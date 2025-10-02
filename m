Return-Path: <linux-gpio+bounces-26744-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E8CBB225F
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Oct 2025 02:26:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5C72188E532
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Oct 2025 00:26:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32A8E3A1CD;
	Thu,  2 Oct 2025 00:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YsDIHMxc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76C55227;
	Thu,  2 Oct 2025 00:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759364762; cv=none; b=lLvv9X/Yk/dQpIehx37ZC+X6wvU/u4XKwrY/K3a0VwihPX9Ca0EsaEpsbev0/0g+xjusqqQFMr38k/AbK39avP/8TUsxs3wjCE7b/Z+9BKBfcX2jW1P8iij3MXdvwayEyJ9/NVwneZUf3LzxP9Lsnuxva9NnNjcJQT8gBDNvzfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759364762; c=relaxed/simple;
	bh=JJD6gJF3RGM77Q2Z++4jBpZovnitTGcnRBrM8p0153E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CvIkkygJ7teCJ2E51Ydq7aWjHcBOLpUFv5WJUrs8vUVpYrMmSk++aFu13HhuwSp7lznS5iWkCvQzFyAEdOVi5tkRcuAtniYIR9of3Sl8z+eqG0SF/15blBS3qElmdkgLFXrm0WLA0u1y8lLHjPkyuU3eBTX6aoq0+Asmov2E6tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YsDIHMxc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2074C4CEF1;
	Thu,  2 Oct 2025 00:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759364761;
	bh=JJD6gJF3RGM77Q2Z++4jBpZovnitTGcnRBrM8p0153E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YsDIHMxcTVgi4f1Slpf+4bGSc0jWtf5C4Gh2ByVar6pr7ksJvl15/2znFb0VPc3Xj
	 DeVjeXy5ljjI88UYRX3O8aNPHwlJBP1drQKCj3NmadQCKD/LGi5rKDuc/2yn0hMIvQ
	 ID476OQz3UECkSFc4/keOpSEoLW4LpIq9CB29RQLX/qTh5WnO5WiQNKlrbFwgGh+7E
	 N6CYgJsqYnIS/rhJvR4wQ1Edfm525jYorRmXgiMhzwlnFlxF8YNFqdRw90Iv4bsg6z
	 GV8gbQS1q/Ks8W8L2FOffNL1dMGXn9qd1owEIIFdF9FHvdDgjW5DvJcGn/i8d4OFSt
	 nfamSb5Icz0og==
Date: Wed, 1 Oct 2025 19:25:59 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
	devicetree@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: qcom,pmic-gpio: Add GPIO
 bindings for Glymur PMICs
Message-ID: <175936475902.2672174.11147610989550494810.robh@kernel.org>
References: <20250924-glymur-pinctrl-driver-v2-0-11bef014a778@oss.qualcomm.com>
 <20250924-glymur-pinctrl-driver-v2-1-11bef014a778@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-glymur-pinctrl-driver-v2-1-11bef014a778@oss.qualcomm.com>


On Wed, 24 Sep 2025 22:31:02 +0530, Kamal Wadhwa wrote:
> From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> 
> Update the Qualcomm Technologies, Inc. PMIC GPIO binding documentation
> to include compatible strings for PMK8850, PMH0101, PMH0104, PMH0110
> and PMCX0102 PMICs.
> 
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml       | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


