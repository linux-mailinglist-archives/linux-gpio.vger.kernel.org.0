Return-Path: <linux-gpio+bounces-16488-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF85A41FAC
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 13:54:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC55C173A15
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 12:48:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAE7E24888A;
	Mon, 24 Feb 2025 12:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l3IT5vJ9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDF62571AC;
	Mon, 24 Feb 2025 12:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740401290; cv=none; b=CYD7EjHxc44tUYjjvELS894PcnEhuTQdmFB8zseBqPThrNy9zb0hV7RvQsAUg6qR78AE5x5854xd2Xz5nYG+3BuuVIhdlX8qYQzT2Lo3BdAfkfZOfb0NF8z6Hok/3MTFgwEy4XZJ35ShK59PbpCUMN1StgYW4dMEK7KctCtbDAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740401290; c=relaxed/simple;
	bh=xGrXpHP0zY8/SIrBj0TE+9SJl5xd19Yuva4BudonjIw=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=ii4n2uUNzP8q8EqzjfmCLSNlVGndG0DgZSv1SAzo/pKZK5gRZuludWtpH3meq9IuJtC+wHTFxLdRJSBKcHvdO6SmumcNn3zBYoVDIgKD8355PvLcHdXTnM88W4pZmbvzXqKJqbhaAfHF0ViAEcs4q9WrzJIixf8JvT8aVjhZTOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l3IT5vJ9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3343C4CED6;
	Mon, 24 Feb 2025 12:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740401289;
	bh=xGrXpHP0zY8/SIrBj0TE+9SJl5xd19Yuva4BudonjIw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=l3IT5vJ9PJxndyf5cx65sy+XrwvonxvBLh8aMBaF/JhvqC0YEy3IGJQu5pzqwNs+l
	 34+CKVhI0fyfRW1RGYJltx6L3LBH6QkwA5HZT3P+HOGE1fkdjeD/r3D5pNxEfmRFbs
	 TcHv/WjxUdu3bRbnhuvSSZj0fqp9KvBaTdPsd3EUFdx6DeCVWmqrhgzTnbkqtk1gJ9
	 z9SMR3yrANkW4YW968bZiyT0MiilRRaW6MXtFl6UY6hwvUnbHoXopn83F5DuJjZiz8
	 DEIEbKS6yZzN2MzM7GoLOK6avMi3UGj+HY0silNCRkY8XDm8sBRiD5nBci416l8V2H
	 Pu1ybwjWXGIxw==
Date: Mon, 24 Feb 2025 06:48:07 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 devicetree@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, linux-gpio@vger.kernel.org, 
 linux-hardening@vger.kernel.org, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Kees Cook <kees@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, kernel-team@android.com, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
In-Reply-To: <20250224-max77759-mfd-v1-1-2bff36f9d055@linaro.org>
References: <20250224-max77759-mfd-v1-0-2bff36f9d055@linaro.org>
 <20250224-max77759-mfd-v1-1-2bff36f9d055@linaro.org>
Message-Id: <174040128694.2418814.685647591949303616.robh@kernel.org>
Subject: Re: [PATCH 1/6] dt-bindings: mfd: add max77759 binding


On Mon, 24 Feb 2025 10:28:49 +0000, André Draszik wrote:
> Add device tree binding for the Maxim MAX77759 companion PMIC for USB
> Type-C applications.
> 
> The MAX77759 includes Battery Charger, Fuel Gauge, temperature sensors,
> USB Type-C Port Controller (TCPC), NVMEM, and a GPIO expander.
> 
> This describes the core mfd device.
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> ---
>  .../devicetree/bindings/mfd/maxim,max77759.yaml    | 104 +++++++++++++++++++++
>  MAINTAINERS                                        |   6 ++
>  2 files changed, 110 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/maxim,max77759.example.dtb: pmic@66: gpio: False schema does not allow {'compatible': ['maxim,max77759-gpio'], 'gpio-controller': True, '#gpio-cells': 2, 'interrupt-controller': True, '#interrupt-cells': 2}
	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77759.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/maxim,max77759.example.dtb: pmic@66: pmic-nvmem: False schema does not allow {'compatible': ['maxim,max77759-nvmem'], 'nvmem-layout': {'compatible': ['fixed-layout'], '#address-cells': 1, '#size-cells': 1, 'reboot-mode@0': {'reg': [[0, 4]]}, 'boot-reason@4': {'reg': [[4, 4]]}, 'shutdown-user-flag@8': {'reg': [[8, 1]]}, 'rsoc@10': {'reg': [[10, 2]]}}}
	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77759.yaml#
Documentation/devicetree/bindings/mfd/maxim,max77759.example.dtb: /example-0/i2c/pmic@66/gpio: failed to match any schema with compatible: ['maxim,max77759-gpio']
Documentation/devicetree/bindings/mfd/maxim,max77759.example.dtb: /example-0/i2c/pmic@66/pmic-nvmem: failed to match any schema with compatible: ['maxim,max77759-nvmem']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250224-max77759-mfd-v1-1-2bff36f9d055@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


