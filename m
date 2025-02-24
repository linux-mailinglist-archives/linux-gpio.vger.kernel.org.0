Return-Path: <linux-gpio+bounces-16489-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D100AA41FE3
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 14:05:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D8F81897DD6
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 13:05:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B593523BCE5;
	Mon, 24 Feb 2025 13:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uXo2+Ggd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65AF22571D6;
	Mon, 24 Feb 2025 13:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740402332; cv=none; b=SWMIu7z+JwIZCccJiwONV6QbL30j/YImnNT8lOgLH+eYnwTsefYGK0CyfIvawlM+v+vFPbIQ0GFZwurp27ORG1iPHmQLTrnQnyYybEL/0r7w21jOVvUlavbI8fJm+0obPJaBPHLz8B4k1GSIy45GYD7g8jw1+e57f6DM0dK72p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740402332; c=relaxed/simple;
	bh=y3eawGNAQwktvt2KmTPjG4rjTuAnaEeylUjuihjn3oI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g5AIYzA8ascKL8oar09NSBnr4YVfWRdIj1FD+AcilkItuzs2TpyhzYICtYgPQcYohYm5O0XEu9iZIdwqx5WtG2mS8TAg/WTFq6JBQgxs/p+n0foLZUMe6ZgtuvTf/fcObTVrY8XPrA1GbTiTUpbm07smrxF49xUKDHvID8GaPFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uXo2+Ggd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 516E9C4CED6;
	Mon, 24 Feb 2025 13:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740402331;
	bh=y3eawGNAQwktvt2KmTPjG4rjTuAnaEeylUjuihjn3oI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uXo2+GgdMDliEqrmKLO04hO8djyp87nQTWq8g0jMbHDB14QSOAwWbhGGnZ7nOy/04
	 fItJwNYNq8CWmVZClUFZUBhEvcM/6+nLgqZUUAN0xCSL7tFzkZ1KaBIGKpW4ufFHXd
	 H16MCBgxi/99QpuLU5ooBkJ6jr4t6snhuhyQmB5GGnxre/tFcyl/3l9i+YW6J1XJf6
	 SNHOAzERqYysUJADTl4abbZ9w8bRF9+7fpwLz4HdxTU4N3Am3oxEZWwbD4snd+5I4X
	 w/KqJIBeFTp0xAMkLXVyqrnUxqKSgqzM8FcH8fE+XhW6E+JGfHiElBORNyt648n5l+
	 8gTfLBWB1/N1w==
Message-ID: <1a16fede-d496-4cdb-aa54-119832f06025@kernel.org>
Date: Mon, 24 Feb 2025 14:05:24 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: mfd: add max77759 binding
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 devicetree@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Will McVicker <willmcvicker@google.com>, linux-gpio@vger.kernel.org,
 linux-hardening@vger.kernel.org, "Gustavo A. R. Silva"
 <gustavoars@kernel.org>, Kees Cook <kees@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, kernel-team@android.com,
 Peter Griffin <peter.griffin@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org
References: <20250224-max77759-mfd-v1-0-2bff36f9d055@linaro.org>
 <20250224-max77759-mfd-v1-1-2bff36f9d055@linaro.org>
 <174040128694.2418814.685647591949303616.robh@kernel.org>
 <923badeacb9e52b78d276382ae8c06a47c44fbae.camel@linaro.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <923badeacb9e52b78d276382ae8c06a47c44fbae.camel@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24/02/2025 14:02, André Draszik wrote:
> On Mon, 2025-02-24 at 06:48 -0600, Rob Herring (Arm) wrote:
>>
>> On Mon, 24 Feb 2025 10:28:49 +0000, André Draszik wrote:
>>> Add device tree binding for the Maxim MAX77759 companion PMIC for USB
>>> Type-C applications.
>>>
>>> The MAX77759 includes Battery Charger, Fuel Gauge, temperature sensors,
>>> USB Type-C Port Controller (TCPC), NVMEM, and a GPIO expander.
>>>
>>> This describes the core mfd device.
>>>
>>> Signed-off-by: André Draszik <andre.draszik@linaro.org>
>>> ---
>>>  .../devicetree/bindings/mfd/maxim,max77759.yaml    | 104 +++++++++++++++++++++
>>>  MAINTAINERS                                        |   6 ++
>>>  2 files changed, 110 insertions(+)
>>>
>>
>> My bot found errors running 'make dt_binding_check' on your patch:
>>
>> yamllint warnings/errors:
>>
>> dtschema/dtc warnings/errors:
>> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/maxim,max77759.example.dtb: pmic@66: gpio: False schema
>> does not allow {'compatible': ['maxim,max77759-gpio'], 'gpio-controller': True, '#gpio-cells': 2, 'interrupt-controller': True,
>> '#interrupt-cells': 2}
>> 	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77759.yaml#
>> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/maxim,max77759.example.dtb: pmic@66: pmic-nvmem: False
>> schema does not allow {'compatible': ['maxim,max77759-nvmem'], 'nvmem-layout': {'compatible': ['fixed-layout'], '#address-cells': 1,
>> '#size-cells': 1, 'reboot-mode@0': {'reg': [[0, 4]]}, 'boot-reason@4': {'reg': [[4, 4]]}, 'shutdown-user-flag@8': {'reg': [[8, 1]]},
>> 'rsoc@10': {'reg': [[10, 2]]}}}
>> 	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77759.yaml#
>> Documentation/devicetree/bindings/mfd/maxim,max77759.example.dtb: /example-0/i2c/pmic@66/gpio: failed to match any schema with
>> compatible: ['maxim,max77759-gpio']
>> Documentation/devicetree/bindings/mfd/maxim,max77759.example.dtb: /example-0/i2c/pmic@66/pmic-nvmem: failed to match any schema with
>> compatible: ['maxim,max77759-nvmem']
> 
> The top-level example in here references the two (MFD cell)
> bindings added in the two follow-up patches for gpio and
> nvmem. When all three binding patches exist in the tree,
> the errors are gone.
> 
> Is this acceptable, or shall I add the top-level example only
> after the bindings?

Not sure if I follow - do you confirm that it is bisectable or it is
not? If not, then it has to be fixed.

Best regards,
Krzysztof

