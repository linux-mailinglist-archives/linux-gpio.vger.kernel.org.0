Return-Path: <linux-gpio+bounces-20673-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A69CAC6BAB
	for <lists+linux-gpio@lfdr.de>; Wed, 28 May 2025 16:29:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 69ED34E1F18
	for <lists+linux-gpio@lfdr.de>; Wed, 28 May 2025 14:29:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2484D288C1C;
	Wed, 28 May 2025 14:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I7laG2yp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D123182C60;
	Wed, 28 May 2025 14:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748442573; cv=none; b=oTgIBhOAfVSghperg10dB7ViVD+uFs7O/imbPbzwP3hZ4F+/exBce65W7bQhxEHgJzonu2tttmbWggU5cQ/VR5G25AosInl02cbo3zYPFCV5Hq2CAMETTD7Y1nIXHmUkwPC77u7Qe5lj9djcU8iJlPpe7O6nu3Az5zsx78CNNYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748442573; c=relaxed/simple;
	bh=ubMRziPv811a1c4W27GNJyX/xyPJhyiu/AXagdFgPWI=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=fJ0jAWEiuNj87H/0Ic+D2b6xzR/jWzbaza4SDLiVqi5XD84GvQyUs33xiTNa9oCM7OdKGgfAHBS8Ke9AL+HwAgxxp8IGHFdMav76K7hY9SGmtE2PO8JaGxoEC1L/qAstJBBxcggKghCXZSUlV1M8OUYMU/XBWKWDo6FY8pyfvzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I7laG2yp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70CBFC4CEE3;
	Wed, 28 May 2025 14:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748442573;
	bh=ubMRziPv811a1c4W27GNJyX/xyPJhyiu/AXagdFgPWI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=I7laG2ypimp7SHSqxMa5Zv8dK5qj7rZUUI7/nErluXMBjhHHMSEtM6yvXCbavNUhJ
	 ey5iPZkBWJFk8SdpyOmPE4kc14L+AahhnxT82ig5yydt8ZG7426O9eTfU0PgtGGVRe
	 xxUm5obNaIxguw+DGXasu5SNYMHJKYo3ZwA+moZEIC0Zh1EYIv/kuGIZpD27Mc3PFs
	 S/T8x6XVxdLiEpgBzOnm7N4RHNl+O3rbxGrGNaiysI7sIoqd0AJeh3oRi0giO6QTLq
	 5vjtSN63MVbmCnUuTtCt2hed50uiXtRzJcJndBPHYw5f+w44UAcfR7sRFzPy5iAn6o
	 F4Q1/RWE7qBow==
Date: Wed, 28 May 2025 09:29:31 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-gpio@vger.kernel.org
To: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
In-Reply-To: <20250528-hdp-upstream-v4-2-7e9b3ad2036d@foss.st.com>
References: <20250528-hdp-upstream-v4-0-7e9b3ad2036d@foss.st.com>
 <20250528-hdp-upstream-v4-2-7e9b3ad2036d@foss.st.com>
Message-Id: <174844257180.4036102.7091043043619447480.robh@kernel.org>
Subject: Re: [PATCH v4 2/9] dt-bindings: pinctrl: stm32: Introduce HDP


On Wed, 28 May 2025 15:30:55 +0200, Clément Le Goffic wrote:
> 'HDP' stands for Hardware Debug Port, it is an hardware block in
> STMicrolectronics' MPUs that let the user decide which internal SoC's
> signal to observe.
> It provides 8 ports and for each port there is up to 16 different
> signals that can be output.
> Signals are different for each MPU.
> 
> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/pinctrl/st,stm32-hdp.yaml  | 187 +++++++++++++++++++++
>  1 file changed, 187 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/st,stm32-hdp.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/pinctrl/st,stm32-pinctrl-hdp.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/st,stm32-hdp.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250528-hdp-upstream-v4-2-7e9b3ad2036d@foss.st.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


