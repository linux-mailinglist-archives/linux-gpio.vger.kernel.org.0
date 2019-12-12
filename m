Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A333911C6BE
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2019 08:56:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728099AbfLLH4i (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Dec 2019 02:56:38 -0500
Received: from mail-il1-f196.google.com ([209.85.166.196]:44389 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728095AbfLLH4i (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Dec 2019 02:56:38 -0500
Received: by mail-il1-f196.google.com with SMTP id z12so1193033iln.11
        for <linux-gpio@vger.kernel.org>; Wed, 11 Dec 2019 23:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8e8J+8oNjvnWxMIl7PCHsMVrbUS44qL0cpDy2yi4+4k=;
        b=WoU7xbWjQAoC19lsrTOwYUDkVW56P6Qq2VfVeywDW2NHlQAn3XP6FcgVYtjWEWDzya
         aOl9QvUgSij96GKdSiv0peJMN+6b+1eVaU+SlFSCS+u7YkJnHyN7t/3uwNuKHOT8OmgZ
         738PPazOG5k76UQSd6bdtlIsc/811b8UjSQm/ShBlqVNbqMNM1Zkn64UItMBfBeXxXUC
         ACcenk3BxqXO8q1jczuSaOXriWBV7IseERq2yC7c+ZbtgxmuslP20S7TkMvmIYaCKJeP
         IuQosuZNF6aFjXl305KfLO1bAjJKFCZCldJg7odevhr4Cjor9nk+VuyB0eNnqvcyDBN5
         pH5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8e8J+8oNjvnWxMIl7PCHsMVrbUS44qL0cpDy2yi4+4k=;
        b=fhXqJFmHoYxWI6NO+1Dk/EpWVTpk0kbo1uuN0gDevClImFgO7ZvEQmmTA5b9tbvehW
         JCLOYrZfzf33lsuv+aHlfVXWn4jl1qPCTHsPx9M13xh2mSXyHFwmAhTfb0nZzG1DSgFo
         yv0pEup844yxRo1fn2mtBZKVtVZjiDeoAGZB9JQCv6Zi1Y/tKhgP4EpaKSmcoeXWizd4
         GQIuFrZIK+vcLdI44qRtTyyuuqiTMM1AN2+hPScVM3FQ3pLgqDpmenlc3A1ww+G3vPKg
         BY6Gw6fDW6Qk3Nbpnp1D/720XH/Ym5NBx1xMJ6X6Px0BEjvAcMzFxyWWyJrycy91i5AU
         tm9A==
X-Gm-Message-State: APjAAAW96gxE3l8Hn862eYq9rwyrul0mPcs7KCDv+y2jD1hDxxW6Pu4J
        06fAtyDB+zb9t2y38vQnlv9OZTMHZLfO/fPEPnCBJA==
X-Google-Smtp-Source: APXvYqwcQMOWpxI8SuMM1YqVmnTQzkTMQw1KgzlrOvDKj4V047cEE+Iblz30XM9CtzrDCxpJeJRwU/ecG1Q2xuuvuR0=
X-Received: by 2002:a05:6e02:beb:: with SMTP id d11mr6956949ilu.220.1576137397176;
 Wed, 11 Dec 2019 23:56:37 -0800 (PST)
MIME-Version: 1.0
References: <20191203192305.31722-1-jsavitz@redhat.com>
In-Reply-To: <20191203192305.31722-1-jsavitz@redhat.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 12 Dec 2019 08:56:26 +0100
Message-ID: <CAMRc=Mcja7ewGJgBRP8_1knhDACmB4DdcyB3xFyiPN35Z5EAGw@mail.gmail.com>
Subject: Re: [libgpiod] bindings: python: fix segfault when calling Line.request()
To:     Joel Savitz <jsavitz@redhat.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        fedora-rpi@googlegroups.com,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 3 gru 2019 o 20:24 Joel Savitz <jsavitz@redhat.com> napisa=C5=82(a):
>
> When Line.request() is called without the required 'consumer=3Dvalue'
> argument, the module attempts access an empty dictionary object
> resulting in a segfault. This patch avoids such access when the
> dictionary is empty and maintains the current design where the
> LineBulk object is responsible for validation of arguments.
>
> Signed-off-by: Joel Savitz <jsavitz@redhat.com>
> ---
>  bindings/python/gpiodmodule.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/bindings/python/gpiodmodule.c b/bindings/python/gpiodmodule.=
c
> index 2f6ef51..ae7e1cc 100644
> --- a/bindings/python/gpiodmodule.c
> +++ b/bindings/python/gpiodmodule.c
> @@ -434,8 +434,12 @@ static PyObject *gpiod_Line_request(gpiod_LineObject=
 *self,
>         gpiod_LineBulkObject *bulk_obj;
>         int rv;
>
> -       def_val =3D PyDict_GetItemString(kwds, "default_val");
> -       def_vals =3D PyDict_GetItemString(kwds, "default_vals");
> +       if (PyDict_Size(kwds) > 0) {
> +               def_val =3D PyDict_GetItemString(kwds, "default_val");
> +               def_vals =3D PyDict_GetItemString(kwds, "default_vals");
> +       } else {
> +               def_val =3D def_vals =3D NULL;
> +       }
>
>         if (def_val && def_vals) {
>                 PyErr_SetString(PyExc_TypeError,
> --
> 2.23.0
>

Thanks a lot for bringing this to my attention - I wasn't aware that
the kwds dictionary will be NULL if no named arguments were passed to
the function call. Let me know if you see any such bug anywhere else.
I've looked through the code but this seems to be the only place where
I ever access the dictionary directly.

Best regards,
Bartosz
