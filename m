Return-Path: <linux-gpio+bounces-24395-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D16CB269F4
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Aug 2025 16:49:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 131671795BB
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Aug 2025 14:41:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48F0D1F0E32;
	Thu, 14 Aug 2025 14:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LAvEDr+U"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75DF1DE3DC;
	Thu, 14 Aug 2025 14:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755182454; cv=none; b=IqaOI41y7I1qXkQM67D+Ln+OZCUxoCR+xx8DIe17vuDpOWcwl64klksrI/lT7KgdbYjYf0V2US+TGuynWQrf0q4JKGTm2PPZIIchVFZe2X5uftKM6WtcqTuEKuDNWz5WIUbouuAOm1ikFy4qiTsSPQsb63qOC+mQ/bCUY+Xs7DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755182454; c=relaxed/simple;
	bh=PU8UA+I5WgTOlBY9VPUqNqmWYyXfIpJmXJCYLjXok58=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=fUYUO6UNa3LMSwTIO2fwODoRfjeyFX83yiEB+3cL7m/ceRbEEqkdzjiEgHCkbyOSHV/qLHOVvOrThwx51Q+TbwWU6aeNQwHvkR0uylwMntVljdR2eazcO66X3K41ib886fLIZvSLAttWNIEk4j/QK4rEB60BYwjmGQyJ3JCSSqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LAvEDr+U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55734C4CEED;
	Thu, 14 Aug 2025 14:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755182453;
	bh=PU8UA+I5WgTOlBY9VPUqNqmWYyXfIpJmXJCYLjXok58=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=LAvEDr+U95m00kjZmTrLNp8VuVL+XYtIEG2s0CzSAfyG9ZJ7nIPN34wZGDGtK7k+R
	 rymKq3ypcPqobxYczNFF7TiI4nzADaGo8befS8+Vnd8uotBkVf5F3gfR/KIsBnzx+s
	 1or3x87vwQHkyc/eRPjwCZPos+v8Vswv0yBhcf44DBw3YBACU+wnqy9/g3JrwpRd0N
	 5oK5uXI+oTEjCveSwi2bB8cIOBQVT9eHULzCnyiHcPr70ncbNRSYTe1tu9J/DRHXAR
	 3AjyaVGKzi7iNQBylr0cTJp3E0/oCD4T5SL4uob8XCHn7uMfIEQz3p/Q6NHUXjGQLJ
	 2/mXpjoGPZ14Q==
Date: Thu, 14 Aug 2025 09:40:52 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Conor Dooley <conor+dt@kernel.org>, 
 Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Jonathan Corbet <corbet@lwn.net>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org
To: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
In-Reply-To: <20250814-ltc4283-support-v1-1-88b2cef773f2@analog.com>
References: <20250814-ltc4283-support-v1-0-88b2cef773f2@analog.com>
 <20250814-ltc4283-support-v1-1-88b2cef773f2@analog.com>
Message-Id: <175518245252.2989785.16386519641633311403.robh@kernel.org>
Subject: Re: [PATCH 1/6] dt-binbings: mfd: Add bindings for the LTC4283
 Swap Controller


On Thu, 14 Aug 2025 11:52:23 +0100, Nuno Sá wrote:
> The LTC4283 is a negative voltage hot swap controller that drives an
> external N-channel MOSFET to allow a board to be safely inserted and
> removed from a live backplane.
> 
> Main usage is as an Hardware Monitoring device. However, it has up to 8
> pins that can be configured and used as GPIOs and hence, the device can
> also be a GPIO controller.
> 
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>
> ---
>  .../devicetree/bindings/mfd/adi,ltc4283.yaml       | 85 ++++++++++++++++++++++
>  MAINTAINERS                                        |  7 ++
>  2 files changed, 92 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/adi,ltc4283.yaml:
	Error in referenced schema matching $id: http://devicetree.org/schemas/gpio/adi,ltc4283.yaml
	Tried these paths (check schema $id if path is wrong):
	/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/gpio/adi,ltc4283.yaml
	/usr/local/lib/python3.13/dist-packages/dtschema/schemas/gpio/adi,ltc4283.yaml

/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/adi,ltc4283.example.dtb: swap-controller@15 (adi,ltc4283): gpio: {'compatible': ['adi,ltc4283-gpio'], 'gpio-controller': True, '#gpio-cells': 2} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/gpio/adi,ltc4283.yaml#"}
	from schema $id: http://devicetree.org/schemas/mfd/adi,ltc4283.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/adi,ltc4283.example.dtb: swap-controller@15 (adi,ltc4283): hwmon: {'compatible': ['adi,ltc4283-hwmon'], 'adi,rsense-nano-ohms': [500], 'adi,current-limit-sense-microvolt': [[25000]], 'adi,current-limit-foldback-factor': [10], 'adi,cooling-delay-ms': [8190], 'adi,fet-bad-timer-delay-ms': [512]} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/hwmon/adi,ltc4283.yaml#"}
	from schema $id: http://devicetree.org/schemas/mfd/adi,ltc4283.yaml#
Documentation/devicetree/bindings/mfd/adi,ltc4283.example.dtb: /example-0/i2c/swap-controller@15/gpio: failed to match any schema with compatible: ['adi,ltc4283-gpio']
Documentation/devicetree/bindings/mfd/adi,ltc4283.example.dtb: /example-0/i2c/swap-controller@15/hwmon: failed to match any schema with compatible: ['adi,ltc4283-hwmon']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250814-ltc4283-support-v1-1-88b2cef773f2@analog.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


