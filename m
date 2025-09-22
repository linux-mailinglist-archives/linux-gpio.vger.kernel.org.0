Return-Path: <linux-gpio+bounces-26499-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 08236B9222B
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 18:07:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DDE3C3B53B9
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 16:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E65083112DC;
	Mon, 22 Sep 2025 16:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dxJqc/rT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8CC3112C4;
	Mon, 22 Sep 2025 16:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758557244; cv=none; b=BgRi+H2UW6KllqmswbueqvOIvMQQYipGxklZhZ3TnQVYxl4ixC2Wz69wnz/Ub+7jsbSoUKyn8alz8wmhUpyW0flDNWs3LhGlx5GgXv1KZMe5esDjHDkQ4p/0XtJdZZL+pLLl/tgtBTW7FTsLKMrk+oSsldMYel+r/NjawaJUS0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758557244; c=relaxed/simple;
	bh=uDYH/PiATibzkVKp3bhSIMRzoQaIsWXinC2i/JYS0CY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LA2Fhhmyz1PictDOnv6MUi7nXVpEtQ4bE7lOojwzpup1td5v5s59VZLMRNjN9itW3JAymUTYjPnDbydka7gZOHXXjsR+sUWNIGc73ocMIGswnQWUerDz1+hlqyHArdtxbfs/pwePjbxEii9PcS42LeB+741OxDa5WX7JZm5A3gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dxJqc/rT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F5CFC113D0;
	Mon, 22 Sep 2025 16:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758557244;
	bh=uDYH/PiATibzkVKp3bhSIMRzoQaIsWXinC2i/JYS0CY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dxJqc/rTNGmUln4TmANPiRWizuTM9+LwmP+nBkAHtaMG9q4XhHFKH+RVd1dE9MDct
	 +26poE8+Fc9uHJLbZ/CzZlK43kQ+Q/lItU8TsESkGKm5ClamVPnZEFOPpdoi90S/ZF
	 5Sr9XcYW8MkmGjGIGOKPhRdbwutWm+juG4v0Gj700WWnOultL8XHabWnkB7GKiykbW
	 YXzQ+zU6Qj64EOIx/1ORaXi8HP6xsTAhOX2H//WSlAvgtyHsegJv6n33F2AZQ4Yv3g
	 OeAGy2dsleLfDDj5md8I8slt/NyC5ej35RcCbYIWw804vnCk0Vz8b2LOQCI2ePY1ze
	 B6ajt6A/nQqNA==
Date: Mon, 22 Sep 2025 11:07:21 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Sean Wang <sean.wang@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: pinctrl: mediatek: Document MT6878
 pin controller bindings
Message-ID: <175855724108.148988.1499605659192465226.robh@kernel.org>
References: <20250915-mt6878-pinctrl-support-v3-0-593cc007d4cf@mentallysanemainliners.org>
 <20250915-mt6878-pinctrl-support-v3-1-593cc007d4cf@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915-mt6878-pinctrl-support-v3-1-593cc007d4cf@mentallysanemainliners.org>


On Mon, 15 Sep 2025 14:46:23 +0200, Igor Belwon wrote:
> Add device-tree bindings for the pin controller and the EINT controller
> found in the MediaTek MT6878 SoC.
> 
> Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
> ---
>  .../bindings/pinctrl/mediatek,mt6878-pinctrl.yaml  | 211 +++++++++++++++++++++
>  1 file changed, 211 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


