Return-Path: <linux-gpio+bounces-11201-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF2799A93D
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 18:56:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 048DB1F22073
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 16:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CD6019F105;
	Fri, 11 Oct 2024 16:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GiMSdH2X"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87E519ABD1;
	Fri, 11 Oct 2024 16:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728665813; cv=none; b=XXl8t999c2NJn/EE6Y2bQPQ/v1YQYNm+BUpZLHcwuRRsv22onuT5O/9t7hbCkLhJ8LjXHD2/i6D4QBs70RIE3UH/cjxNhiqbIXXgQ9bc19Zt+SImnUWB/KSHmkWf7dMaLb5/9WetMQ+xXASyTRZplLg9OnwMqw4jDCu7utvfUEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728665813; c=relaxed/simple;
	bh=iEtHdpYrx5DVc2mfDpmhMV08XV93wcIaiwU6NFEPxW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KTMmDiqzRH6g1MJKBr8iayC9I4wwvv9rd6k3mpXOG8Eu3iBJj4km8WWWpVsfHqMLopr9+PzmFiMvMJsgebwLJRR4+Kbs0JaGn09EYWh4+ZDetXe0wag61SYzTCOSNkWhbKSjEEd/astHPKbDKS6U7HUTI8zUi1Xlu6QTFmCDpL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GiMSdH2X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3401C4CEC7;
	Fri, 11 Oct 2024 16:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728665812;
	bh=iEtHdpYrx5DVc2mfDpmhMV08XV93wcIaiwU6NFEPxW4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GiMSdH2XoZ78kFCXCjt+1Bk9hEjlDpJ18YZd+qDVSlFtwTMWBBvles8ylKqTJ5smK
	 vN8q3gQl06Nyr8Qblp6EeyNJvZ05rq7JpZnTrlOy7dP4Xz/w/EPeAZw1KBTegYAlMv
	 verH1sjYtMaec26n7LYex0T8DBI0oNtVTgqAUBCL8d6UH5D9ysKzq+yBhV+9ppnGTM
	 TBF1VQOAKhMLqcoCxMJFgHw5C7zxDYveMGo+29CyeIaAmJu5HOGHsgavO1/OXHnCfs
	 kMUkGUbal+tatSdQir+hrWSHwrIstTvYWjoMAahOlg5CAdyih8Mcyy+JGojVlonHxI
	 0H4Fp0Tbr3POg==
Date: Fri, 11 Oct 2024 11:56:40 -0500
From: Rob Herring <robh@kernel.org>
To: Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Andy Teng <andy.teng@mediatek.com>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 1/8] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Pull pinctrl node changes from MT6795 document
Message-ID: <20241011165640.GA2475122-robh@kernel.org>
References: <20241011120520.140318-1-y.oudjana@protonmail.com>
 <20241011120520.140318-2-y.oudjana@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011120520.140318-2-y.oudjana@protonmail.com>

On Fri, Oct 11, 2024 at 03:03:46PM +0300, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> mediatek,pinctrl-mt6795.yaml has different node name patterns which match
> bindings of other MediaTek pin controllers, ref for pinmux-node.yaml which
> has a description of the pinmux property, as well as some additional
> descriptions for some pin configuration properties. Pull those changes
> into mediatek,mt6779-pinctrl.yaml and adjust the example DTS to match in
> preparation to combine the MT6795 document into it.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 38 ++++++++++++++-----
>  1 file changed, 28 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
> index 3bbc00df5548d..352a88d7b135e 100644
> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
> @@ -111,12 +111,12 @@ allOf:
>          - "#interrupt-cells"
>  
>  patternProperties:
> -  '-[0-9]*$':
> +  '-pins$':

Worst case, this could be an ABI break. Best case, it's churn for 
mt6779. Is it worth unifying?

Rob

