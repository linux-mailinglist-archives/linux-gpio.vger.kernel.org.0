Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F93315087C
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2020 15:35:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728019AbgBCOfx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Feb 2020 09:35:53 -0500
Received: from mail-il1-f193.google.com ([209.85.166.193]:33160 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726268AbgBCOfx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Feb 2020 09:35:53 -0500
Received: by mail-il1-f193.google.com with SMTP id s18so12802490iln.0
        for <linux-gpio@vger.kernel.org>; Mon, 03 Feb 2020 06:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3vC73VMRCUJjEoKooO4GGeMZvtatPSqZubaRoJ/0maU=;
        b=Ww7tdXfKpSRXvrHnkSuKHrbRpi4DH5/7CchCLp5SKZ9rrZinzYyqfLoN6Sgu/XPuwR
         BgRA5X3D5SyMRuHJ+d9ldTYE19s+r3UcEHZPHpbv7s1XufjlIChBtBZSp9R6BotrPamH
         3cboV5nfiJ+BJ7/8SkHTP4we6E7pcvNqDSRKJ0npAjemW2dONSJ4f8qOLMurVjRtjswZ
         qyfi3PZv9X62QAXyOQJ+7ZAWx9YQxJL9rPkGpwR0oykqvskgFIaJ9yVjd6Tcirk4ynSK
         GIjXnxKmlMN2KeTRqxMdB0lKafbe5PGSVfFg5GeSaMXvjj8q6ZExG4UyqheiWBpWLM6V
         eN/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3vC73VMRCUJjEoKooO4GGeMZvtatPSqZubaRoJ/0maU=;
        b=ERG5ir4Jlmt97nD8fhkyQK9HtCYH5sTcI2VFYw8f+qYwu8cdLAM7JmKjbKJg/Qfw7t
         u/nq3hnEXWdSIG8T1FrfCyPZ8iv1SEGdaRTUqQKdRfUTIRuAez/13vZYEgZyNhMD+lPS
         zXHUYfE64siaOVQjBtCKvmEGg8uimdpr8HxgmC1XpaECQvidhT+ILVbhFGqEAg+Ik0qO
         sz8nKa6Dmd/jF/aLopdyCD/RxSE5Fm6+8eRP3Jww72X8Ep2IjXLtPtWVO/p5kfJR9TIt
         lYxB0ZFMVSiaiojA25VzjM6SEMCMKCpOO069GMLEJ49uKxfTznsDzXplxTK295tHkfiI
         /Pfg==
X-Gm-Message-State: APjAAAWDWLcFNPhjk0FNYkHfU3tkaOgn0moRR9hYDLxB3qElJJLtsYiQ
        asyjw3z0YogVbTjQ6C61H/2lLhqsGlVrnP1e6IsMZA==
X-Google-Smtp-Source: APXvYqxF1nO5CaAKrpQm2UE422imsRk3a9e8PXBdHJQflnvmPVwOfzyooj0LB0aXxs6jlS/ozBwkpOCKs28kx3UeSYc=
X-Received: by 2002:a05:6e02:5c8:: with SMTP id l8mr15701758ils.287.1580740552738;
 Mon, 03 Feb 2020 06:35:52 -0800 (PST)
MIME-Version: 1.0
References: <20200203133026.22930-1-brgl@bgdev.pl> <20200203143106.GF32742@smile.fi.intel.com>
In-Reply-To: <20200203143106.GF32742@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 3 Feb 2020 15:35:41 +0100
Message-ID: <CAMRc=Mc1Du1D_-Xsgj6rtGqOd229J1dVqK3XXSx1Q3vvqM1sow@mail.gmail.com>
Subject: Re: [PATCH 0/3] gpiolib: fix a regression introduced by gpio_do_set_config()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 3 lut 2020 o 15:31 Andy Shevchenko
<andriy.shevchenko@linux.intel.com> napisa=C5=82(a):
>
> On Mon, Feb 03, 2020 at 02:30:23PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > These three patches fix a regression introduced by commit d90f36851d65
> > ("gpiolib: have a single place of calling set_config()"). We first need
> > to revert patches that came on top of it, then apply the actual fix.
>
> Thank you for addressing this!
>
> It might be good to add Fixes / Depends-on to the first two, but I didn't=
 look
> if they are in any of v5.5 or older release.
>

They're not - the patch in question was merged for v5.6 and then the
"fixes" came on top of it once it got into next. We're fine here IMO.

Bart
