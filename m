Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE7B043930C
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Oct 2021 11:53:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232554AbhJYJ4R (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Oct 2021 05:56:17 -0400
Received: from marcansoft.com ([212.63.210.85]:51882 "EHLO mail.marcansoft.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229809AbhJYJ4R (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 25 Oct 2021 05:56:17 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: marcan@marcan.st)
        by mail.marcansoft.com (Postfix) with ESMTPSA id 595C4419B4;
        Mon, 25 Oct 2021 09:53:51 +0000 (UTC)
Subject: Re: [PATCH v4 4/5] pinctrl: add pinctrl/GPIO driver for Apple SoCs
To:     Joey Gouly <joey.gouly@arm.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Sven Peter <sven@svenpeter.dev>, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Kettenis <kettenis@openbsd.org>, nd@arm.com,
        Stan Skowronek <stan@corellium.com>
References: <20211024101838.43107-1-joey.gouly@arm.com>
 <20211024101838.43107-5-joey.gouly@arm.com>
 <7092f3f8-c9ae-4cde-2d1d-f5fd19ad2626@marcan.st>
 <20211025094119.GA52794@e124191.cambridge.arm.com>
From:   Hector Martin <marcan@marcan.st>
Message-ID: <ad9465f6-2544-b6a1-8ffa-dc382f4b93b8@marcan.st>
Date:   Mon, 25 Oct 2021 18:53:48 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211025094119.GA52794@e124191.cambridge.arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: es-ES
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 25/10/2021 18.41, Joey Gouly wrote:
> Hi,
> 
> On Mon, Oct 25, 2021 at 06:07:35PM +0900, Hector Martin wrote:
>> On 24/10/2021 19.18, Joey Gouly wrote:
>>> This driver adds support for the pinctrl / GPIO hardware found
>>> on some Apple SoCs.
>>>
>>> Co-developed-by: Stan Skowronek <stan@corellium.com>
>>> Signed-off-by: Stan Skowronek <stan@corellium.com>
>>> Signed-off-by: Joey Gouly <joey.gouly@arm.com>
>>> ---
>> [snip]
>>
>>> +/* GPIO chip functions */
>>> +
>>> +static int apple_gpio_gpio_get_direction(struct gpio_chip *chip,
>>> +					 unsigned int offset)
>>
>> Nit: do we really need to gpio_gpio all the things? I think maz already
>> mentioned this one.
>>
> 
> I forgot to reply to that. The reason (perhaps not a good one), is that the
> module is called 'apple_gpio' and these set of functions are related to the
> GPIO interface (not the pinctrl side of things). I'm not tied to the names
> either way.

I figured that would be it. Personally I'd just consider the second 
"gpio" implicit here and drop it, but that's me; you can do it however 
you want :)

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub
