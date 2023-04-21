Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F71D6EA859
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Apr 2023 12:32:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229821AbjDUKcR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Apr 2023 06:32:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbjDUKcQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Apr 2023 06:32:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CC0E729F
        for <linux-gpio@vger.kernel.org>; Fri, 21 Apr 2023 03:32:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 70B9561968
        for <linux-gpio@vger.kernel.org>; Fri, 21 Apr 2023 10:32:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CA899C433D2;
        Fri, 21 Apr 2023 10:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682073133;
        bh=tJNrKZeTjzIwWSqC6HSIgGMg0xI9wQInmCYJTlR10Zs=;
        h=From:To:In-Reply-To:References:Subject:Date:From;
        b=IJ7uSw1T+j7ogztaP2txd4UBdS/Zd0x5C74VsQJbgfDLg0ODLz5a6cI2becMJd7OW
         GRGyuP7CEyWIRcnc5mS/X821aFmByHfIP0T/D0EBVGmVEiV2LmhDOz9uQtDqnDWax0
         /gWfwAzFpOwY+/d0pFrEYShHlKXUdsPwtG5IZ+bdjxD7WmTj0iJhcgwuVJkuAih2mY
         lNvXYzEpKgsSVgZYexvbXwn4qHdkEL0zgYLyo017voidk2hVPoFyAA1seA0VxzZYyq
         dry7y4hTQFlLAjUbd1beg/I2+DIUICw62PsvjAU/3OguxUB+lgzURv75vaGzQvZbZg
         UtcUtkzkWS+rQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A9365C395EA;
        Fri, 21 Apr 2023 10:32:13 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From:   "Kernel.org Bugbot" <bugbot@kernel.org>
To:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        bugs@lists.linux.dev
Message-ID: <20230421-b217334c2-00d7f9d564c1@bugzilla.kernel.org>
In-Reply-To: <20230419-b217334c0-3101f9f4b426@bugzilla.kernel.org>
References: <20230419-b217334c0-3101f9f4b426@bugzilla.kernel.org>
Subject: Re: rockchip rk3328 pinctrl unable to change gpio function of pins
 defined in rk3328_mux_recalced_data
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: peebz 0.1
Date:   Fri, 21 Apr 2023 10:32:13 +0000 (UTC)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

antwain.schneider added an attachment on Kernel.org Bugzilla:

Created attachment 304169
the other half

missed from the 2019 patch is the recalculations for the gpio3b, e.g.

/* GRF_GPIO3BL_IOMUX 3'bxxx */
/* 3b0 */	"tsp_d4", "cif_data4", "spi_csn0m2", "i2s2_lrcktxm1", "usb3phy_debug8", "i2s2_lrckrxm1", NULL,
/* GRF_GPIO3BH_IOMUX 2'bxx */
/* 3b1 */	"tsp_d5m0", "cif_data5m", NULL,
/* 3b2 */	"tsp_d6m0", "cif_data6m", NULL,
/* 3b3 */	"tsp_d7m0", "cif_data7m", NULL,
/* 3b4 */	"card_clkm0", NULL, NULL,
/* 3b5 */	"card_rstm0", NULL, NULL,
/* 3b6 */	"card_detm0", NULL, NULL,
/* 3b7 */	"card_iom0", NULL, NULL,

so attached is the missing half of the initial correct recalculations in the modern format

File: rockchip-rk3328-pinctrl-gpio3b-recalc.diff (text/plain)
Size: 743.00 B
Link: https://bugzilla.kernel.org/attachment.cgi?id=304169
---
the other half

You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

