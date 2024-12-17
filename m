Return-Path: <linux-gpio+bounces-13969-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAA49F4E54
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 15:51:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D2CE167740
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 14:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3D7D1F76BD;
	Tue, 17 Dec 2024 14:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TdLeOTsv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6596A1F543A;
	Tue, 17 Dec 2024 14:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734447009; cv=none; b=bfS62tjUw5UvETPuD7XS5mZHcooH9bhKBj954UejwM8Dq4FqIK2E9/apJw2D6AIraCYYvSIB60UqiCHWsuYi6ulbkYW319KQLcJwS8i+GwYzRDFODoGpG3VNxOoObRkj5lOdO4xiN2LxN5+lX/HI8oG+cwZurbjZt5Kd4NEYzB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734447009; c=relaxed/simple;
	bh=9NGVuPAtpr/g0B3E7esC9slTop2iEDfvwQjSq6UBTj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QqH7yTiPVtbkSmLXzcNsyd8sl9gidqPW+IjunX1B4nfuex35rKCq7rUho9kyQc3iYCg/F5gKJMpkbLJIIUs0Zy+hOsl2JtlATv9ZZX7A1Jg2UbaML4Ef9jscPYvI9v3XQS+hWTrlIzeq/jc+6uXacSj+Ql0ZXPxUXbUXediaj3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TdLeOTsv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C0E2C4CED3;
	Tue, 17 Dec 2024 14:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734447009;
	bh=9NGVuPAtpr/g0B3E7esC9slTop2iEDfvwQjSq6UBTj8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TdLeOTsv2LMa1fox4cLQlpHIsi3VZIW18kv04jC0XcrDsIsG+sAKZFtoyKvJiPWDZ
	 Tq7CEl9lgrFODQUPirKCyvKEDj+QFGkqqszrvls/MGhZt5wR1wp6jLV7qVcVqU9bx0
	 lWC/U8h5ZT3+aCUOQkgAVDW4kLJYmKfWMzOabdi+IPMb8FodPQnAc0IlQTd0iTMv77
	 FSQ+c73lnMt0v5UvaQgs07QPn+ofWD0GfY5QSzVLdI77rbB1HtrS3YqewlM08o3DtR
	 bP0QvFDhuAOFxz1Z3ZJ3DWPpvB3+gsg4C8d8lvZdLxZqbE2Bk7C2vbSSvKB867Eg2j
	 au4rHupxQggPg==
Date: Tue, 17 Dec 2024 08:50:07 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Lijuan Gao <quic_lijuang@quicinc.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, kernel@quicinc.com,
	Jingyi Wang <quic_jingyw@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/6] dt-bindings: pinctrl: qcom: correct gpio-ranges in
 examples for qcs8300
Message-ID: <173444700721.1652050.16277960371479734740.robh@kernel.org>
References: <20241212-correct_gpio_ranges-v1-0-c5f20d61882f@quicinc.com>
 <20241212-correct_gpio_ranges-v1-2-c5f20d61882f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241212-correct_gpio_ranges-v1-2-c5f20d61882f@quicinc.com>


On Thu, 12 Dec 2024 17:24:01 +0800, Lijuan Gao wrote:
> The QCS8300 TLMM pin controller have the UFS_RESET pin, which is expected
> to be wired to the reset pin of the primary UFS memory. Include it in
> gpio-ranges so that the UFS driver can toggle it.
> 
> Fixes: 5778535972e2 ("dt-bindings: pinctrl: describe qcs8300-tlmm")
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/qcom,qcs8300-tlmm.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


