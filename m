Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D1BD6E7F4E
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Apr 2023 18:13:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231230AbjDSQNV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Apr 2023 12:13:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230522AbjDSQNJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Apr 2023 12:13:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD00FAD3A
        for <linux-gpio@vger.kernel.org>; Wed, 19 Apr 2023 09:12:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5719B636E7
        for <linux-gpio@vger.kernel.org>; Wed, 19 Apr 2023 16:12:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B5030C433EF;
        Wed, 19 Apr 2023 16:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681920775;
        bh=VN3MoFl0BqYKjiYCIqBvCsf3hwH4mm2i57c20kL8Ev0=;
        h=From:To:Subject:Date:From;
        b=LilddLOOHB5Apz7FEnvfR+neY73RrptmUGqybVjRXL5wcq9bp4b5q9wgkds6LC5XQ
         y/0ZRaqh5d8tnBn2osLlsZHxu0vbd1pU+tYyUJyrx3a27K4RN1V2lMTPWW16KI3pfH
         fCW4CZo+7ZIpKY2bZPChDJnz0jtUbsVJrcXHjB/QAqxh67Xq3IYSwOF6Cv0TGXBgGE
         SFBLy68/YSSvtuG1ry3kvSCI781eivEj18E6EORucZHagFKyTcz4rT3O/nlTC+rmqp
         J7hc1weejWlhbqPDf4f2o6iRn5bMZtNjtpxFMuF/G6PNhsO1BZRjl2e/3tlfCeQ56z
         IlEtIA2glIICw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 99C11E3309C;
        Wed, 19 Apr 2023 16:12:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From:   "Kernel.org Bugbot" <bugbot@kernel.org>
To:     bugs@lists.linux.dev, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org
Message-ID: <20230419-b217334c0-3101f9f4b426@bugzilla.kernel.org>
Subject: rockchip rk3328 pinctrl unable to change gpio function of pins
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

rock64 exposes i2s1 on a secondary 22 pin header on the machine, this includes gpio2b7
since i don't care about i2s and those pins would be more valuable as gpios, i explicitly disabled i2s1 in the device tree
i set gpio2b7 as a cs-gpio but it wasn't working, eventually i got bold and actually started looking at the grf in memory

ma -k /dev/gpiomem dd 0x28 4
00000020  -------- --------  00000001

no matter how many i2s1 things i disabled or removed from the dtb, GRF_GPIO2BH_IOMUX always read 00000001, meaning i2s1_mclk seems hardcoded
eventually i found the description in commit 3818e4a7678ea70508b6b6e72a4cbf445e1e7dfa and realized gpio2b4 also gives me trouble
i feel this is a bug, but probably not important for a 6 year old chip

View: https://bugzilla.kernel.org/show_bug.cgi?id=217334#c0
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

