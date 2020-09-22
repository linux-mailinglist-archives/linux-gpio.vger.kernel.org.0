Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAD9F273845
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Sep 2020 04:00:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729262AbgIVCAW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Sep 2020 22:00:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:42446 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728501AbgIVCAV (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 21 Sep 2020 22:00:21 -0400
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0F5C123A74;
        Tue, 22 Sep 2020 02:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600740021;
        bh=kYNJxkMo2anS/8PuLnAzPGHb8GTmWTIcIgZzUe5W7ys=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=k7OXLPC+wJQNc62e75OkkvOiY2XUHlpSW94FG2mbCavbr9OoBUthgvnsAshDdYrUd
         ibQI7tJ4iX38/3FFnZCHsMhglmYZQeSMe3r2mawzxgw+hjL0YPQ/nNwakkwvAKJMQ3
         E7m61S9bPggx+TW6vXYL1dGfP3KmZ6aU+Oj1XC3w=
Date:   Tue, 22 Sep 2020 10:00:12 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 15/15] ARM: dts: imx6q: align GPIO hog names with
 dtschema
Message-ID: <20200922020011.GQ25109@dragon>
References: <20200916155715.21009-1-krzk@kernel.org>
 <20200916155715.21009-16-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200916155715.21009-16-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 16, 2020 at 05:57:15PM +0200, Krzysztof Kozlowski wrote:
> dtschema for pca95xx expects GPIO hogs to end with 'hog' prefix.  While
> touching the hogs, fix indentation (spaces -> tabs).
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Applied, thanks.
