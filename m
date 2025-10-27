Return-Path: <linux-gpio+bounces-27643-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 49AF2C0D302
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 12:40:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3306619A5255
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 11:40:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 695172FBE1A;
	Mon, 27 Oct 2025 11:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hFzPceDn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E72366;
	Mon, 27 Oct 2025 11:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761565163; cv=none; b=RDtQIunUD32SB48DRw65AiiiCPf2k33XIA1C7V/smuGjaBRMCLJB/BmQuQJdwKYeiq6VKYMVhJYN7EWeEAPDSWNjczUf/uvpbRBCB8y7N98NW70VKCTJ0hywHU3kyUSKhmp4pU34Jg19B19HbUtAexq8sOvpPdupeut4NjuLe+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761565163; c=relaxed/simple;
	bh=ctM1Ko2DzDyqQ68R5PP+z4Xin95KGWuBnuYXi4vewr8=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=doBAB+EcrGhC8kn+OGHmCYJBHmJfIGTaaYtO+twpWiJDBviKmx3BxzKKLjJcq/21L/xMws5ATdKcmgMh9lB0/Y3Gn2i1Dl7LUUdFtXLZEFMOw50I51GybZTmLnA5hrp7SAHxtllTHgyDceLJIF6Yk3R4WS3RObT52rxQxl07Xe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hFzPceDn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93FFBC4CEF1;
	Mon, 27 Oct 2025 11:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761565162;
	bh=ctM1Ko2DzDyqQ68R5PP+z4Xin95KGWuBnuYXi4vewr8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=hFzPceDnaZAdC7D1ZgO5bwA5baPPmXXb2OGEqKaykLdtdMSzi/eSC2xqrPEyxqJhN
	 WxvHaI373ue3OG3BkKss6iSxLfk7r7GGA2MNRjp9HA1MKReXSWHJiBbk3xVaQmbNU9
	 fjd7cfTYRX6/EYWH5vnMLX9AVn2GaFjoKhSRN9z4GKOU62/jYAIHAsvzV6+elj8Laf
	 dgkmEg3QMivONM3sgUy6PRUtRNknylYt0tE3zQ51pMVkQf/ncFNPNh98WhMvvUtPxQ
	 NwU9MME5CTIgwnvKqpwrShDCsrkTG0VpZdQc5rj2hejp2jPmmsQkYUYvsZk+iL6R75
	 No07gkvoMI7Kw==
Date: Mon, 27 Oct 2025 06:39:21 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Peter Rosin <peda@axentia.se>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-gpio@vger.kernel.org
To: Jonas Jelonek <jelonek.jonas@gmail.com>
In-Reply-To: <20251026231754.2368904-2-jelonek.jonas@gmail.com>
References: <20251026231754.2368904-1-jelonek.jonas@gmail.com>
 <20251026231754.2368904-2-jelonek.jonas@gmail.com>
Message-Id: <176156516117.3074175.12049051744005094692.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: add gpio-line-mux controller


On Sun, 26 Oct 2025 23:17:53 +0000, Jonas Jelonek wrote:
> Add dt-schema for a gpio-line-mux controller which exposes virtual
> GPIOs for a shared GPIO controlled by a multiplexer, e.g. a gpio-mux.
> 
> The gpio-line-mux controller is a gpio-controller, thus has mostly the
> same semantics. However, it requires a mux-control to be specified upon
> which it will operate.
> 
> Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>
> ---
>  .../bindings/gpio/gpio-line-mux.yaml          | 108 ++++++++++++++++++
>  .../devicetree/bindings/mux/gpio-mux.yaml     |  30 +++++
>  2 files changed, 138 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-line-mux.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/gpio/gpio-line-mux.yaml: gpio-line-mux-states: missing type definition
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/gpio/gpio-line-mux.example.dtb: gpio-mux (gpio-mux): $nodename:0: 'gpio-mux' does not match '^mux-controller(@.*|-([0-9]|[1-9][0-9]+))?$'
	from schema $id: http://devicetree.org/schemas/mux/mux-controller.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/gpio/gpio-line-mux.example.dtb: sfp-gpio-1 (gpio-line-mux): gpio-line-mux-states:0: 0 is not of type 'string'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-line-mux.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/gpio/gpio-line-mux.example.dtb: sfp-gpio-1 (gpio-line-mux): gpio-line-mux-states:1: 1 is not of type 'string'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-line-mux.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/gpio/gpio-line-mux.example.dtb: sfp-gpio-1 (gpio-line-mux): gpio-line-mux-states:2: 3 is not of type 'string'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-line-mux.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/gpio/gpio-line-mux.example.dtb: sfp-gpio-1 (gpio-line-mux): mux-controls: [[1]] is not of type 'object'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-line-mux.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/gpio/gpio-line-mux.example.dtb: sfp-p1 (sff,sfp): 'i2c-bus' is a required property
	from schema $id: http://devicetree.org/schemas/net/sff,sfp.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mux/gpio-mux.example.dtb: sfp-gpio-1 (gpio-line-mux): gpio-line-mux-states:0: 0 is not of type 'string'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-line-mux.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mux/gpio-mux.example.dtb: sfp-gpio-1 (gpio-line-mux): gpio-line-mux-states:1: 1 is not of type 'string'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-line-mux.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mux/gpio-mux.example.dtb: sfp-gpio-1 (gpio-line-mux): gpio-line-mux-states:2: 2 is not of type 'string'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-line-mux.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mux/gpio-mux.example.dtb: sfp-gpio-1 (gpio-line-mux): mux-controls: [[2]] is not of type 'object'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-line-mux.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mux/gpio-mux.example.dtb: sfp-p0 (sff,sfp): 'i2c-bus' is a required property
	from schema $id: http://devicetree.org/schemas/net/sff,sfp.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251026231754.2368904-2-jelonek.jonas@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


