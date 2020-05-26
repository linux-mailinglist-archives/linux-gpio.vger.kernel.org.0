Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 972651E1C22
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2020 09:24:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731359AbgEZHYd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 May 2020 03:24:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726756AbgEZHYc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 May 2020 03:24:32 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF815C08C5C1
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2020 00:24:31 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id u12so2195627wmd.3
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2020 00:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=MecCjMd20t1+f6I9nwNK+2FBCJgJkQD5Pmqxvgh9VA8=;
        b=eiHKETmZiOUORm6uj3B4kuDo0VRvtDLuGSC0gNQ3a59gj373QKgaE721sKr/ykkKkg
         7qdUWclvwqMnNLFiJQqjOOugsHtPFLM6VSvw6jGro/v/ZXUj3U7qc3cxhrGVP5Clff5C
         8I/kJG/n5bQk4GhT/fjWSKolKOJzr1yVQ8sa3VNlxlUkbdNRZnRxvvQcDeRvrUdeGhOX
         vnUF6o45Z9ZzuAllwXv+BGt/2TaKUqdapTdBLjOcpj6v24tMnf5vLKUJ7owDZVWdzoRu
         kiTlj5+sDCTHTBvmnRy3l/AhKDw/A1M3UghofyLUTYtjHz0QfkOD1gcfXFTNU12x61J9
         25PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=MecCjMd20t1+f6I9nwNK+2FBCJgJkQD5Pmqxvgh9VA8=;
        b=gDodoaBTYYulDpj9WJFjYF7MCjfyvUrz2qRSx/f9K6SnwoFd+E6+UtlG1Cm59lNy79
         BtF46Yzf1a2vxUv7Tkyixk3Lb76FdKLbYrPApwu7V8l4nwxgGc/SZBDiPXXKAXkhIaGg
         i5uaRo0smPBhcmcDN78pROyr3OW4e2XNUjnaLtLC66CO7+ueMe7FLJiJMdRlz4Ld0fML
         uVLj8DcERjHFUk2QGMtcwLi7f6fOAybYGpXSkMWQcMa+yNeJpSxZLuSYr4RiTa34aDZQ
         alGQQAk6UTNz7WOoZU1SCWmpQl7dd4Zi5t4yFIOyWET3g7o22xArTEfI2OF15/jfU842
         aXuw==
X-Gm-Message-State: AOAM531z88L9OmfkM6edHeDYecMoc5WSuucR/r+lsIE98qcpb0XnWSb2
        zee/opRAjpf7FA/j8nyjIE/yJBiu5Nw=
X-Google-Smtp-Source: ABdhPJwmU+QRbZ/BsP6+F83Pu7Mwfeap63WbqvY224Kv0JCyRvDBG7exlrbFRDFk1GmkCzHs6nyaKg==
X-Received: by 2002:a1c:acc8:: with SMTP id v191mr59767wme.154.1590477870140;
        Tue, 26 May 2020 00:24:30 -0700 (PDT)
Received: from dell ([95.149.164.102])
        by smtp.gmail.com with ESMTPSA id l17sm6343895wmi.3.2020.05.26.00.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 00:24:29 -0700 (PDT)
Date:   Tue, 26 May 2020 08:24:27 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Michael Walle <michael@walle.cc>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Thierry Reding <thierry.reding@gmail.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 03/16] mfd: mfd-core: match device tree node against
 reg property
Message-ID: <20200526072427.GC3628@dell>
References: <20200423174543.17161-1-michael@walle.cc>
 <20200423174543.17161-4-michael@walle.cc>
 <67e90dafd67c285158c2c6f67f92edb7@walle.cc>
 <20200515102848.GH271301@dell>
 <159e68b4ce53630ef906b2fcbca925bd@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <159e68b4ce53630ef906b2fcbca925bd@walle.cc>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 25 May 2020, Michael Walle wrote:

> Am 2020-05-15 12:28, schrieb Lee Jones:
> > On Thu, 30 Apr 2020, Michael Walle wrote:
> > 
> > > Hi Lee,
> > > 
> > > Am 2020-04-23 19:45, schrieb Michael Walle:
> > > > There might be multiple children with the device tree compatible, for
> > > > example if a MFD has multiple instances of the same function. In this
> > > > case only the first is matched and the other children get a wrong
> > > > of_node reference.
> > > > Add a new option to match also against the unit address of the child
> > > > node. Additonally, a new helper OF_MFD_CELL_REG is added.
> > > 
> > > 
> > > Do you think this is feasible? I guess this is the biggest uncertainty
> > > for me at the moment in this patch series.
> > 
> > I think it sounds fine in principle.  So long as it doesn't change the
> > existing behaviour when of_reg isn't set.
> > 
> > > > Signed-off-by: Michael Walle <michael@walle.cc>
> > > > ---
> > > >  drivers/mfd/mfd-core.c   | 29 ++++++++++++++++++++---------
> > > >  include/linux/mfd/core.h | 26 ++++++++++++++++++++------
> > > >  2 files changed, 40 insertions(+), 15 deletions(-)

[...]

> > > > diff --git a/include/linux/mfd/core.h b/include/linux/mfd/core.h
> > > > index d01d1299e49d..c2c0ad6b14f3 100644
> > > > --- a/include/linux/mfd/core.h
> > > > +++ b/include/linux/mfd/core.h
> > > > @@ -13,8 +13,11 @@
> > > >  #include <linux/platform_device.h>
> > > >
> > > >  #define MFD_RES_SIZE(arr) (sizeof(arr) / sizeof(struct resource))
> > > > +#define MFD_OF_REG_VALID	BIT(31)
> > 
> > What about 64bit platforms?
> 
> The idea was to have this as a logical number. I.e. for now you may only
> have one subdevice per unique compatible string. In fact, if you have a
> look at the ab8500.c, there are multiple "stericsson,ab8500-pwm"
> subdevices. But there is only one DT node for all three of it. I guess
> this works as long as you don't use phandles to reference the pwm node
> in the device tree. Or you don't want to use device tree properties
> per subdevice (for example the "timeout-sec" of a watchdog device).
> 
> So to circumvent this, I thought of having the unit-address (and thus
> the "reg" property) to differentiate between multiple subdevices. Now
> there is one special case for me: this board management controller
> might be upgradable and it might change internally. Thus I came up
> with that logical numbering of subdevices. Rob doesn't seem to be a
> fan of that, though. Therefore, having bit 31 as a valid indicator
> leaves you with 2^31 logical devices, which should be enough ;)
> 
> Rob proposed to have the internal offset as the unit-address. But
> in that case I can also use devm_of_platform_populate() and don't
> need the OF_MFD_CELL_REG; I'd just parse the reg offset in each
> individual subdevice driver. But like I said, I wanted to keep the
> internal offsets out of the device tree.

Oh, I see what you're doing.

So you're adding an arbitrary ID to the device's reg property in DT?

How is this not a hack?

Why don't you use the full address for identification?

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
