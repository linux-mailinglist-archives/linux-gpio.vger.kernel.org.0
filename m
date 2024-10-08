Return-Path: <linux-gpio+bounces-11063-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB559950BF
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 15:55:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9269F1C2501B
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 13:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72C081DF976;
	Tue,  8 Oct 2024 13:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ToaQpab0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0421DF96D
	for <linux-gpio@vger.kernel.org>; Tue,  8 Oct 2024 13:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728395671; cv=none; b=ZwC71sRwAkt4ucYG3vxW+rlDiMhPG/QeFed8/opWIK7AP1ZCpoIrJKlukqZhJNyubkDxjB9gqAx65TtmjTi53xrwbHR/lUHahE8sQ3NPAn7qlhGUtQhgqtCP7LiOG5ZScsEXSR+nhLMctiddanw7Xsgi8oEhFEDlAsZLSguR/Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728395671; c=relaxed/simple;
	bh=DQztHWsi04EQwMXsHI7CB79/fHhik+DbebOyIq87O2w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ux4OXbZMccUnmXic95FjuTsLMYln1QZdwBtIbWEsiEF0k8PwPiHeBil0RDYm63WRMjVdhYFI75UL5BJlkyz38Y0F1LT3cO4/GndtLHJvnznT74O99XOetbfymjoCtaRXwe6nvyM6dc2l7c2B67zhBVz48dayLAYe2Meh++lDnBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ToaQpab0; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2facaa16826so48556301fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 08 Oct 2024 06:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728395667; x=1729000467; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QJKs0WAUaXThI5oboP9ec6WWxX0ihGhBhSme/jgQzTA=;
        b=ToaQpab0jLCGCHPLsVVSDevU6Ke5hetzaxW/+Qqk0Xx1cR8b17owdHwjz0YbzZUvPQ
         XRt/ZR3RkZKWyI2kwBFYvO6GctRJHZSt8z6ElkKjMKFX6DFkA3ldqbvBVmiz6Go0TLpI
         mrGy9kppM525ulcwCtc950v4HLvFVOk+Y3zDgV/9CUTn1YsLrYv6cpFu1mEkzuAs7622
         bK4H5Km4VoczyiiZ/706YO0dvWrU17LdBUC7slJfABI2gVeffTI6dF7nbSd4SrXhm8i9
         XbwKvGH16dfU+UeSJPlTbnqD+KlHs5Ow/V1/jF6xD9r38Z0hNWQd5AK7mhJKGg3DKS5f
         lK1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728395667; x=1729000467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QJKs0WAUaXThI5oboP9ec6WWxX0ihGhBhSme/jgQzTA=;
        b=naN8wkBTlVKlvPEiUX9EBd8zuNmSNIKabSKQCImMS0MNTXVLZ5es1WZxzYIpiUQw2d
         OXbonF9VMLaBOYIoPwDvMKkn1VXwKIvdOZ+TXnVA/rVo71pYtG/HzGuZD5PNZh+l3NSj
         kv7AUcYG+3MVXauQcnTGv2lpicxKQCkEMK1U/LCFayw40mVIdvswo8Bk1vgDxAcQoKgF
         zmmNZHFYcySFtnCRL4/+srbzLENBXDeiBBLk++dDzOOx+mq/TiPam9kzOb89j9eHlsQ0
         TP2JyhnvncRNs3lxjZ/o/nK7Jdy7J2DLj3Cqnm3ofXNlvYL2F4NjRruEQGoKDzU/8+xt
         J3QQ==
X-Gm-Message-State: AOJu0YydEgVvuwzVLBVKHuPh7wPENLeKUyb/VPmi8FiVrWpc0W6KDPJr
	JP8VS1hSMNGQshVKJfJbqHjjScOFAreShq+TueuxD3yqx7hWYVq8ek/vZfhRB+1WH6jeic2XzbM
	BQEmQKL5wPVqr3dzpTb2AfQP2aXIsGHLn9NVhWQ==
