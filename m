Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 445D8113F56
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2019 11:27:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729041AbfLEK1T (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Dec 2019 05:27:19 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:36423 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728735AbfLEK1T (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Dec 2019 05:27:19 -0500
Received: by mail-pf1-f193.google.com with SMTP id b19so1417579pfd.3;
        Thu, 05 Dec 2019 02:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9Ef/ULU1Kge+LKFh8Fh5zno0Gs8s7Fac2gwZZitwvws=;
        b=GuUc0Wc5oPylsUhp/ivxIYWhGZFVRu3CxWq0tIaLEh3KLexjIu0YF3inaKgRxemq/o
         smcUmURO+bnsWrG37RAr2SMr34mupk/9PlGAex674fldyEUUirLHIco1DfPPIyvB8IS7
         Lgaq2w4woRVywywkz43F0vt9jCVNtoYs6Jx/Uxp4ksGW5qYtpFGlSa1fq6lL0OiM9VMR
         ZBYkACskHxGYQlqRwDTBjqTKwXuWMNttuIXCVCpV42BVsC/0q+mo5y6DSvz1ybhWQBku
         C2zQRCx5AFpWBjbMHX+yode12nEUapPRrCTAsM0PNaGWFPXTSmvvJQDGVzS5tIq4EBnd
         dZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9Ef/ULU1Kge+LKFh8Fh5zno0Gs8s7Fac2gwZZitwvws=;
        b=lCp4jGbHVYu6XSx3WJZfVcJA/TvKDFmTW9GDWTNZ6PLgZNaGg4Eth9FPYxUxxemUpi
         Lqsl1woQlQ0n4+ezW3a8RTkRghvonPQAwKxS9c3dtTaj/sSLB0GhPEgd74ytVcsF5Bd4
         IR7SyzVz/NQreVzI5WHGadPf2QzI/NHYYYMTQjn7Bc/D59YzgfT/LQkW7JT6GXl26XFt
         A6QMTM+ypvv2PW0raziL0y0Y840mxtZcouEN69jSFuetTxy9/Q4g6jQDRaODYyBhyeUN
         2k+s4EV1qu2xFMXXqzxBhvImICNGuNcs9oES09vLiZFGz4lyMKYM2fHjP9gvb6i4+9WW
         aDpQ==
X-Gm-Message-State: APjAAAWdhdxQdKGQBoVoGlZ4J/4RjbzbcuBg7qHMyxQtmipe2rQEG9sv
        vAMRi2GqKOBUWJethJPlOHJjEpuyRsznGdIB3RHeyNh6
X-Google-Smtp-Source: APXvYqxvHJo0ElWDiYwwFrbf1lm4Gp70OeitmtEpDaFZAsEn8ACG2g/DsguKfDXwFnPH/5HOLgQXM+FyqErLXso4fZc=
X-Received: by 2002:a63:e14a:: with SMTP id h10mr8394575pgk.74.1575541638530;
 Thu, 05 Dec 2019 02:27:18 -0800 (PST)
MIME-Version: 1.0
References: <20191204155941.17814-1-brgl@bgdev.pl> <CAHp75VdiAtHtdrUP2EmLULh86oO37ha8si10gFKYRavXCEwRRQ@mail.gmail.com>
 <CAMpxmJVXVVVMPA_hRbs3mUsFs=s_VtQK9SvvYK3Xc5X27NPTKw@mail.gmail.com>
In-Reply-To: <CAMpxmJVXVVVMPA_hRbs3mUsFs=s_VtQK9SvvYK3Xc5X27NPTKw@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 5 Dec 2019 12:27:08 +0200
Message-ID: <CAHp75VfXc88Fa6=zs=9iToz27QdXHqRCDPQwBPs2P-rsBF8nHw@mail.gmail.com>
Subject: Re: [PATCH v2 10/11] gpiolib: add new ioctl() for monitoring changes
 in line info
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 5, 2019 at 11:42 AM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
> =C5=9Br., 4 gru 2019 o 23:34 Andy Shevchenko <andy.shevchenko@gmail.com> =
napisa=C5=82(a):
> > On Wed, Dec 4, 2019 at 6:03 PM Bartosz Golaszewski <brgl@bgdev.pl> wrot=
e:

> > > +struct gpioline_info_changed {
> > > +       __u64 timestamp;
> > > +       __u32 event_type;
> > > +       struct gpioline_info info;
> > > +       __u32 padding[4]; /* for future use */
> > > +};
> >
> > Has this been tested against 64-bit kernel / 32-bit userspace case?
> >
>
> No. Since this is a new thing - do you think it's possible to simply
> arrange the fields or add padding such that the problem doesn't even
> appear in the first place?

Yes. this can be done, though be careful about potential endianess
issues (the ABI must be tested on BE as well).

So, the test cases, I can imagine of, should include (k - kernel, u - user)=
:
- 64k-64u: LE and BE
- 64k-32u: LE and BE
- 32k-32u: LE and BE

--=20
With Best Regards,
Andy Shevchenko
