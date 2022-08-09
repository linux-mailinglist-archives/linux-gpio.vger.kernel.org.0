Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4076B58E0FD
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Aug 2022 22:22:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245455AbiHIUWu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Aug 2022 16:22:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244288AbiHIUWt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Aug 2022 16:22:49 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ECF8193F2
        for <linux-gpio@vger.kernel.org>; Tue,  9 Aug 2022 13:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
        Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
        Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
        In-Reply-To:References; bh=wYKx83TUod8tm6sSJyIjHnQ3qxLKctwPj2tTKD3gxlQ=; b=rA
        R/x6gxdY61uNdDWm2mBSDkBhXvNrSCW6/qt7w3Plb5nvBRi3oASG/Y/C04LM3IahyDN017xx1Usr3
        9E+WBnUGxw9FrkA8jW/dsygpLZk7tAh4baqvo16P2yB4yOBFtC36TiP3p3bLTwwN/iyT85hdoe39l
        MSfQLETOsxkeYD0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1oLVkR-00CsOH-2A; Tue, 09 Aug 2022 22:22:43 +0200
Date:   Tue, 9 Aug 2022 22:22:43 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Cc:     Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 2/4] pinctrl: armada-37xx: Fix definitions for MPP
 pins 20-22
Message-ID: <YvLCE8182jcDx706@lunn.ch>
References: <20220805122202.23174-1-pali@kernel.org>
 <20220805122202.23174-2-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220805122202.23174-2-pali@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 05, 2022 at 02:22:00PM +0200, Pali Rohár wrote:
> All 3 MPP pins (20, 21 and 22) can be configured individually and also can
> be configured to GPIO functions. Fix definitions for these MPP pins in
> existing pin groups. After this change GPIO function can be enabled just
> for one of these 3 pins.
> 
> Fixes: 87466ccd9401 ("pinctrl: armada-37xx: Add pin controller support for Armada 37xx")
> Signed-off-by: Pali Rohár <pali@kernel.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
