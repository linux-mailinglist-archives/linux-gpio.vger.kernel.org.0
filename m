Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9D1678781D
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Aug 2023 20:39:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbjHXSia (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Aug 2023 14:38:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243087AbjHXSiX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Aug 2023 14:38:23 -0400
X-Greylist: delayed 320 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 24 Aug 2023 11:38:19 PDT
Received: from office2.cesnet.cz (office2.cesnet.cz [IPv6:2001:718:ff05:10b::237])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9848419B0;
        Thu, 24 Aug 2023 11:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cesnet.cz;
        s=office2-2020; t=1692901973;
        bh=FqBxkg0Usx4H3yO9c7I2yoVkevWm26on/RPV63zVcDc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=BS1nLzG+SgW36sXAe5oCCqXacdg+ur7T2PFzx76XyTsPLRNK3esUZcBRs8qmZtnVi
         CW4Su3x90HAO05eLfHhaWFE5Y8Hxf79IE89CaHtQcF+rlA0Alz3PKLpb4hSPgPPN2Y
         2UIzEnr4Dp6tkAj7DYUHzZK4wIaCaqRgQ0u+d2q/imEt/puqxJ4QjoYmHLzdQkTsfK
         dgRinCbzd95HjjbEs6negfG7KB700b4ysC+MpKUResW+qEBjP95kRooaFYIw2uEi5o
         KbCfOs8PNeO8V6v1UXr8832fmspd48GuwzluVlAiLpSrlL2mEn0pwlYYfr1v4Ambut
         RMhCiIxYYkahQ==
Received: from localhost (tlha232.cesnet.cz [IPv6:2001:718:1:6::134:232])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by office2.cesnet.cz (Postfix) with ESMTPSA id 1E219118000E;
        Thu, 24 Aug 2023 20:32:47 +0200 (CEST)
From:   =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        <linux-leds@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Tony Lindgren <tony@atomide.com>,
        Felipe Balbi <balbi@kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v2] leds: Mark GPIO LED trigger broken
Date:   Thu, 24 Aug 2023 20:32:46 +0200
MIME-Version: 1.0
Message-ID: <1d11e190-df52-4941-946e-209238dd3e99@cesnet.cz>
In-Reply-To: <20230314210059.419159-1-linus.walleij@linaro.org>
References: <20230314210059.419159-1-linus.walleij@linaro.org>
Organization: CESNET
User-Agent: Trojita/unstable-2022-08-22; Qt/5.15.9; wayland; Linux; 
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MIME_QP_LONG_LINE,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> I want to know that this trigger has active users that
> cannot live without it if we are to continue to support it.

We're using this feature. Our use case is a LED at the front panel which=20
shows whether a signal is present at an input LC optical connector (DWDM=20
network stuff). Here's how we're setting it up:

https://gerrit.cesnet.cz/plugins/gitiles/CzechLight/br2-external/+/6570b571bb=
f3f53cf24ef2be3079bc282c445b9e/package/czechlight-clearfog-leds/init-leds-edf=
a.sh

I understand that the GPIO numeric namespace is racy, but it's never been a=20=

problem for us in the past 5 years since this script runs much later during=20=

boot than any driver probing.

> Option if this is really needed: I can develop a new trigger
> that can associate GPIOs with LEDs as triggers using device
> tree, which should also remove the use of userspace custom
> scripts to achieve this and be much more trustworthy, if
> someone with the Nokia n810 or a device with a similar need
> is willing to test it.

I'll be happy to test a patch like that.

However, the GPIO in question on our board is connected to a MCP23S18, and=20=

we have a pair of these. When used in this configuration (two chips at the=20=

same SPI CS, differing by a chip-specific "HW address" on a HW level),=20
there are some impedance mismatches because it's essentially two=20
independent pinctrl instances on the same SPI address. This causes=20
problems, e.g. the debugfs pinctrl instance won't be created for the second=20=

chip because of a naming conflict. We also carry this out-of-tree patch to=20=

make the GPIO labels work when set from DTS:

https://patchwork.ozlabs.org/project/linux-gpio/patch/517dcdda21ea0b0df884bc6=
adcba1dadb78b66b1.1551966077.git.jan.kundrat@cesnet.cz/

(Feedback on how to solve that problem is welcome, btw.)

Since I am not that much familiar with pinctrl/gpio stuff in kernel, I=20
wanted to bring this up to make sure that your future trigger works even on=20=

a setup like ours. Here's how it's used via DTS in case it's relevant:

https://gerrit.cesnet.cz/plugins/gitiles/CzechLight/br2-external/+/6570b571bb=
f3f53cf24ef2be3079bc282c445b9e/board/czechlight/clearfog/sdn-roadm-clearfog.d=
tsi#151

With kind regards,
Jan
