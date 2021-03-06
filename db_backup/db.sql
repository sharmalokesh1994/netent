PGDMP     /                    x         	   bookstore    9.6.12    9.6.12 #    q           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            r           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            s           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            t           1262    27863 	   bookstore    DATABASE     �   CREATE DATABASE bookstore WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_India.1252' LC_CTYPE = 'English_India.1252';
    DROP DATABASE bookstore;
             postgres    false                        2615    27864 	   bookstore    SCHEMA        CREATE SCHEMA bookstore;
    DROP SCHEMA bookstore;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            u           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12387    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            v           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    28261    book    TABLE     �   CREATE TABLE bookstore.book (
    isbn character varying(255) NOT NULL,
    author character varying(255),
    count integer DEFAULT 0,
    price integer,
    title character varying(255)
);
    DROP TABLE bookstore.book;
    	   bookstore         postgres    false    7            �            1259    28272    customer    TABLE     �   CREATE TABLE bookstore.customer (
    id integer NOT NULL,
    email character varying(255),
    firstname character varying(255),
    lastname character varying(255)
);
    DROP TABLE bookstore.customer;
    	   bookstore         postgres    false    7            �            1259    28270    customer_id_seq    SEQUENCE     {   CREATE SEQUENCE bookstore.customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE bookstore.customer_id_seq;
    	   bookstore       postgres    false    7    188            w           0    0    customer_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE bookstore.customer_id_seq OWNED BY bookstore.customer.id;
         	   bookstore       postgres    false    187            �            1259    28283    order    TABLE     y   CREATE TABLE bookstore."order" (
    id integer NOT NULL,
    book_id character varying(255),
    customer_id integer
);
    DROP TABLE bookstore."order";
    	   bookstore         postgres    false    7            �            1259    28281    order_id_seq    SEQUENCE     x   CREATE SEQUENCE bookstore.order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE bookstore.order_id_seq;
    	   bookstore       postgres    false    7    190            x           0    0    order_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE bookstore.order_id_seq OWNED BY bookstore."order".id;
         	   bookstore       postgres    false    189            �            1259    28291    staff    TABLE     }   CREATE TABLE bookstore.staff (
    id integer NOT NULL,
    email character varying(255),
    name character varying(255)
);
    DROP TABLE bookstore.staff;
    	   bookstore         postgres    false    7            �            1259    28289    staff_id_seq    SEQUENCE     x   CREATE SEQUENCE bookstore.staff_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE bookstore.staff_id_seq;
    	   bookstore       postgres    false    192    7            y           0    0    staff_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE bookstore.staff_id_seq OWNED BY bookstore.staff.id;
         	   bookstore       postgres    false    191            �           2604    28275    customer id    DEFAULT     p   ALTER TABLE ONLY bookstore.customer ALTER COLUMN id SET DEFAULT nextval('bookstore.customer_id_seq'::regclass);
 =   ALTER TABLE bookstore.customer ALTER COLUMN id DROP DEFAULT;
    	   bookstore       postgres    false    187    188    188            �           2604    28286    order id    DEFAULT     l   ALTER TABLE ONLY bookstore."order" ALTER COLUMN id SET DEFAULT nextval('bookstore.order_id_seq'::regclass);
 <   ALTER TABLE bookstore."order" ALTER COLUMN id DROP DEFAULT;
    	   bookstore       postgres    false    189    190    190            �           2604    28294    staff id    DEFAULT     j   ALTER TABLE ONLY bookstore.staff ALTER COLUMN id SET DEFAULT nextval('bookstore.staff_id_seq'::regclass);
 :   ALTER TABLE bookstore.staff ALTER COLUMN id DROP DEFAULT;
    	   bookstore       postgres    false    192    191    192            h          0    28261    book 
   TABLE DATA               D   COPY bookstore.book (isbn, author, count, price, title) FROM stdin;
 	   bookstore       postgres    false    186   �"       j          0    28272    customer 
   TABLE DATA               E   COPY bookstore.customer (id, email, firstname, lastname) FROM stdin;
 	   bookstore       postgres    false    188   k#       z           0    0    customer_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('bookstore.customer_id_seq', 3, true);
         	   bookstore       postgres    false    187            l          0    28283    order 
   TABLE DATA               >   COPY bookstore."order" (id, book_id, customer_id) FROM stdin;
 	   bookstore       postgres    false    190   �#       {           0    0    order_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('bookstore.order_id_seq', 2, true);
         	   bookstore       postgres    false    189            n          0    28291    staff 
   TABLE DATA               3   COPY bookstore.staff (id, email, name) FROM stdin;
 	   bookstore       postgres    false    192   �#       |           0    0    staff_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('bookstore.staff_id_seq', 1, false);
         	   bookstore       postgres    false    191            �           2606    28269    book book_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY bookstore.book
    ADD CONSTRAINT book_pkey PRIMARY KEY (isbn);
 ;   ALTER TABLE ONLY bookstore.book DROP CONSTRAINT book_pkey;
    	   bookstore         postgres    false    186    186            �           2606    28280    customer customer_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY bookstore.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id);
 C   ALTER TABLE ONLY bookstore.customer DROP CONSTRAINT customer_pkey;
    	   bookstore         postgres    false    188    188            �           2606    28288    order order_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY bookstore."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY bookstore."order" DROP CONSTRAINT order_pkey;
    	   bookstore         postgres    false    190    190            �           2606    28299    staff staff_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY bookstore.staff
    ADD CONSTRAINT staff_pkey PRIMARY KEY (id);
 =   ALTER TABLE ONLY bookstore.staff DROP CONSTRAINT staff_pkey;
    	   bookstore         postgres    false    192    192            �           2606    28300 !   order fk5wfkmki9lhx405em2mghlpqvc    FK CONSTRAINT     �   ALTER TABLE ONLY bookstore."order"
    ADD CONSTRAINT fk5wfkmki9lhx405em2mghlpqvc FOREIGN KEY (book_id) REFERENCES bookstore.book(isbn);
 P   ALTER TABLE ONLY bookstore."order" DROP CONSTRAINT fk5wfkmki9lhx405em2mghlpqvc;
    	   bookstore       postgres    false    2026    186    190            �           2606    28305 !   order fkb8tboo4d95mh8gavvovwbb7vg    FK CONSTRAINT     �   ALTER TABLE ONLY bookstore."order"
    ADD CONSTRAINT fkb8tboo4d95mh8gavvovwbb7vg FOREIGN KEY (customer_id) REFERENCES bookstore.customer(id);
 P   ALTER TABLE ONLY bookstore."order" DROP CONSTRAINT fkb8tboo4d95mh8gavvovwbb7vg;
    	   bookstore       postgres    false    190    2028    188            h   f   x�34261����6�440 aμ�\.C��1H�8�E��8,	�K-��4�ɹ��(�嗥��!�YZ@�]+R��3KK2��Rs�RRsrK�b���� z�"I      j   2   x�3�LLJv b���\N��������Ģ�D.c����Tֈ+F��� �~c      l      x�3�44261�4�2��b���� 1��      n      x������ � �     