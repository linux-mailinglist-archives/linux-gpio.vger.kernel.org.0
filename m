Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5494278602
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Sep 2020 13:36:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728264AbgIYLg5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Sep 2020 07:36:57 -0400
Received: from muru.com ([72.249.23.125]:45456 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728148AbgIYLg5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 25 Sep 2020 07:36:57 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id DBB9C80B0;
        Fri, 25 Sep 2020 11:36:52 +0000 (UTC)
Date:   Fri, 25 Sep 2020 14:36:46 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Shawn Guo <shawnguo@kernel.org>,
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
Subject: Re: [PATCH v3 08/15] ARM: dts: am335x: lxm: fix PCA9539 GPIO
 expander properties
Message-ID: <20200925113646.GJ9471@atomide.com>
References: <20200916155715.21009-1-krzk@kernel.org>
 <20200916155715.21009-9-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200916155715.21009-9-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* Krzysztof Kozlowski <krzk@kernel.org> [200916 18:58]:
> The PCA9539 GPIO expander requires GPIO controller properties to operate
> properly.

I'm picking this patch into omap-for-v5.10/dt thanks.

Tony
