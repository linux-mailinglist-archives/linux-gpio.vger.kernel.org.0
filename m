Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A5E643BF35
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Oct 2021 03:48:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230160AbhJ0Buq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Oct 2021 21:50:46 -0400
Received: from marcansoft.com ([212.63.210.85]:51140 "EHLO mail.marcansoft.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236313AbhJ0Buq (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 26 Oct 2021 21:50:46 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: marcan@marcan.st)
        by mail.marcansoft.com (Postfix) with ESMTPSA id 387EF419BC;
        Wed, 27 Oct 2021 01:48:14 +0000 (UTC)
Subject: Re: [PATCH v5 0/5] pinctrl/GPIO driver for Apple SoCs
To:     Joey Gouly <joey.gouly@arm.com>, linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Sven Peter <sven@svenpeter.dev>, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Kettenis <kettenis@openbsd.org>, nd@arm.com
References: <20211026175815.52703-1-joey.gouly@arm.com>
From:   Hector Martin <marcan@marcan.st>
Message-ID: <c46f2ba9-d528-4248-7611-e76d1e4ae553@marcan.st>
Date:   Wed, 27 Oct 2021 10:48:12 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211026175815.52703-1-joey.gouly@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: es-ES
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 27/10/2021 02.58, Joey Gouly wrote:
> Hi all,
> 
> Here is the v5 patchset for the Apple pinctrl/GPIO driver.
> 
> Changes since v4 [1]:
>    - Renamed functions to remove duplicate 'gpio'
>    - Create all 4 functions (gpio, periph1-3)
>    - Applied Acks/Review tags
> 
> There is a branch here with the driver:
>    https://gitlab.arm.com/linux-arm/jg-open/-/tree/pinctrl_apple_v4
> 
> Thanks,
> Joey

Thank you! I've applied patch 5 to asahi-soc/maintainers and will be 
sending that out to SoC shortly :)

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub
