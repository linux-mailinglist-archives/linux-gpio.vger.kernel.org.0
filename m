Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 367311006D6
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2019 14:53:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726830AbfKRNxJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Nov 2019 08:53:09 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:41098 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726668AbfKRNxJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Nov 2019 08:53:09 -0500
Received: by mail-ot1-f66.google.com with SMTP id 94so14524700oty.8
        for <linux-gpio@vger.kernel.org>; Mon, 18 Nov 2019 05:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=k9lIRhwgcbajhqZpOmb59aZe1C6tNWHMx4MXKAPT8GA=;
        b=2TVW7BlRRvg/yNdEe7SXfLssjB+94AA4r2TszH5OFw5Vw6Vby5qBXcLTDWLd+utPMN
         PdXAg5jT4eMUcI5j89HmvSLIxeplqCtmGlKvuGvcvWfNZ+rqAm3S9hHdJzI73C69c0bB
         hu+m1eX07jbJvC4Rvl2JVRo+GfVJi6duaFFK6vRY12bANYbp3QNFUgvfsqW9BO6KxTPB
         U6N1x06ufllwzHHl98f2EioaEbCrjveiGYb6j4CZDVUNhDu8Ao5sLC6NfKA3epRHLEdF
         JAUuc1t17xBSuGek9QPyOb1ufKCAv9NvWwrTXPPj7DfCPhRlUJLrrYcPfaoWKaQYZm4+
         UVjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=k9lIRhwgcbajhqZpOmb59aZe1C6tNWHMx4MXKAPT8GA=;
        b=uVAugmyed5+nbvVmD/gn3RAkeu/Q3gOPhFzHh59SCpVUabT3I6HwMMqOKNrTgqS/Q3
         m8GFmUYX/gUzgWLOxYGDV3HZgVJhrNZfYNZmyNt9WufYpGpXic14zI2Vj0ER5XKmbHEb
         uNFHaRyqeCY9mAqvQ7atD1k5Fwgu5g+kqybjsbChhKqbIihx62lycD2/hxUlji0ZkPxB
         UfwBvIro9gG30n6b8lnb7dr+UOV/pOQGoyJLcY6QCskbc+un6Pir3ZlonFoOoJArYbAQ
         Cxf6XEgfWJWhrQbpP4Ej+1KgA1qWHscz/W4aXwsSscEZFY8EZyd0w1AXLqKiAvLBAqlP
         9WLQ==
X-Gm-Message-State: APjAAAUQQ7UxD1HDukRyt1ZDNjqUoY1eyoEsyI336AAxkXnT0qB0Y1cN
        PgjO5/BWlXSSMWhNzBOgewTkHjFeHhR7IS1WYnsfuA==
X-Google-Smtp-Source: APXvYqw5d0gyDjZipTu/2JAH+fQ8e0BTZCCpGvPXeJJmn618E2tHzMw3GZZYg7g55Oz2iFYElYb34xxZqEeSvdiWW+w=
X-Received: by 2002:a05:6830:453:: with SMTP id d19mr11370129otc.256.1574085187557;
 Mon, 18 Nov 2019 05:53:07 -0800 (PST)
MIME-Version: 1.0
References: <20191115144355.975-1-warthog618@gmail.com> <20191115144355.975-20-warthog618@gmail.com>
In-Reply-To: <20191115144355.975-20-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 18 Nov 2019 14:52:56 +0100
Message-ID: <CAMpxmJVuw84__hhd=HVmZVMhZzeb4VuYNhC==A94QRE-vG3ZUg@mail.gmail.com>
Subject: Re: [libgpiod] [PATCH 19/19] treewide: change "correspond with" to
 "correspond to"
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pt., 15 lis 2019 o 15:45 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a)=
:
>
> Trivial grammar fix. "correspond with" can mean either being in agreement
> with, happening at the same time, or communication between parties.
> "correspond to" is used to mean equivalance, which is the intended use
> throughout the documentation.
>

Thanks for this. I'm not a native English speaker, so if you see any
other language issues, please let me know, or feel free to fix them.

Bart

> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>  bindings/python/gpiodmodule.c | 6 +++---
>  include/gpiod.h               | 2 +-
>  lib/core.c                    | 2 +-
>  tests/mockup/gpio-mockup.c    | 2 +-
>  4 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/bindings/python/gpiodmodule.c b/bindings/python/gpiodmodule.=
c
> index 4949b14..74fbea3 100644
> --- a/bindings/python/gpiodmodule.c
> +++ b/bindings/python/gpiodmodule.c
> @@ -1330,7 +1330,7 @@ PyDoc_STRVAR(gpiod_LineBulk_get_values_doc,
>  "get_values() -> list of integers\n"
>  "\n"
>  "Read the values of all the lines held by this LineBulk object. The inde=
x\n"
> -"of each value in the returned list corresponds with the index of the li=
ne\n"
> +"of each value in the returned list corresponds to the index of the line=
\n"
>  "in this gpiod.LineBulk object.");
>
>  static PyObject *gpiod_LineBulk_get_values(gpiod_LineBulkObject *self,
> @@ -1385,7 +1385,7 @@ PyDoc_STRVAR(gpiod_LineBulk_set_values_doc,
>  "\n"
>  "The number of values in the list passed as argument must be the same as=
\n"
>  "the number of lines held by this gpiod.LineBulk object. The index of ea=
ch\n"
> -"value corresponds with the index of each line in the object.\n");
> +"value corresponds to the index of each line in the object.\n");
>
>  static PyObject *gpiod_LineBulk_set_values(gpiod_LineBulkObject *self,
>                                            PyObject *args)
> @@ -1408,7 +1408,7 @@ static PyObject *gpiod_LineBulk_set_values(gpiod_Li=
neBulkObject *self,
>         num_vals =3D PyObject_Size(val_list);
>         if (self->num_lines !=3D num_vals) {
>                 PyErr_SetString(PyExc_TypeError,
> -                               "Number of values must correspond with th=
e number of lines");
> +                               "Number of values must correspond to the =
number of lines");
>                 return NULL;
>         }
>
> diff --git a/include/gpiod.h b/include/gpiod.h
> index 4053fd2..6776852 100644
> --- a/include/gpiod.h
> +++ b/include/gpiod.h
> @@ -779,7 +779,7 @@ gpiod_line_bulk_num_lines(struct gpiod_line_bulk *bul=
k)
>   *
>   * This is a variant of ::gpiod_line_bulk_foreach_line which uses an int=
eger
>   * variable (either signed or unsigned) to store the loop state. This of=
fset
> - * variable is guaranteed to correspond with the offset of the current l=
ine in
> + * variable is guaranteed to correspond to the offset of the current lin=
e in
>   * the bulk->lines array.
>   */
>  #define gpiod_line_bulk_foreach_line_off(bulk, line, offset)           \
> diff --git a/lib/core.c b/lib/core.c
> index 2e54def..54ae09c 100644
> --- a/lib/core.c
> +++ b/lib/core.c
> @@ -111,7 +111,7 @@ static bool is_gpiochip_cdev(const char *path)
>
>         /*
>          * Make sure the major and minor numbers of the character device
> -        * correspond with the ones in the dev attribute in sysfs.
> +        * correspond to the ones in the dev attribute in sysfs.
>          */
>         snprintf(devstr, sizeof(devstr), "%u:%u",
>                  major(statbuf.st_rdev), minor(statbuf.st_rdev));
> diff --git a/tests/mockup/gpio-mockup.c b/tests/mockup/gpio-mockup.c
> index e3a53da..fa27bd7 100644
> --- a/tests/mockup/gpio-mockup.c
> +++ b/tests/mockup/gpio-mockup.c
> @@ -333,7 +333,7 @@ EXPORT int gpio_mockup_probe(struct gpio_mockup *ctx,=
 unsigned int num_chips,
>         /*
>          * We can't assume that the order in which the mockup gpiochip
>          * devices are created will be deterministic, yet we want the
> -        * index passed to the test_chip_*() functions to correspond with=
 the
> +        * index passed to the test_chip_*() functions to correspond to t=
he
>          * order in which the chips were defined in the TEST_DEFINE()
>          * macro.
>          *
> --
> 2.24.0
>
