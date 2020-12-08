Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B554C2D2849
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Dec 2020 10:58:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728241AbgLHJ6X (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Dec 2020 04:58:23 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:45515 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727132AbgLHJ6X (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Dec 2020 04:58:23 -0500
Received: by mail-lj1-f195.google.com with SMTP id q8so18352703ljc.12;
        Tue, 08 Dec 2020 01:58:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Q47D2MCEJANfe8A3Mn/U//6T+qK1xgRot8Ay5wujQIg=;
        b=KipQnqbgUuyoecsjKoPfDKVBuDTOswBrGz2z4I+zK4j9O6L88cDle97w93n2AYi9Z+
         drz2IMLl4i/hWI4ahqEqDXoU+XUZhMWgnNGcjGOmJ5XdkYz7hhB+X3N685Wo2HDJbkHg
         sKOaCaAohxL6cKJCtDkCixzIZwdhoThRWsZWmONo9ADdVqblZdUAxHa8fi6NF8ROyrmS
         dd8niFye19l7keZuuoVaw4D3jMNzlmugkReY2vwT5qyhhX0gsp7NL0OE4FHSOY2yAuSW
         jujdO1O2LVFkN91/5uX1tkkyQ0GKeGx3jCtv696NS5XZtmtPxKNnqtEL0l9ltsGNIqYq
         NtwA==
X-Gm-Message-State: AOAM532uDRJwkTBHKNnSNbHeL77P8kbCqdX4CnY1wS0Y6yEQucdJzTFc
        vwGv1MAmfqknFCL4D4RobbA=
X-Google-Smtp-Source: ABdhPJyq06PSaIEJucMbI2cUpTz3rwP8T22tNF+Iukqc4xzbUcKe/BZubhoMJpmKW42UNCAiexoZ0g==
X-Received: by 2002:a2e:81d1:: with SMTP id s17mr10404025ljg.287.1607421460890;
        Tue, 08 Dec 2020 01:57:40 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id m11sm862904ljp.12.2020.12.08.01.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 01:57:40 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kmZlB-0002ZK-9Y; Tue, 08 Dec 2020 10:58:18 +0100
Date:   Tue, 8 Dec 2020 10:58:17 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Johan Hovold <johan@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        patong.mxl@gmail.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Angelo Dureghello <angelo.dureghello@timesys.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v5 2/3] usb: serial: xr_serial: Add gpiochip support
Message-ID: <X89OOUOG0x0SSxXA@localhost>
References: <20201122170822.21715-1-mani@kernel.org>
 <20201122170822.21715-3-mani@kernel.org>
 <CACRpkdbY-aZB1BAD=JkZAHA+OQvpH12AD3tLAp6Nf1hwr74s9A@mail.gmail.com>
 <X8ZmfbQp7/BGgxec@localhost>
 <CACRpkdZJdxqxUEQaKUHctHRSQAUpYZJtuxonwVd_ZFAsLBbKrA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZJdxqxUEQaKUHctHRSQAUpYZJtuxonwVd_ZFAsLBbKrA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Dec 05, 2020 at 11:21:09PM +0100, Linus Walleij wrote:
> On Tue, Dec 1, 2020 at 4:50 PM Johan Hovold <johan@kernel.org> wrote:
> > On Tue, Dec 01, 2020 at 03:37:38PM +0100, Linus Walleij wrote:
> > > On Sun, Nov 22, 2020 at 6:08 PM Manivannan Sadhasivam <mani@kernel.org> wrote:
> 
> > > You know the names of the pins...
> > >
> > > > +       port_priv->gc.ngpio = 6;
> > > > +       port_priv->gc.label = "xr_gpios";
> > > > +       port_priv->gc.request = xr_gpio_request;
> > > > +       port_priv->gc.free = xr_gpio_free;
> > > > +       port_priv->gc.get_direction = xr_gpio_direction_get;
> > > > +       port_priv->gc.direction_input = xr_gpio_direction_input;
> > > > +       port_priv->gc.direction_output = xr_gpio_direction_output;
> > > > +       port_priv->gc.get = xr_gpio_get;
> > > > +       port_priv->gc.set = xr_gpio_set;
> > > > +       port_priv->gc.owner = THIS_MODULE;
> > > > +       port_priv->gc.parent = &port->dev;
> > > > +       port_priv->gc.base = -1;
> > > > +       port_priv->gc.can_sleep = true;
> > >
> > > So assign port_priv->gc.names here as well with an array
> > > of strings with the names ("RI", "CD", ... etc).
> > > This makes it look really nice in userspace if you do
> > > e.g. "lsgpio".
> >
> > Last time we tried that gpiolib still used a flat namespace so that you
> > can't have have more than one device using the same names. Unless that
> > has changed this is a no-go. See
> >
> >         https://lore.kernel.org/r/20180930122703.7115-1-johan@kernel.org
> >
> > for our previous discussion about this.
> 
> Hm hm yeah we actually put in a nasty warning there since:
> 
>                 gpio = gpio_name_to_desc(gc->names[i]);
>                 if (gpio)
>                         dev_warn(&gdev->dev,
>                                  "Detected name collision for GPIO name '%s'\n",
>                                  gc->names[i]);
> 
> 
> A better approach might be to create an array of names
> prepended with something device-unique like the USB
> bus topology? Or do we need a helper to help naming the
> GPIOs? What would be helpful here?
> 
> name = kasprintf(GFP_KERNEL, "%s-NAME", topology_str);

Well we started discussing this back when we only had the sysfs
interface which suffered from the same problem. I thought the chardev
interface was supposed to get rid of the assumption of a flat name
space? Perhaps in v3 of the ABI. ;P

If this is too built into the new chardev interface as well to be fixed
up, a unique prefix is the only way to go. Perhaps gpiolib can just
prefix it with the controller name?

	gpiochip508-CBUS0

Based on a hotpluggable bus flag? But what about any other non-pluggable
IC, which provides a few named GPIO lines and of which there could be
more than one in a system?

The topology is already encoded in sysfs and it seems backwards to have
each and every gpio driver reconstruct it.

Johan
