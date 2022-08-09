Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A83C58E100
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Aug 2022 22:23:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244288AbiHIUXW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Aug 2022 16:23:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343968AbiHIUXQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Aug 2022 16:23:16 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3CB127B1C
        for <linux-gpio@vger.kernel.org>; Tue,  9 Aug 2022 13:23:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 62854B81890
        for <linux-gpio@vger.kernel.org>; Tue,  9 Aug 2022 20:23:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB416C433D6;
        Tue,  9 Aug 2022 20:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660076592;
        bh=1yxMovD3WlEse8UDbGb5v7sDZRhWdOUDJwE1WbofpRE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=J8y5HvFcEktBLabps1wjIXbs0dt5DV6bYXoaeC85JBWfWYdBPYZBMRS4MXIz0MTwb
         Unzim5wUXxyV881qWVqAjiO9JQpXu23VHpkkbV2uQbnwKhLUN8i8eqyQ3BYBpKdPow
         wBExtRvy14MPYlmLSRANrdC0BDCn4IsXhnvYk0j67/aCQgZSBByjQ3H3938AAsH75d
         fRt+V43uqCryPX5NZdfH4bvU3CMxe2wHyXOWyIT/ggnbKUOgZ17dMSEmnzFrDV4tB8
         9eXuyq7tTQ1ldcKwevrEJhW/hM6Yhdzy8y8bp1+3VznEK+BzbFDmNe5hq7rTBUDXBP
         GIa/r9TZbnwig==
Received: by pali.im (Postfix)
        id DA9DEC1F; Tue,  9 Aug 2022 22:23:08 +0200 (CEST)
Date:   Tue, 9 Aug 2022 22:23:08 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 1/4] pinctrl: armada-37xx: Add missing GPIO-only pins
Message-ID: <20220809202308.irqvf56idsw73ydd@pali>
References: <20220805122202.23174-1-pali@kernel.org>
 <YvLBVdn7hQydeobO@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YvLBVdn7hQydeobO@lunn.ch>
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

On Tuesday 09 August 2022 22:19:33 Andrew Lunn wrote:
> On Fri, Aug 05, 2022 at 02:21:59PM +0200, Pali Rohár wrote:
> > gpio1_5 and gpio2_2 are GPIO-only pins. Add them into MPP groups table
> > so they are properly exported as valid pin numbers.
> > 
> > Fixes: 87466ccd9401 ("pinctrl: armada-37xx: Add pin controller support for Armada 37xx")
> > Signed-off-by: Pali Rohár <pali@kernel.org>
> > ---
> >  drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > 
> > diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> > index a140b6bfbfaa..2b44c634ccb5 100644
> > --- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> > +++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> > @@ -122,6 +122,16 @@ struct armada_37xx_pinctrl {
> >  		.funcs = {_func1, _func2}	\
> >  	}
> >  
> > +#define PIN_GRP_GPIO_0(_name, _start, _nr)	\
> 
> The naming of these macros are a bit odd, but this does not make it
> any worse.

Yea... but I'm continuing to use existing naming convention. Suffix _N
means how many non-gpio functions have particular group.

> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> 
>     Andrew