X-Google-Smtp-Source: AGHT+IEeoF0hXz5H+/XSM6/eHAlpjsVfBA5OtYAlUCWift8F2ugnQK1Sq3I6GtROruwoju6bsdsEmbm3iF3OnKLGIys=
X-Received: by 2002:a2e:5109:0:b0:2f3:fa99:4bab with SMTP id
 38308e7fff4ca-2faf3c1ccbamr60259251fa.15.1728395667078; Tue, 08 Oct 2024
 06:54:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241004171438.3066379-1-vfazio@xes-inc.com>
In-Reply-To: <20241004171438.3066379-1-vfazio@xes-inc.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 8 Oct 2024 15:54:15 +0200
Message-ID: <CAMRc=MeD5ehaPkaJUNL2HYjK8iV=NLcuC5=ktSMVhcyqgpXt7Q@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] bindings: python: import gpiod attributes in
 external module
To: Vincent Fazio <vfazio@xes-inc.com>
Cc: linux-gpio@vger.kernel.org, vfazio@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 4, 2024 at 7:15=E2=80=AFPM Vincent Fazio <vfazio@xes-inc.com> w=
rote:
>
> Previously, the external module relied on gpiod attributes being present
> within `globals()` to construct return values back to the caller.
>
> This assumption required callers of the external module to have imported
> the attributes to populate `globals()` for the interface to work.
>
> Having this implicit contract is opaque and prone to causing issues if
> imports within gpiod modules ever get reworked.
>
> Now, the external module explicitly imports attributes from gpiod in
> order to return values back to the caller.
>
> There should be no concern about circular imports as the external module
> should be completely imported by the time callers call into it.
>
> Since Py_gpiod_GetGlobalType is no longer used, it has been replaced
> with Py_gpiod_GetModuleAttrString which returns a new PyObject*
> reference for the named module and attribute that must be decremented
> when no longer in use.
>
> Closes: https://github.com/brgl/libgpiod/issues/101
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
> ---
>  bindings/python/gpiod/ext/chip.c     | 39 +++++++++++++++++-----------
>  bindings/python/gpiod/ext/common.c   | 14 ++++++----
>  bindings/python/gpiod/ext/internal.h |  3 ++-
>  bindings/python/gpiod/ext/request.c  | 26 ++++++++++++-------
>  4 files changed, 52 insertions(+), 30 deletions(-)
>
> diff --git a/bindings/python/gpiod/ext/chip.c b/bindings/python/gpiod/ext=
/chip.c
> index e8eaad8..fcfb960 100644
> --- a/bindings/python/gpiod/ext/chip.c
> +++ b/bindings/python/gpiod/ext/chip.c
> @@ -75,31 +75,34 @@ static PyObject *chip_get_info(chip_object *self, PyO=
bject *Py_UNUSED(ignored))
>         struct gpiod_chip_info *info;
>         PyObject *type, *ret;
>
> -       type =3D Py_gpiod_GetGlobalType("ChipInfo");
> +       type =3D Py_gpiod_GetModuleAttrString("gpiod.chip_info", "ChipInf=
o");
>         if (!type)
>                 return NULL;
>
>         info =3D gpiod_chip_get_info(self->chip);
> -       if (!info)
> +       if (!info) {
> +               Py_DECREF(type);
>                 return PyErr_SetFromErrno(PyExc_OSError);
> +       }
>
> -        ret =3D PyObject_CallFunction(type, "ssI",
> -                                    gpiod_chip_info_get_name(info),
> -                                    gpiod_chip_info_get_label(info),
> -                                    gpiod_chip_info_get_num_lines(info))=
;
> -        gpiod_chip_info_free(info);
> -        return ret;
> +       ret =3D PyObject_CallFunction(type, "ssI",
> +                                   gpiod_chip_info_get_name(info),
> +                                   gpiod_chip_info_get_label(info),
> +                                   gpiod_chip_info_get_num_lines(info));
> +       gpiod_chip_info_free(info);
> +       Py_DECREF(type);
> +       return ret;
>  }
>
>  static PyObject *make_line_info(struct gpiod_line_info *info)
>  {
> -       PyObject *type;
> +       PyObject *type, *ret;
>
> -       type =3D Py_gpiod_GetGlobalType("LineInfo");
> +       type =3D Py_gpiod_GetModuleAttrString("gpiod.line_info", "LineInf=
o");
>         if (!type)
>                 return NULL;
>
> -       return PyObject_CallFunction(type, "IsOsiOiiiiOk",
> +       ret =3D PyObject_CallFunction(type, "IsOsiOiiiiOk",
>                                 gpiod_line_info_get_offset(info),
>                                 gpiod_line_info_get_name(info),
>                                 gpiod_line_info_is_used(info) ?
> @@ -115,6 +118,8 @@ static PyObject *make_line_info(struct gpiod_line_inf=
o *info)
>                                 gpiod_line_info_is_debounced(info) ?
>                                                         Py_True : Py_Fals=
e,
>                                 gpiod_line_info_get_debounce_period_us(in=
fo));
> +       Py_DECREF(type);
> +       return ret;
>  }
>
>  static PyObject *chip_get_line_info(chip_object *self, PyObject *args)
> @@ -168,10 +173,6 @@ chip_read_info_event(chip_object *self, PyObject *Py=
_UNUSED(ignored))
>         struct gpiod_info_event *event;
>         struct gpiod_line_info *info;
>
> -       type =3D Py_gpiod_GetGlobalType("InfoEvent");
> -       if (!type)
> -               return NULL;
> -
>         Py_BEGIN_ALLOW_THREADS;
>         event =3D gpiod_chip_read_info_event(self->chip);
>         Py_END_ALLOW_THREADS;
> @@ -186,12 +187,20 @@ chip_read_info_event(chip_object *self, PyObject *P=
y_UNUSED(ignored))
>                 return NULL;
>         }
>
> +       type =3D Py_gpiod_GetModuleAttrString("gpiod.info_event", "InfoEv=
ent");
> +       if (!type) {
> +               Py_DECREF(info_obj);
> +               gpiod_info_event_free(event);
> +               return NULL;
> +       }
> +
>         event_obj =3D PyObject_CallFunction(type, "iKO",
>                                 gpiod_info_event_get_event_type(event),
>                                 gpiod_info_event_get_timestamp_ns(event),
>                                 info_obj);
>         Py_DECREF(info_obj);
>         gpiod_info_event_free(event);
> +       Py_DECREF(type);
>         return event_obj;
>  }
>
> diff --git a/bindings/python/gpiod/ext/common.c b/bindings/python/gpiod/e=
xt/common.c
> index 07fca8c..62201b6 100644
> --- a/bindings/python/gpiod/ext/common.c
> +++ b/bindings/python/gpiod/ext/common.c
> @@ -64,15 +64,19 @@ PyObject *Py_gpiod_SetErrFromErrno(void)
>         return PyErr_SetFromErrno(exc);
>  }
>
> -PyObject *Py_gpiod_GetGlobalType(const char *type_name)
> +PyObject *Py_gpiod_GetModuleAttrString(const char *modname,
> +                                      const char *attrname)
>  {
> -       PyObject *globals;
> +       PyObject *module, *attribute;
>
> -       globals =3D PyEval_GetGlobals();
> -       if (!globals)
> +       module =3D PyImport_ImportModule(modname);
> +       if (!module)
>                 return NULL;
>
> -       return PyDict_GetItemString(globals, type_name);
> +       attribute =3D PyObject_GetAttrString(module, attrname);
> +       Py_DECREF(module);
> +
> +       return attribute;
>  }
>
>  unsigned int Py_gpiod_PyLongAsUnsignedInt(PyObject *pylong)
> diff --git a/bindings/python/gpiod/ext/internal.h b/bindings/python/gpiod=
/ext/internal.h
> index 7d223c0..15aedfb 100644
> --- a/bindings/python/gpiod/ext/internal.h
> +++ b/bindings/python/gpiod/ext/internal.h
> @@ -8,7 +8,8 @@
>  #include <Python.h>
>
>  PyObject *Py_gpiod_SetErrFromErrno(void);
> -PyObject *Py_gpiod_GetGlobalType(const char *type_name);
> +PyObject *Py_gpiod_GetModuleAttrString(const char *modname,
> +                                      const char *attrname);
>  unsigned int Py_gpiod_PyLongAsUnsignedInt(PyObject *pylong);
>  void Py_gpiod_dealloc(PyObject *self);
>  PyObject *Py_gpiod_MakeRequestObject(struct gpiod_line_request *request,
> diff --git a/bindings/python/gpiod/ext/request.c b/bindings/python/gpiod/=
ext/request.c
> index 5db69fe..4a035f4 100644
> --- a/bindings/python/gpiod/ext/request.c
> +++ b/bindings/python/gpiod/ext/request.c
> @@ -149,10 +149,6 @@ static PyObject *request_get_values(request_object *=
self, PyObject *args)
>         if (num_offsets < 0)
>                 return NULL;
>
> -       type =3D Py_gpiod_GetGlobalType("Value");
> -       if (!type)
> -               return NULL;
> -
>         iter =3D PyObject_GetIter(offsets);
>         if (!iter)
>                 return NULL;
> @@ -183,14 +179,21 @@ static PyObject *request_get_values(request_object =
*self, PyObject *args)
>         if (ret)
>                 return Py_gpiod_SetErrFromErrno();
>
> +       type =3D Py_gpiod_GetModuleAttrString("gpiod.line", "Value");
> +       if (!type)
> +               return NULL;
> +
>         for (pos =3D 0; pos < num_offsets; pos++) {
>                 val =3D PyObject_CallFunction(type, "i", self->values[pos=
]);
> -               if (!val)
> +               if (!val) {
> +                       Py_DECREF(type);
>                         return NULL;
> +               }
>
>                 ret =3D PyList_SetItem(values, pos, val);
>                 if (ret) {
>                         Py_DECREF(val);
> +                       Py_DECREF(type);
>                         return NULL;
>                 }

Don't you need to Py_DECREF(type) here before returning?

>         }
> @@ -279,10 +282,6 @@ static PyObject *request_read_edge_events(request_ob=
ject *self, PyObject *args)
>                 max_events =3D 64;
>         }
>
> -       type =3D Py_gpiod_GetGlobalType("EdgeEvent");
> -       if (!type)
> -               return NULL;
> -
>         Py_BEGIN_ALLOW_THREADS;
>         ret =3D gpiod_line_request_read_edge_events(self->request,
>                                                  self->buffer, max_events=
);
> @@ -296,10 +295,17 @@ static PyObject *request_read_edge_events(request_o=
bject *self, PyObject *args)
>         if (!events)
>                 return NULL;
>
> +       type =3D Py_gpiod_GetModuleAttrString("gpiod.edge_event", "EdgeEv=
ent");
> +       if (!type) {
> +               Py_DECREF(events);
> +               return NULL;
> +       }
> +
>         for (i =3D 0; i < num_events; i++) {
>                 event =3D gpiod_edge_event_buffer_get_event(self->buffer,=
 i);
>                 if (!event) {
>                         Py_DECREF(events);
> +                       Py_DECREF(type);
>                         return NULL;
>                 }
>
> @@ -311,6 +317,7 @@ static PyObject *request_read_edge_events(request_obj=
ect *self, PyObject *args)
>                                 gpiod_edge_event_get_line_seqno(event));
>                 if (!event_obj) {
>                         Py_DECREF(events);
> +                       Py_DECREF(type);
>                         return NULL;
>                 }
>
> @@ -318,6 +325,7 @@ static PyObject *request_read_edge_events(request_obj=
ect *self, PyObject *args)
>                 if (ret) {
>                         Py_DECREF(event_obj);
>                         Py_DECREF(events);
> +                       Py_DECREF(type);
>                         return NULL;
>                 }

And here?

>         }
> --
> 2.34.1
>
>

Bart

