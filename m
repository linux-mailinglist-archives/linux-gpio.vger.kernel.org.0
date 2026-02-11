Return-Path: <linux-gpio+bounces-31583-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AriBQwqjGmFigAAu9opvQ
	(envelope-from <linux-gpio+bounces-31583-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 08:04:44 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 874CF121C37
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 08:04:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 47F0A3025E6F
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 07:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B05C532D0D9;
	Wed, 11 Feb 2026 07:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cPcE6n+w"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE682C2365;
	Wed, 11 Feb 2026 07:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770793478; cv=none; b=EMiGoDKpf2bjWDLVqmtkMdD0YrtIieoVIi2eC/jADvmlMYXc1+uWmkveDGg4g2qPB+xvfbuMok+wu32DLulZJAIfrUZW2txBEGF68WMIp57TBu+67R1rg53NHukzK4E+Yy/3Zc1eFC5kUCfDdCYbcuUT2DKgExlB+5MpW/ikk/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770793478; c=relaxed/simple;
	bh=3ZTnWhXXoERir4oO0pfx4Q02C2doAZHVJvzFlwy5MRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o8050kPMPVQDt15pa/SH49jVVwIR11oEzsluMPbiJueticjam9Th/hi1Guf0yHf7ryoIaFhu076B/oDQ4lvi7jEEdQvp4R9zDvEA6v7LqzrrXJYdMGY0INZZHd2UgX6RAb7uBzBdSo6XN7OVolMx7xz3OatCc38FCsDvCLVGMVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cPcE6n+w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D466C4CEF7;
	Wed, 11 Feb 2026 07:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770793477;
	bh=3ZTnWhXXoERir4oO0pfx4Q02C2doAZHVJvzFlwy5MRI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cPcE6n+wMTjRTF0qXd5BzwFFJpnbjDSOEYPcUWGTZDessMWC5fxe1GpHYp1v5KYNl
	 NN9pIFDzXVJ85muL5dqr3qRLNOmUzvh5Mm2rM8GXxG5U4hnGJms9jNZ7LMOzTqwE2n
	 SsjOeefZB6J9zAqmMvBlHfojpH8AE1mtmpwed6+Bs1CYKUkKAhpa3OhZh9LzqemCcy
	 2zj5WdSrErRbGY9emASPelj0EJLA6YkUTxoXGiOsnQeSGQsAbjJXE6aX/yrz60bK/T
	 QuUuqEj9uy2nLLx+0IWKD7ppnZOk5/CPSFOWRpxkyeojeW3b8qL+pO+c+5Z1ubuKg+
	 V1FmdhhRdR0mw==
Date: Wed, 11 Feb 2026 08:04:35 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Alexander Stein <linux@ew.tq-group.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] gpio: aggregator: add gpio-aggregator DT compatible
Message-ID: <20260211-accurate-mini-mustang-2b2c9e@quoll>
References: <20260211044216.2885718-1-james.hilliard1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260211044216.2885718-1-james.hilliard1@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-31583-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tq-group.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 874CF121C37
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 09:42:12PM -0700, James Hilliard wrote:
> Add an OF match entry for gpio-aggregator so the forwarder can be
> instantiated without using the delay-specific compatible.

Why? What problems or real hardware are you solving here?


> 
> Add a minimal DT schema for gpio-aggregator documenting compatible.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  .../bindings/gpio/gpio-aggregator.yaml        | 57 +++++++++++++++++++

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

>  drivers/gpio/gpio-aggregator.c                |  3 +
>  2 files changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-aggregator.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-aggregator.yaml b/Documentation/devicetree/bindings/gpio/gpio-aggregator.yaml
> new file mode 100644
> index 000000000000..ec1d08f3db2c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-aggregator.yaml
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/gpio-aggregator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: GPIO aggregator controller
> +
> +maintainers:
> +  - Alexander Stein <linux@ew.tq-group.com>
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  This binding describes a GPIO forwarder that exposes selected GPIO

Explain the hardware, not the binding. Drop "this binding ......"

> +  lines as a virtual GPIO controller.
> +
> +properties:
> +  compatible:
> +    const: gpio-aggregator
> +
> +  "#gpio-cells":
> +    description: Specifies the line offset and GPIO flags.
> +    const: 2
> +
> +  gpios:
> +    description: Array of GPIOs to aggregate
> +    minItems: 1
> +    maxItems: 32
> +
> +  gpio-controller: true
> +
> +  gpio-line-names:
> +    minItems: 1
> +    maxItems: 32
> +
> +required:
> +  - compatible
> +  - "#gpio-cells"
> +  - gpio-controller
> +  - gpios
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    gpio_agg: gpio-aggregator {
> +        compatible = "gpio-aggregator";
> +        #gpio-cells = <2>;
> +        gpio-controller;
> +        gpios = <&gpio0 3 GPIO_ACTIVE_LOW>,
> +                <&gpio3 1 GPIO_ACTIVE_HIGH>;
> +    };
> +
> +    consumer {
> +        enable-gpios = <&gpio_agg 0 GPIO_ACTIVE_LOW>;
> +    };

Drop node, not relevant. Anyway, I do not see any point in referencing
"gpio_agg 0" instead of "gpio0 3" and your commit msg fails to explain
that.

Best regards,
Krzysztof


