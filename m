Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E99A7375896
	for <lists+linux-gpio@lfdr.de>; Thu,  6 May 2021 18:40:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236026AbhEFQlm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 May 2021 12:41:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235295AbhEFQlh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 May 2021 12:41:37 -0400
Received: from ssl.serverraum.org (ssl.serverraum.org [IPv6:2a01:4f8:151:8464::1:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36E84C061574;
        Thu,  6 May 2021 09:40:39 -0700 (PDT)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 0C2882224F;
        Thu,  6 May 2021 18:40:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1620319237;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=w4MY3G564NdTEkuj4VLGNFihTv4+RO4yLopFAh40/24=;
        b=eBCH6kXReCxnXQmOrX+gIktbnA5fzQj9nqLHJ1ypRpAhiQmg7Qh8Pbj2w8oYM3UhEos720
        +tiRVVbBxs/H7DQp5/Fbf4FIb0aN/CCDCoguDSIRQ8NsTOigBcAERDSqv2zwNwt9o5nyRZ
        EzjZ4JRZVb6njr92JIGU0FBVNbuH/UM=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 06 May 2021 18:40:37 +0200
From:   Michael Walle <michael@walle.cc>
To:     Rob Herring <robh@kernel.org>
Cc:     Robert Marko <robert.marko@sartura.hr>, lee.jones@linaro.org,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        jdelvare@suse.com, linux@roeck-us.net, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-hwmon@vger.kernel.org, luka.perkov@sartura.hr,
        jmp@epiphyte.org, pmenzel@molgen.mpg.de, buczek@molgen.mpg.de
Subject: Re: [PATCH 3/6] gpio: Add Delta TN48M CPLD GPIO driver
In-Reply-To: <20210506140024.GB3340759@robh.at.kernel.org>
References: <20210430123511.116057-1-robert.marko@sartura.hr>
 <20210430123511.116057-3-robert.marko@sartura.hr>
 <20210506140024.GB3340759@robh.at.kernel.org>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <3905879e67d50d6a7f73fcd83982c052@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am 2021-05-06 16:00, schrieb Rob Herring:
> On Fri, Apr 30, 2021 at 02:35:08PM +0200, Robert Marko wrote:
>> Delta TN48M CPLD is used as a GPIO expander for the SFP GPIOs.
>> 
>> It is a mix of input only and output only pins.
>> 
>> Since there is no logical GPIO numbering arbitrary one is used
>> along dt-bindings to make it humanly readable.
>> 
>> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
>> ---
>>  drivers/gpio/Kconfig      |  12 +++
>>  drivers/gpio/Makefile     |   1 +
>>  drivers/gpio/gpio-tn48m.c | 191 
>> ++++++++++++++++++++++++++++++++++++++
>>  drivers/mfd/tn48m-cpld.c  |   6 +-
>>  include/linux/mfd/tn48m.h |   3 +
>>  5 files changed, 212 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/gpio/gpio-tn48m.c
> 
> 
>> +static const struct platform_device_id tn48m_gpio_id_table[] = {
>> +	{ "delta,tn48m-gpio", },
> 
> Looks like a compatible, but is not. I think you can drop this and just
> use 'tm48m-gpio' (the driver name).

I'm just curious, why isn't the vendor included here (as there
might be a chance for name clashes in the future).

-michael
