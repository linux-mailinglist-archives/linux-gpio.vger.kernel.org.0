Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7727B613226
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Oct 2022 10:03:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229637AbiJaJDd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Oct 2022 05:03:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbiJaJDd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Oct 2022 05:03:33 -0400
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B022820C
        for <linux-gpio@vger.kernel.org>; Mon, 31 Oct 2022 02:03:31 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: marcan@marcan.st)
        by mail.marcansoft.com (Postfix) with ESMTPSA id 8C62A41A42;
        Mon, 31 Oct 2022 09:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
        t=1667207010; bh=Hno0sFzHCLWhg8Vn0kd1G05Gd57magUPAZpfkYprqfE=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To;
        b=H8RanM3FS15PG3VITRTgMMO6UO//kUqLbGq2jtc8AnbR8oOzc++Zt1B4ZyQ8lt+LZ
         IHmb6AmNsJalRIgqDzGCdLR2GKnG2PNmIAEBnNCPF5laB7OgOqoCio2TcBvoqUMQNn
         XcjOVezJXK1pb4vewofwd06lfRaBx4bJCYa1PF7Vk7euei4ECEYPoB3AkiRLLIZAqt
         /xnihiiiIHuxFdG8V3WhCEEi2oMPov4yofRnmch5CFRLU1B8m+/dfvryGbDQ48m/Qc
         caneAopmtTTxcOob8fFMicbzkx3Ti0UqYfA2mVl7BoPZ5nAXG8U8TVgg01K+3sFa+l
         K55IHskTcXV9Q==
Message-ID: <0d2f2f56-f68c-2849-c2f6-1c2c2537a162@marcan.st>
Date:   Mon, 31 Oct 2022 18:03:25 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 4/6] platform/apple: Add new Apple Mac SMC driver
Content-Language: en-US
To:     Lee Jones <lee@kernel.org>,
        "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        Sven Peter <sven@svenpeter.dev>
References: <YxnK3LeyfacKssLT@google.com>
 <45ed0a37-60ac-3a06-92d1-6b30e18261ff@marcan.st>
 <YxngtlhRLTVBw+iW@google.com>
 <8f30a490-f970-6605-20cb-c2256daab9de@marcan.st>
 <Yxnv2mKkl1tW4PUp@google.com>
 <82088b05-2a0d-69cc-ba2c-d61c74c9d855@marcan.st>
 <YxrwLwVihe/s9wxN@google.com> <Yx8D8mGCO+1sEaKG@shell.armlinux.org.uk>
 <Yx8QEkZcnL59qSUM@google.com> <Y1v3EMP6pFZuo0QW@shell.armlinux.org.uk>
 <Y1+LYbdYLA0otaKF@google.com>
