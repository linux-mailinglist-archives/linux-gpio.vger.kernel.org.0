Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A26A259E7FE
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Aug 2022 18:51:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245531AbiHWQs4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Aug 2022 12:48:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244524AbiHWQsc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Aug 2022 12:48:32 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 507FDFCA1C
        for <linux-gpio@vger.kernel.org>; Tue, 23 Aug 2022 07:21:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 015D9B81E07
        for <linux-gpio@vger.kernel.org>; Tue, 23 Aug 2022 14:21:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCF1CC433D6;
        Tue, 23 Aug 2022 14:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661264459;
        bh=ZIeN9tRV9MS5G+VTlpRplJ4Guun7YGJrDn4Zt1TTxVQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=VlekC84KUXAbOlZYvGzrQM4a08qkjeUpaHKxdzCADnYbiCjUqZMLgwKkZpmY0ybrv
         UB92PNt9DMEwa2RkXrQQ8OlmGSpmq+mAdMXWAuNl0S2bWYEhjABG8HqDL2tqQlPVgM
         xf5CxbOWuoFQR+aJxvKa3OBVOoimquNWJsj3DbYemf4V9ibeX/ncIhvTeKhfSO9zSN
         j2hALlumPiAWQndF7Q+akGU6I9Sy/cUCjWOUQcfpwDcVSFmVYCfPCUVBoaxXoeQpCS
         UxejdiYCSfM8vmuaJ/P2uTehsCc4pY2yY+TyTOs/Rgylg8a/FNVLddPpPBOQ4PEh3T
         gk2Gg1z3Pwp9w==
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.95)
        (envelope-from <maz@kernel.org>)
        id 1oQUm1-005D36-Aq;
        Tue, 23 Aug 2022 15:20:57 +0100
MIME-Version: 1.0
Date:   Tue, 23 Aug 2022 15:20:56 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v5 0/2] gpio: mxc: Locking and direction input fix
In-Reply-To: <8487c9a1-a14f-eb5d-7069-7e9527d146a6@denx.de>
References: <20220725103445.88674-1-marex@denx.de>
 <87bktdxkc6.wl-maz@kernel.org>
 <8487c9a1-a14f-eb5d-7069-7e9527d146a6@denx.de>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <dfcf4297bdef79584095b87482de910b@kernel.org>
X-Sender: maz@kernel.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: marex@denx.de, linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com, linus.walleij@linaro.org, loic.poulain@linaro.org, linux-imx@nxp.com, peng.fan@nxp.com, shawnguo@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2022-08-23 11:41, Marek Vasut wrote:
> On 7/25/22 17:50, Marc Zyngier wrote:
>> On Mon, 25 Jul 2022 11:34:43 +0100,
>> Marek Vasut <marex@denx.de> wrote:
>>> 
>>> The irqchip callbacks in gpio-mxc perform register read-modify-write 
>>> operations
>>> without locking, which may lead to a race condition. Add the missing 
>>> locking.
>>> 
>>> In case the GPIO is used as IRQ, make sure it is configured as input.
>>> 
>>> Marek Vasut (2):
>>>    gpio: mxc: Protect GPIO irqchip RMW with bgpio spinlock
>>>    gpio: mxc: Always set GPIOs used as interrupt source to INPUT mode
>>> 
>>>   drivers/gpio/gpio-mxc.c | 17 ++++++++++++++++-
>>>   1 file changed, 16 insertions(+), 1 deletion(-)
>>> 
>>> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>> Cc: Linus Walleij <linus.walleij@linaro.org>
>>> Cc: Loic Poulain <loic.poulain@linaro.org>
>>> Cc: Marc Zyngier <maz@kernel.org>
>>> Cc: NXP Linux Team <linux-imx@nxp.com>
>>> Cc: Peng Fan <peng.fan@nxp.com>
>>> Cc: Shawn Guo <shawnguo@kernel.org>
>> 
>> Reviewed-by: Marc Zyngier <maz@kernel.org>
> 
> Can these two now be applied or is there something more to do ?

That'd be question for Linus and Bartosz, I guess. From my
own PoV, this is good to go.

Thanks,

      M.
-- 
Jazz is not dead. It just smells funny...
