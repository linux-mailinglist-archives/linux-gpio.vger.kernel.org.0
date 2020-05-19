Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C19F1D92AA
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2020 10:57:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726504AbgESI5J (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 May 2020 04:57:09 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:38168 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726333AbgESI5J (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 May 2020 04:57:09 -0400
Received: by mail-lj1-f195.google.com with SMTP id m18so4457855ljo.5;
        Tue, 19 May 2020 01:57:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PJHKcK00srJhlFb8jqpH0pa2jLjQm3d68mr/bdpPl0o=;
        b=ILo5fpWBMUHSVbW16rPYP9TgKvY3X/cUYs3uflgQeM57NOpo+x/5oqhmbdKoVh/Bx9
         UNezcqu2bgARRPRfYC+1ZqIB2ApMAnUysSbpiBgDHyPPl+K5sl0v7Xtn3Ii1pLPiHw55
         7ESNa8J66H8RqFkVTeZYLy3ci9BedqaX7RheApLJbiJ7+RCxl+F7xRBwEDm5356Wnx9N
         beqAQAPg4FNlJSrMvNOJybHJuYywPGQqESYEMb/Sb/4h2mvv4NeaDiy/6qBIWp+aDhxV
         q9OocLKeYi8BSkqUfFeoUl6Su9pA2g4GgebVeBHnY9jxSpZvZEj4OfgIvsY5UwmuLeFI
         Uvtw==
X-Gm-Message-State: AOAM5313BcphXphi71knahC3ANFq0VNti1pocoYdCs0yQXBly4dpJNtS
        JT34Mr6A/ciHhi54oK5zAF8=
X-Google-Smtp-Source: ABdhPJw9kdDoj/n3y2c3jAmQFmEOC5xmPBh/xHYXAWLH6k22GtQ5jriaPD5bqpkRAlbM8vWGmhFrXQ==
X-Received: by 2002:a2e:898c:: with SMTP id c12mr7157424lji.200.1589878624854;
        Tue, 19 May 2020 01:57:04 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id z13sm8881061lfd.7.2020.05.19.01.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 01:57:04 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1jay3b-0001TY-4R; Tue, 19 May 2020 10:57:03 +0200
Date:   Tue, 19 May 2020 10:57:03 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Manivannan Sadhasivam <mani@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Johan Hovold <johan@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        patong.mxl@gmail.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 2/2] usb: serial: xr_serial: Add gpiochip support
Message-ID: <20200519085703.GB27787@localhost>
References: <20200428195651.6793-1-mani@kernel.org>
 <20200428195651.6793-3-mani@kernel.org>
 <CACRpkdZ3b-VLvxN06H_4cDOtUEQTVbe=Zw+NA=YjssMzK2d2sQ@mail.gmail.com>
 <20200429124918.GC6443@Mani-XPS-13-9360>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200429124918.GC6443@Mani-XPS-13-9360>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 29, 2020 at 06:19:18PM +0530, Manivannan Sadhasivam wrote:

> On Wed, Apr 29, 2020 at 02:12:24PM +0200, Linus Walleij wrote:
> > On Tue, Apr 28, 2020 at 9:57 PM <mani@kernel.org> wrote:
> > 
> > > From: Manivannan Sadhasivam <mani@kernel.org>
> > >
> > > Add gpiochip support for Maxlinear/Exar USB to serial converter
> > > for controlling the available gpios.
> > >
> > > Cc: Linus Walleij <linus.walleij@linaro.org>
> > > Cc: linux-gpio@vger.kernel.org
> > > Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>

> > I would change this:
> > 
> >    port_priv->gc.label = "xr_gpios";
> > 
> > to something that is device-unique, like "xr-gpios-<serial number>"
> > which makes it easy to locate the GPIOs on a specific serial converter
> > for lab use. However the USB serial maintainers know better what
> > to use here. Whatever makes a USB-to-serial unique from a TTY
> > point of view is probably fine with me too.
> > 
> > My idea is that people might want to know which USB cable
> > this is sitting on, so I have this USB cable and from this label
> > I can always figure out which GPIO device it is.

I think we've had this discussion before. First, not every device has a
unique serial number. Second, we already have a universal way of
distinguishing devices namely by using the bus topology. That's
available through sysfs and shouldn't have to be be re-encoded by every
driver in the gpiochip name.

> Sounds reasonable. I can postfix the PID as below:
>
> port_priv->gc.label = devm_kasprintf(port->dev, GFP_KERNEL, "XR%04x",
>                                      port_priv->idProduct);
> 
> So this will become, "XR1410".

So this doesn't really buy us anything; what if you have two of these
devices?

Johan
