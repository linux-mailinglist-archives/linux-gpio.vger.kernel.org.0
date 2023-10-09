Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11DAD7BE99D
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Oct 2023 20:36:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377350AbjJISgT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Oct 2023 14:36:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377392AbjJISgS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Oct 2023 14:36:18 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C27CCA4
        for <linux-gpio@vger.kernel.org>; Mon,  9 Oct 2023 11:36:17 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2E92C433C8;
        Mon,  9 Oct 2023 18:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696876577;
        bh=cleXwwfg4OCGw1Kekzev2WGKdvehBL0Gc1xi4pIDrp0=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=lRVKJnS86mkBgUwHEKu3kTFmSyz0+HRJuREm/e4ClHEh1+kRaNQ0DZNol8dHUriEU
         MNX+R3wWHACHrBArrmULIe7ymsvBD4q8CMJn11vgxPdNOc72FMylFe60KtEQEKXHaS
         T2Ujs52iMz2UKlImVbFCPfNuoA+lzj+nuJt7VwIn6uw72hhQvtLGQ2QAlfiSFmkNEc
         6UAA3hV9J73+xnqT4RgkckUG8QdipOceou+nwaYBhqAqdDrDSF1vAqzKi5mIee85OC
         d5ZFnpbbIEjUMv8z380k9BIVNG1LB+SHEeLJ685xGevfbyzZJ2Z/NIdFcXeqkMznXG
         hgebKbLav8evA==
From:   Mark Brown <broonie@kernel.org>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     alsa-devel@alsa-project.org, linux-gpio@vger.kernel.org,
        linux-rockchip@lists.infradead.org
In-Reply-To: <20230929-descriptors-asoc-rockchip-v2-0-2d2c0e043aab@linaro.org>
References: <20230929-descriptors-asoc-rockchip-v2-0-2d2c0e043aab@linaro.org>
Subject: Re: [PATCH v2 0/4] Convert Rockchip ASoC drivers to GPIO
 descriptors
Message-Id: <169687657441.138823.7986058351382162360.b4-ty@kernel.org>
Date:   Mon, 09 Oct 2023 19:36:14 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 29 Sep 2023 00:12:53 +0200, Linus Walleij wrote:
> The Rockchip drivers are pretty straight-forward to convert
> over to using GPIO descriptors.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: rockchip: Convert RK3288 HDMI to GPIO descriptors
      commit: 15b26d8165b39a07f038fb4d2b67a04c50463eb9
[2/4] ASoC: rockchip: Drop includes from RK3399
      commit: 3116dc2e16542d56bd173e90ce1893bed697a830
[3/4] ASoC: rockchip: Drop includes from Rockchip MAX98090
      commit: 7214141067922836b48157e8266335096a0ea4ea
[4/4] ASoC: rockchip: Drop includes from Rockchip RT5645
      commit: 329b017ccdf80cdcc3550f6caecbf2bc80a67432

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

