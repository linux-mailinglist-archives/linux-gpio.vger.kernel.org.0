Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BCEE7C41A
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2019 15:54:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729702AbfGaNyW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Jul 2019 09:54:22 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:42204 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727708AbfGaNyV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Jul 2019 09:54:21 -0400
Received: by mail-pl1-f194.google.com with SMTP id ay6so30568515plb.9;
        Wed, 31 Jul 2019 06:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NMHoNMkwZIjttRoQclv/No/h1YkPwIfxBhh7UosFrCo=;
        b=nt6cMM8cKfDQBR7KEsqpXraXr/TS7TxUrSquIpxxKJEIQU/KrSZUh1EdWzsGrk6M9Z
         xQHfyseFfzYpJygezf4x6ys1Foun2MhQdR0j/UG+BJHeP7ihcP9xWSw4UJ/2m+98+Pkx
         q2MRvvu50jo+0CEoRqs8pfOrR9gH+6VbkMo5BqqByA6lxd7IevLy9F2PozH7xUokVBhk
         jzTYBCP7dycssJ1lTBvgu6sbJ/sD47t7TeSjrW6RO6LdOuXBzeYj3eHJ1E27Ejj45ek8
         c20ZhFSw1OBvL7qhzRERIMgFJxNZanhNQkxtsTje9/xWqFngP+B8s+UaOEAynPlfjdZl
         Rlrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NMHoNMkwZIjttRoQclv/No/h1YkPwIfxBhh7UosFrCo=;
        b=ukcfTaMR7xZ+iWfKIKtlOKSUONn625e7LRgZ8OJP+BE/73/2QdsU6ZGFriHnTHQXOD
         tB6dtwJ5FaBQvhuHHaLapZPcEqy6zGWoI8TPaB+P4qq5SFezNYCWTcGDO3f3U/BihBaa
         FVK7Xu4oE3FVMz+oRFJLDjbkUUVtdY8/ygICkFPhuZFLww1hSBXbh444vfqVVOO2SpSX
         OkZtG0Ir/xVVIWCL1nA1TqfYzbYZOnOw2zR/S/KwHUf8wK+IM25WMUo+4c/UoypH1D2G
         UV82x24EevI0ljez0ulJsbYvIxY05c3oHh3cnvPNxE4NAgVpDwOkSyDHWCGmajJ72ZD+
         iJhA==
X-Gm-Message-State: APjAAAUIqAZj6pFKvj2CSWms29P0kRvBKs/OYX4LYupkLAhnUwTxYfS2
        hmslX+xWG16o4KZRFGhtlJg=
X-Google-Smtp-Source: APXvYqwf7iFI8IPFMwE49BO1MBfggFyFXdCWGnl/9js+QXKFf0Hyn4QBBo0ttQZmr3aN8bfyhXQ08A==
X-Received: by 2002:a17:902:8d92:: with SMTP id v18mr122418654plo.211.1564581260564;
        Wed, 31 Jul 2019 06:54:20 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id u6sm2133736pjx.23.2019.07.31.06.54.18
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 31 Jul 2019 06:54:19 -0700 (PDT)
Date:   Wed, 31 Jul 2019 06:54:17 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        linux-input@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 1/2] drivers: base: swnode: link devices to software nodes
Message-ID: <20190731135417.GF147138@dtor-ws>
References: <20190713075259.243565-1-dmitry.torokhov@gmail.com>
 <20190713075259.243565-2-dmitry.torokhov@gmail.com>
 <20190729120715.GA28600@kuha.fi.intel.com>
 <20190729131532.GA1201@penguin>
 <20190730115247.GK28600@kuha.fi.intel.com>
 <e36fb47b-2969-5f53-97d4-8e94b4c98283@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e36fb47b-2969-5f53-97d4-8e94b4c98283@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 30, 2019 at 04:49:50PM +0200, Rafael J. Wysocki wrote:
