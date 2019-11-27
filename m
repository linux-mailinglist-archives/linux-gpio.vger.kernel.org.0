Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EB9110B0ED
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2019 15:15:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726698AbfK0OPl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Nov 2019 09:15:41 -0500
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:43267 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726320AbfK0OPl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Nov 2019 09:15:41 -0500
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id E725A3C057C;
        Wed, 27 Nov 2019 15:15:37 +0100 (CET)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id bipKjdt3AzRZ; Wed, 27 Nov 2019 15:15:32 +0100 (CET)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id D79383C00BE;
        Wed, 27 Nov 2019 15:15:32 +0100 (CET)
Received: from vmlxhi-102.adit-jv.com (10.72.93.184) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0; Wed, 27 Nov
 2019 15:15:32 +0100
Date:   Wed, 27 Nov 2019 15:15:29 +0100
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        <linux-gpio@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <qemu-devel@nongnu.org>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH v3 5/7] gpio: Add GPIO Aggregator/Repeater driver
Message-ID: <20191127141529.GA18189@vmlxhi-102.adit-jv.com>
References: <20191127084253.16356-1-geert+renesas@glider.be>
 <20191127084253.16356-6-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191127084253.16356-6-geert+renesas@glider.be>
User-Agent: Mutt/1.12.1+40 (7f8642d4ee82) (2019-06-28)
X-Originating-IP: [10.72.93.184]
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Geert,

Many thanks for the series upgrade.
A few static-analysis findings below (could be false positives).

On Wed, Nov 27, 2019 at 09:42:51AM +0100, Geert Uytterhoeven wrote:

[..]

> +static bool isrange(const char *s)
> +{
> +	size_t n = strlen(s);

Cppcheck 1.40-18521-ge6d692d96058:
drivers/gpio/gpio-aggregator.c:69:11: style: Variable 'n' is assigned a value that is never used. [unreadVariable]

Smatch v0.5.0-6150-gc1ed13e4ee7b:
drivers/gpio/gpio-aggregator.c:69 isrange() warn: unused return: n = strlen()

[..]

> +	aggr->lookups->dev_id = kasprintf(GFP_KERNEL, "%s.%d", DRV_NAME, id);
> +	if (!aggr->lookups) {
> +		res = -ENOMEM;
> +		goto remove_idr;
> +	}

s/aggr->lookups/aggr->lookups->dev_id/ ?

[..]

> +static int gpio_fwd_get_multiple(struct gpio_chip *chip, unsigned long *mask,
> +				 unsigned long *bits)
> +{
> +	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
> +	unsigned long *values, flags;

gcc 9.2.1:
warning: ‘flags’ may be used uninitialized in this function [-Wmaybe-uninitialized]

[..]

> +static void gpio_fwd_set_multiple(struct gpio_chip *chip, unsigned long *mask,
> +				  unsigned long *bits)
> +{
> +	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
> +	unsigned long *values, flags;

gcc 9.2.1, same as above:
warning: ‘flags’ may be used uninitialized in this function [-Wmaybe-uninitialized]

Should these be silenced like in 2bf593f101f3ca ("xilinx_uartps.c:
suppress "may be used uninitialised" warning") ?

I plan to do some runtime testing soon.

-- 
Best Regards,
Eugeniu
