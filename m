Return-Path: <linux-gpio+bounces-9972-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BCB9756CC
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Sep 2024 17:19:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 04723B25E9D
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Sep 2024 15:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCF391AB6E3;
	Wed, 11 Sep 2024 15:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BskZPeOk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8246919F127;
	Wed, 11 Sep 2024 15:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726067899; cv=none; b=dHSOchHfYEiPVV5KqQTd3MuqLY1BdHVyH/QyCNyAUXYTfYUG6ULrjXL7hVgpK5qgRcE0ksRZFijzTO2Tnf7++BXmsqOZCeAznmC+o+e8i0+5CQjj17J3AOrJQqJxm4lWlS2R2B9f+FURtd4lKuqvrnv3vnW90X70neLZ8o/S3Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726067899; c=relaxed/simple;
	bh=o8n6sGQg+WPVYvO3a9tu7RfZ5ty8QLmwcmasOG4fMHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QfRAtu7mcDjW27bo5eATKEIkscZe1bUbsVvNEoMNxM2MYUNjaCpS7M6XcpoETptbUJguroy5hair1XLXqPi1N30a/PJVVG9Vz0gMc7nClKs//RtP2NGlFq/Yn3FNnWgWImYXkhgssEVC4MyApm9ylMsbETuYXmihyFSoN3wBiJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BskZPeOk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2B1CC4CEC0;
	Wed, 11 Sep 2024 15:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726067899;
	bh=o8n6sGQg+WPVYvO3a9tu7RfZ5ty8QLmwcmasOG4fMHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BskZPeOkKM6uft1tJBRFmWc0bdDFvIq5Cz0xHSfifn3TScuJ9vanXet401jbBE/S3
	 Niy6/RvHfXaKTnCU3Ra6kUnjTjAKCJnifge+cnzWtj5ZdCMvqJCfxKFqNi65Viqerz
	 JirC4C1LcHjyhbJXTyvkSCuyqZnZ3cKybb5nU7AOmjqDH++wLlk/3qQ6e43AU/f2bF
	 vdGZpWSrYcQDXUTsKLQn1nKfuBWBMrFQAtqZtE2gInBu2cmD1lbX2YmDV+Y5TR5pcl
	 SIYoXxThla0+PN5RQJy+TjwfdRqzDxPWLiu7wE6OHdemtciPYjIlgvvgMOUisuDHoc
	 cTQ8TMsCsefdA==
Date: Wed, 11 Sep 2024 10:18:18 -0500
From: Rob Herring <robh@kernel.org>
To: Lijuan Gao <quic_lijuang@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel@quicinc.com
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: document the QCS615 Top Level
 Mode Multiplexer
Message-ID: <20240911151818.GA283533-robh@kernel.org>
References: <20240910-add_qcs615_pinctrl_driver-v1-0-36f4c0d527d8@quicinc.com>
 <20240910-add_qcs615_pinctrl_driver-v1-1-36f4c0d527d8@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240910-add_qcs615_pinctrl_driver-v1-1-36f4c0d527d8@quicinc.com>

On Tue, Sep 10, 2024 at 06:26:14PM +0800, Lijuan Gao wrote:
> Document the Top Level Mode Multiplexer on the QCS615 Platform.
> It concisely explains the pin multiplexing and configuration in
> the device tree, and includes simple examples of typical device
> tree snippets, making it easier for designers to configure and
> manage chip pins.
> 
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---
>  .../bindings/pinctrl/qcom,qcs615-tlmm.yaml         | 123 +++++++++++++++++++++
>  1 file changed, 123 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,qcs615-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,qcs615-tlmm.yaml
> new file mode 100644
> index 000000000000..2bfb0a453880
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,qcs615-tlmm.yaml
> @@ -0,0 +1,123 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/qcom,qcs615-tlmm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. QCS615 TLMM block
> +
> +maintainers:
> +  - Lijuan Gao <quic_lijuang@quicinc.com>
> +
> +description:
> +  Top Level Mode Multiplexer pin controller in Qualcomm QCS615 SoC.
> +
> +allOf:
> +  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,qcs615-tlmm
> +
> +  reg:
> +    maxItems: 3
> +
> +  reg-names:
> +    items:
> +      - const: east
> +      - const: west
> +      - const: south
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  gpio-reserved-ranges:
> +    minItems: 1
> +    maxItems: 62
> +
> +  gpio-line-names:
> +    maxItems: 123
> +
> +patternProperties:
> +  "-state$":
> +    oneOf:
> +      - $ref: "#/$defs/qcom-qcs615-tlmm-state"
> +      - patternProperties:

Needs 'type: object' before patternProperties.

Otherwise,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

