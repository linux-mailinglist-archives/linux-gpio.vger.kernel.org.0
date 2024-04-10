Return-Path: <linux-gpio+bounces-5305-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E3E89FF5C
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Apr 2024 20:02:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 735DC1F29F92
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Apr 2024 18:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0D5D17F385;
	Wed, 10 Apr 2024 18:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tr3dzcKx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE9217B519;
	Wed, 10 Apr 2024 18:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712772137; cv=none; b=dCYh6bIcR66xvac+UfZdVXk4De1NRIY89I9cYWgYwg/JpAGQrNgh6HubsdNhzKOOQAMya21PHS+t0hlXUE5jZSXetP6Je2kV8ISjJzn3p9Xalh/zV2H3CaPdBKQwLtlYOFk+FRdhj5NwyIN/6nPbCStrfeJ4IttgRrFWFfAKn/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712772137; c=relaxed/simple;
	bh=l+8qKYjj+N3M1apcMI6K5gZozIGCeJp8ySXUDsOhuO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K7BmNxScU3nZn5zjPnNWphiOAVMAtOlXWKHt0AunURABIcUwXWB454wahKv+ls2gpEajoWLPx4BKeRwXkPB5OB3aOHmRDNxGBmyMux7WghzBaTV+Z5SN6E+bdgGZDLudyQ0tOi4TOguq5h+D+LRnuYIhSx1US6oxuO1/IiQRokg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tr3dzcKx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A31EC433F1;
	Wed, 10 Apr 2024 18:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712772137;
	bh=l+8qKYjj+N3M1apcMI6K5gZozIGCeJp8ySXUDsOhuO0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tr3dzcKxhC80GNydHScB18HbhVS3E+gOBfHmcmNEF2PFEMwoEmXTrDFZgH1yv0BNx
	 1DiPpcK8AYc8iC3iqCHfb/G4fV+BvNqp7Yf3036Vx2kec8rf7MOUG/FozDw4NWTeyE
	 j1h2uvcfIutozomBt13+u6NUtRKbw6X+xtaFvkCeyvcRdkBwd4/5x47dK860T21l34
	 NwGh+uWnr7ubm0fi0vjPqxxEtstjgF9mlHDCeU+8uZCpO6vAdNfR5WCj3bpUqZpgZt
	 fiyqAABVM4xiqivGwnjy4W0LOEb8gbpOwrr3tOSbqQt7/i+wpw3akwiJHSQQTsvyfE
	 fe3feTwH6Sr8A==
Date: Wed, 10 Apr 2024 13:02:15 -0500
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@kernel.org>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Chuanhong Guo <gch981213@gmail.com>,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: pinctrl: mediatek: mt7622: add "antsel"
 function
Message-ID: <171277213295.820159.3023089832430236921.robh@kernel.org>
References: <20240408090506.21596-1-zajec5@gmail.com>
 <20240408090506.21596-2-zajec5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240408090506.21596-2-zajec5@gmail.com>


On Mon, 08 Apr 2024 11:05:05 +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> MT7622 pinctrl has ANTSEL* pins. Linux support for those was added in
> the commit 19f599e83ac5 ("pinctrl: mediatek: mt7622: add antsel
> pins/groups"). Include them in binding.
> 
> Cc: Chuanhong Guo <gch981213@gmail.com>
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>  .../pinctrl/mediatek,mt7622-pinctrl.yaml       | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>


