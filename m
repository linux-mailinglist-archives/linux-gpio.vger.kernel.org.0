Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00D0D10C6AA
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Nov 2019 11:29:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726587AbfK1K3r (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Nov 2019 05:29:47 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:33106 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726510AbfK1K3r (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Nov 2019 05:29:47 -0500
Received: by mail-oi1-f194.google.com with SMTP id x21so15803384oic.0
        for <linux-gpio@vger.kernel.org>; Thu, 28 Nov 2019 02:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=uInBE7rwP7H9dvF2TgC2G6IJOl8n/3Lw+eMi2U1rWJA=;
        b=Gqfv4uib9XDaaEy2kBkX5PGmOdx9n4MjYGaucskMATh6bsAZcl1PxlRgPLRwa6UPEG
         kzeVUYBXQMVECL1Ty4maC3KalOeliOXtSSq6Vhb9P8t0dWWM8vNqwe5IWRHowhbjFHpM
         5O48kI+b5lJw/nqD/HZVh5GRUqwcME2dYo2ZVzICGwj6oKOu5pe8Edf3iJ8DgcQk7eW/
         eemVTuB9uP3bSEuMljMTlcQAWKdpzu54TWznh4TSXYG972QeoswGFziFwkRk5fFg6+Ln
         g/QWaC6otU5mkfQVxaMMOSBXoAMSqJ03EKZVtoV4frUSLprRyhh/ILfNtzhOZgEPiidP
         p7Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=uInBE7rwP7H9dvF2TgC2G6IJOl8n/3Lw+eMi2U1rWJA=;
        b=dpSXydGxFJrbkn+qWvAO90pK4nMKiSdByL06a3q//1MJ2W1sIGeFgzitwPWJFFdxZq
         opmgLGySrl1Ydl7vla7kqWzRRhwOnCED8PxySJBoT1iV/Q3H5rUmcTJ3eSubsSkJR2bb
         VhGF5kcsVkHDqXxZ1aXBKfNo0b4hHIv1Kf8iWZ3tFAwZ0P7hUMFm83Aum3kYfeLR5AZN
         BxJ0TgeeZq3nJ0ayFX56W6ZCAIpNNLoi432At+V0Od1oksU/DydAwRcC/uq9XB406Po0
         84XKLC7QRR9gQ7Vw149VlEVlZdFIoCH/AHng8w1nR9afYq3rnuaIu44GjINoxvUdB7iu
         6sjA==
X-Gm-Message-State: APjAAAWPVIxevY5AiHxpREL7HxfKngL8yrKaEZKxSOc4hmnBwnGhxipf
        cWD3V0KHX9iDO4uPpEccgf/0W3621jOzpL2ekl7+ew==
X-Google-Smtp-Source: APXvYqzWBz2bJLN3WWQIqTSpe1jo4zAwd69eqaGzTlqxkYjV/mrQLWl628eVdStvw4mWPL+Z/Nn/hLBBn4va9tAdccM=
X-Received: by 2002:aca:4756:: with SMTP id u83mr8007296oia.147.1574936984090;
 Thu, 28 Nov 2019 02:29:44 -0800 (PST)
MIME-Version: 1.0
References: <20191125143157.26154-1-warthog618@gmail.com> <20191125143157.26154-12-warthog618@gmail.com>
In-Reply-To: <20191125143157.26154-12-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 28 Nov 2019 11:29:33 +0100
Message-ID: <CAMpxmJU81_Taz-UHhN_+ArJhd2EfxM0B886xjPtRZ7io7thvaw@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v3 11/14] bindings: python: add support for SET_CONFIG
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 25 lis 2019 o 15:33 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a=
):
>
> Add methods to support setting line configuration.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>  bindings/python/gpiodmodule.c | 381 +++++++++++++++++++++++++++++++++-
>  1 file changed, 379 insertions(+), 2 deletions(-)
>
> diff --git a/bindings/python/gpiodmodule.c b/bindings/python/gpiodmodule.=
c
> index 4723771..4f5e117 100644
> --- a/bindings/python/gpiodmodule.c
> +++ b/bindings/python/gpiodmodule.c
> @@ -585,14 +585,149 @@ static PyObject *gpiod_Line_set_value(gpiod_LineOb=
ject *self, PyObject *args)
>         if (!bulk_obj)
>                 return NULL;
>
> -       vals =3D Py_BuildValue("((O))", val);
> +       vals =3D Py_BuildValue("(O)", val);

