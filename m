Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D6BF7A751
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2019 13:52:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728215AbfG3Lwv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jul 2019 07:52:51 -0400
Received: from mga03.intel.com ([134.134.136.65]:50252 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726078AbfG3Lwv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 30 Jul 2019 07:52:51 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Jul 2019 04:52:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,326,1559545200"; 
   d="scan'208";a="190845479"
Received: from kuha.fi.intel.com ([10.237.72.189])
  by fmsmga001.fm.intel.com with SMTP; 30 Jul 2019 04:52:47 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 30 Jul 2019 14:52:47 +0300
Date:   Tue, 30 Jul 2019 14:52:47 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        linux-input@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 1/2] drivers: base: swnode: link devices to software nodes
Message-ID: <20190730115247.GK28600@kuha.fi.intel.com>
References: <20190713075259.243565-1-dmitry.torokhov@gmail.com>
 <20190713075259.243565-2-dmitry.torokhov@gmail.com>
 <20190729120715.GA28600@kuha.fi.intel.com>
 <20190729131532.GA1201@penguin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190729131532.GA1201@penguin>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 29, 2019 at 03:15:32PM +0200, Dmitry Torokhov wrote:
> On Mon, Jul 29, 2019 at 03:07:15PM +0300, Heikki Krogerus wrote:
> > On Sat, Jul 13, 2019 at 12:52:58AM -0700, Dmitry Torokhov wrote:
> > > It is helpful to know what device, if any, a software node is tied to, so
> > > let's store a pointer to the device in software node structure. Note that
> > > children software nodes will inherit their parent's device pointer, so we
> > > do not have to traverse hierarchy to see what device the [sub]tree belongs
> > > to.
> > > 
> > > We will be using the device pointer to locate GPIO lookup tables for
> > > devices with static properties.
> > > 
> > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > ---
> > >  drivers/base/property.c  |  1 +
> > >  drivers/base/swnode.c    | 35 ++++++++++++++++++++++++++++++++++-
> > >  include/linux/property.h |  5 +++++
> > >  3 files changed, 40 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/base/property.c b/drivers/base/property.c
> > > index 348b37e64944..3bc93d4b35c4 100644
> > > --- a/drivers/base/property.c
> > > +++ b/drivers/base/property.c
> > > @@ -527,6 +527,7 @@ int device_add_properties(struct device *dev,
> > >  	if (IS_ERR(fwnode))
> > >  		return PTR_ERR(fwnode);
> > >  
> > > +	software_node_link_device(fwnode, dev);
> > >  	set_secondary_fwnode(dev, fwnode);
> > >  	return 0;
> > >  }
> > > diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
> > > index 7fc5a18e02ad..fd12eea539b6 100644
> > > --- a/drivers/base/swnode.c
> > > +++ b/drivers/base/swnode.c
> > > @@ -24,6 +24,9 @@ struct software_node {
> > >  
> > >  	/* properties */
> > >  	const struct property_entry *properties;
> > > +
> > > +	/* device this node is associated with */
> > > +	struct device *dev;
> > >  };
> > 
> > Let's not do that! The nodes can be, and in many cases are, associated
> > with multiple devices.
> 
> They do? Where? I see that set of properties can be shared between
> several devices, but when we instantiate SW node we create a new
> instance for device. This is also how ACPI and OF properties work; they
> not shared between devices (or, rather, the kernel creates distinct _and
> single_ devices for instance of ACPI or OF node). I do not think we want
> swnodes work differently from the other firmware nodes.

Having multiple devices linked to a single node is quite normal. Most
multifunctional devices will share a single node. The USB port devices
will share their node (if they have one) with any device that is
attached to them. Etc.

If you want to check how this works with ACPI, then find
"physical_node" named files from sysfs. The ACPI node folders in sysfs
have symlinks named "physical_node<n>" for every device they are bind
to. The first one is named just "physical_node", the second
"physical_node1", the third "physical_node2", and so on.

> > Every device is already linked with the software node kobject, so
> > isn't it possible to simply walk trough those links in order to check
> > the devices associated with the node?
> 
> No, we need to know the exact instance of a device, not a set of
> devices, because even though some properties can be shared, others can
> not. For example, even if 2 exactly same touch controllers in the system
> have "reset-gpios" property, they won't be the same GPIO for the both of
> them.

I don't think I completely understand the use case you had in mind for
this API, but since you planned to use it with the GPIO lookup tables,
I'm going to assume it's not needed after all. Let's replace those
with the references instead like I proposed in my reply to the 2/2
patch.

Linking a single device with a node like that is in any case not
acceptable nor possible.


thanks,

-- 
heikki
