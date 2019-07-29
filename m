Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F34278B5A
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2019 14:07:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728344AbfG2MHU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Jul 2019 08:07:20 -0400
Received: from mga04.intel.com ([192.55.52.120]:38024 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728297AbfG2MHT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 29 Jul 2019 08:07:19 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 Jul 2019 05:07:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,322,1559545200"; 
   d="scan'208";a="190555061"
Received: from kuha.fi.intel.com ([10.237.72.189])
  by fmsmga001.fm.intel.com with SMTP; 29 Jul 2019 05:07:16 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 29 Jul 2019 15:07:15 +0300
Date:   Mon, 29 Jul 2019 15:07:15 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        linux-input@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 1/2] drivers: base: swnode: link devices to software nodes
Message-ID: <20190729120715.GA28600@kuha.fi.intel.com>
References: <20190713075259.243565-1-dmitry.torokhov@gmail.com>
 <20190713075259.243565-2-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190713075259.243565-2-dmitry.torokhov@gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jul 13, 2019 at 12:52:58AM -0700, Dmitry Torokhov wrote:
> It is helpful to know what device, if any, a software node is tied to, so
> let's store a pointer to the device in software node structure. Note that
> children software nodes will inherit their parent's device pointer, so we
> do not have to traverse hierarchy to see what device the [sub]tree belongs
> to.
> 
> We will be using the device pointer to locate GPIO lookup tables for
> devices with static properties.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/base/property.c  |  1 +
>  drivers/base/swnode.c    | 35 ++++++++++++++++++++++++++++++++++-
>  include/linux/property.h |  5 +++++
>  3 files changed, 40 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/base/property.c b/drivers/base/property.c
> index 348b37e64944..3bc93d4b35c4 100644
> --- a/drivers/base/property.c
> +++ b/drivers/base/property.c
> @@ -527,6 +527,7 @@ int device_add_properties(struct device *dev,
>  	if (IS_ERR(fwnode))
>  		return PTR_ERR(fwnode);
>  
> +	software_node_link_device(fwnode, dev);
>  	set_secondary_fwnode(dev, fwnode);
>  	return 0;
>  }
> diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
> index 7fc5a18e02ad..fd12eea539b6 100644
> --- a/drivers/base/swnode.c
> +++ b/drivers/base/swnode.c
> @@ -24,6 +24,9 @@ struct software_node {
>  
>  	/* properties */
>  	const struct property_entry *properties;
> +
> +	/* device this node is associated with */
> +	struct device *dev;
>  };

Let's not do that! The nodes can be, and in many cases are, associated
with multiple devices.

Every device is already linked with the software node kobject, so
isn't it possible to simply walk trough those links in order to check
the devices associated with the node?


thanks,

-- 
heikki
