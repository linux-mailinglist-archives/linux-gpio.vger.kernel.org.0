Return-Path: <linux-gpio+bounces-24709-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BA3B2EEBF
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 08:53:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57399189BE03
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 06:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 600E02E7BCB;
	Thu, 21 Aug 2025 06:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rWtcNuVz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B9136CE1E;
	Thu, 21 Aug 2025 06:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755759009; cv=none; b=W0qk5TA7tmOI9OnjjGHV+QIC3osW+qcVhH8oqs4AhtjcLY/0BPj7zCBBHzC0b50p+erSNm50PZqZgu64zvvmbu7bEeOJgEDhq+fWnypfOAvG0YJujH9Rpuiqj9oTKmTnbj/Epw3Z6tAu/fvhKdkXZ5RQ/UjOaZAhhU41LH1oAFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755759009; c=relaxed/simple;
	bh=u+lsxovfQh47JM2+/dnFIH86HtbVMZEaPA79GiUi060=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cf0IBqE+1N7DH/tT4CqmqSMGeW3DAy+71+HEK5gpSUrHXrWLH5D5Iu+eA19ViiGa/gmejOVXItgVXMT1EsdUcacW6b2xv8aWI0Z4/yvU++4nWQknYbRv1kovVPpNYsM/tKTsBSt/8L3Uv4y+hVNmfy0q7ePY4GIG0ob5RgKOAfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rWtcNuVz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3939C4CEED;
	Thu, 21 Aug 2025 06:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755759008;
	bh=u+lsxovfQh47JM2+/dnFIH86HtbVMZEaPA79GiUi060=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rWtcNuVzxcYsC34AHmhjHBgxMf2ouycBh5sbTI6IqDcMDOs4NOiAHwDiinq/rRFcp
	 Zgxpz9CoVE/6w1hlonzqs0taKH8bD0I8vlzYiEt0rlghWXCLkBz2/+nKPXojDrxuwI
	 NvUDXL8TsapMRtBVOYosrNgG2uUt6SsgcjjGQLyBXlIESLxLYwakv0ozJOyxoC7ZxP
	 292JeFide5WNt2qdhGCgu7c9WFuVYhx+jp++UHpQXyr1Q2DfXXvb0zrWJ8fzlizFG3
	 T2t4mnu9y1ueNesgpAAJrCut//SNpr/e7hd8Ru35/r+G3fPuwK+ByZsWf3r01mj1Vf
	 MJolRnW5Wm8EQ==
Date: Thu, 21 Aug 2025 08:50:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch, 
	andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com, broonie@kernel.org, 
	chunkuang.hu@kernel.org, ck.hu@mediatek.com, conor+dt@kernel.org, davem@davemloft.net, 
	dmitry.torokhov@gmail.com, edumazet@google.com, flora.fu@mediatek.com, 
	houlong.wei@mediatek.com, jeesw@melfas.com, jmassot@collabora.com, kernel@collabora.com, 
	krzk+dt@kernel.org, kuba@kernel.org, kyrie.wu@mediatek.corp-partner.google.com, 
	lgirdwood@gmail.com, linus.walleij@linaro.org, louisalexis.eyraud@collabora.com, 
	maarten.lankhorst@linux.intel.com, matthias.bgg@gmail.com, mchehab@kernel.org, 
	minghsiu.tsai@mediatek.com, mripard@kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com, 
	robh@kernel.org, sean.wang@kernel.org, simona@ffwll.ch, 
	support.opensource@diasemi.com, tiffany.lin@mediatek.com, tzimmermann@suse.de, 
	yunfei.dong@mediatek.com, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v1 07/14] dt-bindings: display: mediatek,ufoe: Add
 mediatek,gce-client-reg property
Message-ID: <20250821-wandering-vermilion-pigeon-b8c9f0@kuoka>
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
 <20250820171302.324142-8-ariel.dalessandro@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250820171302.324142-8-ariel.dalessandro@collabora.com>

On Wed, Aug 20, 2025 at 02:12:55PM -0300, Ariel D'Alessandro wrote:
> Current, the DT bindings for Mediatek UFOe (Unified Frame Optimization
> engine) is missing the mediatek,gce-client-reg property. Add it and

Why is it missing? If the binding is complete, it cannot be missing...

> update the example as well.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---
>  .../bindings/display/mediatek/mediatek,ufoe.yaml      | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
> index 61a5e22effbf2..ecb4c0359fec3 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
> @@ -64,6 +64,14 @@ properties:
>        - port@0
>        - port@1
>  
> +  mediatek,gce-client-reg:
> +    description: The register of client driver can be configured by gce with
> +      4 arguments defined in this property, such as phandle of gce, subsys id,
> +      register offset and size. Each GCE subsys id is mapping to a client

Don't explain what DT syntax is. We all know, so that's completely
redundant description. Explain the purpose. Explain Arguments with sechema - items.

Best regards,
Krzysztof


