Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B0993331DB
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Mar 2021 00:09:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232131AbhCIXI2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Mar 2021 18:08:28 -0500
Received: from ssl.serverraum.org ([176.9.125.105]:46517 "EHLO
        ssl.serverraum.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230320AbhCIXIT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Mar 2021 18:08:19 -0500
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id C448C2223E;
        Wed, 10 Mar 2021 00:08:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1615331298;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dY8thLJTvUFPqF0cSmDpUCfCXwYha9hEicw+eVPn5Sw=;
        b=CMFWKDf5BOZLvAi+TKV/P6sDvINOHcjQW/8pQocQEjDNwMWQUj1vUiYD7OYOsvKXiQzb99
        JFuCsAg+Vj5xueRrntg2rB/UCsL4jOkQAwfAzABYbHvFoJvIX3QyWqGgrjnAaSWG6thyky
        tU3UMhtiooiDUKe10jwTupv1Jvsm0QI=
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Wed, 10 Mar 2021 00:08:17 +0100
From:   Michael Walle <michael@walle.cc>
To:     =?UTF-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 01/15] gpio: guard gpiochip_irqchip_add_domain() with
 GPIOLIB_IRQCHIP
In-Reply-To: <20210306155712.4298-2-noltari@gmail.com>
References: <20210306155712.4298-1-noltari@gmail.com>
 <20210306155712.4298-2-noltari@gmail.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <25a0180d69ac5e16112227b5dc12eac1@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am 2021-03-06 16:56, schrieb Álvaro Fernández Rojas:
> The current code doesn't check if GPIOLIB_IRQCHIP is enabled, which 
> results in
> a compilation error when trying to build gpio-regmap if 
> CONFIG_GPIOLIB_IRQCHIP
> isn't enabled.
> 
> Fixes: 6a45b0e2589f ("gpiolib: Introduce 
> gpiochip_irqchip_add_domain()")
> Suggested-by: Michael Walle <michael@walle.cc>
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

Reviewed-by: Michael Walle <michael@walle.cc>

Thanks!
-michael
