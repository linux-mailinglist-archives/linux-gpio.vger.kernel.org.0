Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D849F446B33
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Nov 2021 00:24:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231221AbhKEX0j (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Nov 2021 19:26:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231332AbhKEX0j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Nov 2021 19:26:39 -0400
Received: from ssl.serverraum.org (ssl.serverraum.org [IPv6:2a01:4f8:151:8464::1:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5D1DC061570;
        Fri,  5 Nov 2021 16:23:58 -0700 (PDT)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 21EBE22247;
        Sat,  6 Nov 2021 00:23:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1636154637;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pWLwpF7t1z7sXc6uIRQDlJkxUETTVbm6yWRf9vDD+FQ=;
        b=Uie9go5fzSOUCvZzeflBzsCwCsZ3h6ZoNq7KzpqGDbmWeLX9TD8tj+BvOJRAihqE5B7xd0
        lLw3tWfiM90xEe+3AAjSdCQ6ix6vu6op2ifT9iyAmkQid9XiR1uk3b0//MUOHDND+3uMat
        T8Tfrj/Cc4+QZojj5g3/RZx0gEyfHN8=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Sat, 06 Nov 2021 00:23:57 +0100
From:   Michael Walle <michael@walle.cc>
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, lee.jones@linaro.org, p.zabel@pengutronix.de,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, andy.shevchenko@gmail.com,
        luka.perkov@sartura.hr
Subject: Re: [PATCH v8 1/6] mfd: simple-mfd-i2c: Add Delta TN48M CPLD support
In-Reply-To: <20211105113859.101868-1-robert.marko@sartura.hr>
References: <20211105113859.101868-1-robert.marko@sartura.hr>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <ab3a9cea425449af6a7752e40b9aa4c8@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am 2021-11-05 12:38, schrieb Robert Marko:
> Delta TN48M switches have a Lattice CPLD that serves
> multiple purposes including being a GPIO expander.
> 
> So, lets use the simple I2C MFD driver to provide the MFD core.
> 
> Also add a virtual symbol which pulls in the simple-mfd-i2c driver and
> provide a common symbol on which the subdevice drivers can depend on.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> ---
> Changes in v2:
> * Drop the custom MFD driver and header
> * Use simple I2C MFD driver
> ---
>  drivers/mfd/Kconfig          | 10 ++++++++++
>  drivers/mfd/simple-mfd-i2c.c |  1 +
>  2 files changed, 11 insertions(+)
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index ad15be6b86bc..3701657e831d 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -297,6 +297,16 @@ config MFD_ASIC3
>  	  This driver supports the ASIC3 multifunction chip found on many
>  	  PDAs (mainly iPAQ and HTC based ones)
> 
> +config MFD_TN48M_CPLD
> +	tristate "Delta Networks TN48M switch CPLD driver"
> +	depends on I2C
> +	select MFD_SIMPLE_MFD_I2C

Is this device used on multiple architectures? See commit
de1292817cf73 (mfd: MFD_SL28CPLD should depend on ARCH_LAYERSCAPE).

-michael
