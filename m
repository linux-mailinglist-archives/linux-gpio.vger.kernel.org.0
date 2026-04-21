Return-Path: <linux-gpio+bounces-35317-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALxFEqXE52nuAQIAu9opvQ
	(envelope-from <linux-gpio+bounces-35317-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 20:40:37 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2F343EBD6
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 20:40:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 70767301C169
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 18:40:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63E5B3DC4AF;
	Tue, 21 Apr 2026 18:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XVpdSQ+R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA6B372B4B;
	Tue, 21 Apr 2026 18:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776796798; cv=none; b=YJJnSqlVLUFspU1p8AEKmJLEk1eJkFOvKaEeUuOvdAAIJPAWCEW7Ue3Un+zYW7p5R20RLkt9F+4R9UBr5qgMGSHwuLuuYzsP2Tsbi3yT/u6A4PEkQqOdIQt0SdgY9bXI2Czw5BPjFF4aK01R6E3mrEvM06T71NI/46w/zF0WSro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776796798; c=relaxed/simple;
	bh=50mQHD7FkIRq1YWjICck6T5+Oufmi7QsAhgPHeR0pvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W6yCO/jAkoVNgYG0KQHIWrsDU3Ra1f3mmTjNryD3GPo2nOb32vxaI3vpZbulLvEB/hdH2Cay/ASS9Hy7jyzvTOcORbi1WAxWn4vt35JrM11eBE0s5jzvrBoBM8qch54+IVOZmXLmzAeUz7EisOEGy0eFB9HoNb+32G5cCkRm+08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XVpdSQ+R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFA0EC2BCB0;
	Tue, 21 Apr 2026 18:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776796798;
	bh=50mQHD7FkIRq1YWjICck6T5+Oufmi7QsAhgPHeR0pvM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XVpdSQ+RtzY6DXBIz5P+utA5Jm+7IvW1PJQT0HkIe/aJYAxaBs6mx5s7PC1H/eCxB
	 ikORpKU+Q5q4nBMfp1sFBgudE5UUmEDscUk7yz0HcDBbRxu/Ay1JridC4AKWyz16aC
	 44Qadg1bUgmus5YzYKdBb4gszgRrBK6hFXg/jwT2Kl51bCFQL44nfEVJ9d9VekL5ft
	 f7LuIifWK+dT8Rsll3YKDiRc8V2+EYyLn6JcXJTXz9usahPwOjSo/h41ryystRCAx7
	 uVlNZUwaZvV7BLC01XAAJUXzXL7YDQXDDbTUGYw/7PlgI7H8acD+u8h8awdRl2xnRW
	 3rhxJIhuN8cEA==
Date: Tue, 21 Apr 2026 13:39:55 -0500
From: Rob Herring <robh@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v7 2/3] dt-bindings: mfd: aspeed,ast2x00-scu: Describe
 AST2700 SCU0
Message-ID: <20260421183955.GA1448377-robh@kernel.org>
References: <20260416-upstream_pinctrl-v7-0-d72762253163@aspeedtech.com>
 <20260416-upstream_pinctrl-v7-2-d72762253163@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260416-upstream_pinctrl-v7-2-d72762253163@aspeedtech.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35317-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aspeedtech.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EA2F343EBD6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 16, 2026 at 03:29:44PM +0800, Billy Tsai wrote:
> AST2700 consists of two interconnected SoC instances, each with its own
> System Control Unit (SCU). The SCU0 provides pin control, interrupt
> controllers, clocks, resets, and address-space mappings for the
> Secondary and Tertiary Service Processors (SSP and TSP).
> 
> Describe the SSP/TSP address mappings using the standard
> memory-region and memory-region-names properties.
> 
> Disallow legacy child nodes that are not present on AST2700, including
> p2a-control and smp-memram. The latter is unnecessary as software can
> access the scratch registers via the SCU syscon.
> 
> Also allow the AST2700 SoC0 pin controller to be described as a child
> node of the SCU0, and add an example illustrating the SCU0 layout,
> including reserved-memory, interrupt controllers, and pinctrl.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../bindings/mfd/aspeed,ast2x00-scu.yaml           | 113 +++++++++++++++++++++
>  1 file changed, 113 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
> index a87f31fce019..215ff59b38ea 100644
> --- a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
> +++ b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
> @@ -46,6 +46,17 @@ properties:
>    '#reset-cells':
>      const: 1
>  
> +  memory-region:
> +    items:
> +      - description: Region mapped through the first SSP address window.
> +      - description: Region mapped through the second SSP address window.
> +      - description: Region mapped through the TSP address window.

blank line

> +  memory-region-names:
> +    items:
> +      - const: ssp-0
> +      - const: ssp-1
> +      - const: tsp
> +
>  patternProperties:
>    '^p2a-control@[0-9a-f]+$':
>      description: >
> @@ -87,6 +98,7 @@ patternProperties:
>              - aspeed,ast2400-pinctrl
>              - aspeed,ast2500-pinctrl
>              - aspeed,ast2600-pinctrl
> +            - aspeed,ast2700-soc0-pinctrl
>  
>      required:
>        - compatible
> @@ -156,6 +168,30 @@ required:
>    - '#clock-cells'
>    - '#reset-cells'
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            anyOf:
> +              - const: aspeed,ast2700-scu0
> +              - const: aspeed,ast2700-scu1

More simply expressed as:

contains:
  enum:
    - aspeed,ast2700-scu0
    - aspeed,ast2700-scu1


> +    then:
> +      patternProperties:
> +        '^p2a-control@[0-9a-f]+$': false
> +        '^smp-memram@[0-9a-f]+$': false

