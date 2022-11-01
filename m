Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DF82614755
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Nov 2022 10:59:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229971AbiKAJ7J (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Nov 2022 05:59:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229763AbiKAJ7I (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Nov 2022 05:59:08 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76BBC18E03
        for <linux-gpio@vger.kernel.org>; Tue,  1 Nov 2022 02:59:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1325C6158D
        for <linux-gpio@vger.kernel.org>; Tue,  1 Nov 2022 09:59:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE328C433D6;
        Tue,  1 Nov 2022 09:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667296746;
        bh=uJPqy7FdyJCQ3j/6bfkJujcNB6cscQ3q4+L1Rs0Y5Jk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=arwNIvA1wsqucYpLvARlwfatzTaLVsPmmj8WXh2ihymvc4jyg736y53jBzaB3hi1o
         q+5fMgrqZ1NPiiagpJltvuRHZ3Rt1ujoC7sCBms/TJ/ejyi1VrdpjglUAeFIyv/228
         nnlxDzo90LWgL/nl7w+hJkoLOajoY9sG6JvttOszwaBTRNSGWXpdcKAFrqK+aC5Z15
         4l/v3Te8c+Mgs0YhLRgfFh6kEkHc5UXH7qZYwLvg8dsRuo2bLI2406Hr6ttAxSSJBz
         1gDSbBQhs4cpEszkGPSUvWoEPLqB88QHtnKuCMe6uEcWAVVsCMA2oKMXwar5yFPMbv
         KhhrCH4eaCGMg==
Date:   Tue, 1 Nov 2022 09:59:00 +0000
From:   Lee Jones <lee@kernel.org>
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     Hector Martin <marcan@marcan.st>, Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        Sven Peter <sven@svenpeter.dev>
Subject: Re: [PATCH 4/6] platform/apple: Add new Apple Mac SMC driver
Message-ID: <Y2Dt5Gp4umPbp2an@google.com>
References: <Yxnv2mKkl1tW4PUp@google.com>
 <82088b05-2a0d-69cc-ba2c-d61c74c9d855@marcan.st>
 <YxrwLwVihe/s9wxN@google.com>
 <Yx8D8mGCO+1sEaKG@shell.armlinux.org.uk>
 <Yx8QEkZcnL59qSUM@google.com>
 <Y1v3EMP6pFZuo0QW@shell.armlinux.org.uk>
 <Y1+LYbdYLA0otaKF@google.com>
 <Y1+Y49b6vi2waVN9@shell.armlinux.org.uk>
 <Y2AE5a/5fY4Pl7YF@google.com>
 <Y2AmZQtttiGwpvth@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y2AmZQtttiGwpvth@shell.armlinux.org.uk>
X-Spam-Status: No, score=-8.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 31 Oct 2022, Russell King (Oracle) wrote:

> On Mon, Oct 31, 2022 at 05:24:53PM +0000, Lee Jones wrote:
> > On Mon, 31 Oct 2022, Russell King (Oracle) wrote:
> > 
> > > On Mon, Oct 31, 2022 at 08:46:25AM +0000, Lee Jones wrote:
> > > > On Fri, 28 Oct 2022, Russell King (Oracle) wrote:
> > > > 
> > > > > On Mon, Sep 12, 2022 at 11:55:14AM +0100, Lee Jones wrote:
> > > > > > > I'm guessing this series is now dead, and Hector needs to re-spin the
> > > > > > > patch set according to your views. I'm guessing this is going to take
> > > > > > > a major re-work of the patch series.
> > > > > > > 
> > > > > > > I suspect my attempt and trying to get this upstream has made things
> > > > > > > more complicated, because I doubt Hector has updated his patch set
> > > > > > > with the review comments that have been made so far... so this is
> > > > > > > now quite a mess. I think, once this is sorted, the entire series
> > > > > > > will need to be re-reviewed entirely afresh.
> > > > > > 
> > > > > > I have no insight into what Hector is doing, or plans to do.
> > > > > 
> > > > > It seems there's no plans by Hector to address this, so it comes down
> > > > > to me.
> > > > > 
> > > > > So, guessing what you're after, would something like the following
> > > > > work for you? I don't see *any* point in creating more yet more
> > > > > platform devices unless we're on a mission to maximise wasted memory
> > > > > resources (which this split will already be doing by creating two
> > > > > small modules instead of one.)
> > > > > 
> > > > > Obviously, this is not an official patch yet, it's just to find out
> > > > > what code structure you are looking for.
> > > > > 
> > > > > diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> > > > > index 78c6d9d99c3f..8d4c0508a2c8 100644
> > > > > --- a/drivers/mfd/Makefile
> > > > > +++ b/drivers/mfd/Makefile
> > > > > @@ -18,6 +18,8 @@ obj-$(CONFIG_MFD_ENE_KB3930)	+= ene-kb3930.o
> > > > >  obj-$(CONFIG_MFD_EXYNOS_LPASS)	+= exynos-lpass.o
> > > > >  obj-$(CONFIG_MFD_GATEWORKS_GSC)	+= gateworks-gsc.o
> > > > >  
> > > > > +obj-$(CONFIG_APPLE_SMC)		+= apple-smc.o
> > > > > +
> > > > >  obj-$(CONFIG_HTC_PASIC3)	+= htc-pasic3.o
> > > > >  obj-$(CONFIG_HTC_I2CPLD)	+= htc-i2cpld.o
> > > > >  
> > > > > diff --git a/drivers/mfd/apple-smc.c b/drivers/mfd/apple-smc.c
> > > > > new file mode 100644
> > > > > index 000000000000..bc59d1c5e13d
> > > > > --- /dev/null
> > > > > +++ b/drivers/mfd/apple-smc.c
> > > > > @@ -0,0 +1,38 @@
> > > > > +#include <linux/mfd/core.h>
> > > > > +#include <linux/mfd/apple-smc.h>
> > > > > +
> > > > > +static const struct mfd_cell apple_smc_devs[] = {
> > > > > +	{
> > > > > +		.name = "macsmc-gpio",
> > > > > +		.of_compatible = "apple,smc-gpio",
> > > > > +	},
> > > > > +	{
> > > > > +		.name = "macsmc-hid",
> > > > > +	},
> > > > > +	{
> > > > > +		.name = "macsmc-power",
> > > > > +	},
> > > > > +	{
> > > > > +		.name = "macsmc-reboot",
> > > > > +	},
> > > > > +	{
> > > > > +		.name = "macsmc-rtc",
> > > > > +	},
> > > > > +};
> > > > > +
> > > > > +int apple_smc_mfd_probe(struct device *dev)
> > > > > +{
> > > > > +	return mfd_add_devices(dev, -1, apple_smc_devs,
> > > > > +			       ARRAY_SIZE(apple_smc_devs), NULL, 0, NULL);
> > > > > +}
> > > > > +EXPORT_SYMBOL(apple_smc_mfd_probe);
> > > > > +
> > > > > +void apple_smc_mfd_remove(struct device *dev)
> > > > > +{
> > > > > +	mfd_remove_devices(dev);
> > > > > +}
> > > > > +EXPORT_SYMBOL(apple_smc_mfd_remove);
> > > > > +
> > > > > +MODULE_AUTHOR("Hector Martin <marcan@marcan.st>");
> > > > > +MODULE_LICENSE("Dual MIT/GPL");
> > > > > +MODULE_DESCRIPTION("Apple SMC MFD core");
> > > > 
> > > > Conceptually interesting, not seen this one before, but clearly a
> > > > hack, no?  Pretty sure all of the other cores in MFD are represented
> > > > by a Platform Device.
> > > 
> > > No one seems to understand what you actually want to see with the
> > > smc-core.c part, so I'm trying to find out what code structure
> > > would suit you.
> > > 
> > > It seemed from the thread that moving smc-core.c to drivers/mfd
> > > wasn't desirable, but there was the desire to move the mfd bits
> > > into there - so that's what I've done with this patch. It doesn't
> > > make any sense what so ever to add yet another platform device
> > > into this structure with all of the complication around what happens
> > > if the user forces it to unbind, so I didn't.
> > > 
> > > > Why not implement the inverse?
> > > 
> > > What do you mean "the inverse" ? The inverse of this patch is moving
> > > everything of smc-core.c except the MFD bits into drivers/mfd leaving
> > > the MFD bits in drivers/platform/apple, which makes no sense.
> > > 
> > > > The Apple SMC is clearly an MFD, in
> > > > Linux terms, so why not move the Platform Device into here, fetch all
> > > > of the global resources, register the sub-devices, then call into the
> > > > rtkit implementation in drivers/platform? 
> > > 
> > > I thought you had previously ruled out the idea of moving the contents
> > > of drivers/platform/apple into drivers/mfd, but maybe your position on
> > > that had changed through the course of the discussion. It's really not
> > > obvious to me what you want from what's been said in this thread.
> > > 
> > > So, I ask the direct question - would moving the code that is in this
> > > patch set from drivers/platform/apple to drivers/mfd then make it
> > > acceptable to you? In other words:
> > > 
> > >  drivers/platform/apple/smc_core.c
> > >  drivers/platform/apple/smc.h
> > >  drivers/platform/apple/smc_rtkit.c
> > > 
> > > If not, then please clearly and fully state what you want to see.
> > 
> > Sorry Russell, I'm out of time today.  Please see my recent reply to
> > Hector for now and I'll get back to you first thing.
> 
> Hi Lee,
> 
> Thanks - I look forward to it. Having read your response to Hector, I
> am wondering whether there's a misunderstanding of the code, so I'm
> hoping that my attempt in my reply helps to clear up any code
> misunderstandings.
> 
> If you want to ask questions about the code, you know where to find
> me on irc, and I'll more than happily answer anything you want to
> know about the code structure.

That might be helpful, thanks.

Let's keep in on-list for now, in case others are following along.

For now, I'll go take a look at your other response.

-- 
Lee Jones [李琼斯]
