Return-Path: <linux-gpio+bounces-33706-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPF6O+JQumkAUQIAu9opvQ
	(envelope-from <linux-gpio+bounces-33706-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 08:14:42 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48ABC2B6C04
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 08:14:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3BAA53033D1A
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 07:14:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D19836920B;
	Wed, 18 Mar 2026 07:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f1rwr8A4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9DF18DF9D;
	Wed, 18 Mar 2026 07:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773818078; cv=none; b=obJvXi8D/LO/b4R73eVBzzMLenNhNl+/GBV7gZfyyHAZ5HQTtJo7pX1H68liK+DdFCD2cJNF0+pnN72xGs6Zhy3DTLQynxjqa0GeHJI3C6m+TfVsJPrfsSW11GhWXwI/HCeS12v56gz0Mn8Jn8syBgtlpyywKgpolHQBXf3UD7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773818078; c=relaxed/simple;
	bh=UUsNg0176Pj9NWFxrWArSHKtbO6bwxNXY6VX89i/DUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i4Dxo7zNoTn9itRnS/ybYb6dvxghyB+ivZNJNZ8ND/Oad+XLdthWiFkyJ393thCLREV2m+yrMl88QYb3ERDKDXZeR5EBNdt4iYLM6eR+1MPFTXwbKp/JSt8GfFtcDJ455lyHY6QbPKDAPbfqiAs2+RrrkSNsbK0sM631uvVf9+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f1rwr8A4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CF9BC19421;
	Wed, 18 Mar 2026 07:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773818077;
	bh=UUsNg0176Pj9NWFxrWArSHKtbO6bwxNXY6VX89i/DUI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f1rwr8A4ICV+zJrB7tUWcGQ8d7o13whgr6QzZRK/7Q9X/8Emnbe0oHkcOZ3CD5kb9
	 BauqUdXGWifpG+t8S13MBTrzPOtxGF7ya68OLmcnc4KsTeOr5lhFv2CFLwfoByNPBz
	 HbMKLKmMuFFXGMDWhaQorzhx32cMhGvJwUo4KLnjrMCcTmg1HdwQFLk48saOGLuF19
	 ebBCLsNIqAnJAYnJTPRpxnqCO0GoXrkNBXttv/74X3PFikXE1fSa71bGjI0WvAlsqD
	 IyKrCkD+i8MMVREd7gGqPgyuVFxnKl4PE4T5I2bP9KmTq+MsP8Mj6dh4HkUgz2jzzR
	 sPWQlLjFqYkaA==
Date: Wed, 18 Mar 2026 08:14:34 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Linus Walleij <linusw@kernel.org>, 
	AKASHI Takahiro <akashi.tkhro@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Dan Carpenter <dan.carpenter@linaro.og>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	arm-scmi@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>, 
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>, Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH v4 6/7] dt-bindings: gpio: Add bindings for pinctrl based
 generic gpio driver
Message-ID: <20260318-tuscan-agouti-of-unity-b564fe@quoll>
References: <cover.1773757772.git.dan.carpenter@linaro.org>
 <caf4b7265bb631964d384c1b68100ef90208dda6.1773757772.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <caf4b7265bb631964d384c1b68100ef90208dda6.1773757772.git.dan.carpenter@linaro.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33706-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.og,vger.kernel.org,intel.com,oss.qualcomm.com,linaro.org,arm.com,amd.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url]
X-Rspamd-Queue-Id: 48ABC2B6C04
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 05:40:57PM +0300, Dan Carpenter wrote:
> From: AKASHI Takahiro <takahiro.akashi@linaro.org>
> 
> Add a dt binding for the gpio-by-pinctrl driver.  The driver is used

Drop all references to the driver. Describe the
device/hardware/firmware/interface, not driver. Same for subject.

> for doing GPIO over the SCMI pinctrl protocol.  There are a few
> mandatory properties such as gpio-ranges and ngpios, but it's not
> mandatory to specify the pin-mux.

There is no such thing there as pin-mux, so I don't understand above
sentence.

Describe the hardware/firmware/interface, not the patch, because we
easily see which properties are mandatory. Schema tells that.

> 
> Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> Reviewed-by: Linus Walleij <linusw@kernel.org>

A nit, subject: drop second/last, redundant "bindings for". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

> ---
> v4: Changed additionalProperties: true to false.
> 
>     My concern here was that there might be a lot of gpio properties
>     which I wasn't familiar with.  To check I did:
>         grep :$ Documentation/devicetree/bindings/gpio/* | \
>           cut -d : -f 2- | perl -ne 's/[\       ]*//g; print "$_\n"' | \
>           sort | uniq -c
>     The only property that I decided to add was gpio-line-names.
> 
>     Deleted the extra bonus example.
> 
>  .../bindings/gpio/pin-control-gpio.yaml       | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/pin-control-gpio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/pin-control-gpio.yaml b/Documentation/devicetree/bindings/gpio/pin-control-gpio.yaml
> new file mode 100644
> index 000000000000..ebc3fdd039fd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/pin-control-gpio.yaml
> @@ -0,0 +1,59 @@
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
> +  gpio-line-names: true
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
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    gpio {
> +        compatible = "scmi-pinctrl-gpio";
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        ngpios = <3>;

Three pins here

> +        gpio-line-names = "gpio_5_17", "gpio_5_20", "gpio_5_22", "gpio_2_1";

... four here

> +        gpio-ranges = <&scmi_pinctrl 0 30 4>;

... and four here, so it feels inconsistent. I guess ngpios = 4?

Best regards,
Krzysztof


