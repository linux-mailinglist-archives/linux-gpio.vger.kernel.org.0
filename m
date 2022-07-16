Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A26F576D53
	for <lists+linux-gpio@lfdr.de>; Sat, 16 Jul 2022 12:44:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbiGPKoh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 16 Jul 2022 06:44:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbiGPKog (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 16 Jul 2022 06:44:36 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16B351B7A8;
        Sat, 16 Jul 2022 03:44:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6D7E1B80ECB;
        Sat, 16 Jul 2022 10:44:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A137C34114;
        Sat, 16 Jul 2022 10:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657968273;
        bh=MT/ioChApAV3Fbzdv9gL+KtbbUDKSiObJMHNjAz1Iwk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=N8I1FwXwIlaoSQq9N9cUgqE2zMOuBH932SIkqKWogyNUG3LefcXTehPghN6c/39Pj
         RVVX/7SgcJEL7AGz21Gir6Dow1kiXbRBUAU+fi0gN+lcs1IVH4iSNweCWVVqF4ZCHo
         cvZWz4sVhN5WAN22S+yeFaohJHNBLbcslRxi+XCsTya5JZFqG0ohFCfaDjr0jin/ew
         Mdspnl0BVP6KkZpf5wDXBgHsyBRA8JojgybzA3FGgMlRzDSQzHQF+MYATcp9i5ofjd
         kuxQIPv0HxsVpKBfS95Q2VWwgR/3h8y0dPMb/B4fp3BCKT47bP5EIv/wzptcYRQu+k
         rUqWUgfaS+dUA==
Received: from ip-185-104-136-29.ptr.icomera.net ([185.104.136.29] helo=wait-a-minute.misterjones.org)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.95)
        (envelope-from <maz@kernel.org>)
        id 1oCfHi-007rH6-P9;
        Sat, 16 Jul 2022 11:44:31 +0100
Date:   Sat, 16 Jul 2022 11:44:26 +0100
Message-ID: <87pmi549rp.wl-maz@kernel.org>
From:   Marc Zyngier <maz@kernel.org>
To:     <lewis.hanly@microchip.com>
Cc:     <linux-gpio@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linus.walleij@linaro.org>, <brgl@bgdev.pl>,
        <linux-kernel@vger.kernel.org>, <palmer@dabbelt.com>,
        <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>
Subject: Re: [PATCH v3 1/1] gpio: mpfs: add polarfire soc gpio support
In-Reply-To: <20220716071113.1646887-2-lewis.hanly@microchip.com>
References: <20220716071113.1646887-1-lewis.hanly@microchip.com>
        <20220716071113.1646887-2-lewis.hanly@microchip.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.104.136.29
X-SA-Exim-Rcpt-To: lewis.hanly@microchip.com, linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, linus.walleij@linaro.org, brgl@bgdev.pl, linux-kernel@vger.kernel.org, palmer@dabbelt.com, conor.dooley@microchip.com, daire.mcnamara@microchip.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, 16 Jul 2022 08:11:13 +0100,
<lewis.hanly@microchip.com> wrote:
> 
> From: Lewis Hanly <lewis.hanly@microchip.com>
> 
> Add a driver to support the Polarfire SoC gpio controller.
> 
> Signed-off-by: Lewis Hanly <lewis.hanly@microchip.com>
> ---
>  drivers/gpio/Kconfig     |   9 +
>  drivers/gpio/Makefile    |   1 +
>  drivers/gpio/gpio-mpfs.c | 361 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 371 insertions(+)
>  create mode 100644 drivers/gpio/gpio-mpfs.c

A couple of other nits:

> +static const struct of_device_id mpfs_of_ids[] = {
> +	{ .compatible = "microchip,mpfs-gpio", },

Where is the DT binding for this?

> +	{ /* end of list */ }
> +};
> +
> +static struct platform_driver mpfs_gpio_driver = {
> +	.probe = mpfs_gpio_probe,
> +	.driver = {
> +		.name = "microchip,mpfs-gpio",
> +		.of_match_table = mpfs_of_ids,
> +	},
> +	.remove = mpfs_gpio_remove,

No, please. You cannot enforce that there are no interrupts being used
(and nothing checks for this), and you're pretty much guaranteed that
the system will catch fire on the first interrupt being delivered.
Moreover, your "remove" callback only turns the clock off, which is
yet another nail on that coffin.

	M.

-- 
Without deviation from the norm, progress is not possible.
