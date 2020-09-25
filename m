Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18A2E278696
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Sep 2020 14:02:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728339AbgIYMCl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Sep 2020 08:02:41 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:58448 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727248AbgIYMCk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Sep 2020 08:02:40 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08PC1sEh091014;
        Fri, 25 Sep 2020 07:01:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1601035314;
        bh=hRluHT8MEUBdje+dfLWcezPxtUriv4zuwVUpPSAXAbM=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=WVZUjNsSj7DdGsHdtFkiR6WobLdIx8XVugawvpE65QTk9vwsAt/Qz4j3zskHR1QEc
         NCGmjRc/t6AZZD8KX4ahsaG96Llcrq7w57Kx9tMx8Cl1IhCBZZJVi7cZUB394uAFl4
         NQDbIRGGPr0tGdpwU7iXQ456lMatKte55cMYBvlo=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08PC1sZM055785;
        Fri, 25 Sep 2020 07:01:54 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 25
 Sep 2020 07:01:54 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 25 Sep 2020 07:01:54 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08PC1sMi029536;
        Fri, 25 Sep 2020 07:01:54 -0500
Date:   Fri, 25 Sep 2020 07:01:54 -0500
From:   Nishanth Menon <nm@ti.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
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
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Tero Kristo <t-kristo@ti.com>,
        Michal Simek <michal.simek@xilinx.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v3 06/15] arm64: dts: ti: align GPIO hog names with
 dtschema
Message-ID: <20200925120154.utjxncf4qs2usuo4@akan>
References: <20200916155715.21009-1-krzk@kernel.org>
 <20200916155715.21009-7-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200916155715.21009-7-krzk@kernel.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 17:57-20200916, Krzysztof Kozlowski wrote:
> The convention for node names is to use hyphens, not underscores.
> dtschema for pca95xx expects GPIO hogs to end with 'hog' prefix.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Applied to ti-k3-dts-next with minor update to $subject (added
'k3-j721e-common-proc-board:')

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
