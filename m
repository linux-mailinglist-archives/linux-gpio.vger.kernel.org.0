Return-Path: <linux-gpio+bounces-15884-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D55A32E60
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 19:19:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DEE3188BA59
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 18:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBE4F26281C;
	Wed, 12 Feb 2025 18:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H87SpPOg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715CB26157D;
	Wed, 12 Feb 2025 18:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739384261; cv=none; b=KfsyczTMLV5Sku5Y95Us2sFib/AVuU4Ewzr/Md6lcGoz20HPnWmjbCon4hf9YGn6cwuuvSKmzXmqbzvxYrWgrRDj0HY+6OcOaPkTDNSzc1/3FcD6X8BmA/32PUNiE/TX9IX8YRrbcALvYUJ8Kwged5j8aiUuHxM0aj9qTs9a1tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739384261; c=relaxed/simple;
	bh=jU2kPhgyRZAfdjYf2MKVcaAlilzb8sQchUY6HIPoYUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H3y1TE5oRq8MmbgprGT4KigPMfqMlTVzXKnKhGDEbCfx9XTHeCgGHgojuCtgXlRkKL2peN+/3XIWKJTHEg4FoJh7pQdE3oXOURGNRY0hqo2QRhLuTfEu3Xi5ccABYxc/LXv4gihh5isPtf0xdCGrgTcktMitOwbV7zaZsBMT/m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H87SpPOg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90D38C4CEDF;
	Wed, 12 Feb 2025 18:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739384259;
	bh=jU2kPhgyRZAfdjYf2MKVcaAlilzb8sQchUY6HIPoYUM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H87SpPOgrCyGqo44WNZMOiY7ftkh5qONH0YCgttNiuye/7uexi28ExoBCGok2InLh
	 zNiobaiOZ/eFofd97uUB/D/h/O0wjL/9ACrJaexTBoWg0/iof73FHv440cYpRX7jI0
	 avnjFg0skeGp0kisV/1SlCUXSUH1kPqwn7Ub0cc1lVDNIqAd8XOjo/FecG2DVnkIjR
	 GBQD1GRMX8DGjtvcIpK+ztuo4dlbPr7CVuMyncJ9R3IaOh23lWs8SVBRE4BXCsNNxq
	 8qXJX88jNTmmzkz+qxD1JdWEemHmcsuwOTlSFbgS3lpVVKNo3A3odYulBgInJ89ryF
	 ZhxR89buP8NkQ==
Date: Wed, 12 Feb 2025 12:17:38 -0600
From: Rob Herring <robh@kernel.org>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Christian Daudt <bcm@fixthebug.org>,
	Sherman Yin <syin@broadcom.com>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Stanislav Jakubek <stano.jakubek@gmail.com>,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 1/7] dt-bindings: pinctrl: Add bindings for BCM21664 pin
 controller
Message-ID: <20250212181738.GA4056295-robh@kernel.org>
References: <20250207-bcm21664-pinctrl-v1-0-e7cfac9b2d3b@gmail.com>
 <20250207-bcm21664-pinctrl-v1-1-e7cfac9b2d3b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207-bcm21664-pinctrl-v1-1-e7cfac9b2d3b@gmail.com>

On Fri, Feb 07, 2025 at 09:02:40PM +0100, Artur Weber wrote:
> Add device tree bindings for the pin controller included in the
> BCM21664 chip. The bindings are based off brcm,bcm11351-pinctrl.yaml;
> both chips use the same driver, but have different pins, and the
> BCM21664 has 6 alt modes instead of 4.
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---
>  .../bindings/pinctrl/brcm,bcm21664-pinctrl.yaml    | 169 +++++++++++++++++++++
>  1 file changed, 169 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm21664-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm21664-pinctrl.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..233bea91b640ffa8480637d7304f661b7a4f5d79
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm21664-pinctrl.yaml
> @@ -0,0 +1,169 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/brcm,bcm21664-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom BCM21664 pin controller
> +
> +maintainers:
> +  - Florian Fainelli <florian.fainelli@broadcom.com>
> +  - Ray Jui <rjui@broadcom.com>
> +  - Scott Branden <sbranden@broadcom.com>
> +
> +allOf:
> +  - $ref: pinctrl.yaml#
> +
> +properties:
> +  compatible:
> +    const: brcm,bcm21664-pinctrl
> +
> +  reg:
> +    maxItems: 1
> +
> +patternProperties:
> +  '-pins$':
> +    type: object
> +    additionalProperties: false
> +
> +    patternProperties:
> +      '-grp[0-9]$':
> +        type: object
> +        unevaluatedProperties: false
> +
> +        properties:
> +          pins:
> +            description:
> +              Specifies the name(s) of one or more pins to be configured by
> +              this node.
> +            items:
> +              enum: [ adcsyn, batrm, bsc1clk, bsc1dat, camcs0, camcs1, clk32k,
> +                      clk_cx8, dclk1, dclk4, dclkreq1, dclkreq4, dmic0clk,
> +                      dmic0dq, dsi0te, gpio00, gpio01, gpio02, gpio03, gpio04,
> +                      gpio05, gpio06, gpio07, gpio08, gpio09, gpio10, gpio11,
> +                      gpio12, gpio13, gpio14, gpio15, gpio16, gpio17, gpio18,
> +                      gpio19, gpio20, gpio21, gpio22, gpio23, gpio24, gpio25,
> +                      gpio26, gpio27, gpio28, gpio32, gpio33, gpio34, gpio93,
> +                      gpio94, gps_calreq, gps_hostreq, gps_pablank, gps_tmark,
> +                      icusbdm, icusbdp, lcdcs0, lcdres, lcdscl, lcdsda, lcdte,
> +                      mdmgpio00, mdmgpio01, mdmgpio02, mdmgpio03, mdmgpio04,
> +                      mdmgpio05, mdmgpio06, mdmgpio07, mdmgpio08, mmc0ck,
> +                      mmc0cmd, mmc0dat0, mmc0dat1, mmc0dat2, mmc0dat3, mmc0dat4,
> +                      mmc0dat5, mmc0dat6, mmc0dat7, mmc0rst, mmc1ck, mmc1cmd,
> +                      mmc1dat0, mmc1dat1, mmc1dat2, mmc1dat3, mmc1dat4,
> +                      mmc1dat5, mmc1dat6, mmc1dat7, mmc1rst, pc1, pc2, pmbscclk,
> +                      pmbscdat, pmuint, resetn, rfst2g_mtsloten3g,
> +                      rtxdata2g_txdata3g1, rtxen2g_txdata3g2, rxdata3g0,
> +                      rxdata3g1, rxdata3g2, sdck, sdcmd, sddat0, sddat1, sddat2,
> +                      sddat3, simclk, simdat, simdet, simrst, spi0clk, spi0fss,
> +                      spi0rxd, spi0txd, sri_c, sri_d, sri_e, sspck, sspdi,
> +                      sspdo, sspsyn, stat1, stat2, swclktck, swdiotms, sysclken,
> +                      tdi, tdo, testmode, traceclk, tracedt00, tracedt01,
> +                      tracedt02, tracedt03, tracedt04, tracedt05, tracedt06,
> +                      tracedt07, tracedt08, tracedt09, tracedt10, tracedt11,
> +                      tracedt12, tracedt13, tracedt14, tracedt15, trstb,
> +                      txdata3g0, ubctsn, ubrtsn, ubrx, ubtx ]
> +
> +          function:
> +            description:
> +              Specifies the pin mux selection.
> +            enum: [ alt1, alt2, alt3, alt4, alt5, alt6 ]
> +
> +          slew-rate:
> +            description: |
> +              Meaning depends on configured pin mux:
> +                bsc*clk/pmbscclk or bsc*dat/pmbscdat:
> +                  0: Standard (100 kbps) & Fast (400 kbps) mode
> +                  1: Highspeed (3.4 Mbps) mode
> +                Otherwise:
> +                  0: fast slew rate
> +                  1: normal slew rate
> +
> +          bias-disable: true
> +          bias-pull-up: true
> +          input-disable: true
> +          input-enable: true

