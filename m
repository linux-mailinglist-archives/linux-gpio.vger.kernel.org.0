Return-Path: <linux-gpio+bounces-23263-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D685B04E82
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 05:08:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F06241712E4
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 03:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6B882C15A3;
	Tue, 15 Jul 2025 03:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bNbxOySX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC0684A3E;
	Tue, 15 Jul 2025 03:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752548901; cv=none; b=Fs0xEpHonqgdpcQyecIDfJpxFp4iBKw1Y2/tcCu93wiv13/TeA/P2YT7PqvdZe4PMMow+uUNc6pezUaO8+1vu2bdWN/aCpqSF+hYNLoyvB5eb4YLAmjNc2UPfZHXMiBKoQjI0cIUtPd8ej5XyyBm2+JuFPQ932anz/wkRqo8iSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752548901; c=relaxed/simple;
	bh=Een49Bjr0iYL6xkrFd8mI1xoBasVFRuwmM1PSNhGWAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e2LwFQQybmZuo9AIj+v7m13Z3HyZjMA+RJFDEsSCHvUuogeBzMrqq9v0FQ0mH92y7WLyziECGwXxnUcaLuxF1I6TSR+05Wx8QQGOA6N+HKzcc5IpxlkWTti4FFN8eGl+SMZIV3XKbSA9aj0I1kl97hPAQnC4cZqyDdufW0NgsOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bNbxOySX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB945C4CEED;
	Tue, 15 Jul 2025 03:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752548900;
	bh=Een49Bjr0iYL6xkrFd8mI1xoBasVFRuwmM1PSNhGWAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bNbxOySX9+WgAkBnliDFYcCRgmpP/TPSU3wrJUCaacCjsapiFXEP/1NN2K1O1BjJJ
	 cqmw46GL3CawwfaWpuJRNvvXoctATh9bUjuUG9NHFkEwr56ejQtD3kqoceHoEdKVgU
	 dOCa1hsrlq66v5dhjujUxuKTtiVIWnIeAijMwbC5dT63ScRBiv3EPEoLFIMQaRe7d+
	 Ewn7i8lwqsnQ+rmm6YeG1Yosrmrsp1T+Ct8+1Q+TTFs6cZVRORVnRm0K5NsBfoV1Iz
	 w2BDw7fpS03XXEWpzCuSTMg3fBJ8NSsmedAVd11e9Eekov3PbZCVrpSeUtmeZTIdcQ
	 dpcX5Xi9lCVbw==
Date: Mon, 14 Jul 2025 22:08:19 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Cathy Xu <ot_cathy.xu@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, Yong Mao <yong.mao@mediatek.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Wenbin Mei <Wenbin.Mei@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	Lei Xue <lei.xue@mediatek.com>, linux-gpio@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Axe Yang <Axe.Yang@mediatek.com>, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: mediatek: Add support for
 mt8189
Message-ID: <175254889827.4140322.15910226048522473514.robh@kernel.org>
References: <20250711094513.17073-1-ot_cathy.xu@mediatek.com>
 <20250711094513.17073-2-ot_cathy.xu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711094513.17073-2-ot_cathy.xu@mediatek.com>


On Fri, 11 Jul 2025 17:44:57 +0800, Cathy Xu wrote:
> Add the new binding document for pinctrl on MediaTek mt8189.
> 
> Signed-off-by: Cathy Xu <ot_cathy.xu@mediatek.com>
> ---
>  .../pinctrl/mediatek,mt8189-pinctrl.yaml      | 213 ++++++++++++++++++
>  1 file changed, 213 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt8189-pinctrl.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


