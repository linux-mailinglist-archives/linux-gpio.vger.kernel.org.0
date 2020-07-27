Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7AA122E502
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jul 2020 06:46:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725787AbgG0Eq2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Jul 2020 00:46:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:46244 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725775AbgG0Eq2 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 27 Jul 2020 00:46:28 -0400
Received: from Mani-XPS-13-9360 (unknown [157.46.48.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 957FB2073E;
        Mon, 27 Jul 2020 04:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595825187;
        bh=FaoNP8k6aSLsx7TpTwjKJPpQYLPjHTrsR+RxlYSUviU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DxKMTyFAiQtwVJ8+TAzrsFrS/urT4BTzQAYkttN0vO2lb6v9eml9DXxa+OimH6s4P
         ZrQmPSpmfk5J+mmY+BuhCpQSKoJ7Ponb9EW7asDNx4P3w5Q8K2LnLQjP7pk1qDF5s6
         6YSFkrGND2zQeHtOwkqIU6ZB7lPxzIM0qddlynjM=
Date:   Mon, 27 Jul 2020 10:16:10 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB <linux-usb@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        patong.mxl@gmail.com, Linus Walleij <linus.walleij@linaro.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [RESEND PATCH v4 2/3] usb: serial: xr_serial: Add gpiochip
 support
Message-ID: <20200727044610.GC12036@Mani-XPS-13-9360>
References: <20200607162350.21297-1-mani@kernel.org>
 <20200607162350.21297-3-mani@kernel.org>
 <20200701130206.GD3334@localhost>
 <20200726155223.GB12036@Mani-XPS-13-9360>
 <CAHp75VeP8CMZ-T2Kk24NzOPiWHM62GErxCDUgBbYzNotwiFHhw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VeP8CMZ-T2Kk24NzOPiWHM62GErxCDUgBbYzNotwiFHhw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jul 26, 2020 at 07:34:54PM +0300, Andy Shevchenko wrote:
> On Sun, Jul 26, 2020 at 6:53 PM Manivannan Sadhasivam <mani@kernel.org> wrote:
> > On Wed, Jul 01, 2020 at 03:02:06PM +0200, Johan Hovold wrote:
> > > On Sun, Jun 07, 2020 at 09:53:49PM +0530, Manivannan Sadhasivam wrote:
> 
> ...
> 
> > > Same here. And perhaps just ignoring the pins managed by gpiolib is
> > > better (cf. gpiolib and pinctrl being orthogonal).
> >
> > You mean, we can just make TX,RX,CTS,RTS pins controlled only by the serial
> > driver and the rest only by gpiolib?
> 
> I'm wondering if you may use mctrl_gpio_*() API instead.

How? mctrl_gpio APIs are a wrapper for accessing modem control gpio pins but
here we are not accessing the pins but rather exposing the pins as a gpiochip.
Am I missing something?

Thanks,
Mani

> 
> -- 
> With Best Regards,
> Andy Shevchenko
