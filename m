Return-Path: <linux-gpio+bounces-17923-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A661A6E406
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 21:18:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63B3C1891799
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 20:18:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E4481BBBFD;
	Mon, 24 Mar 2025 20:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sGbiLowv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028DC2E3367;
	Mon, 24 Mar 2025 20:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742847501; cv=none; b=mtFv94KlmPgER7ZCyOHwVr74DAj1K3H0BzVRT/psqKWrkNZcIfCXvVelWh+z+uHlhr36fqikf7i/QjylPP3j0UnljmXd+P/n3ZjOiWLNMgQY1V7GQKA+tOdMiqWghUTGRWJgHg3QxJmsXU02TgXa6jSv6TX3tySYeqc5GXeQaQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742847501; c=relaxed/simple;
	bh=NnWv+qAJjyydShD2opgIyPjRUBku9e2zXaoi4Dh+lXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sglbSJFjh+mtLS9pnb18mPPnjzjMtqOVA7isTX/pCtW5pFogewEiWLmVs07f0OSn/J585LhHrWvmKWMZN4WdO/yEJFwIFwPnyWnQ/NJbxM1NYvRUhq1n0U3sJerZf8AorZRWle+Kdw7kOM/gXvZ50d+Wlt440H+JbBvWROdlwwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sGbiLowv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25CF9C4CEDD;
	Mon, 24 Mar 2025 20:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742847499;
	bh=NnWv+qAJjyydShD2opgIyPjRUBku9e2zXaoi4Dh+lXY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sGbiLowv7wzD93y9r1HB2YDp0gsAInUeOtuyQ50pYwOHxm6jzie0j6Q2IQTQv535S
	 id9QWjB3T128AvmAZMoCdwPSFsfoAPXzaJJbyTk9ZcW85hre46Xx0wYNabn1Vr+YK1
	 9VFx/91shwNAKH/STumDqk18bLOu/6At5QAG3kXuz7tu7jwbOuPY3i6RngMQRRyOAO
	 K8E4PdExxpsozvFLUQnf+vCfxNtdptU9sSdhqNWpxD/qHoGBlCEIXTOi5GPn53uWom
	 fpf5vCW8cKD3F6UhS8l8t7cVd8tAcui+QwxxkDEnCDygd8ntlBNilu1zPX/rI2atRf
	 bHP7BpjpZJt7A==
Date: Mon, 24 Mar 2025 15:18:18 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Andy Teng <andy.teng@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: mediatek: Drop unrelated nodes
 from DTS example
Message-ID: <174284749693.804487.17057148980208397199.robh@kernel.org>
References: <20250324125105.81774-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250324125105.81774-1-krzysztof.kozlowski@linaro.org>


On Mon, 24 Mar 2025 13:51:04 +0100, Krzysztof Kozlowski wrote:
> Binding example should not contain other nodes, e.g. consumers of
> pinctrl of, because this is completely redundant and adds unnecessary
> bloat.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml      | 10 ----------
>  .../bindings/pinctrl/mediatek,mt6779-pinctrl.yaml      |  5 -----
>  2 files changed, 15 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