With unevaluateProperties, these have no effect.

> +
> +        required:
> +          - pins
> +
> +        allOf:
> +          - $ref: pincfg-node.yaml#
> +
> +          # Optional properties for standard pins
> +          - if:
> +              properties:
> +                pins:
> +                  contains:
> +                    enum: [ adcsyn, batrm, camcs0, camcs1, clk32k, clk_cx8,
> +                            dclk1, dclk4, dclkreq1, dclkreq4, dmic0clk, dmic0dq,
> +                            dsi0te, gpio00, gpio01, gpio02, gpio03, gpio04,
> +                            gpio05, gpio06, gpio07, gpio08, gpio09, gpio10,
> +                            gpio11, gpio12, gpio13, gpio14, gpio15, gpio18,
> +                            gpio19, gpio20, gpio21, gpio22, gpio23, gpio24,
> +                            gpio25, gpio26, gpio27, gpio28, gpio32, gpio33,
> +                            gpio34, gpio93, gpio94, gps_calreq, gps_hostreq,
> +                            gps_pablank, gps_tmark, icusbdm, icusbdp, lcdcs0,
> +                            lcdres, lcdscl, lcdsda, lcdte, mdmgpio00, mdmgpio01,
> +                            mdmgpio02, mdmgpio03, mdmgpio04, mdmgpio05,
> +                            mdmgpio06, mdmgpio07, mdmgpio08, mmc0ck, mmc0cmd,
> +                            mmc0dat0, mmc0dat1, mmc0dat2, mmc0dat3, mmc0dat4,
> +                            mmc0dat5, mmc0dat6, mmc0dat7, mmc0rst, mmc1ck,
> +                            mmc1cmd, mmc1dat0, mmc1dat1, mmc1dat2, mmc1dat3,
> +                            mmc1dat4, mmc1dat5, mmc1dat6, mmc1dat7, mmc1rst,
> +                            pc1, pc2, pmuint, resetn, rfst2g_mtsloten3g,
> +                            rtxdata2g_txdata3g1, rtxen2g_txdata3g2, rxdata3g0,
> +                            rxdata3g1, rxdata3g2, sdck, sdcmd, sddat0, sddat1,
> +                            sddat2, sddat3, simclk, simdat, simdet, simrst,
> +                            spi0clk, spi0fss, spi0rxd, spi0txd, sri_c, sri_d,
> +                            sri_e, sspck, sspdi, sspdo, sspsyn, stat1, stat2,
> +                            swclktck, swdiotms, sysclken, tdi, tdo, testmode,
> +                            traceclk, tracedt00, tracedt01, tracedt02,
> +                            tracedt03, tracedt04, tracedt05, tracedt06,
> +                            tracedt07, tracedt08, tracedt09, tracedt10,
> +                            tracedt11, tracedt12, tracedt13, tracedt14,
> +                            tracedt15, trstb, txdata3g0, ubctsn, ubrtsn, ubrx,
> +                            ubtx ]
> +            then:
> +              properties:
> +                drive-strength:
> +                  enum: [ 2, 4, 6, 8, 10, 12, 14, 16 ]

Not sure this is worth the complexity. And actually, 'drive-strength' 
will be allowed on the pins not listed here and can have any value.

I would just move this to the main section and drop the if/then. You 
could list the subset of pins where 'drive-strength' is not valid 
instead and then put 'drive-strength: false'.

Rob

