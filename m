Return-Path: <linux-gpio+bounces-16449-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E7FA41194
	for <lists+linux-gpio@lfdr.de>; Sun, 23 Feb 2025 21:29:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCF6F3B4248
	for <lists+linux-gpio@lfdr.de>; Sun, 23 Feb 2025 20:29:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8BFB23C8A5;
	Sun, 23 Feb 2025 20:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iF3FLRXI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751C823A9BD;
	Sun, 23 Feb 2025 20:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740342543; cv=none; b=P6ylSseJp3LOpMvgD27BCiRanp01/TollnTnlA01avk1wEbYUq8YSWOt6/xSeiSCGpiQzU1eSzbxWbLgTXKD1e9sYlX6L+EgfQD6fZ6fwXd1PPNpGKdCjpbxE81B4oeIDiCpazUYQGoTErGnzU9MZ/vCC5FGP7CVQtFgkeK1CtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740342543; c=relaxed/simple;
	bh=n4NWWAUXEdT0YGj4Aiq2nVtrLD+1ywCK9QsELKjAkPA=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=NDu7lXCKDSTD3xeCLiBzCY/2RYJFnRmhR96zVKJnZv/HrEDiubkfBmFoKvkaJzCAUfo34rXtFkgB6iEgCXMaOCt94Vo91Rr48z4Fgd8UON1H9+94cJL99kSCAgr62TcBlhXXS5kLnRAKDI69EcMRllOMYjYEfoitwqDINYpEBo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iF3FLRXI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBCF9C4CEDD;
	Sun, 23 Feb 2025 20:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740342543;
	bh=n4NWWAUXEdT0YGj4Aiq2nVtrLD+1ywCK9QsELKjAkPA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=iF3FLRXIwtp4T2Mrc28IqG9radah4rcXuDw8jWPJ5stZ1RqEbhlM1DwR5McIjSabZ
	 VnqNvJaXrmxh1IPK1QRtBZYepZd/q4kt5Qhs/Eb3Bjw8hPuh+tNJ6c5p/+6kJTlPuF
	 hDw5qCFERLC3zo4nQPHGRwmG5gVjICiVjF3sYbihO99NyxMa3O12/eNlv4j5dWBuzF
	 0XwH/Y9FmdlSGdtANBBoc+nANUcxa1rv3FvHQEt4zn6V/S9nGDV/KklY9ZcGpUubTS
	 2O9a1d7sbik66eeIvpXvXRzVWo0vgcdvudFv/WJ7C2JAy24V3vYgd7EKxoLDdiU+qj
	 ELJmu770IhaDg==
Date: Sun, 23 Feb 2025 14:29:01 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Simona Vetter <simona@ffwll.ch>, Conor Dooley <conor+dt@kernel.org>, 
 linux-gpio@vger.kernel.org, Will Deacon <will@kernel.org>, 
 linux-arm-msm@vger.kernel.org, Joerg Roedel <joro@8bytes.org>, 
 David Airlie <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 Rob Clark <robdclark@gmail.com>, Lee Jones <lee@kernel.org>, 
 Sean Paul <sean@poorly.run>, Stephen Boyd <sboyd@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Robin Murphy <robin.murphy@arm.com>, linux-clk@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, iommu@lists.linux.dev, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, freedreno@lists.freedesktop.org, 
 Bjorn Andersson <andersson@kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephan Gerhold <stephan@gerhold.net>
To: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
In-Reply-To: <20250223-msm8937-v2-4-b99722363ed3@mainlining.org>
References: <20250223-msm8937-v2-0-b99722363ed3@mainlining.org>
 <20250223-msm8937-v2-4-b99722363ed3@mainlining.org>
Message-Id: <174034253782.156239.3219626417590856183.robh@kernel.org>
Subject: Re: [PATCH v2 4/8] dt-bindings: iommu: qcom,iommu: Add MSM8937
 IOMMU to SMMUv1 compatibles


On Sun, 23 Feb 2025 19:57:49 +0100, Barnabás Czémán wrote:
> Add MSM8937 compatible string with "qcom,msm-iommu-v1" as fallback
> for the MSM8937 IOMMU which is compatible with Qualcomm's secure
> fw "SMMU v1" implementation.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  Documentation/devicetree/bindings/iommu/qcom,iommu.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250223-msm8937-v2-4-b99722363ed3@mainlining.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


