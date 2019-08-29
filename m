Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50459A1B6B
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2019 15:28:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbfH2N2C (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Aug 2019 09:28:02 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:32802 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727021AbfH2N2B (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Aug 2019 09:28:01 -0400
Received: by mail-pg1-f194.google.com with SMTP id n190so1616008pgn.0;
        Thu, 29 Aug 2019 06:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2Y6BpN7Uupv7X4I2rysVn7jUz/GHrmd0Z9b9CcxKoxs=;
        b=Ycdb5dkvqqq+4NIpkaAupgTLIDvX14i7bpzIKjFlPl3+BAx5Z4ux339GbCiXB8RFii
         KYI/1UWZhaVcbvMVjlqnN0cWuaycw9VQELtYcvwDXdzjw4hYAf7xh681C93k2DzWa8HF
         b2xmoN+7bprc8Ez94NBFrEfyiQqxUTI5VOlO3acgw8I3+y10RWZ74FlwgZZZnoQdc1WL
         lu8urWcjz+eAmbYR/8sDH4xc7Sva1FtH2dNweORLRl72vollVCx+BfNBl0SI+vrX6NoP
         7j/hGqbW+KUiJwYBydeg21FmieYDDbXt6qAJwiHLnNV3iriEK5Vx4cajJE0bcp8ournT
         HKPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2Y6BpN7Uupv7X4I2rysVn7jUz/GHrmd0Z9b9CcxKoxs=;
        b=BEgRGiGFt1+oq/bIJp+xOvY4/a4GCLQErlKmjaxb0DdI0p8dicWNh7zcMzmFTM9qnO
         BvFejYpwGD16uHn5ic19UaGCaDDBcRis0N0rAyXbFQfZayKJ+wnZx+ygc6XIf4OGxXwU
         2eQfVKHE1dc6Z8mHSn6j1SG8aEedLUK9uvJIssQQ06pD3ON2enSU1G4d6RpvOnjFK8M7
         MwNSpCYbsZQzZ5VMAK6RoPaoXTyD0BFvOq2+G3r/179jRNaeTtexG4Jy0OmcOXAns331
         kt3j6hdWFUNvCkFPk285Qz/hcT3eaz0BVY9t9seQD4Uj4v6ugGWSzNgf6Up3I2RUl1b4
         c5Iw==
X-Gm-Message-State: APjAAAVfMv+8uIeLv24fg7XswWpl/SRySpxL8POtvWQuv6HuxzP0pVPY
        5e6Ur3ZvTMzIuiQ+1Mm8NX3c7Hsgd0Zk6oMUNng=
X-Google-Smtp-Source: APXvYqx4YSUU2osDY9JdW85z12G2w/UvYdFaEaqz3Z5+lCelyQCVM7HmagT+5t2YxPCEJ95Uyc+Y0i2MTZHASo/160k=
X-Received: by 2002:a63:c842:: with SMTP id l2mr6905808pgi.4.1567085280639;
 Thu, 29 Aug 2019 06:28:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190824233724.1775-1-uwe@kleine-koenig.org>
In-Reply-To: <20190824233724.1775-1-uwe@kleine-koenig.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 29 Aug 2019 16:27:49 +0300
Message-ID: <CAHp75Veuxt40U8CotL5KHJGxNPOJ7a-DCcKWN7+mgoPJAieTDA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] vsprintf: introduce %dE for error constants
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <uwe@kleine-koenig.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Documentation List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Aug 25, 2019 at 2:40 AM Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.or=
g> wrote:
>
>         pr_info("probing failed (%dE)\n", ret);
>
> expands to
>
>         probing failed (EIO)
>
> if ret holds -EIO (or EIO). This introduces an array of error codes. If
> the error code is missing, %dE falls back to %d and so prints the plain
> number.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.org>
> ---
> Hello
>
> there are many code sites that benefit from this. Just grep for
> "(%d)" ...
>
> As an example the follow up patch converts a printk to use this new
> format escape.
>

Let's not do this!

We have already a lot of pain with pointer extension, but here is just
a misleading stuff.
Besides above, how you print (float) number out of kernel in sysfs in
very well standard format?
Please, use %p<SMTH> instead.

> Best regards
> Uwe
>
>  Documentation/core-api/printk-formats.rst |   3 +
>  lib/vsprintf.c                            | 193 +++++++++++++++++++++-
>  2 files changed, 195 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/co=
re-api/printk-formats.rst
> index c6224d039bcb..81002414f956 100644
> --- a/Documentation/core-api/printk-formats.rst
> +++ b/Documentation/core-api/printk-formats.rst
> @@ -35,6 +35,9 @@ Integer types
>                 u64                     %llu or %llx
>
>
> +To print the name that corresponds to an integer error constant, use %dE=
 and
> +pass the int.
> +
>  If <type> is dependent on a config option for its size (e.g., sector_t,
>  blkcnt_t) or is architecture-dependent for its size (e.g., tcflag_t), us=
e a
>  format specifier of its largest possible type and explicitly cast to it.
> diff --git a/lib/vsprintf.c b/lib/vsprintf.c
> index b0967cf17137..672eab8dab84 100644
> --- a/lib/vsprintf.c
> +++ b/lib/vsprintf.c
> @@ -533,6 +533,192 @@ char *number(char *buf, char *end, unsigned long lo=
ng num,
>         return buf;
>  }
>
> +#define ERRORCODE(x) { .str =3D #x, .err =3D x }
> +
> +static const struct {
> +       const char *str;
> +       int err;
> +} errorcodes[] =3D {
> +       ERRORCODE(EPERM),
> +       ERRORCODE(ENOENT),
> +       ERRORCODE(ESRCH),
> +       ERRORCODE(EINTR),
> +       ERRORCODE(EIO),
> +       ERRORCODE(ENXIO),
> +       ERRORCODE(E2BIG),
> +       ERRORCODE(ENOEXEC),
> +       ERRORCODE(EBADF),
> +       ERRORCODE(ECHILD),
> +       ERRORCODE(EAGAIN),
> +       ERRORCODE(ENOMEM),
> +       ERRORCODE(EACCES),
> +       ERRORCODE(EFAULT),
> +       ERRORCODE(ENOTBLK),
> +       ERRORCODE(EBUSY),
> +       ERRORCODE(EEXIST),
> +       ERRORCODE(EXDEV),
> +       ERRORCODE(ENODEV),
> +       ERRORCODE(ENOTDIR),
> +       ERRORCODE(EISDIR),
> +       ERRORCODE(EINVAL),
> +       ERRORCODE(ENFILE),
> +       ERRORCODE(EMFILE),
> +       ERRORCODE(ENOTTY),
> +       ERRORCODE(ETXTBSY),
> +       ERRORCODE(EFBIG),
> +       ERRORCODE(ENOSPC),
> +       ERRORCODE(ESPIPE),
> +       ERRORCODE(EROFS),
> +       ERRORCODE(EMLINK),
> +       ERRORCODE(EPIPE),
> +       ERRORCODE(EDOM),
> +       ERRORCODE(ERANGE),
> +       ERRORCODE(EDEADLK),
> +       ERRORCODE(ENAMETOOLONG),
> +       ERRORCODE(ENOLCK),
> +       ERRORCODE(ENOSYS),
> +       ERRORCODE(ENOTEMPTY),
> +       ERRORCODE(ELOOP),
> +       ERRORCODE(EWOULDBLOCK),
> +       ERRORCODE(ENOMSG),
> +       ERRORCODE(EIDRM),
> +       ERRORCODE(ECHRNG),
> +       ERRORCODE(EL2NSYNC),
> +       ERRORCODE(EL3HLT),
> +       ERRORCODE(EL3RST),
> +       ERRORCODE(ELNRNG),
> +       ERRORCODE(EUNATCH),
> +       ERRORCODE(ENOCSI),
> +       ERRORCODE(EL2HLT),
> +       ERRORCODE(EBADE),
> +       ERRORCODE(EBADR),
> +       ERRORCODE(EXFULL),
> +       ERRORCODE(ENOANO),
> +       ERRORCODE(EBADRQC),
> +       ERRORCODE(EBADSLT),
> +       ERRORCODE(EBFONT),
> +       ERRORCODE(ENOSTR),
> +       ERRORCODE(ENODATA),
> +       ERRORCODE(ETIME),
> +       ERRORCODE(ENOSR),
> +       ERRORCODE(ENONET),
> +       ERRORCODE(ENOPKG),
> +       ERRORCODE(EREMOTE),
> +       ERRORCODE(ENOLINK),
> +       ERRORCODE(EADV),
> +       ERRORCODE(ESRMNT),
> +       ERRORCODE(ECOMM),
> +       ERRORCODE(EPROTO),
> +       ERRORCODE(EMULTIHOP),
> +       ERRORCODE(EDOTDOT),
> +       ERRORCODE(EBADMSG),
> +       ERRORCODE(EOVERFLOW),
> +       ERRORCODE(ENOTUNIQ),
> +       ERRORCODE(EBADFD),
> +       ERRORCODE(EREMCHG),
> +       ERRORCODE(ELIBACC),
> +       ERRORCODE(ELIBBAD),
> +       ERRORCODE(ELIBSCN),
> +       ERRORCODE(ELIBMAX),
> +       ERRORCODE(ELIBEXEC),
> +       ERRORCODE(EILSEQ),
> +       ERRORCODE(ERESTART),
> +       ERRORCODE(ESTRPIPE),
> +       ERRORCODE(EUSERS),
> +       ERRORCODE(ENOTSOCK),
> +       ERRORCODE(EDESTADDRREQ),
> +       ERRORCODE(EMSGSIZE),
> +       ERRORCODE(EPROTOTYPE),
> +       ERRORCODE(ENOPROTOOPT),
> +       ERRORCODE(EPROTONOSUPPORT),
> +       ERRORCODE(ESOCKTNOSUPPORT),
> +       ERRORCODE(EOPNOTSUPP),
> +       ERRORCODE(EPFNOSUPPORT),
> +       ERRORCODE(EAFNOSUPPORT),
> +       ERRORCODE(EADDRINUSE),
> +       ERRORCODE(EADDRNOTAVAIL),
> +       ERRORCODE(ENETDOWN),
> +       ERRORCODE(ENETUNREACH),
> +       ERRORCODE(ENETRESET),
> +       ERRORCODE(ECONNABORTED),
> +       ERRORCODE(ECONNRESET),
> +       ERRORCODE(ENOBUFS),
> +       ERRORCODE(EISCONN),
> +       ERRORCODE(ENOTCONN),
> +       ERRORCODE(ESHUTDOWN),
> +       ERRORCODE(ETOOMANYREFS),
> +       ERRORCODE(ETIMEDOUT),
> +       ERRORCODE(ECONNREFUSED),
> +       ERRORCODE(EHOSTDOWN),
> +       ERRORCODE(EHOSTUNREACH),
> +       ERRORCODE(EALREADY),
> +       ERRORCODE(EINPROGRESS),
> +       ERRORCODE(ESTALE),
> +       ERRORCODE(EUCLEAN),
> +       ERRORCODE(ENOTNAM),
> +       ERRORCODE(ENAVAIL),
> +       ERRORCODE(EISNAM),
> +       ERRORCODE(EREMOTEIO),
> +       ERRORCODE(EDQUOT),
> +       ERRORCODE(ENOMEDIUM),
> +       ERRORCODE(EMEDIUMTYPE),
> +       ERRORCODE(ECANCELED),
> +       ERRORCODE(ENOKEY),
> +       ERRORCODE(EKEYEXPIRED),
> +       ERRORCODE(EKEYREVOKED),
> +       ERRORCODE(EKEYREJECTED),
> +       ERRORCODE(EOWNERDEAD),
> +       ERRORCODE(ENOTRECOVERABLE),
> +       ERRORCODE(ERFKILL),
> +       ERRORCODE(EHWPOISON),
> +       ERRORCODE(ERESTARTSYS),
> +       ERRORCODE(ERESTARTNOINTR),
> +       ERRORCODE(ERESTARTNOHAND),
> +       ERRORCODE(ENOIOCTLCMD),
> +       ERRORCODE(ERESTART_RESTARTBLOCK),
> +       ERRORCODE(EPROBE_DEFER),
> +       ERRORCODE(EOPENSTALE),
> +       ERRORCODE(ENOPARAM),
> +       ERRORCODE(EBADHANDLE),
> +       ERRORCODE(ENOTSYNC),
> +       ERRORCODE(EBADCOOKIE),
> +       ERRORCODE(ENOTSUPP),
> +       ERRORCODE(ETOOSMALL),
> +       ERRORCODE(ESERVERFAULT),
> +       ERRORCODE(EBADTYPE),
> +       ERRORCODE(EJUKEBOX),
> +       ERRORCODE(EIOCBQUEUED),
> +       ERRORCODE(ERECALLCONFLICT),
> +};
> +
> +static noinline_for_stack
> +char *errstr(char *buf, char *end, unsigned long long num,
> +            struct printf_spec spec)
> +{
> +       char *errname =3D NULL;
> +       size_t errnamelen, copy;
> +       int i;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(errorcodes); ++i) {
> +               if (num =3D=3D errorcodes[i].err || num =3D=3D -errorcode=
s[i].err) {
> +                       errname =3D errorcodes[i].str;
> +                       break;
> +               }
> +       }
> +
> +       if (!errname) {
> +               /* fall back to ordinary number */
> +               return number(buf, end, num, spec);
> +       }
> +
> +       copy =3D errnamelen =3D strlen(errname);
> +       if (copy > end - buf)
> +               copy =3D end - buf;
> +       buf =3D memcpy(buf, errname, copy);
> +
> +       return buf + errnamelen;
> +}
> +
>  static noinline_for_stack
>  char *special_hex_number(char *buf, char *end, unsigned long long num, i=
nt size)
>  {
> @@ -2566,7 +2752,12 @@ int vsnprintf(char *buf, size_t size, const char *=
fmt, va_list args)
>                                 num =3D va_arg(args, unsigned int);
>                         }
>
> -                       str =3D number(str, end, num, spec);
> +                       if (spec.type =3D=3D FORMAT_TYPE_INT && *fmt =3D=
=3D 'E') {
> +                               fmt++;
> +                               str =3D errstr(str, end, num, spec);
> +                       } else {
> +                               str =3D number(str, end, num, spec);
> +                       }
>                 }
>         }
>
> --
> 2.20.1
>


--=20
With Best Regards,
Andy Shevchenko
