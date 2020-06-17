Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 974C31FD2EE
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2020 18:55:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726966AbgFQQzq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Jun 2020 12:55:46 -0400
Received: from muru.com ([72.249.23.125]:58134 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726959AbgFQQzp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 17 Jun 2020 12:55:45 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 7191880F3;
        Wed, 17 Jun 2020 16:56:36 +0000 (UTC)
Date:   Wed, 17 Jun 2020 09:55:41 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Grygorii Strashko <grygorii.strashko@ti.com>,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Suman Anna <s-anna@ti.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, jkridner@beagleboard.org,
        robertcnelson@gmail.com
Subject: Re: [PATCH] ARM: dts: AM33xx-l4: add gpio-ranges
Message-ID: <20200617165541.GH37466@atomide.com>
References: <20200602131428.GA496390@x1>
 <803e2d78-28ba-0816-dbb5-d441d7659a91@ti.com>
 <20200602135155.GE37466@atomide.com>
 <20200602163458.GA847883@x1>
 <20200617162740.GA4181112@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200617162740.GA4181112@x1>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* Drew Fustini <drew@beagleboard.org> [200617 16:28]:
> These gpio-ranges are correct for all the platforms that included
> am33xx-l4.dtsi.
> 
> I think it makes sense to add gpio-ranges properties as they describe
> the relationship between a gpio line and pin control register that
> exists in the hardware.
> 
> Are there changes you would like to see in this patch?

Looks good to me, will apply when I'm done with the fixes
now that we have -rc1 out.

Regards,

Tony
