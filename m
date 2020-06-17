Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1E561FCDBB
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2020 14:51:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726454AbgFQMvc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Jun 2020 08:51:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726211AbgFQMvb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Jun 2020 08:51:31 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96E78C061755
        for <linux-gpio@vger.kernel.org>; Wed, 17 Jun 2020 05:51:31 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id d128so1872166wmc.1
        for <linux-gpio@vger.kernel.org>; Wed, 17 Jun 2020 05:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ZNdhT1O8ghdO/yxNE2LQXegJpujAjKndMu2bshp61pY=;
        b=Ew4T1koEzWTfh6kAw3zMYNcj6AwfMdr4ZlA5IXWcaxvmkC1+nxXCuOJ0SrQjghwWGi
         KTM2LqRlw3K7/ltixO5Dpdxp7XZMPc2TyyoOkuAE3NoVexXoprBwHTnR9CCznoIHyVwo
         mTpLL3mKkCDs4EW5NVmhEY4z26UXGdGTE0JLiA0l++ZhXgowL7T3E9qAd6tA9Mr/82oC
         S57SgZc+YHyQlYIN6WmBhA9ezPz7xMF/Fs9LbM6XlQvmek9tOyQwqVDPz1ohCFWVpuZw
         4fyYZr1Tw/6fe8qVyjkwjzFziEvmC5kQNI7qSet6vYSuNuz+vtD1TkhignbGVONOuNj6
         1zbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ZNdhT1O8ghdO/yxNE2LQXegJpujAjKndMu2bshp61pY=;
        b=tJe+/HTT89El4jqjF76O/VBaVaaNMcJVioj5okhKRuKP+cgo8AKptyaXGg4mK+sexo
         aJtVDbMszHJcK3/0nanjRhyQJXofCHJKZijYf7xaN/Gjdn1Gez2FU4NvnnxdtrTVYXmR
         fl0WUr5EzhBGhgPe3t1lm0amIm79ANhxE4o1qdYZEsa9jSZ5/Q2H2CvOb0EJfcT0Grq+
         R8L7lmZV9sLJRT/u1jG9FrQt7EvjY0E+Ms8EuCamQQ8G69naEh78iOMjfM982a3k1ua/
         nqylr8Pk1AQ6dVUWhoy/+2c9FY+aKE8uTlme30SqpPXnhmnBEsX4y0syXgyNUk6mASLe
         Zwxw==
X-Gm-Message-State: AOAM531JDDkBkBMOkaIsZYizZ1oHL20CuxeWXlKopa31JsHZIBHTuPK+
        ZTWtl/CaghaARFsuziqg+ptFBw==
X-Google-Smtp-Source: ABdhPJwRxogohu9xenneWybyNGA7/KqI/GOgkdioUUMJWgbS1vIGiEVOGKiQyCD4pI7AhzvSycLzlg==
X-Received: by 2002:a7b:cd06:: with SMTP id f6mr8357661wmj.8.1592398290140;
        Wed, 17 Jun 2020 05:51:30 -0700 (PDT)
Received: from dell ([2.27.167.65])
        by smtp.gmail.com with ESMTPSA id b8sm33382379wrm.35.2020.06.17.05.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 05:51:29 -0700 (PDT)
Date:   Wed, 17 Jun 2020 13:51:28 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Serge Semin <fancer.lancer@gmail.com>, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-kernel@vger.kernel.org,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v1 3/6] mfd: core: Propagate software node group to the
 sub devices
Message-ID: <20200617125128.GW2608702@dell>
References: <20200608134300.76091-1-andriy.shevchenko@linux.intel.com>
 <20200608134300.76091-4-andriy.shevchenko@linux.intel.com>
 <20200608192524.GF4106@dell>
 <20200609124000.GO2428291@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200609124000.GO2428291@smile.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 09 Jun 2020, Andy Shevchenko wrote:

> On Mon, Jun 08, 2020 at 08:25:24PM +0100, Lee Jones wrote:
> > On Mon, 08 Jun 2020, Andy Shevchenko wrote:
> > 
> > > From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > > 
> > > When ever device properties are supplied for a sub device, a software node
> > > (fwnode) is actually created and then associated with that device. By allowing
> > > the drivers to supply the complete software node group instead of just the
> > > properties in it, the drivers can take advantage of the other features the
> > > software nodes have on top of supplying the device properties.
> > > 
> > > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > ---
> > >  drivers/mfd/mfd-core.c   | 31 +++++++++++++++++++++++++++----
> > >  include/linux/mfd/core.h |  3 +++
> > >  2 files changed, 30 insertions(+), 4 deletions(-)
> > 
> > I'm not sure a change to the API is justified presently (same does go
> > for 'properties' really, but as it was only a couple of lines, it
> > didn't seem too intrusive).
> 
> This is better and comprehensive API, but I heard you.
> 
> > My recommendation is to handle this in-house (i.e. locally in-driver)
> > for now.
> 
> I think you understand that this is not gonna work (we need to attach fwnode
> to the child device before it's registration.
> 
> > When (if) more users adopt the practice, then we should
> > consider to draw down on line numbers and repetition and make it part
> > of the API.
> 
> I briefly looked at the current state of affairs and found that properties are
> used only for MFD LPSS driver. Would the conversion of that driver to swnodes
> work for you?
> 
> Note, the long prospective is to get rid of platform_add_properties() API
> completely.

That's a shame.  Do you plan on replacing it with something else?

MFD tends to only interact with the platform_device API, and even
platform_device_add_properties() doesn't get involved in the nitty
gritty of fwnodes.  Instead it acts as a pass-through straight to
device_add_properties() which is where the magic happens.

For this to be acceptable you would need to add support into
platform_device i.e. platform_device_add_property_group() or some
such.  I really do not want the MFD API to have knowledge about
regarding the particulars i.e. software node registration, secondary
fwnodes and the like.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
