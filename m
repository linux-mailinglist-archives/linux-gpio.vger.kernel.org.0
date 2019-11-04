Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFDDAEDC6F
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2019 11:24:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728397AbfKDKYy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Nov 2019 05:24:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:34516 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726633AbfKDKYx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 4 Nov 2019 05:24:53 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F278021D7F;
        Mon,  4 Nov 2019 10:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572863091;
        bh=rH8hwXH0FtHi+uAht/YzU82eRlA9su1m3ek62QSRXZo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=viXH/GT48v+LgNLGJfktn2RMvrdadSig6yYI6V1q0Y13ZJXBOUrFchlkDEyTQxasz
         mxv10bIBLULMNQyuJoDB2QJg2o3LpXV+UfYzLD8NJ2rhtKr7mGAw6HApRp1Qxzi0Lz
         WlxoUm8IiLz3t+G3O5Pld1C3rXLkHTjklKTa/Rqc=
Date:   Mon, 4 Nov 2019 11:24:49 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-doc <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [RESEND PATCH v3 0/8] drivers: add new variants of
 devm_platform_ioremap_resource()
Message-ID: <20191104102449.GA1780310@kroah.com>
References: <20191022084318.22256-1-brgl@bgdev.pl>
 <CAMRc=MdqDv7FYCEKoK52G5zacNfLTDErrOGZAG5KDOsKh2pfUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdqDv7FYCEKoK52G5zacNfLTDErrOGZAG5KDOsKh2pfUw@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 04, 2019 at 10:29:23AM +0100, Bartosz Golaszewski wrote:
> wt., 22 paź 2019 o 10:43 Bartosz Golaszewski <brgl@bgdev.pl> napisał(a):
> >
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > Note: resending with Arnd's review tags and rebased on top of char-misc-next
> >
> > The new devm_platform_ioremap_resource() helper has now been widely
> > adopted and used in many drivers. Users of the write-combined ioremap()
> > variants could benefit from the same code shrinkage. This series provides
> > a write-combined version of devm_platform_ioremap_resource() and uses it in a
> > relevant driver with the assumption that - just like was the case
> > previously - a coccinelle script will be developed to ease the transition
> > for others.
> >
> > There are also users of platform_get_resource_byname() who call
> > devm_ioremap_resource() next, so provide another variant that they can use
> > together with two examples.
> >
> > v1 -> v2:
> > - dropped everything related to nocache ioremap as this is going away
> >
> > v2 -> v3:
> > - don't call platform_get_resource() as an argument of devm_ioremap_resource(),
> >   it actually decreases readability
> > - add devm_platform_ioremap_resource_byname() as another variant
> >
> > Bartosz Golaszewski (8):
> >   Documentation: devres: add missing entry for
> >     devm_platform_ioremap_resource()
> >   lib: devres: prepare devm_ioremap_resource() for more variants
> >   lib: devres: provide devm_ioremap_resource_wc()
> >   drivers: platform: provide devm_platform_ioremap_resource_wc()
> >   misc: sram: use devm_platform_ioremap_resource_wc()
> >   drivers: provide devm_platform_ioremap_resource_byname()
> >   gpio: mvebu: use devm_platform_ioremap_resource_byname()
> >   gpio: tegra186: use devm_platform_ioremap_resource_byname()
> >
> >  .../driver-api/driver-model/devres.rst        |  4 ++
> >  drivers/base/platform.c                       | 39 +++++++++++-
> >  drivers/gpio/gpio-mvebu.c                     | 19 +++---
> >  drivers/gpio/gpio-tegra186.c                  |  4 +-
> >  drivers/misc/sram.c                           | 28 +++------
> >  include/linux/device.h                        |  2 +
> >  include/linux/platform_device.h               |  6 ++
> >  lib/devres.c                                  | 62 +++++++++++++------
> >  8 files changed, 108 insertions(+), 56 deletions(-)
> >
> > --
> > 2.23.0
> >
> 
> Hi Greg,
> 
> can you pick it up for char-misc for v5.5? This was reviewed by Arnd.

Yes, sorry, am backlogged on patches at the moment, will get to it this
week...

greg k-h
