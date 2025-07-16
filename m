Return-Path: <linux-gpio+bounces-23363-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4D9B07B42
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 18:33:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0CFB3B605A
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 16:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D3C827991E;
	Wed, 16 Jul 2025 16:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OBqhiptl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE7B1D7E5B;
	Wed, 16 Jul 2025 16:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752683627; cv=none; b=UC+/kUfxDAOmXUo3f4R2IGTHMmv6+VsC0ZT8HBwXSYxzR7wuSeUyT/QW2TECJ6DjoUSol4f+xVWGhO75P1UAEh86Rxg5AMj91m5d0Ip1toGPm6reB1A0/9I8MxhSgXPL5E6sGvACRJRyyxMfXKpKcFGVgHqSjCOrhQrUJ94r4aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752683627; c=relaxed/simple;
	bh=uZSKz75Mf4BVvfMWaOmJBSSwWGFguOXiH8tOdDk8GMs=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=MPHjdKo4upa5yxzdsbnu1Flsio1xlFSM/qmfb9XxW0qhf3dsSgTzRu6fyROO6NTEE91juhVZaZSve8tpYyBN3+zgnj36BqgBqg7LKTx+SyPV0/xeUYS0n25i98RlVbSFH1WrNoi2LGzZNxK0mMc2caILaUIyKYR70siosYUuhR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OBqhiptl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A74CFC4CEE7;
	Wed, 16 Jul 2025 16:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752683626;
	bh=uZSKz75Mf4BVvfMWaOmJBSSwWGFguOXiH8tOdDk8GMs=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=OBqhiptlYcKKe2QAUXcw/3/IpHZr52wDj2xERULgEnGJLjxy1j/QQfn0p4X8z33EF
	 RXgmnxWe4Gv31RBd1AiyhO3D6/vfI2tT8HuTjD5qMAzX1GR2W8jzPU57tnGhlhvpCo
	 TXsWPvcM4HtDtpJM4HRI0eHB8AgweVrJ+4KL4CBuz/olbep939jKOz52K/CBnr5gB1
	 Bu8gIqoQM/KdZ0BmagFouC9cxi8SvGLRh86iwNWqVQAhK8pqmCO+kSNb3Eib2LbdKe
	 bHhdZOr7NQDRibbgVaFgv+ZRRANrF1np1+isOqA4/JS8AQrsJHSgdQuqoWWaBWNlXy
	 EQmnJ0BOKC2ww==
Date: Wed, 16 Jul 2025 11:33:45 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, krzk+dt@kernel.org, 
 linux-gpio@vger.kernel.org, quic_rjendra@quicinc.com, andersson@kernel.org, 
 linus.walleij@linaro.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, conor+dt@kernel.org
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20250716150822.4039250-2-pankaj.patil@oss.qualcomm.com>
References: <20250716150822.4039250-1-pankaj.patil@oss.qualcomm.com>
 <20250716150822.4039250-2-pankaj.patil@oss.qualcomm.com>
Message-Id: <175268362571.679622.3900348701835739870.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add Glymur pinctrl
 bindings


On Wed, 16 Jul 2025 20:38:21 +0530, Pankaj Patil wrote:
> Add DeviceTree binding for Glymur SoC TLMM block
> 
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
>  .../bindings/pinctrl/qcom,glymur-tlmm.yaml    | 128 ++++++++++++++++++
>  1 file changed, 128 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.example.dtb: pinctrl@f100000 (qcom,glymur-tlmm): reg: [[0, 252706816], [0, 15728640]] is too long
	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,glymur-tlmm.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.example.dtb: pinctrl@f100000 (qcom,glymur-tlmm): Unevaluated properties are not allowed ('reg' was unexpected)
	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,glymur-tlmm.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250716150822.4039250-2-pankaj.patil@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


