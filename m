Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6590658E133
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Aug 2022 22:36:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235974AbiHIUg4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Aug 2022 16:36:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234285AbiHIUgz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Aug 2022 16:36:55 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19D04CE2B
        for <linux-gpio@vger.kernel.org>; Tue,  9 Aug 2022 13:36:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C4C5EB818AB
        for <linux-gpio@vger.kernel.org>; Tue,  9 Aug 2022 20:36:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37EE0C433C1;
        Tue,  9 Aug 2022 20:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660077411;
        bh=c9yBHksvA35FfOYwbY+Am560Ccn/vbdkJ8idj5Ivtcs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iEopNBg/AIbXVEw3+QCK26MBJ2M3ksP7YEinQKaMpkLwLGSHGg8NOsf6tG4eDLCd+
         mrbi6K8+kRhT0Qg3eEj+0WuFVorukXIfdqXYKaMkFqZAqZd+3b7EUUGoeoUYw8O3bt
         VqKlekZL1mjKmFMp9kARhW+G5xhSVRffNH+a9O68i5sASK3b1ue53X+IZaWkIb40Cw
         rvo5Tx4lDsL/7eoD4THCRiZxmSCih+tbQs3fm52B9UqdQBYPRnnV0jzO6QnqFarTgP
         U9OxqxRApuHXCBfRTyFo68CKO/h6j72VgIn40l7aEM2t5h1BTN8B+jRCTiGsYG22IZ
         a4eDbwe08gqBA==
Received: by pali.im (Postfix)
        id 33CB0C1F; Tue,  9 Aug 2022 22:36:48 +0200 (CEST)
Date:   Tue, 9 Aug 2022 22:36:48 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 1/4] pinctrl: armada-37xx: Add missing GPIO-only pins
Message-ID: <20220809203648.uxxgpe7q4jg4qvvf@pali>
References: <20220805122202.23174-1-pali@kernel.org>
 <YvLCbEs3rCO5e+dE@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YvLCbEs3rCO5e+dE@lunn.ch>
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tuesday 09 August 2022 22:24:12 Andrew Lunn wrote:
> On Fri, Aug 05, 2022 at 02:21:59PM +0200, Pali Rohár wrote:
> > gpio1_5 and gpio2_2 are GPIO-only pins. Add them into MPP groups table
> > so they are properly exported as valid pin numbers.
> > 
> > Fixes: 87466ccd9401 ("pinctrl: armada-37xx: Add pin controller support for Armada 37xx")
> 
> Does this actually break anything? Are there boards in mainline that
> require this? Does this need to be part of stable?
> 
> 	Andrew

I'm not adding CC:stable tag for automatic stable backporting. I'm
adding just Fixes tag to indicate that this patch fixes above mentioned
commit.

On Turris Mox board this at least one of those GPIOs available on PIN
header and ready for (GPIO) using. These GPIOs are not specified in
pinmuxing part of Turris Mox dts files included in kernel. But
theoretically they can be added via dts overlay with bootloader.
Probably same applies for Espressobin which also have lot of GPIOs
exported on pin header -- but I have not investigated it.

So I would say currently there is no known or reported breakage and that
is why I have not added CC:stable tag, only Fixes.

Originally I discovered this issue during debugging of U-Boot which has
copy of this driver and U-Boot supports pinmuxing and gpio requesting
via commands. And U-Boot gpio command refused to change status of these
two GPIOs, for explained reasons.
