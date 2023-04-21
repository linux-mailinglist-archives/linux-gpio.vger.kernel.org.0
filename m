Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FB596EA87D
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Apr 2023 12:43:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229846AbjDUKnF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Apr 2023 06:43:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229640AbjDUKnF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Apr 2023 06:43:05 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 482DB3C07
        for <linux-gpio@vger.kernel.org>; Fri, 21 Apr 2023 03:43:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D7C516192D
        for <linux-gpio@vger.kernel.org>; Fri, 21 Apr 2023 10:43:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4038EC433EF;
        Fri, 21 Apr 2023 10:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682073783;
        bh=Tjp7wAX1+QEEX9xG1fxk+EymK7jvR/5MSwQ8zASDegg=;
        h=From:To:In-Reply-To:References:Subject:Date:From;
        b=kW+/F2/Sc0aDCRfeS+JQje3mYyGwj3Lg7d8mvYtWIBJfhHUldwZHOtOjXCubnlysq
         RRcJpDDfSp/FPji21ojsdb9BBfxXQpU3SUHEr0AugBfoQtfQBAUIgwEl0NzqFnxbid
         Fl8U/rOZbnryXO8M/Jn8cTfjDDQBbIuSmuae0FbGdH89nYQP0WgEwsFt6TSEfnmtK6
         PsO/YenL8tHg0zUw2FV6vjqb2XWUUtMcq5E+O4oYQ8jonTxGkzyF/+UUWiZcCAkdSe
         zYCmxPvIvt4FZ+RK5YCtDkGrUkEHV3zp3uByM7OUpPrg7cvqVG8ee7kWBrIEKYoJjF
         DU0wU+zGltCwA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 22BF6C561EE;
        Fri, 21 Apr 2023 10:43:03 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From:   "Kernel.org Bugbot" <bugbot@kernel.org>
To:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        bugs@lists.linux.dev
Message-ID: <20230421-b217334c3-87cbb53c78f4@bugzilla.kernel.org>
In-Reply-To: <20230419-b217334c0-3101f9f4b426@bugzilla.kernel.org>
References: <20230419-b217334c0-3101f9f4b426@bugzilla.kernel.org>
Subject: Re: rockchip rk3328 pinctrl unable to change gpio function of pins
 defined in rk3328_mux_recalced_data
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: peebz 0.1
Date:   Fri, 21 Apr 2023 10:43:03 +0000 (UTC)
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

Created attachment 304170
correct other half

sorry, off by 8 error :O

File: rockchip-rk3328-pinctrl-gpio3b-recalc.diff (text/plain)
Size: 749.00 B
Link: https://bugzilla.kernel.org/attachment.cgi?id=304170
---
correct other half

You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

