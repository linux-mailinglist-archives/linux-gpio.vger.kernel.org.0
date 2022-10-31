Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17A55613212
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Oct 2022 09:58:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230086AbiJaI6S (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Oct 2022 04:58:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230084AbiJaI6P (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Oct 2022 04:58:15 -0400
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A6B2D2F5
        for <linux-gpio@vger.kernel.org>; Mon, 31 Oct 2022 01:58:12 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: marcan@marcan.st)
        by mail.marcansoft.com (Postfix) with ESMTPSA id E0C6241A42;
        Mon, 31 Oct 2022 08:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
        t=1667206690; bh=OTa1+8o7mYyJcDcaIQoNw1DovJ5wxNno2mZ54SxYZDQ=;
        h=Date:To:Cc:References:From:Subject:In-Reply-To;
        b=gWkgUAD2ESePZcKbNTSwjn82lNH0L9FCOUk7gOeeLEm6gZ4JTgNeoA11/bNf3VUSe
         RKve+W/ENMXLrPb/cTh42z3zRHm44WWAq6oywgfZflexJ9qwFre26Mppc/7WEfNNvk
         LdrkpaQKPPHcVX5TsXIBXZVlC/xP0ndhJDgxAnIKPmB7Qm55uIzUabPOdfBnEEv+no
         U3VSa2Gp8+zUx2BUvosHpADmSRQFcbFlt2DPrivSoulSeyEPN/NrO+BamcOmfVtZvs
         8XDhhSBOqHBJW4adPsLUZssMMJQDIan4EZnP+iI4x4oU53opAukw2z4LasFVtlc8c1
         Ll+TX/rdiI4yw==
Message-ID: <dcd692aa-1525-4fc5-5198-37f803725c4f@marcan.st>
Date:   Mon, 31 Oct 2022 17:58:05 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To:     Lee Jones <lee@kernel.org>
Cc:     Russell King <rmk+kernel@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        Sven Peter <sven@svenpeter.dev>
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk>
 <E1oTkeW-003t9Y-Ey@rmk-PC.armlinux.org.uk> <YxnK3LeyfacKssLT@google.com>
 <45ed0a37-60ac-3a06-92d1-6b30e18261ff@marcan.st>
 <YxngtlhRLTVBw+iW@google.com>
 <8f30a490-f970-6605-20cb-c2256daab9de@marcan.st>
 <Yxnv2mKkl1tW4PUp@google.com>
 <82088b05-2a0d-69cc-ba2c-d61c74c9d855@marcan.st>
 <YxrwLwVihe/s9wxN@google.com>
 <a92ca9ac-fbc8-a25f-4865-5bc7adb206e2@marcan.st>
 <Y1+LzpEvVj7xswqb@google.com>
From:   Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 4/6] platform/apple: Add new Apple Mac SMC driver
In-Reply-To: <Y1+LzpEvVj7xswqb@google.com>
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

On 31/10/2022 17.48, Lee Jones wrote:
> On Sat, 29 Oct 2022, Hector Martin wrote:
> 
>> On 09/09/2022 16.50, Lee Jones wrote:
>>>> What's the point of just having effectively an array of mfd_cell and
>>>> wrappers to call into the mfd core in the drivers/mfd/ tree and the
>>>> rest of the driver elsewhere?
>>>
>>> They should be separate drivers, with MFD registering the Platform.
>>
>> Why? What purpose does this serve? I'm still confused. There's one
>> parent device, which provides services to the child devices. There isn't
>> one parent device which wraps a platform service which is used by
>> children. This makes no sense. The platform device is the root, if it
>> exposes MFD services, then it has to be in that direction, not the other
>> way around.
>>
>> Look at how this patch series is architected. There is smc_core.c, which
>> implements SMC helpers and wrappers on top of a generic backend, and
>> registers with the MFD subsystem. And then there is smc_rtkit.c which is
>> the actual platform implementation on top of the RTKit framework, and is
>> the actual platform device entry point.
>>
>> A priori, the only thing that makes sense to me right now would be to
>> move smc_core.c into drivers/mfd, and leave smc_rtkit.c in platform.
>> That way the mfd registration would be in drivers/mfd (as would be the
>> services offered to sub-drivers), but the actual backend implementation
>> would be in platform/ (and there would eventually be others, e.g. at
>> least two more for x86 systems). That does mean that the driver entry
>> point will be in platform/, with mfd/smc_core.c serving as effectively
>> library code to plumb in the mfd stuff into one of several possible
>> platform devices. Would that work for you?
> 
> Yes, sounds sensible.  However, keep all of the abstraction craziness
> somewhere else and fetch and share all of your shared resources from
> the MFD (SMC) driver.

I'm not sure what you mean by that. The abstraction (smc_core.c) *is*
the shared resource. All it does is wrap ops callbacks with a mutex and
add a couple helpers for finding keys. Do you literally want us to just
have this in drivers/mfd?

// SPDX-License-Identifier: GPL-2.0-only OR MIT
/*
 * Apple SMC MFD wrapper
 * Copyright The Asahi Linux Contributors
 */

#include <linux/device.h>
#include "smc.h"

static const struct mfd_cell apple_smc_devs[] = {
	{
		.name = "macsmc-gpio",
	},
	{
		.name = "macsmc-hid",
	},
	{
		.name = "macsmc-power",
	},
	{
		.name = "macsmc-reboot",
	},
	{
		.name = "macsmc-rtc",
	},
};

int apple_smc_add_mfd_devices(struct device *dev)
{
	ret = mfd_add_devices(dev, -1, apple_smc_devs,
ARRAY_SIZE(apple_smc_devs), NULL, 0, NULL);
	if (ret)
		return dev_err_probe(dev, ret, "Subdevice initialization failed");

	return 0;
}
EXPORT_SYMBOL(apple_smc_add_mfd_devices);

int apple_smc_remove_mfd_devices(struct device *dev)
{
	mfd_remove_devices(smc->dev);

	return 0;
}
EXPORT_SYMBOL(apple_smc_add_mfd_devices);

MODULE_AUTHOR("Hector Martin <marcan@marcan.st>");
MODULE_LICENSE("Dual MIT/GPL");
MODULE_DESCRIPTION("Apple SMC MFD wrapper");

Because this feels *immensely* silly and pointless.

- Hector
