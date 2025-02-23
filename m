Return-Path: <linux-gpio+bounces-16451-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EBBA411A2
	for <lists+linux-gpio@lfdr.de>; Sun, 23 Feb 2025 21:30:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 461E87A2F7A
	for <lists+linux-gpio@lfdr.de>; Sun, 23 Feb 2025 20:28:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB5C923F411;
	Sun, 23 Feb 2025 20:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EMu3xoiL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A6623F27B;
	Sun, 23 Feb 2025 20:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740342546; cv=none; b=PPIqhKQ9wy/00Q8g63NplijlLRKkc15Hcqawnm/8y8a1dubMFYVeIK6DZCpCW87Id4Ki8orWFFknYMvqhSSXu3qGUN0KLQTOvnpTCHen0wXl4Jfz4doM7HMwRuaoj/R94VDXBcbBRHIaXgkpclt+PF8iNnnMEF3hVDhDe3TRvvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740342546; c=relaxed/simple;
	bh=gcpP4QAXBjl72D8XNOpucie4qYX2x+ECVvClPZgS6JU=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=tEahlqRbfY0AB6Ue7f3ODE0L+sQfH5XTTpTEixYzvUII0oEMfhjN2bjsk3MgpXQt+W5Dw92DGCPWojcWgY/woKCLeGwo3GzCpLDoZY7INFxISMLJZcV5tmnjpUJ+yJH92IN3BOP8KBKYuKu6iZorHDRfX4QB4mL7PU8p3wO66FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EMu3xoiL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2E73C4CEEC;
	Sun, 23 Feb 2025 20:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740342545;
	bh=gcpP4QAXBjl72D8XNOpucie4qYX2x+ECVvClPZgS6JU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=EMu3xoiLvSz5FypZw6ueucOe00lB8KncS2CE02T5OjC8mVvXz6a8uxzU1unXSzQ+U
	 uOiJMnp/2wqBkyPTTGrrYAg05DpHCDSI0jlyEgAMSJ1w0XcnbmaxTLEe+j11iaU5wR
	 2rmKsjnNtsUxIDTD5YAck8JTsHpQiRuVv/hWlludlLkmVzDn2nKgLWG9/DWvgk+XCt
	 N45rI6zpJXVcAcMnHmrRFJSrll0R/2l0Q6UBGdukOauKZn2TBjIhAm2YHTu5Hm8C36
	 PH07XFD6CIyPS3+MAeAtilUvkoXM/DqkqdhIHKdgIfPEiOoKxcJNgSsT5ByYUYg4k5
	 C+DfEaIfSLWbA==
Date: Sun, 23 Feb 2025 14:29:04 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, devicetree@vger.kernel.org, 
 Robin Murphy <robin.murphy@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Sean Paul <sean@poorly.run>, 
 Stephen Boyd <sboyd@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, linux-gpio@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-clk@vger.kernel.org, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Stephan Gerhold <stephan@gerhold.net>, iommu@lists.linux.dev, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
To: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
In-Reply-To: <20250223-msm8937-v2-7-b99722363ed3@mainlining.org>
References: <20250223-msm8937-v2-0-b99722363ed3@mainlining.org>
 <20250223-msm8937-v2-7-b99722363ed3@mainlining.org>
Message-Id: <174034253945.156304.15112460035182362046.robh@kernel.org>
Subject: Re: [PATCH v2 7/8] dt-bindings: arm: qcom: Add Xiaomi Redmi 3S


On Sun, 23 Feb 2025 19:57:52 +0100, Barnabás Czémán wrote:
> Document Xiaomi Redmi 3S (land).
> Add qcom,msm8937 for msm-id, board-id allow-list.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250223-msm8937-v2-7-b99722363ed3@mainlining.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


