Return-Path: <linux-gpio+bounces-32723-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBnpOq4jrGlHlwEAu9opvQ
	(envelope-from <linux-gpio+bounces-32723-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Mar 2026 14:10:06 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A68722BD79
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Mar 2026 14:10:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DEDE6301FA75
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Mar 2026 13:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3847D3A0E82;
	Sat,  7 Mar 2026 13:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YNkLqo07"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98C33A0B37;
	Sat,  7 Mar 2026 13:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772889001; cv=none; b=bZglE3lxOB8O016UAlrXvUD1bMm1QEn8fdKqagF/wE9nZ9g+O5HGIvbFIuJLgxAlQufYGVz19Q7AIJDgbmepXC9VdTnp98eUklhU1N0VoGjY1AZLpfjL4B2wOrakaf2MXab99uGZxC1nujUIld3JOi4PHO+tkGUwyUhJcI75qOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772889001; c=relaxed/simple;
	bh=CsR7XjNewZ3NQCE6y0mxkCJ0kBswMv6pLNJLWrjMwZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jTLMiLKzWfGq8+eSgAzM28sGz9S67PZSirZhZp5q8ZOAuOGJfwh1+8JIoBFh+IzR/Uu42xQtZDl0bd59Tp3AGg93UlrLn/kjZIBO+aFhbYTscWhkpRV5cyQXVHrumz1V64jUh28oCCUEquVqD3qWwEctlQOgewc643mAxirECz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YNkLqo07; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E2B3C2BC86;
	Sat,  7 Mar 2026 13:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772889000;
	bh=CsR7XjNewZ3NQCE6y0mxkCJ0kBswMv6pLNJLWrjMwZM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YNkLqo07CG75uNpB+lKu0fcol5AQ8E38PYtLyeJfvza+M7BK1RH8aU5Wkmofi+53o
	 CV71xU0doe5AqxDLEdW2y/dQIV68ghcd+hE1M1kSpOnUHvc3C10S6EDbl0KY57xuX2
	 8E1kTYmlScQTCS/MIROUqAhrCfC+BXoy+as390MJhdnJFhdYb7xFH8Gic/TneVkNuc
	 exXfmc45w0gjvthhtII9dbcgN5pv6aMv4MWX/wC9wGN7lsocFQVM+AmWSvwaesv14Z
	 C1pNTPDTiKS5eoACKvXx0xPuhATiUX3ynfKe8cI5TPBgsNU4AU/3M0UzrBGMOs8uiE
	 8lOlKl573/kdQ==
Date: Sat, 7 Mar 2026 14:09:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, bartosz.golaszewski@oss.qualcomm.com, afaerber@suse.com, 
	james.tai@realtek.com, cy.huang@realtek.com, stanley_chang@realtek.com, 
	tychang@realtek.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-realtek-soc@lists.infradead.org
Subject: Re: [PATCH v2 11/14] dt-bindings: pinctrl: realtek: Add RTD1625
 pinctrl binding
Message-ID: <20260307-large-wondrous-coot-4f4ee7@quoll>
References: <20260306075244.1170399-1-eleanor.lin@realtek.com>
 <20260306075244.1170399-12-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260306075244.1170399-12-eleanor.lin@realtek.com>
X-Rspamd-Queue-Id: 8A68722BD79
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32723-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.984];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 03:52:41PM +0800, Yu-Chun Lin wrote:
> +      input-voltage-microvolt:
> +        description: |
> +          Select the input receiver voltage domain for the pin.
> +          Valid arguments are:
> +          - 1800000: 1.8V input logic level
> +          - 3300000: 3.3V input logic level
> +        enum: [1800000, 3300000]
> +
> +      drive-push-pull: true
> +
> +      power-source:
> +        description: |
> +          Valid arguments are described as below:
> +          0: power supply of 1.8V
> +          1: power supply of 3.3V
> +        enum: [0, 1]

Isn't this duplicating input-voltage-microvolt? Where do you use it in
the driver?

> +
> +      slew-rate:
> +        description: |
> +          Valid arguments are described as below:
> +            0: ~1ns falling time
> +            1: ~10ns falling time
> +            2: ~20ns falling time
> +            3: ~30ns falling time
> +        enum: [0, 1, 2, 3]

