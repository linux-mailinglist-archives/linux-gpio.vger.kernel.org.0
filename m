Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F9341BDCAA
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2020 14:49:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727052AbgD2Mt2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Apr 2020 08:49:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:47730 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726599AbgD2Mt1 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 29 Apr 2020 08:49:27 -0400
Received: from Mani-XPS-13-9360 (unknown [157.46.25.26])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E45F42085B;
        Wed, 29 Apr 2020 12:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588164567;
        bh=5/wUlfpAFr+xk1jHyr+vgbwi2/B7/efoDXjCT+3aLqI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eMecHkiJKNNyePhQP3DvfOk7uu5YZDOt0LgHqh0CtMnlxIELsjmyJeEsCjdb5ShOU
         mEMFFBGsIvXgRq4JdccWJqSq2uIChJq8rYu86j0VxWSPmItZpJDWIc8gYt8Ojt0RBu
         aWkLhBEj6bhnIbh/lMVzg7vk5PA7Ap948+JakX58=
Date:   Wed, 29 Apr 2020 18:19:18 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Johan Hovold <johan@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        patong.mxl@gmail.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 2/2] usb: serial: xr_serial: Add gpiochip support
Message-ID: <20200429124918.GC6443@Mani-XPS-13-9360>
References: <20200428195651.6793-1-mani@kernel.org>
 <20200428195651.6793-3-mani@kernel.org>
 <CACRpkdZ3b-VLvxN06H_4cDOtUEQTVbe=Zw+NA=YjssMzK2d2sQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZ3b-VLvxN06H_4cDOtUEQTVbe=Zw+NA=YjssMzK2d2sQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Wed, Apr 29, 2020 at 02:12:24PM +0200, Linus Walleij wrote:
> On Tue, Apr 28, 2020 at 9:57 PM <mani@kernel.org> wrote:
> 
> > From: Manivannan Sadhasivam <mani@kernel.org>
> >
> > Add gpiochip support for Maxlinear/Exar USB to serial converter
> > for controlling the available gpios.
> >
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: linux-gpio@vger.kernel.org
> > Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>
> 
> That's a nice and clean GPIO driver.

Thanks for the compliments :)

> 
> I would change this:
> 
>    port_priv->gc.label = "xr_gpios";
> 
> to something that is device-unique, like "xr-gpios-<serial number>"
> which makes it easy to locate the GPIOs on a specific serial converter
> for lab use. However the USB serial maintainers know better what
> to use here. Whatever makes a USB-to-serial unique from a TTY
> point of view is probably fine with me too.
> 
> My idea is that people might want to know which USB cable
> this is sitting on, so I have this USB cable and from this label
> I can always figure out which GPIO device it is.
> 

Sounds reasonable. I can postfix the PID as below:

port_priv->gc.label = devm_kasprintf(port->dev, GFP_KERNEL, "XR%04x",
                                     port_priv->idProduct);

So this will become, "XR1410".

> Either way, it is not a super-big issue so:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Is this a off-the-shelf product that can be bought or is it mainly
> integrated on boards?
> 

Both I believe, though I have only used it integrated in dev boards. But
a quick googling gives me below,

https://www.digikey.in/product-detail/en/maxlinear-inc/XR21V1410IL-0C-EB/1016-1425-ND/2636664

Thanks,
Mani

> I'm asking because I'm looking for a neat USB-to-serial adapter
> with some GPIOs (2 is enough) that can be used for reset and
> power cycling of lab boards using one simple piece of equipment.
> 
> Yours,
> Linus Walleij