> On 7/30/2019 1:52 PM, Heikki Krogerus wrote:
> > On Mon, Jul 29, 2019 at 03:15:32PM +0200, Dmitry Torokhov wrote:
> > > On Mon, Jul 29, 2019 at 03:07:15PM +0300, Heikki Krogerus wrote:
> > > > On Sat, Jul 13, 2019 at 12:52:58AM -0700, Dmitry Torokhov wrote:
> > > > > It is helpful to know what device, if any, a software node is tied to, so
> > > > > let's store a pointer to the device in software node structure. Note that
> > > > > children software nodes will inherit their parent's device pointer, so we
> > > > > do not have to traverse hierarchy to see what device the [sub]tree belongs
> > > > > to.
> > > > > 
> > > > > We will be using the device pointer to locate GPIO lookup tables for
> > > > > devices with static properties.
> > > > > 
> > > > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > > > ---
> > > > >   drivers/base/property.c  |  1 +
> > > > >   drivers/base/swnode.c    | 35 ++++++++++++++++++++++++++++++++++-
> > > > >   include/linux/property.h |  5 +++++
> > > > >   3 files changed, 40 insertions(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/drivers/base/property.c b/drivers/base/property.c
> > > > > index 348b37e64944..3bc93d4b35c4 100644
> > > > > --- a/drivers/base/property.c
> > > > > +++ b/drivers/base/property.c
> > > > > @@ -527,6 +527,7 @@ int device_add_properties(struct device *dev,
> > > > >   	if (IS_ERR(fwnode))
> > > > >   		return PTR_ERR(fwnode);
> > > > > +	software_node_link_device(fwnode, dev);
> > > > >   	set_secondary_fwnode(dev, fwnode);
> > > > >   	return 0;
> > > > >   }
> > > > > diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
> > > > > index 7fc5a18e02ad..fd12eea539b6 100644
> > > > > --- a/drivers/base/swnode.c
> > > > > +++ b/drivers/base/swnode.c
> > > > > @@ -24,6 +24,9 @@ struct software_node {
> > > > >   	/* properties */
> > > > >   	const struct property_entry *properties;
> > > > > +
> > > > > +	/* device this node is associated with */
> > > > > +	struct device *dev;
> > > > >   };
> > > > Let's not do that! The nodes can be, and in many cases are, associated
> > > > with multiple devices.
> > > They do? Where? I see that set of properties can be shared between
> > > several devices, but when we instantiate SW node we create a new
> > > instance for device. This is also how ACPI and OF properties work; they
> > > not shared between devices (or, rather, the kernel creates distinct _and
> > > single_ devices for instance of ACPI or OF node). I do not think we want
> > > swnodes work differently from the other firmware nodes.
> > Having multiple devices linked to a single node is quite normal. Most
> > multifunctional devices will share a single node. The USB port devices
> > will share their node (if they have one) with any device that is
> > attached to them. Etc.
> > 
> > If you want to check how this works with ACPI, then find
> > "physical_node" named files from sysfs. The ACPI node folders in sysfs
> > have symlinks named "physical_node<n>" for every device they are bind
> > to. The first one is named just "physical_node", the second
> > "physical_node1", the third "physical_node2", and so on.
> > 
> > > > Every device is already linked with the software node kobject, so
> > > > isn't it possible to simply walk trough those links in order to check
> > > > the devices associated with the node?
> > > No, we need to know the exact instance of a device, not a set of
> > > devices, because even though some properties can be shared, others can
> > > not. For example, even if 2 exactly same touch controllers in the system
> > > have "reset-gpios" property, they won't be the same GPIO for the both of
> > > them.
> > I don't think I completely understand the use case you had in mind for
> > this API, but since you planned to use it with the GPIO lookup tables,
> > I'm going to assume it's not needed after all. Let's replace those
> > with the references instead like I proposed in my reply to the 2/2
> > patch.
> > 
> > Linking a single device with a node like that is in any case not
> > acceptable nor possible.
> > 
> I think I need to withdraw my ACK here at this point.

OK, fair enough, I'll see if I can make the references that Heikki
mentioned work for me.

Thanks.

-- 
Dmitry