If you have specific values, why not using 1/10/20/30?

> +
> +      realtek,drive-strength-p:
> +        description: |
> +          Some of pins can be driven using the P-MOS and N-MOS transistor to
> +          achieve finer adjustments. The block-diagram representation is as
> +          follows:
> +                         VDD
> +                          |
> +                      ||--+
> +               +-----o||     P-MOS-FET
> +               |      ||--+
> +          IN --+          +----- out
> +               |      ||--+
> +               +------||     N-MOS-FET
> +                      ||--+
> +                          |
> +                         GND
> +          The driving strength of the P-MOS/N-MOS transistors impacts the
> +          waveform's rise/fall times. Greater driving strength results in
> +          shorter rise/fall times. Each P-MOS and N-MOS transistor offers
> +          8 configurable levels (0 to 7), with higher values indicating
> +          greater driving strength, contributing to achieving the desired
> +          speed.
> +
> +          The realtek,drive-strength-p is used to control the driving strength
> +          of the P-MOS output.
> +
> +          This value is not a simple count of transistors. Instead, it
> +          represents a weighted configuration. There is a base driving
> +          capability (even at value 0), and each bit adds a different weight to
> +          the total strength. The resulting current is non-linear and varies
> +          significantly based on the IO voltage (1.8V vs 3.3V) and the specific
> +          pad group.
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 0
> +        maximum: 7
> +
> +      realtek,drive-strength-n:
> +        description: |
> +          Similar to the realtek,drive-strength-p, the realtek,drive-strength-n
> +          is used to control the driving strength of the N-MOS output.
> +
> +          This property uses the same weighted configuration logic where values
> +          0-7 represent non-linear strength adjustments rather than a transistor
> +          count.
> +
> +          Higher values indicate greater driving strength, resulting in shorter
> +          fall times.
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 0
> +        maximum: 7
> +
> +      realtek,pulse-width-adjust:
> +        description: |
> +          An integer describing the level to adjust the output pulse width, it
> +          provides a fixed nanosecond-level adjustment to the rising/falling
> +          edges of an existing signal. It is used for Signal Integrity tuning
> +          (adding/subtracting delay to fine-tune the high/low duration), rather
> +          than generating a specific PWM frequency.
> +
> +          Valid arguments are described as below:
> +          0: 0ns
> +          2: + 0.25ns
> +          3: + 0.5ns
> +          4: -0.25ns
> +          5: -0.5ns
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [0, 2, 3, 4, 5]
> +
> +      realtek,high-vil-microvolt:
> +        description: |
> +          The threshold value for the input receiver's LOW recognition (VIL).
> +
> +          This property is used to address specific HDMI I2C compatibility
> +          issues where some sinks (TVs) have weak pull-down capabilities and
> +          fail to pull the bus voltage below the standard VIL threshold
> +          (~0.7V).
> +
> +          Setting this property to 1100000 (1.1V) enables a specialized input
> +          receiver mode that raises the effective VIL threshold to improve
> +          detection.
> +        enum: [1100000]
> +
> +    required:
> +      - pins
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pinctrl@4e000 {
> +        compatible = "realtek,rtd1625-iso-pinctrl";
> +        reg = <0x4e000 0x130>;
> +
> +        emmc-hs200-pins {
> +            pins = "emmc_clk",
> +                   "emmc_cmd",
> +                   "emmc_data_0",
> +                   "emmc_data_1",
> +                   "emmc_data_2",
> +                   "emmc_data_3",
> +                   "emmc_data_4",
> +                   "emmc_data_5",
> +                   "emmc_data_6",
> +                   "emmc_data_7";
> +            function = "emmc";
> +            realtek,drive-strength-p = <0x2>;
> +            realtek,drive-strength-n = <0x2>;

These are not hex, but simple decimals

> +        };
> +
> +        i2c-0-pins {
> +            pins = "gpio_12",
> +                   "gpio_13";
> +            function = "i2c0";
> +            drive-strength = <4>;
> +        };
> +    };
> -- 
> 2.34.1
> 

