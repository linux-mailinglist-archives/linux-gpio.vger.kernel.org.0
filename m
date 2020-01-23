Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC903146578
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jan 2020 11:16:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726234AbgAWKQg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Jan 2020 05:16:36 -0500
Received: from mail-il1-f195.google.com ([209.85.166.195]:39633 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726227AbgAWKQg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jan 2020 05:16:36 -0500
Received: by mail-il1-f195.google.com with SMTP id x5so1694760ila.6
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jan 2020 02:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Clq3TmE58JoFz2R4QbuECPlpViKppwwhqPhDFIlk7XI=;
        b=GAv2gEKpKL5sHBs3QAQS2iZvBJhXMs9QZRTuUPyF+dSwktr7pB9Y24yb2tnqpcO5nJ
         zpMwoTtu+HKp9jT+CTc1c0WZqdqZo0qdImTkI0KvqEyXm8a527RFSYaIKZLPUjhwMEXH
         ow5d29nR9fonp+obMbxhKdZG6vo8h1U8qu0bKzNWx1LgfURiiaPkRGo3Siy4sZt/xuNN
         2fdktMvl1yOpzPGBDDSH9HHJSo9qpDmCp0cBD4/M8dxrcWWMHsJwBGwTlPvl+CAfxM77
         tffP4qi1otnlACyC7Q+UVYga6e+hvwKMD5bZwcTsLLXzSuzOxpN8SRiPm8zshrXcvEAo
         l9Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Clq3TmE58JoFz2R4QbuECPlpViKppwwhqPhDFIlk7XI=;
        b=g0TKHnBjubkqxs42CfoXGKVDVWmodBTSC5yhiV0al1AIPGdoq+4e4dvWbXtc4pv8OQ
         /oTjiOubJTaoWge0ccYE7DtsWW/kumJaWoArnV/D1D3uDiMlBJvznSoiws2ruVEGpXmb
         HPOr7mQM8FZB4Ajz8IsJ28lW0q7A3EuD2jTuY6oa7jWtYuHw8Y9OS0m7ZcldaaI02tL1
         n5EmeLHO4kvCcesriga1oSBQLkQGAbZPw3dCdQJzZucfixMLjVA0//o2oq9wyiYMF/we
         GI7Tkeqs17h3e7LvYbJaKQU5bFFEoxEDFWJMFG3OOqCvlMvrfN/Lmv5DZLNLjY/1Njm/
         AECA==
X-Gm-Message-State: APjAAAX4fIbQ8O/oG2QSfx0Evf1BKxrNCylk2R5WMyOE079yR4GKF0jB
        /Sdcbj9xdD4kvwWX8skacxZ3xsHBWoiTRgChSpAX7g==
X-Google-Smtp-Source: APXvYqy9i4gs8Ex3+uErZaUkaGTQbOaOrqoPXhg9/Qs/7oyudyIFGyf6JSihBtcyod15S1FSGSKKRjM65+gZrX3jDmo=
X-Received: by 2002:a92:3d9d:: with SMTP id k29mr2424144ilf.220.1579774595940;
 Thu, 23 Jan 2020 02:16:35 -0800 (PST)
MIME-Version: 1.0
References: <20191224120709.18247-1-brgl@bgdev.pl> <20191224120709.18247-3-brgl@bgdev.pl>
 <CAMuHMdWigj9_CDdDD49qU-y7r+he53v1NEKE9_0RBQCFUrY-Qw@mail.gmail.com>
In-Reply-To: <CAMuHMdWigj9_CDdDD49qU-y7r+he53v1NEKE9_0RBQCFUrY-Qw@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 23 Jan 2020 11:16:25 +0100
Message-ID: <CAMRc=Mf3BOMC9akxu4-Z-KifGLrbLYC61NB1XWM_Swiz6M8U8g@mail.gmail.com>
Subject: Re: [PATCH v4 02/13] gpiolib: have a single place of calling set_config()
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 20 sty 2020 o 09:44 Geert Uytterhoeven <geert@linux-m68k.org> napisa=
=C5=82(a):
>
> Hi Bartosz,
>
> On Tue, Dec 24, 2019 at 1:08 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote=
:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > Instead of calling the gpiochip's set_config() callback directly and
> > checking its existence every time - just add a new routine that perform=
s
> > this check internally. Call it in gpio_set_config() and
> > gpiod_set_transitory(). Also call it in gpiod_set_debounce() and drop
> > the check for chip->set() as it's irrelevant to this config option.
> >
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>

[snip!]

>
> These two lines are not equivalent: the new code no longer uses the
> packed value of mode and arg!
> Hence this leads to subsequent cleanups in commits e5e42ad224a040f9
> ("gpiolib: remove set but not used variable 'config'") and d18fddff061d27=
96
> ("gpiolib: Remove duplicated function gpio_do_set_config()").
>
> However, what was the purpose of the PIN_CONF_PACKED() translation?
> Why is it no longer needed?
>

Thanks for catching this. I was OoO for a couple days. I'll try to get
through the mail today and address this as well.

Bartosz
