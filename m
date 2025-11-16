Return-Path: <linux-gpio+bounces-28552-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 562FBC61AD2
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Nov 2025 19:31:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 154053A8734
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Nov 2025 18:31:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99E93226D02;
	Sun, 16 Nov 2025 18:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HFP2JVC6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DE62F85B;
	Sun, 16 Nov 2025 18:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763317884; cv=none; b=HzJ9B7sIy12fzuyANvftV8IX4KXYhQxBLPjVPlP6o++vdWaAIhFfv3HG3JFV1SBUjhhp8OHLiHCEulnTI/lAQQHig50Watpcu+pLtQ0xSmm+SwgG6iu+tyLPJjRfgR8osimzf9bc7V6zy1kb70ogWmN574GdPc2rrGNfhBev5rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763317884; c=relaxed/simple;
	bh=/VyPh/xOytqv1G1BstcuBG5Ov01bXDW8DWBXPWoz06U=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=swyzYZhuHf8sHTn9qneUTN6Mviqv+dTN8eXqIRTaL2+z9zSAggxy9nmMpyF7pzAI8vdznAz6mxIcgFYS2AWMEhQA3MMXYKtZSWPRRw+Zx85taVUhoNV6GY3n0y/G+SciwJ5ApdwRFjDvFchOBdFZJhCK6OAmr4vjENfnkI4x/w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HFP2JVC6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99914C4CEF1;
	Sun, 16 Nov 2025 18:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763317883;
	bh=/VyPh/xOytqv1G1BstcuBG5Ov01bXDW8DWBXPWoz06U=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=HFP2JVC6YRRmTehyn3okeXYaPaKVjLEvyVxqkdku1eWeiaBSJW+FlNa/53egc9xjJ
	 2qZRzn0d0ocEdsTwGZr/UWMWDe3BI28LdMHt7/otfXugiT6RJHbfoyBl+VpDY6s+UL
	 cPv7Iftr1VqzDUqaGLfGmjirEvuDV7k07VBd83LcSNmD9uyXHPjJqxjfzUm9XiCTst
	 cBnkExdWTvwYl0DhfhEi4/BbPxZOViLrCW3FMMDCzmFXUgU6G2vVAJBkzroWTJWDLp
	 xE2B43wKYcAIY3ACBU1zkEq5RWNjeHfUx6Ew6WE7XB65iRYMpX5FVsScqygyC3CZ/R
	 N3VpLlzMNQV7g==
Date: Sun, 16 Nov 2025 12:31:22 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 kernel@oss.qualcomm.com, Linus Walleij <linus.walleij@linaro.org>, 
 ravi.hothi@oss.qualcomm.com, linux-kernel@vger.kernel.org, 
 ajay.nandam@oss.qualcomm.com, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20251116171656.3105461-2-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20251116171656.3105461-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20251116171656.3105461-2-mohammad.rafi.shaik@oss.qualcomm.com>
Message-Id: <176331788200.10500.11310148901433303757.robh@kernel.org>
Subject: Re: [PATCH v1 1/2] dt-bindings: pinctrl:
 qcom,sa8775p-lpass-lpi-pinctrl: Add SA8775P LPASS pinctrl


On Sun, 16 Nov 2025 22:46:55 +0530, Mohammad Rafi Shaik wrote:
> Add bindings for the pin controller in Low Power Audio SubSystem (LPASS)
> of Qualcomm SA8775P SoC.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  .../qcom,sa8775p-lpass-lpi-pinctrl.yaml       | 106 ++++++++++++++++++
>  1 file changed, 106 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-lpass-lpi-pinctrl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-lpass-lpi-pinctrl.example.dtb: pinctrl@3440000 (qcom,sa8775p-lpass-lpi-pinctrl): reg: [[0, 54788096], [0, 131072]] is too long
	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sa8775p-lpass-lpi-pinctrl.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251116171656.3105461-2-mohammad.rafi.shaik@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


