Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3B47625440
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Nov 2022 08:08:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233143AbiKKHIP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Nov 2022 02:08:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232964AbiKKHIK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Nov 2022 02:08:10 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80EC477226
        for <linux-gpio@vger.kernel.org>; Thu, 10 Nov 2022 23:08:09 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3E0DDB802C4
        for <linux-gpio@vger.kernel.org>; Fri, 11 Nov 2022 07:08:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 335BBC433D6;
        Fri, 11 Nov 2022 07:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668150486;
        bh=ZsKwjofItGT0fKvKOrj1/ghcu9kpy+zMOeo8XMpoZpw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=k/W9P+9U+CItpH8mktk7BRJTlaK7MaaIB+JezqWWmsmyTYnQPgqHW7XiW+XbuJqTd
         BkFXrSTSr+F8r9yjH3R+y4PIPoBOriOV0TYIUGHD74LGSNFhcGCSNvryPTdVP2Lfzw
         Vqy6WFrNVzyGE2un15bf29YbzgcitC2xFI1BBKTACFaHnMFSSYvybFdEb0XF1yeGDj
         07lDsUSB6W1MzKKucKSIEDd4jyNoWrcua98HHWDkuRGXLMXzRJMzzqzSyAk6tAtg88
         UVKahh5IyHtthPyxJs8e6kSZRFIddjoPBj2BsJXUEcRzsr5RN6z2+BxeaOkoOSFWHW
         3BqVkD5DPZNaA==
Date:   Fri, 11 Nov 2022 15:08:00 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] ARM: imx3: Remove unneeded #include
 <linux/pinctrl/machine.h>
Message-ID: <20221111070800.GP2649582@dragon>
References: <d5852583707c7f4cb2711b726f89f983e5171b60.1668000921.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5852583707c7f4cb2711b726f89f983e5171b60.1668000921.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 09, 2022 at 02:35:58PM +0100, Geert Uytterhoeven wrote:
> Commit 6c5f05a6cd88c77f ("ARM: imx3: Remove imx3 soc_init()")
> removed the last user of the pinctrl machine API.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied, thanks!
