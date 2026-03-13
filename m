Return-Path: <linux-gpio+bounces-33358-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNh3CGoTtGlkgwAAu9opvQ
	(envelope-from <linux-gpio+bounces-33358-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 14:38:50 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A6D2840AB
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 14:38:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EE3EE30A6362
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 13:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BFAF3AE1B1;
	Fri, 13 Mar 2026 13:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o4eBeLr8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1153B27CC;
	Fri, 13 Mar 2026 13:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773408276; cv=none; b=pdj9ZU9D74SDJJpqI/lUnYTm0N7wJ7I2M1WKNIEsqUHwESxrxbzQuZZp7UwY4F5IiXTNztEwUfwDU/Vr0s7dVx24Rmi6ahjbaaEkq3zdpGwLMJPliGPhikkkBuWrQTEgT1whl79bPc8zY+JDVjjKBJXbUJt6piCJ//QcYMGskxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773408276; c=relaxed/simple;
	bh=urOzvIsE02W6nKaEYPnzM0tviGqCdNvKQWffGaUiF4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nQO9Kwl8d2vrshmEOawl7DPuIcrn8ptvCVN8g7rIPiQAZfnzzGjqoDQsiybdo4Owi2E9ymIOb6iwKUE6IKG+FtfDkdci3eTN1M9XpOIFzCOIS+fcmuMCCooQc81lWQSy6BvyExTzMNqkcgvXopqhZ6rH+Xys2phQ09mxbt4I79g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o4eBeLr8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 765AAC19421;
	Fri, 13 Mar 2026 13:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773408276;
	bh=urOzvIsE02W6nKaEYPnzM0tviGqCdNvKQWffGaUiF4M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o4eBeLr8fq6DBt3IokA2HTcm0D2lglIs21flnxnTG56EKtwRN1uq9FoeUs82QjJEw
	 1ERQOmhFfuDmYceGmZ2icKnkB5soQi9HjGRttpgp/xJ+hfBTf6rM8Aa6Updkb3mJOx
	 E9JP7pLJbMrE7O9XHbkdVbJ4NYFHpFCc1DSmPfnCLKLW5x/mYEHpAFTKC+DJ2V8Cpt
	 HKjGb97YcU1Vmjdfgb4e63Yf1tUbpLKQGT/aDrIBwSEzbQA7Yc0ortykCRCl5WenpI
	 hv+jCdj7r9f9MxPklY3qz/Y2SHnQT8Uyo27WIpquei/sq4WvZszBk7a7BFdv7w/uVF
	 s0/OnQ8bKNJ9g==
Date: Fri, 13 Mar 2026 14:24:33 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linusw@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-mmc@vger.kernel.org
Subject: Re: [PATCH 3/9] dt-bindings: pinctrl: qcom: add IPQ5210 pinctrl
Message-ID: <20260313-primitive-talented-boobook-d7a7e7@quoll>
References: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
 <20260311-ipq5210_boot_to_shell-v1-3-fe857d68d698@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260311-ipq5210_boot_to_shell-v1-3-fe857d68d698@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33358-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,pengutronix.de,linaro.org,gmail.com,gurudas.dev,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.15.66.64:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,devicetree.org:url]
X-Rspamd-Queue-Id: B2A6D2840AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 03:15:45PM +0530, Kathiravan Thirumoorthy wrote:
> Add device tree bindings for IPQ5210 TLMM block.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  .../bindings/pinctrl/qcom,ipq5210-tlmm.yaml        | 141 +++++++++++++++++++++
>  1 file changed, 141 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq5210-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,ipq5210-tlmm.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..3e5a46638385cf7925963c7e4b615c67e642152c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq5210-tlmm.yaml
> @@ -0,0 +1,141 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/qcom,ipq5210-tlmm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm IPQ5210 TLMM pin controller
> +
> +maintainers:
> +  - Bjorn Andersson <andersson@kernel.org>
> +  - Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> +
> +description: |

Drop |

Please do not combine completely independent series, targetting
different subsystems, into one patchset. It does not bring benefits but
only make everything trickier for maintainers which need to figure out
dependencies and cherry pick instead of applying entire series.

We raised this multiple times and it IS documented in your guideline, so
READ the internal docs.

> +  Top Level Mode Multiplexer pin controller in Qualcomm IPQ5210 SoC.
> +
> +allOf:
> +  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
> +

...

> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    tlmm: pinctrl@1000000 {
> +        compatible = "qcom,ipq5210-tlmm";
> +        reg = <0x01000000 0x300000>;
> +        gpio-controller;
> +        #gpio-cells = <0x2>;
> +        gpio-ranges = <&tlmm 0 0 54>;
> +        interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-controller;
> +        #interrupt-cells = <0x2>;
> +
> +        qup-uart1-default-state {
> +            tx-pins {
> +                pins = "gpio39";
> +                function = "qup_se1_l2";
> +                drive-strength = <6>;
> +                bias-pull-down;
> +            };
> +
> +            rx-pins {
> +                pins = "gpio38";
> +                function = "qup_se1_l3";
> +                drive-strength = <6>;
> +                bias-pull-down;
> +            };
> +        };
> +

Drop blank line

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


