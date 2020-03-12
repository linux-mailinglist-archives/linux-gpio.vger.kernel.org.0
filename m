Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D39D0183220
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2020 14:54:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727072AbgCLNy0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Mar 2020 09:54:26 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:46258 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726299AbgCLNy0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Mar 2020 09:54:26 -0400
Received: by mail-qk1-f195.google.com with SMTP id f28so6210456qkk.13
        for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2020 06:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=YJCbAPM757c7WtP5729q/CvzsGeEr1ydJuKt4rhqYN0=;
        b=Wz9uTaImPoBXmMxauB2gmqMyOC7ZHJIqwDg3dkJxuEtcOEk7VlKjUF7hgOsfXtoDcf
         j56kSjTCHlUXqEi+p4R2+8g6dT3gOl/SfmGOcvsTWoiIqnsO1gIjCd8nmxxSGGTU+gXg
         redRm1hKIc7Hw5YBy+xDo0LJcZwVYZbd3/gGlzuiEBUPTOsTKdPvowZBsC/atoHowoQL
         Wd6J4G7x2CQKp0qB8Q4ri+INEfgSNXrxafpiqxJXlFFMGhj7xVIBbfKyTOmvcpmFwtzH
         rJWugm3npmE/ewF3g+mT9QpKbmwqmK6NhDhKv8RUCMsY/qAWA4H2bHNlERC3rgkJlNnM
         +vxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YJCbAPM757c7WtP5729q/CvzsGeEr1ydJuKt4rhqYN0=;
        b=r6z1uIwNjZ19tjWatuYDeaELG8DRcjw8b70oTtSLhCxk4P0LG0abFJvK1Q/u1rS0QR
         MdTtvjBP4ZQXGqycErH9gM81yejiTKMXhC3gNPF6QisQyCCCpzKkRpqrGt0hhr/vfQh2
         MvNnLODENuIHEXvtACG+uprhJTo8sld4Z/dFwZLrEbTVm7dMOSTZUXImBEQlTRF07i6k
         v8BG55lDfViaeuJUWIR2+EIG4MAHZd+YOwM2wqnMRyBrmNJy9UOegpChxUsumAvAPVUh
         ofbxBwHAefGp1dpotU3Mkt4+FrmjYM34NGXMWNQJYkoUtl4Ym4XkMnmuUDPEm8whtYY6
         61cQ==
X-Gm-Message-State: ANhLgQ3hemMVNwlwKEhpdSYcRPnLjvOSDcrkiLAGzmPBe+b7IPcTid0f
        NEJiUqP7GTDloipB2Wvu5KUvGFR2mA/ipMHUvFxhzw==
X-Google-Smtp-Source: ADFU+vsuGDmI45/A8Yf3+0B7+92jTTpshUjY3yuJofcW2KRZcB5IKMAjUaGCEWxWhVaaeduCWL8mS5oibYzFRjRxZqM=
X-Received: by 2002:a05:620a:1362:: with SMTP id d2mr8052260qkl.120.1584021265259;
 Thu, 12 Mar 2020 06:54:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200312094008.1833929-1-gabravier@gmail.com>
In-Reply-To: <20200312094008.1833929-1-gabravier@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 12 Mar 2020 14:54:12 +0100
Message-ID: <CAMpxmJUUth5w8tvZp8mFV-FDz0YivmRWAqsOQSTdze1xagMX8A@mail.gmail.com>
Subject: Re: [PATCH] gpio-hammer: Avoid potential overflow in main
To:     Gabriel Ravier <gabravier@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 12 mar 2020 o 10:40 Gabriel Ravier <gabravier@gmail.com> napisa=C5=82=
(a):
>
> If '-o' was used more than 64 times in a single invocation of gpio-hammer=
,
> this could lead to an overflow of the 'lines' array. This commit fixes
> this by avoiding the overflow and giving a proper diagnostic back to the
> user
>
> Signed-off-by: Gabriel Ravier <gabravier@gmail.com>
> ---
>  tools/gpio/gpio-hammer.c | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
>
> diff --git a/tools/gpio/gpio-hammer.c b/tools/gpio/gpio-hammer.c
> index 0e0060a6e..273d33847 100644
> --- a/tools/gpio/gpio-hammer.c
> +++ b/tools/gpio/gpio-hammer.c
> @@ -77,7 +77,7 @@ int hammer_device(const char *device_name, unsigned int=
 *lines, int nlines,
>
>                 fprintf(stdout, "[%c] ", swirr[j]);
>                 j++;
> -               if (j =3D=3D sizeof(swirr)-1)
> +               if (j =3D=3D sizeof(swirr) - 1)

Please don't try to sneak in unrelated changes into commits. This is
of course correct coding-style-wise but send it in a separate patch.

>                         j =3D 0;
>
>                 fprintf(stdout, "[");
> @@ -135,7 +135,14 @@ int main(int argc, char **argv)
>                         device_name =3D optarg;
>                         break;
>                 case 'o':
> -                       lines[i] =3D strtoul(optarg, NULL, 10);
> +                       /*
> +                        * Avoid overflow. Do not immediately error, we w=
ant to
> +                        * be able to accurately report on the amount of =
times
> +                        *'-o' was given to give an accurate error messag=
e
> +                        */
> +                       if (i < GPIOHANDLES_MAX)
> +                               lines[i] =3D strtoul(optarg, NULL, 10);
> +
>                         i++;
>                         break;
>                 case '?':
> @@ -143,6 +150,14 @@ int main(int argc, char **argv)
>                         return -1;
>                 }
>         }
> +
> +       if (i >=3D GPIOHANDLES_MAX) {
> +               fprintf(stderr,
> +                       "Only %d occurences of '-o' are allowed, %d were =
found\n",
> +                       GPIOHANDLES_MAX, i + 1);
> +               return -1;
> +       }
> +
>         nlines =3D i;
>
>         if (!device_name || !nlines) {
> --
> 2.24.1
>

Other than that, looks good.

Bartosz
