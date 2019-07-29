Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC29778C7F
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2019 15:15:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728547AbfG2NPw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Jul 2019 09:15:52 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:35852 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726973AbfG2NPv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Jul 2019 09:15:51 -0400
Received: by mail-io1-f65.google.com with SMTP id o9so16255077iom.3;
        Mon, 29 Jul 2019 06:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hesoZG+TcuR2ee3ESupVuTZ9BAyVWJDa4N1y2VQSFbA=;
        b=dxlI/uKS1x/I62djieCFmuyPj9xjbstOXhRIT8tlirULC+Cfrf57qeguUW32ksAFai
         0cCDFsrNt6NNxY7+AW3VzzbTEZNcBvxoMRSPIrPQMdenQIG4v5CDboDBA4A3XsfXTVLU
         HFmb9d54USSK1Jw7k3B8Nk+OXD7+PF3vBjayG1RUASPYxvowPUKmw65c6Q0TyRWurLb/
         ZOXNTgFWYirtvTvDlKr8AK+7nRHxZeUs5ARsC8Afvqza6XSWdMt+7VqM6SCYfvidaxsL
         ivcnl5ug5bRl4IE6nxW7vpF3qTqnze7ewJaaTGMvMs7zYv1UYY4MDdG2WH0qJZZSgMwS
         KTvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hesoZG+TcuR2ee3ESupVuTZ9BAyVWJDa4N1y2VQSFbA=;
        b=LNcHsfSYZJv6KkgwbeVuhZu3IL1zzD8ZybAmiLgOthE2m0QnKkg6/whD+daHaARy73
         Sei70dTDST+DVzgj//RLdSvgI4UGn7pNbGzMlvEYdPDbrWY6GUcoPbm4BYfwpTGTL5sE
         8q+lBzA+OWtgW+BAtGS5uN61ZY9DPbknFxVyb4h9U3WVvAM2fK/f8p08R6x+fApPSy10
         jFIPOBB6vi0sRD1ZJF69apeawq9cYxyQBV+pAnvs8uZ70Az5ErLRBb+E6GHePW35n9Wg
         5Joi8trPfVFoWbjmdKmSMlFCzkPKOqgpwUEL7z7gNQCCvAky//LIpVmEA79+GvPGa+Oj
         KHqw==
X-Gm-Message-State: APjAAAWlHdKq8QdDyKJ79k+FHgpeddsWyxTz0e9pe1IalS5NLmqnAU9F
        7B/o0T/ZgJoH+XsywbsNxnU=
X-Google-Smtp-Source: APXvYqwoWQTwF5tIsbtyIfsCRBRQp5dFcjhYZlqA4xw1kFYGOW8RBewbcLjn8mmgVWtwQYUdZPRcCA==
X-Received: by 2002:a5d:8347:: with SMTP id q7mr95370134ior.277.1564406150592;
        Mon, 29 Jul 2019 06:15:50 -0700 (PDT)
Received: from localhost ([8.46.76.96])
        by smtp.gmail.com with ESMTPSA id n22sm100665148iob.37.2019.07.29.06.15.48
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jul 2019 06:15:49 -0700 (PDT)
Date:   Mon, 29 Jul 2019 15:15:32 +0200
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        linux-input@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 1/2] drivers: base: swnode: link devices to software nodes
Message-ID: <20190729131532.GA1201@penguin>
References: <20190713075259.243565-1-dmitry.torokhov@gmail.com>
 <20190713075259.243565-2-dmitry.torokhov@gmail.com>
 <20190729120715.GA28600@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190729120715.GA28600@kuha.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 29, 2019 at 03:07:15PM +0300, Heikki Krogerus wrote:
> On Sat, Jul 13, 2019 at 12:52:58AM -0700, Dmitry Torokhov wrote:
> > It is helpful to know what device, if any, a software node is tied to, so
> > let's store a pointer to the device in software node structure. Note that
> > children software nodes will inherit their parent's device pointer, so we
> > do not have to traverse hierarchy to see what device the [sub]tree belongs
> > to.
> > 
> > We will be using the device pointer to locate GPIO lookup tables for
> > devices with static properties.
> > 
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> >  drivers/base/property.c  |  1 +
> >  drivers/base/swnode.c    | 35 ++++++++++++++++++++++++++++++++++-
> >  include/linux/property.h |  5 +++++
> >  3 files changed, 40 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/base/property.c b/drivers/base/property.c
> > index 348b37e64944..3bc93d4b35c4 100644
> > --- a/drivers/base/property.c
> > +++ b/drivers/base/property.c
> > @@ -527,6 +527,7 @@ int device_add_properties(struct device *dev,
> >  	if (IS_ERR(fwnode))
> >  		return PTR_ERR(fwnode);
> >  
> > +	software_node_link_device(fwnode, dev);
> >  	set_secondary_fwnode(dev, fwnode);
> >  	return 0;
> >  }
> > diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
> > index 7fc5a18e02ad..fd12eea539b6 100644
> > --- a/drivers/base/swnode.c
> > +++ b/drivers/base/swnode.c
> > @@ -24,6 +24,9 @@ struct software_node {
> >  
> >  	/* properties */
> >  	const struct property_entry *properties;
> > +
> > +	/* device this node is associated with */
> > +	struct device *dev;
> >  };
> 
> Let's not do that! The nodes can be, and in many cases are, associated
> with multiple devices.

They do? Where? I see that set of properties can be shared between
several devices, but when we instantiate SW node we create a new
instance for device. This is also how ACPI and OF properties work; they
not shared between devices (or, rather, the kernel creates distinct _and
single_ devices for instance of ACPI or OF node). I do not think we want
swnodes work differently from the other firmware nodes.

> 
> Every device is already linked with the software node kobject, so
> isn't it possible to simply walk trough those links in order to check
> the devices associated with the node?

No, we need to know the exact instance of a device, not a set of
devices, because even though some properties can be shared, others can
not. For example, even if 2 exactly same touch controllers in the system
have "reset-gpios" property, they won't be the same GPIO for the both of
them.

Thanks.

-- 
Dmitry
