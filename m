Return-Path: <linux-gpio+bounces-33409-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mM/jGAOotGlvrgAAu9opvQ
	(envelope-from <linux-gpio+bounces-33409-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Mar 2026 01:12:51 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD9028ADB1
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Mar 2026 01:12:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F1281308ED72
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Mar 2026 00:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15CED225775;
	Sat, 14 Mar 2026 00:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k3nK86uT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2A61D555;
	Sat, 14 Mar 2026 00:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773447166; cv=none; b=k1KU961/D2A3iSn4XgL80j5txhdD4xRyO97UczarLSQiGSdVT+xwv4EmFn9SfG013fQQNwOOzKzjr18HcnEuGhwQchOho4zwtuFAS1n2qVhvn7ZNG4mAQujwwCp6yf35WrjXQ0CCzE8HATH1dQGVvLnvI8lQwvSjap92mVIuTkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773447166; c=relaxed/simple;
	bh=PspIzlOgSIHhY3SbB6UtbeuiSGc96oEWYbYAyeK+8TY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nrNanzD/YntSBol4lhivvpP3TdofCKoRSvLJQO7enqqsv5L6E4igHrfOmtAjR3SHHFBhWxe0SHpsDKbMTnmy4U3Zuhn8VjOBh5s7XpNOGnf2+E+QB5fGxJrrzi/GwRV/rG6eKGV58jrSkVi7fevUJq6n9FclDCFkZuAGCvzm0ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k3nK86uT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EACEC19421;
	Sat, 14 Mar 2026 00:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773447166;
	bh=PspIzlOgSIHhY3SbB6UtbeuiSGc96oEWYbYAyeK+8TY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k3nK86uT9WAGBd61j1jhNRkko5MZUppELNXWuqaNT8pWuvF9I/psFYbDQoTOSK+Ba
	 y+jtjdxWQ0uVuv+ipqviQBTrUsYRaZLxuiOJfTK2WPplVYoM9mRtDlgpH431FdiEuq
	 GZru+ekUsd4C8HcKjaAyG0sAbV43NzzhCu0LR1sP4M+pCKehLDw35CKAw20qpGuvAU
	 4v553biz4QdvRIdF0/s+EkQ0E8YcGFzH7RWe1/oIIFPkCoP9ynJ4T/lXVGa6Y5/sVX
	 3cWFDUm63uX7WKzaRSpVKeniW1fqwHGXnxhGdSBQgT4UQE/Sh/cYc+9OwH9trbIfzQ
	 Ik8JkBmQEGxew==
Date: Fri, 13 Mar 2026 19:12:45 -0500
From: Rob Herring <robh@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Linus Walleij <linusw@kernel.org>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.og>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	arm-scmi@vger.kernel.org
Subject: Re: [PATCH v3 6/7] dt-bindings: gpio: Add bindings for pinctrl based
 generic gpio driver
Message-ID: <20260314001245.GA3706571-robh@kernel.org>
References: <cover.1773150895.git.dan.carpenter@linaro.org>
 <58446889d781435424c46bac563483e603d7c0e9.1773150895.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58446889d781435424c46bac563483e603d7c0e9.1773150895.git.dan.carpenter@linaro.org>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.og,vger.kernel.org,intel.com,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-33409-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url]
X-Rspamd-Queue-Id: BFD9028ADB1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 10:39:17PM +0300, Dan Carpenter wrote:
> From: AKASHI Takahiro <takahiro.akashi@linaro.org>
> 
> Add a dt binding for the gpio-by-pinctrl driver.  The driver is used
> for doing GPIO over the SCMI pinctrl protocol.  There are a few
> mandatory properties such as gpio-ranges and ngpios, but it's not
> mandatory to specify the pin-mux.
> 
> Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  .../bindings/gpio/pin-control-gpio.yaml       | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/pin-control-gpio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/pin-control-gpio.yaml b/Documentation/devicetree/bindings/gpio/pin-control-gpio.yaml
> new file mode 100644
> index 000000000000..81c68579df6e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/pin-control-gpio.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/pin-control-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Pin control based generic GPIO controller
> +
> +description:
> +  The pin control-based GPIO will facilitate a pin controller's ability
> +  to drive electric lines high/low and other generic properties of a
> +  pin controller to perform general-purpose one-bit binary I/O.
> +
> +maintainers:
> +  - Dan Carpenter <dan.carpenter@linaro.og>
> +
> +properties:
> +  compatible:
> +    const: scmi-pinctrl-gpio
> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  gpio-ranges: true
> +
> +  ngpios: true
> +
> +patternProperties:
> +  "^.+-hog(-[0-9]+)?$":
> +    type: object
> +
> +    required:
> +      - gpio-hog
> +
> +required:
> +  - compatible
> +  - gpio-controller
> +  - "#gpio-cells"
> +  - gpio-ranges
> +  - ngpios
> +
> +additionalProperties: true

That's only valid for common (incomplete) schemas. It must be false.

> +
> +examples:
> +  - |
> +    gpio1 {
> +        compatible = "scmi-pinctrl-gpio";
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        ngpios = <10>;
> +        gpio-ranges = <&scmi_pinctrl 0 8 4>,
> +                      <&scmi_pinctrl 4 12 1>,
> +                      <&scmi_pinctrl 5 15 1>,
> +                      <&scmi_pinctrl 6 17 4>;
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&i2c2_pins>;
> +    };
> +
> +    gpio2 {
> +        compatible = "scmi-pinctrl-gpio";
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        ngpios = <3>;
> +        gpio-line-names = "gpio_5_17", "gpio_5_20", "gpio_5_22", "gpio_2_1";
> +        gpio-ranges = <&scmi_pinctrl 0 30 4>;
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&keys_pins>;
> +    };

I think 1 example is enough.

> -- 
> 2.51.0
> 