Please don't try to sneak in changes like this. If you think this
should be changed, make it a separate commit with proper explanation.
I vaguely remember using this because previously I didn't use
PyObject_CallMethod() but called the set_values() function directly
and it was easier to package it right away. Anyway - is it broken? Do
we gain something from changing it? If so, let's have a separate patch
for this.

>         if (!vals) {
>                 Py_DECREF(bulk_obj);
>                 return NULL;
>         }
>
>         ret =3D PyObject_CallMethod((PyObject *)bulk_obj,
> -                                 "set_values", "O", vals);
> +                                 "set_values", "(O)", vals);
> +       Py_DECREF(bulk_obj);
> +       Py_DECREF(vals);
> +
> +       return ret;
> +}
> +
> +PyDoc_STRVAR(gpiod_Line_set_config_doc,
> +"set_config(direction,flags,value) -> None\n"
> +"\n"
> +"Set the configuration of this GPIO line.\n"
> +"\n"
> +"  direction\n"
> +"    New direction (integer)\n"
> +"  flags\n"
> +"    New flags (integer)\n"
> +"  value\n"
> +"    New value (integer)");
> +
> +static PyObject *gpiod_Line_set_config(gpiod_LineObject *self, PyObject =
*args)
> +{
> +       gpiod_LineBulkObject *bulk_obj;
> +       PyObject *dirn, *flags, *val, *vals, *ret;
> +       int rv;
> +
> +       val =3D NULL;
> +       rv =3D PyArg_ParseTuple(args, "OO|O", &dirn, &flags, &val);
> +       if (!rv)
> +               return NULL;
> +
> +       bulk_obj =3D gpiod_LineToLineBulk(self);
> +       if (!bulk_obj)
> +               return NULL;
> +
> +       if (val) {
> +               vals =3D Py_BuildValue("(O)", val);
> +               if (!vals) {
> +                       Py_DECREF(bulk_obj);
> +                       return NULL;
> +               }
> +               ret =3D PyObject_CallMethod((PyObject *)bulk_obj,
> +                               "set_config", "OO(O)", dirn, flags, vals)=
;
> +               Py_DECREF(vals);
> +       } else
> +               ret =3D PyObject_CallMethod((PyObject *)bulk_obj,
> +                               "set_config", "OO", dirn, flags);

Please use brackets here even if it's a single line after you used it
in the first branch. Same elsewhere if needed.

> +
> +       Py_DECREF(bulk_obj);
> +
> +       return ret;
> +}
> +
> +PyDoc_STRVAR(gpiod_Line_set_flags_doc,
> +"set_flags(flags) -> None\n"
> +"\n"
> +"Set the flags of this GPIO line.\n"
> +"\n"
> +"  flags\n"
> +"    New flags (integer)");
> +
> +static PyObject *gpiod_Line_set_flags(gpiod_LineObject *self, PyObject *=
args)
> +{
> +       gpiod_LineBulkObject *bulk_obj;
> +       PyObject *ret;
> +
> +       bulk_obj =3D gpiod_LineToLineBulk(self);
> +       if (!bulk_obj)
> +               return NULL;
> +
> +       ret =3D PyObject_CallMethod((PyObject *)bulk_obj,
> +                                 "set_flags", "O", args);
> +       Py_DECREF(bulk_obj);
> +
> +       return ret;
> +}
> +
> +PyDoc_STRVAR(gpiod_Line_set_direction_input_doc,
> +"set_direction_input() -> None\n"
> +"\n"
> +"Set the direction of this GPIO line to input.\n");
> +
> +static PyObject *gpiod_Line_set_direction_input(gpiod_LineObject *self,
> +                                               PyObject *Py_UNUSED(ignor=
ed))
> +{
> +       gpiod_LineBulkObject *bulk_obj;
> +       PyObject *ret;
> +
> +       bulk_obj =3D gpiod_LineToLineBulk(self);
> +       if (!bulk_obj)
> +               return NULL;
> +
> +       ret =3D PyObject_CallMethod((PyObject *)bulk_obj,
> +                                 "set_direction_input", "");
> +       Py_DECREF(bulk_obj);
> +
> +       return ret;
> +}
> +
> +PyDoc_STRVAR(gpiod_Line_set_direction_output_doc,
> +"set_direction_output(value) -> None\n"
> +"\n"
> +"Set the direction of this GPIO line to output.\n"
> +"\n"
> +"  value\n"
> +"    New value (integer)");
> +
> +static PyObject *gpiod_Line_set_direction_output(gpiod_LineObject *self,
> +                                                PyObject *args)
> +{
> +       gpiod_LineBulkObject *bulk_obj;
> +       PyObject *val, *vals, *ret;
> +       int rv;
> +       const char *fmt;
> +
> +       val =3D NULL;
> +       rv =3D PyArg_ParseTuple(args, "|O", &val);
> +       if (!rv)
> +               return NULL;
> +
> +       if (val) {
> +               fmt =3D "(O)";
> +               vals =3D Py_BuildValue(fmt, val);
> +       } else {
> +               vals =3D Py_BuildValue("()");
> +               fmt =3D "O"; /* pass empty args to bulk */
> +       }
> +       if (!vals)
> +               return NULL;
> +
> +       bulk_obj =3D gpiod_LineToLineBulk(self);
> +       if (!bulk_obj)
> +               return NULL;
> +
> +       ret =3D PyObject_CallMethod((PyObject *)bulk_obj,
> +                                 "set_direction_output", fmt, vals);
> +
>         Py_DECREF(bulk_obj);
>         Py_DECREF(vals);
>
> @@ -838,6 +973,30 @@ static PyMethodDef gpiod_Line_methods[] =3D {
>                 .ml_flags =3D METH_VARARGS,
>                 .ml_doc =3D gpiod_Line_set_value_doc,
>         },
> +       {
> +               .ml_name =3D "set_config",
> +               .ml_meth =3D (PyCFunction)gpiod_Line_set_config,
> +               .ml_flags =3D METH_VARARGS,
> +               .ml_doc =3D gpiod_Line_set_config_doc,
> +       },
> +       {
> +               .ml_name =3D "set_flags",
> +               .ml_meth =3D (PyCFunction)gpiod_Line_set_flags,
> +               .ml_flags =3D METH_VARARGS,
> +               .ml_doc =3D gpiod_Line_set_flags_doc,
> +       },
> +       {
> +               .ml_name =3D "set_direction_input",
> +               .ml_meth =3D (PyCFunction)gpiod_Line_set_direction_input,
> +               .ml_flags =3D METH_NOARGS,
> +               .ml_doc =3D gpiod_Line_set_direction_input_doc,
> +       },
> +       {
> +               .ml_name =3D "set_direction_output",
> +               .ml_meth =3D (PyCFunction)gpiod_Line_set_direction_output=
,
> +               .ml_flags =3D METH_VARARGS,
> +               .ml_doc =3D gpiod_Line_set_direction_output_doc,
> +       },
>         {
>                 .ml_name =3D "release",
>                 .ml_meth =3D (PyCFunction)gpiod_Line_release,
> @@ -1283,6 +1442,200 @@ static PyObject *gpiod_LineBulk_set_values(gpiod_=
LineBulkObject *self,
>         Py_RETURN_NONE;
>  }
>
> +static int convert_values(PyObject *src, int *dst, Py_ssize_t n)

Coding convention and readability: this module is a bit different as I
tried to stay consistent with Python C code when naming symbols.
Please use the common 'gpiod_' prefix even for non-exported functions
and maybe name this routine something else as "convert_values" doesn't
really indicate concrete functionality. I'm still not sure what it
does.


> +{
> +       int val;
> +       Py_ssize_t num_vals, i;
> +       PyObject *iter, *next;
> +
> +       num_vals =3D PyObject_Size(src);
> +       if (num_vals !=3D n) {
> +               PyErr_SetString(PyExc_TypeError,
> +                       "Number of values must correspond to the number o=
f lines");
> +               return -1;
> +       }
> +       iter =3D PyObject_GetIter(src);
> +       if (!iter)
> +               return -1;
> +       for (i =3D 0;; i++) {
> +               next =3D PyIter_Next(iter);
> +               if (!next) {
> +                       Py_DECREF(iter);
> +                       break;
> +               }
> +               val =3D PyLong_AsLong(next);
> +               Py_DECREF(next);
> +               if (PyErr_Occurred()) {
> +                       Py_DECREF(iter);
> +                       return -1;
> +               }
> +               dst[i] =3D (int)val;
> +       }
> +       return 0;
> +}
> +
> +PyDoc_STRVAR(gpiod_LineBulk_set_config_doc,
> +"set_config(direction,flags,values) -> None\n"
> +"\n"
> +"Set the configuration of all the lines held by this LineBulk object.\n"
> +"\n"
> +"  direction\n"
> +"    New direction (integer)\n"
> +"  flags\n"
> +"    New flags (integer)\n"
> +"  values\n"
> +"    List of values (integers) to set when direction is output.\n"
> +"\n"
> +"The number of values in the list passed as argument must be the same as=
\n"
> +"the number of lines held by this gpiod.LineBulk object. The index of ea=
ch\n"
> +"value corresponds to the index of each line in the object.\n");
> +
> +static PyObject *gpiod_LineBulk_set_config(gpiod_LineBulkObject *self,
> +                                          PyObject *args)
> +{
> +       int rv, vals[GPIOD_LINE_BULK_MAX_LINES];
> +       PyObject *val_list;
> +       struct gpiod_line_bulk bulk;
> +       const int *valp;
> +       int dirn, flags;
> +
> +       if (gpiod_LineBulkOwnerIsClosed(self))
> +               return NULL;
> +
> +       gpiod_LineBulkObjToCLineBulk(self, &bulk);
> +
> +       val_list =3D NULL;
> +       rv =3D PyArg_ParseTuple(args, "ii|(O)", &dirn, &flags, &val_list)=
;
> +       if (!rv)
> +               return NULL;
> +
> +       if (val_list =3D=3D NULL)
> +               valp =3D NULL;
> +       else {
> +               memset(vals, 0, sizeof(vals));
> +               rv =3D convert_values(val_list, vals, self->num_lines);
> +               if (rv)
> +                       return NULL;
> +               valp =3D vals;
> +       }
> +
> +       Py_BEGIN_ALLOW_THREADS;
> +       rv =3D gpiod_line_set_config_bulk(&bulk, dirn, flags, valp);
> +       Py_END_ALLOW_THREADS;
> +       if (rv)
> +               return PyErr_SetFromErrno(PyExc_OSError);
> +
> +       Py_RETURN_NONE;
> +}
> +
> +PyDoc_STRVAR(gpiod_LineBulk_set_flags_doc,
> +"set_flags(flags) -> None\n"
> +"\n"
> +"Set the flags of all the lines held by this LineBulk object.\n"
> +"\n"
> +"  flags\n"
> +"    New flags (integer)");
> +
> +static PyObject *gpiod_LineBulk_set_flags(gpiod_LineBulkObject *self,
> +                                         PyObject *args)
> +{
> +       int rv;
> +       struct gpiod_line_bulk bulk;
> +       int flags;
> +
> +       if (gpiod_LineBulkOwnerIsClosed(self))
> +               return NULL;
> +
> +       gpiod_LineBulkObjToCLineBulk(self, &bulk);
> +
> +       rv =3D PyArg_ParseTuple(args, "i", &flags);
> +       if (!rv)
> +               return NULL;
> +
> +       Py_BEGIN_ALLOW_THREADS;
> +       rv =3D gpiod_line_set_flags_bulk(&bulk, flags);
> +       Py_END_ALLOW_THREADS;
> +       if (rv)
> +               return PyErr_SetFromErrno(PyExc_OSError);
> +
> +       Py_RETURN_NONE;
> +}
> +
> +PyDoc_STRVAR(gpiod_LineBulk_set_direction_input_doc,
> +"set_direction_input() -> None\n"
> +"\n"
> +"Set the direction of all the lines held by this LineBulk object to inpu=
t.\n");
> +
> +static PyObject *gpiod_LineBulk_set_direction_input(gpiod_LineBulkObject=
 *self,
> +                                               PyObject *Py_UNUSED(ignor=
ed))
> +{
> +       struct gpiod_line_bulk bulk;
> +       int rv;
> +
> +       if (gpiod_LineBulkOwnerIsClosed(self))
> +               return NULL;
> +
> +       gpiod_LineBulkObjToCLineBulk(self, &bulk);
> +
> +       Py_BEGIN_ALLOW_THREADS;
> +       rv =3D gpiod_line_set_direction_input_bulk(&bulk);
> +       Py_END_ALLOW_THREADS;
> +       if (rv)
> +               return PyErr_SetFromErrno(PyExc_OSError);
> +
> +       Py_RETURN_NONE;
> +}
> +
> +PyDoc_STRVAR(gpiod_LineBulk_set_direction_output_doc,
> +"set_direction_output(value) -> None\n"
> +"\n"
> +"Set the direction of all the lines held by this LineBulk object to outp=
ut.\n"
> +"\n"
> +"  values\n"
> +"    List of values (integers) to set when direction is output.\n"
> +"\n"
> +"The number of values in the list passed as argument must be the same as=
\n"
> +"the number of lines held by this gpiod.LineBulk object. The index of ea=
ch\n"
> +"value corresponds to the index of each line in the object.\n");
> +
> +static PyObject *gpiod_LineBulk_set_direction_output(
> +                               gpiod_LineBulkObject *self,
> +                               PyObject *args)
> +{
> +       int rv, vals[GPIOD_LINE_BULK_MAX_LINES];
> +       PyObject *val_list;
> +       struct gpiod_line_bulk bulk;
> +       const int *valp;
> +
> +       if (gpiod_LineBulkOwnerIsClosed(self))
> +               return NULL;
> +
> +       gpiod_LineBulkObjToCLineBulk(self, &bulk);
> +
> +       val_list =3D NULL;
> +       rv =3D PyArg_ParseTuple(args, "|O", &val_list);
> +       if (!rv)
> +               return NULL;
> +
> +       if (val_list =3D=3D NULL)
> +               valp =3D NULL;
> +       else {
> +               memset(vals, 0, sizeof(vals));
> +               rv =3D convert_values(val_list, vals, self->num_lines);
> +               if (rv)
> +                       return NULL;
> +               valp =3D vals;
> +       }
> +
> +       Py_BEGIN_ALLOW_THREADS;
> +       rv =3D gpiod_line_set_direction_output_bulk(&bulk, valp);
> +       Py_END_ALLOW_THREADS;
> +       if (rv)
> +               return PyErr_SetFromErrno(PyExc_OSError);
> +
> +       Py_RETURN_NONE;
> +}
> +
>  PyDoc_STRVAR(gpiod_LineBulk_release_doc,
>  "release() -> None\n"
>  "\n"
> @@ -1431,6 +1784,30 @@ static PyMethodDef gpiod_LineBulk_methods[] =3D {
>                 .ml_doc =3D gpiod_LineBulk_set_values_doc,
>                 .ml_flags =3D METH_VARARGS,
>         },
> +       {
> +               .ml_name =3D "set_config",
> +               .ml_meth =3D (PyCFunction)gpiod_LineBulk_set_config,
> +               .ml_flags =3D METH_VARARGS,
> +               .ml_doc =3D gpiod_LineBulk_set_config_doc,
> +       },
> +       {
> +               .ml_name =3D "set_flags",
> +               .ml_meth =3D (PyCFunction)gpiod_LineBulk_set_flags,
> +               .ml_flags =3D METH_VARARGS,
> +               .ml_doc =3D gpiod_LineBulk_set_flags_doc,
> +       },
> +       {
> +               .ml_name =3D "set_direction_input",
> +               .ml_meth =3D (PyCFunction)gpiod_LineBulk_set_direction_in=
put,
> +               .ml_flags =3D METH_NOARGS,
> +               .ml_doc =3D gpiod_LineBulk_set_direction_input_doc,
> +       },
> +       {
> +               .ml_name =3D "set_direction_output",
> +               .ml_meth =3D (PyCFunction)gpiod_LineBulk_set_direction_ou=
tput,
> +               .ml_flags =3D METH_VARARGS,
> +               .ml_doc =3D gpiod_LineBulk_set_direction_output_doc,
> +       },
>         {
>                 .ml_name =3D "release",
>                 .ml_meth =3D (PyCFunction)gpiod_LineBulk_release,
> --
> 2.24.0
>
