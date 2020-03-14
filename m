Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 115AE18583F
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Mar 2020 02:59:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727282AbgCOB7I (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 14 Mar 2020 21:59:08 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:37270 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727049AbgCOB7I (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 14 Mar 2020 21:59:08 -0400
Received: by mail-io1-f67.google.com with SMTP id k4so13672733ior.4
        for <linux-gpio@vger.kernel.org>; Sat, 14 Mar 2020 18:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=XS7pPJqjYBq2Cs3zeKdcSdMmGqDIVMj9vKA0yVpQYQM=;
        b=Sf5x1zwN8QR6qPFehI+iNJp+T4OBQDZok0BZVP5d7W697tY7nu3iIaNX/pTClNaP6m
         a2IlKNgv3JLE+oLxB140e6Gni9q1YQvXzxUKBXYU2Qz/JmiQg9VkiOFdwViV3x/oNTuq
         ODxU2QcZ0/2BsgOZHB9KPXhgo4UWuHOLkdg5ebQcSj1DOyzkciV28dC7LznuuSbbsgLf
         9qKypmkEvJauObctXk54IDy1FlikMphAdZKUM9sRnEVtB06VebdZWeFf0jzJDmICKRGR
         j4BvQWoJ3wr5/ZDTL0CUeBuvqrdKMphzxoyMadubUapSr3ZlPFVXY042oSM6QDHGEcQF
         Y0VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=XS7pPJqjYBq2Cs3zeKdcSdMmGqDIVMj9vKA0yVpQYQM=;
        b=nHv+ftFp26OE21bEyi3tcmy0Pv+HdgGOiJFX+DJwPF4BhgswyQHFLffYXCxLxakbkV
         gSAHX4auzdLqO5aabkI+8D8XmtzvYijXlasgsmYtLpBBhXDPYaDOmCTrwcsYMqDoiARB
         AXPf+IKBPUHzCloi6hHv4TEEYnFkIG6KhASLQIQy/AiqIluHpKYMkuirT/Ym6SkkMN70
         IkDVsj7RFFAkH0cZ69FOtBjNElL8H0xn3BXeq+KPz8FjVZnFStcclPJgFksm7eh+6f0w
         2XkoJ8jOJSSVjqwNb5qUZUIRMHDmcNhxDNQY7+I+5ObpAWYZHgqE1LncAyICNIWeIFfa
         P2Xg==
X-Gm-Message-State: ANhLgQ1AfsRVIhDL3aA7SYOo+HJHRGrZEWTIR5iVZ/qaceuc/79nxRcX
        uX9Sn77bzSvnLOJvCpz1vRmvK/6VJQs0J1vy/DI+0jni
X-Google-Smtp-Source: ADFU+vvNqfelgTman/LTAHlaUt3dUAnq12p1V6wQSTw4nfnSrB6N2tLtBDR4+u3SG5RCHzJpuWY38EXEpQpmo5eYaxA=
X-Received: by 2002:a5e:c70c:: with SMTP id f12mr18048548iop.130.1584217720359;
 Sat, 14 Mar 2020 13:28:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200312145020.1848727-1-gabravier@gmail.com>
In-Reply-To: <20200312145020.1848727-1-gabravier@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sat, 14 Mar 2020 21:28:29 +0100
Message-ID: <CAMRc=Me=u5dq1_kOk3qJ-XZbkiOrK01ZDueY6K_U2N2QSc27zQ@mail.gmail.com>
Subject: Re: [PATCH v3] gpio-hammer: Avoid potential overflow in main
To:     Gabriel Ravier <gabravier@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 12 mar 2020 o 15:50 Gabriel Ravier <gabravier@gmail.com> napisa=C5=82=
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
>  tools/gpio/gpio-hammer.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/tools/gpio/gpio-hammer.c b/tools/gpio/gpio-hammer.c
> index 0e0060a6e..083399d27 100644
> --- a/tools/gpio/gpio-hammer.c
> +++ b/tools/gpio/gpio-hammer.c
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
> +                        * '-o' was given to give an accurate error messa=
ge
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

Patch applied, thanks!

Bartosz
