Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C42A958E139
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Aug 2022 22:41:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238317AbiHIUlp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Aug 2022 16:41:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234285AbiHIUlo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Aug 2022 16:41:44 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84C531EC72
        for <linux-gpio@vger.kernel.org>; Tue,  9 Aug 2022 13:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
        Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
        Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
        In-Reply-To:References; bh=L6nYbNwZbavL20BkXfq7ccRGR46LACEwgHCUQkvJVyc=; b=DD
        2hSF2X5NpkIoNbMlhJveb8h8W5K9yk3up4KyJuN/bEpWELdJW0K5R87WwRmy+7L0xSW4JsR4v/UED
        /eslQ+v1z7C9WHhnq0B256yyzzmnHd0Q5rSGe2RyF3hDqTevQPrv/7xeC0oPjdMYp4UOWC5t0OjeY
        J4G0CzCJ7d1FwWU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1oLW2g-00CsTl-09; Tue, 09 Aug 2022 22:41:34 +0200
Date:   Tue, 9 Aug 2022 22:41:33 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Cc:     Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 1/4] pinctrl: armada-37xx: Add missing GPIO-only pins
Message-ID: <YvLGfU1LRbjmGEU4@lunn.ch>
References: <20220805122202.23174-1-pali@kernel.org>
 <YvLCbEs3rCO5e+dE@lunn.ch>
 <20220809203648.uxxgpe7q4jg4qvvf@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220809203648.uxxgpe7q4jg4qvvf@pali>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 09, 2022 at 10:36:48PM +0200, Pali Rohár wrote:
> On Tuesday 09 August 2022 22:24:12 Andrew Lunn wrote:
> > On Fri, Aug 05, 2022 at 02:21:59PM +0200, Pali Rohár wrote:
> > > gpio1_5 and gpio2_2 are GPIO-only pins. Add them into MPP groups table
> > > so they are properly exported as valid pin numbers.
> > > 
> > > Fixes: 87466ccd9401 ("pinctrl: armada-37xx: Add pin controller support for Armada 37xx")
> > 
> > Does this actually break anything? Are there boards in mainline that
> > require this? Does this need to be part of stable?
> > 
> > 	Andrew
> 
> I'm not adding CC:stable tag for automatic stable backporting. I'm
> adding just Fixes tag to indicate that this patch fixes above mentioned
> commit.

O.K.

It might get back ported anyway, due to the fuzzy logic bot thinking
its a valuable fix.

    Andrew