From:   Hector Martin <marcan@marcan.st>
In-Reply-To: <Y1+LYbdYLA0otaKF@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 31/10/2022 17.46, Lee Jones wrote:
> On Fri, 28 Oct 2022, Russell King (Oracle) wrote:
> 
>> On Mon, Sep 12, 2022 at 11:55:14AM +0100, Lee Jones wrote:
>>>> I'm guessing this series is now dead, and Hector needs to re-spin the
>>>> patch set according to your views. I'm guessing this is going to take
>>>> a major re-work of the patch series.
>>>>
>>>> I suspect my attempt and trying to get this upstream has made things
>>>> more complicated, because I doubt Hector has updated his patch set
>>>> with the review comments that have been made so far... so this is
>>>> now quite a mess. I think, once this is sorted, the entire series
>>>> will need to be re-reviewed entirely afresh.
>>>
>>> I have no insight into what Hector is doing, or plans to do.
>>
>> It seems there's no plans by Hector to address this, so it comes down
>> to me.
>>
>> So, guessing what you're after, would something like the following
>> work for you? I don't see *any* point in creating more yet more
>> platform devices unless we're on a mission to maximise wasted memory
>> resources (which this split will already be doing by creating two
>> small modules instead of one.)
>>
>> Obviously, this is not an official patch yet, it's just to find out
>> what code structure you are looking for.
>>
>> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
>> index 78c6d9d99c3f..8d4c0508a2c8 100644
>> --- a/drivers/mfd/Makefile
>> +++ b/drivers/mfd/Makefile
>> @@ -18,6 +18,8 @@ obj-$(CONFIG_MFD_ENE_KB3930)	+= ene-kb3930.o
>>  obj-$(CONFIG_MFD_EXYNOS_LPASS)	+= exynos-lpass.o
>>  obj-$(CONFIG_MFD_GATEWORKS_GSC)	+= gateworks-gsc.o
>>  
>> +obj-$(CONFIG_APPLE_SMC)		+= apple-smc.o
>> +
>>  obj-$(CONFIG_HTC_PASIC3)	+= htc-pasic3.o
>>  obj-$(CONFIG_HTC_I2CPLD)	+= htc-i2cpld.o
>>  
>> diff --git a/drivers/mfd/apple-smc.c b/drivers/mfd/apple-smc.c
>> new file mode 100644
>> index 000000000000..bc59d1c5e13d
>> --- /dev/null
>> +++ b/drivers/mfd/apple-smc.c
>> @@ -0,0 +1,38 @@
>> +#include <linux/mfd/core.h>
>> +#include <linux/mfd/apple-smc.h>
>> +
>> +static const struct mfd_cell apple_smc_devs[] = {
>> +	{
>> +		.name = "macsmc-gpio",
>> +		.of_compatible = "apple,smc-gpio",
>> +	},
>> +	{
>> +		.name = "macsmc-hid",
>> +	},
>> +	{
>> +		.name = "macsmc-power",
>> +	},
>> +	{
>> +		.name = "macsmc-reboot",
>> +	},
>> +	{
>> +		.name = "macsmc-rtc",
>> +	},
>> +};
>> +
>> +int apple_smc_mfd_probe(struct device *dev)
>> +{
>> +	return mfd_add_devices(dev, -1, apple_smc_devs,
>> +			       ARRAY_SIZE(apple_smc_devs), NULL, 0, NULL);
>> +}
>> +EXPORT_SYMBOL(apple_smc_mfd_probe);
>> +
>> +void apple_smc_mfd_remove(struct device *dev)
>> +{
>> +	mfd_remove_devices(dev);
>> +}
>> +EXPORT_SYMBOL(apple_smc_mfd_remove);
>> +
>> +MODULE_AUTHOR("Hector Martin <marcan@marcan.st>");
>> +MODULE_LICENSE("Dual MIT/GPL");
>> +MODULE_DESCRIPTION("Apple SMC MFD core");
> 
> Conceptually interesting, not seen this one before, but clearly a
> hack, no?  Pretty sure all of the other cores in MFD are represented
> by a Platform Device.
> 
> Why not implement the inverse?  The Apple SMC is clearly an MFD, in
> Linux terms, so why not move the Platform Device into here, fetch all
> of the global resources, register the sub-devices, then call into the
> rtkit implementation in drivers/platform? 

Because the RTKit implementation is *one* of several possible backends,
and the others aren't even necessarily platform devices, and may have
their own registration requirements (e.g. probing for ACPI stuff on
x86). The entry points are completely different depending on the flavor.
They will have to be different modules that compile on different
architectures and load based on completely different device IDs.

This is common in Linux. There's the core xHCI driver, then an xhci-plat
wrapper for platform devices, and an xhci-pci wrapper for PCI devices.
It makes no sense to have the driver entry point be the core and then
somehow call back out to xhci-pci and xhci-plat when those are different
drivers with different match lists and different registration requirements.

It sounds like you have a mental model of what you want for MFD that
doesn't actually fit how hardware works, and you're trying to shoehorn
this into it without thinking. Linux is perfectly capable of
representing things in a way that works with this hardware, but you need
to let go of this idea that "the mfd driver lives in drivers/mfd and is
the entry point but also I don't want any platform/abstraction/silliness
in there" because that just doesn't work.

- Hector
