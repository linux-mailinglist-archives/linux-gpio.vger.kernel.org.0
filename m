Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 280AF11B7BC
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2019 17:10:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731128AbfLKQJ0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Dec 2019 11:09:26 -0500
Received: from mail-qk1-f169.google.com ([209.85.222.169]:42785 "EHLO
        mail-qk1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731051AbfLKPMH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Dec 2019 10:12:07 -0500
Received: by mail-qk1-f169.google.com with SMTP id z14so9572924qkg.9
        for <linux-gpio@vger.kernel.org>; Wed, 11 Dec 2019 07:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WlPM/YHVMJ7UCNl2eZLZOOG7aVPUieazQLzoHK/wCZI=;
        b=LsiNBM/FsroUH4smxOe1imJV4dPcZjb/uHGn+Wp31XCVd43g7vuF8y4w5pRvcYNC4r
         jY/uuxrKwpkAat4JElPjEbk+rOvoOsicLYRuwsQ9ytI207UUE2yzykSwgdQGU9F8heK4
         UwWYU7vhDeX1bKZEDkOZ7KisnriznV/JJvfP6gf/42u7Zjv0TCNY5UU1P2ZvrryxaxoK
         +241GcARrddlBC0jKJbGmyXF5wzVmDIgK3IIACyX3jBr0SwcaN/64JYIP1v+vuPZRnbm
         zdHjj4UzOu/qg7rNSgv9ode5CE+QnvUGEQ8+cqIFM7iBryLajgFrXNkMthY8yhYBdQGy
         4r1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WlPM/YHVMJ7UCNl2eZLZOOG7aVPUieazQLzoHK/wCZI=;
        b=oK0EUD/KIkV815hcHiPCLvURzIvDBGCSL3ZqlPrOu6wqP7V4xLPtWT1bV/6LUU4StI
         P8qOif7Y2k9hA5onHKW3nQ6n9TGDIUIFBreVJ7D1fHL8wHQJg51QU9x2sBR0hvcHqax3
         UT89mEuJPl7dsEvtRmuaT9QX4SMXMJjWNyp2kd90amIHXGy9nImOXjv1ZNmm75Qe2WyL
         /Lu/sDyB5v+kPhpNiGf1d+0+A+z0PFRJsWh4B7Lx5for50qnA7mCPlwWhivjzyUWcdIk
         v1WMZvDKU6IzGkfPhBQllFvFvLfGMr1NvfdKScdpRGzdpc3lu5clAc/Y1OktVzR8Bj7Q
         dOng==
X-Gm-Message-State: APjAAAWsU6m4ic9rIgrbiHNsdfA3+sLoycaDMPdLMR7ai0himnh6re74
        mp/wh9tIVHVuoBrSbz0aB/occ+DyfERE7RGfSEmNbw==
X-Google-Smtp-Source: APXvYqxl1xrD4MtXqbrkFEiz63zdtPszg9xDvbfcvPrJS6Orq2Hc5A0XCKwVf/iGCeYME1nlObxILIrr6uNtuDv8SYQ=
X-Received: by 2002:a05:620a:136e:: with SMTP id d14mr3035585qkl.263.1576077126350;
 Wed, 11 Dec 2019 07:12:06 -0800 (PST)
MIME-Version: 1.0
References: <20191203192305.31722-1-jsavitz@redhat.com>
In-Reply-To: <20191203192305.31722-1-jsavitz@redhat.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 11 Dec 2019 16:11:55 +0100
Message-ID: <CAMpxmJXNXJKMqPiJrKXtJ0GXxVjvv61aSgDHeX_p2TWTphsUFQ@mail.gmail.com>
Subject: Re: [libgpiod] bindings: python: fix segfault when calling Line.request()
To:     Joel Savitz <jsavitz@redhat.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        fedora-rpi@googlegroups.com
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

Applied to master and 1.4.x stable.

Thanks,
Bartosz
