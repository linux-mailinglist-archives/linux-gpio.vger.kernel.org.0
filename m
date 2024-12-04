Return-Path: <linux-gpio+bounces-13480-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C58FE9E342C
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 08:35:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4A23CB22DA8
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 07:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B67F618C337;
	Wed,  4 Dec 2024 07:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QvsfcRlE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65235189BB3;
	Wed,  4 Dec 2024 07:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733297742; cv=none; b=in/3wpAqSrlGCt23aH3VmqxRrk2lptGVHI7WsklfaVNEycoxKcgNDU+dt1cF7+2zXFRXYIm9u0AFDGiswXZJImVDzbDDCyC4LQy6Q8Qtz+TVeSPpl3tnFT6XOah/lyk9onoNR7XSDwED17AzPqh8rN2HS0C9s5mwPdrTnJM7XLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733297742; c=relaxed/simple;
	bh=en/j+2A6Gs06WxgQsDr+80HBb8Vp8sTiMeBxY16I3o0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rUzi7YzGOPX3yvmxUEEPgjdvcjmWh3k0qdOIH3HVwQXgtcOqF/JLO8nFHhQwazPlQMO8pgHexW4MXZE2KdW3o1KckxBAZqp3T+zL19pce5ingn1/wjiu7pEnbk+007SecmgjPVvt0i/dnx64MbrZHYDSRuL8RbnUj08zAj0IJj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QvsfcRlE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09B0CC4CED1;
	Wed,  4 Dec 2024 07:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733297740;
	bh=en/j+2A6Gs06WxgQsDr+80HBb8Vp8sTiMeBxY16I3o0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QvsfcRlEzlaEF8nigmjLJnGG5aZr5IKqy2ac31Z0eTETrFO10BKzreLOFxeM5DnfX
	 R0vDcmMZN3HA/Chn93mwdxs2MFx7RFyPvREl9n6WRhzKMJRzc3ogRmu734zMJNFEPG
	 YieZfxsC4zHg9cPEEVwOUbMvReH2OfNJEjg0IMLXhig4xzXAPJUCG2FcwEgxZfdql4
	 PUaKTsOMxfdgjhRFnLrSRqhyUyk5roWfE+P8/9qDtTVQBY34bFT++DLsuLFT7n/d6w
	 LuHFeuaUr247O2ZxM/mfo4AYvB4jJ6hRTqCQvgElTS0PC8SjV2qLuTFqwmny9oXtZU
	 06fFhlEcVNQvQ==
Date: Wed, 4 Dec 2024 08:35:37 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>, 
	Frank Wunderlich <frank-w@public-files.de>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v5 3/5] dt-bindings: pinctrl: add binding for MT7988 SoC
Message-ID: <iwmnxlqpaijvr4kmzwk3elacqj5ukqlchfs67ca6c6gxrycpbb@pc6a6scqkdi5>
References: <20241202110045.22084-1-linux@fw-web.de>
 <20241202110045.22084-4-linux@fw-web.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241202110045.22084-4-linux@fw-web.de>

On Mon, Dec 02, 2024 at 12:00:37PM +0100, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> This adds bindings for MT7988 pinctrl driver.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> changes in v5 (so not adding RB from Rob given in v4):
> - do not use MTK_DRIVE_8mA in example
> - add _0 functions for pwm
>

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation: Please add
Acked-by/Reviewed-by/Tested-by tags when posting new versions, under
or above your Signed-off-by tag. Tag is "received", when provided
in a message replied to you on the mailing list. Tools like b4 can help
here. However, there's no need to repost patches *only* to add the tags.
The upstream maintainer will do that for tags received on the version
they apply.

https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.
</form letter>

Best regards,
Krzysztof


