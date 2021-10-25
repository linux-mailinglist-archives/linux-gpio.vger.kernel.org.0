Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5140C43921B
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Oct 2021 11:13:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232394AbhJYJP1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Oct 2021 05:15:27 -0400
Received: from marcansoft.com ([212.63.210.85]:41662 "EHLO mail.marcansoft.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232227AbhJYJP0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 25 Oct 2021 05:15:26 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: marcan@marcan.st)
        by mail.marcansoft.com (Postfix) with ESMTPSA id 13F8141EA7;
        Mon, 25 Oct 2021 09:13:00 +0000 (UTC)
Subject: Re: [PATCH v4 0/5] pinctrl/GPIO driver for Apple SoCs
To:     Joey Gouly <joey.gouly@arm.com>, linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Sven Peter <sven@svenpeter.dev>, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Kettenis <kettenis@openbsd.org>, nd@arm.com
References: <20211024101838.43107-1-joey.gouly@arm.com>
From:   Hector Martin <marcan@marcan.st>
Message-ID: <44f573d2-4e77-a235-c45b-079eeb6a45a9@marcan.st>
Date:   Mon, 25 Oct 2021 18:12:59 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211024101838.43107-1-joey.gouly@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: es-ES
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 24/10/2021 19.18, Joey Gouly wrote:
> Hi all,
> 
> Here is the v4 patchset for the Apple pinctrl/GPIO driver.
> 
> Changes since v3 [1]:
>    - Applied Marc Zyngier's review/patch (with exception noted below)
>    - Removed "apple,t8103-pinctrl" compatible from driver
>    - Applied Acks/Review tags

I mentioned two nits in a reply to #4, but nothing worth blocking 
merging over, so this is:

Acked-by: Hector Martin <marcan@marcan.st>

Linus: You can take everything but the MAINTAINERS patch, I'll push that 
one via SoC together with everything else for this window to avoid merge 
hell :)

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub
