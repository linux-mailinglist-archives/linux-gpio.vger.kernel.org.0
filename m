Return-Path: <linux-gpio+bounces-12193-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FE29B28B5
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 08:29:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 13C4BB20BFA
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 07:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 402B419047F;
	Mon, 28 Oct 2024 07:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q1Fzg29F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2727524C;
	Mon, 28 Oct 2024 07:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730100565; cv=none; b=AjspaShkAFNGDFxJAw0PQqagyKCLNcDdsQFZ2L2+TonKSQGS/IX+VkCSGZfHPmCkglb+4ksMI1vXfl+5dkKx9PkfVpKtiOBxQg+ozPFCct6Bpf30he//NyY4nP5r+yM8hGRxfCSYr2RsXOdrX5WrhAbCwAxroE9AqT9QpLl5YEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730100565; c=relaxed/simple;
	bh=eAdOEawa5eGk49560zkEDUAGIPAvX2hfDutdAy0RIpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mZnRyUBsPIi6IAyPPN5nP+IIDkfA8lkie09wIPeO37EYmBG9tGlqVblcU+wcfTyE/PuZVHCDFRzh6mEFREZrvPtKPIbLSKBrxU1MZuTlceqDv8oQt1z4KuYGJOdOmOs9KTH/8fa3nQxzxdruhWVrwXnjyQlTyqPhmD6UVWVu46g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q1Fzg29F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEEEBC4CEC3;
	Mon, 28 Oct 2024 07:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730100564;
	bh=eAdOEawa5eGk49560zkEDUAGIPAvX2hfDutdAy0RIpU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q1Fzg29FwGMPNq52Ui7Upa1ZqMWDvEnyjwXmWBJbwf2p3h29gAogy9+4a7GAlkXxx
	 1KY3J056WqZwQrec0VQDv/gjuwrgN9yh2beKo4Walc4qsCRIdB+LfB4vncGLOB8UdM
	 ueGpow/qgOtGqp8qvf8eFcNXw84LrsSQ25rPbz5tWNmfRF1HzUG1H/HSK2LZ5MGI3A
	 SU7KTJgVK33kxPxWhwBJOLPS+esrTeExM6QaNr9qikWTOiUI31SmWtOzd6UWHke0ao
	 h89NqaW4pLiaw60RgamQTtXzXQkMy67Whpf6q1bKUWNEKxZkG4P2/qxE7zXMONnMmE
	 sXpNrzC3AffbA==
Date: Mon, 28 Oct 2024 08:29:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sricharan R <quic_srichara@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	ulf.hansson@linaro.org, linus.walleij@linaro.org, catalin.marinas@arm.com, 
	p.zabel@pengutronix.de, geert+renesas@glider.be, dmitry.baryshkov@linaro.org, 
	neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, quic_varada@quicinc.com
Subject: Re: [PATCH V5 2/6] dt-bindings: clock: Add Qualcomm IPQ5424 GCC
 binding
Message-ID: <cznvuyyhzltpdqabz7gjo3odjew46ppclvhhkw2r7ajczatgjk@7t3gcz47ivl2>
References: <20241028060506.246606-1-quic_srichara@quicinc.com>
 <20241028060506.246606-3-quic_srichara@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241028060506.246606-3-quic_srichara@quicinc.com>

On Mon, Oct 28, 2024 at 11:35:02AM +0530, Sricharan R wrote:
> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> 
> Add binding for the Qualcomm IPQ5424 Global Clock Controller
> 
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> ---
>  [V5] Updated ipq5424 clk properties with minItems

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


