Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5D3711454C
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2019 18:02:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729866AbfLERCc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Dec 2019 12:02:32 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:45980 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726028AbfLERCc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Dec 2019 12:02:32 -0500
Received: by mail-pj1-f66.google.com with SMTP id r11so1519857pjp.12;
        Thu, 05 Dec 2019 09:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RHJUr25kmF0qaYU7XKGZXFCAi/6myqgpNnO6bM9rpxM=;
        b=L5+Uiq2fJf9wLrh4uFUX4gkocBD981uCeSyNPfIDjEGLN/kecQt+wcVhm2ep+Rko/K
         tmUMtdeYAnBC0evxnBY1PPe+z0wLKQ1Us9HByNAh+Meoq50XRy60rf2ttT4ETiRGwZa3
         fjD0KGxjsQe1qWyY7Mo8MJ3IWxhoB4A5gn4Yfa6iAjatYg/r9oAjFHzVIDcGmp4TAFaa
         e9fxgGokX3nAchueZh0aU/EktPP8ItgZFUKKKbhCr46eI0h5ICQ6a/A/RSqSa2Hoh6BM
         XLqH2QnwE9XlVM1NADp+zGA7ukChsm6gL3P6l4vZeD9b6zXQ+pQDWd+0nlNnGyQp81Ki
         +pLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RHJUr25kmF0qaYU7XKGZXFCAi/6myqgpNnO6bM9rpxM=;
        b=azG+XOWzYEtxEPcYjc/CqaJ31HVQlL3Nlddjx1HGfASlYTWdLtPAYaF+cqhGcrslnM
         oVB5S1ymZldH1LvVUm0vYBH6yL//qgSTHcNLVhE+a27j46crePRQZDHYEyI+KOhh2uOz
         /ntX2v6yA9T8OakkT5B8ZvVz7gtRklvq8TNZ88jV2zIdxfSXO450D1EnXbAdLr90/zuj
         9hEO0IM/+NMooQjjP7z8o9kZx3tWkL2YNwVPcMcAD56iadyKOs+Xfa7OJGgmAZiZ426I
         Zrm6LpNvE6+99NWddfGwdeFQKH4Cx+S7GAW00zDTY1GRuh+JG2t/Y3NUyXCPxsiqdt0w
         CAIQ==
X-Gm-Message-State: APjAAAUpUORyZhK/XEKZ/Jg+2DqmfrTTp0Yj9yibMyAxu9SNJhdDcxcV
        6wxS81tULfBD9HtcqnslEcVywYw4UAsYO1tp2P4=
X-Google-Smtp-Source: APXvYqyqsP8cdWdeG0WdYWRvw2EMbPgQ0l70RUvop0SBX/Tfn6fSQWhKNdYN4BdFG5NCz7YeW1Qe256CHYvKJFjqM1g=
X-Received: by 2002:a17:90a:c68f:: with SMTP id n15mr10539320pjt.20.1575565351311;
 Thu, 05 Dec 2019 09:02:31 -0800 (PST)
MIME-Version: 1.0
References: <20191204155941.17814-1-brgl@bgdev.pl> <CAHp75VdiAtHtdrUP2EmLULh86oO37ha8si10gFKYRavXCEwRRQ@mail.gmail.com>
 <CAMpxmJVXVVVMPA_hRbs3mUsFs=s_VtQK9SvvYK3Xc5X27NPTKw@mail.gmail.com>
 <CAHp75VfXc88Fa6=zs=9iToz27QdXHqRCDPQwBPs2P-rsBF8nHw@mail.gmail.com> <CAMRc=Me4xWsQggmr=BvJrA9-FnPkxFkOYsRTsSXCtyNwFnsHNw@mail.gmail.com>
In-Reply-To: <CAMRc=Me4xWsQggmr=BvJrA9-FnPkxFkOYsRTsSXCtyNwFnsHNw@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 5 Dec 2019 19:02:21 +0200
Message-ID: <CAHp75VfzP8-0wKmPTTKYe+fc6=r_4sVcJPyOsM8YTuH=i4rxmA@mail.gmail.com>
Subject: Re: [PATCH v2 10/11] gpiolib: add new ioctl() for monitoring changes
 in line info
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
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

On Thu, Dec 5, 2019 at 3:47 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> czw., 5 gru 2019 o 11:27 Andy Shevchenko <andy.shevchenko@gmail.com> napi=
sa=C5=82(a):
> > On Thu, Dec 5, 2019 at 11:42 AM Bartosz Golaszewski
> > <bgolaszewski@baylibre.com> wrote:
> > > =C5=9Br., 4 gru 2019 o 23:34 Andy Shevchenko <andy.shevchenko@gmail.c=
om> napisa=C5=82(a):
> > > > On Wed, Dec 4, 2019 at 6:03 PM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> > So, the test cases, I can imagine of, should include (k - kernel, u - u=
ser):
> > - 64k-64u: LE and BE
> > - 64k-32u: LE and BE
> > - 32k-32u: LE and BE
>
> I usually use qemu VMs built with yocto for testing but I don't see
> any way of creating a 32-bit user-space with 64-bit kernel. Any ideas
> on how to prepare a testing environment?

In my case it's very easy. I do
- compile kernel as 64-bit separately;
- compile initramfs of Buildroot distro with external kernel build provided=
.

That's setup in which I observed the issue.

--=20
With Best Regards,
Andy Shevchenko
