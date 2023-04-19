Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C87826E7F4F
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Apr 2023 18:13:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230522AbjDSQNV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Apr 2023 12:13:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233666AbjDSQNJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Apr 2023 12:13:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA994AF05
        for <linux-gpio@vger.kernel.org>; Wed, 19 Apr 2023 09:12:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 66351640BC
        for <linux-gpio@vger.kernel.org>; Wed, 19 Apr 2023 16:12:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C9AE5C433D2;
        Wed, 19 Apr 2023 16:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681920775;
        bh=x1PfG08LgKfxyzsOdioEQCjx6FyjGxmUyXzBkKrfmhQ=;
        h=From:To:In-Reply-To:References:Subject:Date:From;
        b=JKqydB4lnBYSmR+g+lY00ZpyJM/K7qo8fHXcFPGrOGxlm8Et7MewtX004MCLmG0FA
         xtZ/0R7nSKc1v6shhXSyMF8u6WNgFWQTtyg6Q/TeMxNckog+3ln3NIKPv8QeweL5vv
         egMvqRrdKmAw0oNvsvuTlAVCOOKSRcx0kN8WiyOpdVC0qwq5iUOefqvdTohtnY90uZ
         QfbAezFqENMnM03HBV/d0hAeqoq1ruMNldgKvXLrOfLdA4oYccKaWt/LD3xJlKwcTy
         FTzIPqgbUCjFPOsYI3Vlq5Y5SS9IifjCeraCYdwOE8M7OlY16qR1+7F4pUv3isrirp
         VXQdcYBfrsyKg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AFA5BE330AB;
        Wed, 19 Apr 2023 16:12:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From:   "Kernel.org Bugbot" <bugbot@kernel.org>
To:     bugs@lists.linux.dev, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org
Message-ID: <20230419-b217334c1-7af366b3bb44@bugzilla.kernel.org>
In-Reply-To: <20230419-b217334c0-3101f9f4b426@bugzilla.kernel.org>
References: <20230419-b217334c0-3101f9f4b426@bugzilla.kernel.org>
Subject: Re: rockchip rk3328 pinctrl unable to change gpio function of pins
 defined in rk3328_mux_recalced_data
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: peebz 0.1
Date:   Wed, 19 Apr 2023 16:12:55 +0000 (UTC)
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

antwain.schneider writes via Kernel.org Bugzilla:

so here's as best as i understand what's going on

in pinctrl-rockchip.c

rk3328_pin_banks

PIN_BANK_IOMUX_FLAGS(2, 32, "gpio2", 0, IOMUX_WIDTH_3BIT, IOMUX_WIDTH_3BIT, 0),

it states that gpio2b is 3 bits per gpio, but if you look at the rk3328 trm, it's only 1 gpio pin in bank 2 that is three bits, e.g.

/* GRF_GPIO2BL_IOMUX 2'bxxx */
/* 2b0 */	"spi_clkm0", NULL, NULL,
/* 2b1 */	"spi_txdm0", NULL, NULL,
/* 2b2 */	"spi_rxdm0", NULL, NULL,
/* 2b3 */	"spi_csn0m0", NULL, NULL,
/* 2b4 */	"spi_csn1m0", "flash_vol_sel", NULL,
/* 2b5 */	"i2c2_sda", "tsadc_shut", NULL,
/* 2b6 */	"i2c2_scl", NULL, NULL,
/* GRF_GPIO2BH_IOMUX 3'bxxx */
/* 2b7 */	"i2s1_mclk", NULL, "tsp_syncm1", "cif_clkoutm1", NULL, NULL, NULL,

so by not adding addtional explicit 2 bit alignment adjustments to rk3328_mux_recalced_data, everything is 'slightly off'

david wu originally submitted the correct alignment on the initial patch[1], but it wasn't commited, but on the official rockchip linux fork, he readded the alignment in 2019[2]

so i request someone please add this back into the kernel

[1] https://lore.kernel.org/linux-rockchip/1485074286-7863-1-git-send-email-david.wu@rock-chips.com/
[2] https://github.com/rockchip-linux/kernel/commit/d69af8ab6534bb28c1556076f08d2a5ab4935d95

View: https://bugzilla.kernel.org/show_bug.cgi?id=217334#c1
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

