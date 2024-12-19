Return-Path: <linux-gpio+bounces-14016-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 629019F7B7F
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2024 13:37:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 445511701FD
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2024 12:35:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD782224B17;
	Thu, 19 Dec 2024 12:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GhGC2Q8a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96497224AF7;
	Thu, 19 Dec 2024 12:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734611684; cv=none; b=sbT7yo4GoYVgRwPjieR9aJKWai2HoTl4vJnkKzpRoBKj24ZABstWmIQDTQnvQIvnmQa7d3xxHFCJI2ai92ZtF2bA/w2xsORjtmc0M4XENbXp5qWRIcStgNUbS+lW4aZ50rXgOMtpMYUyb4k2RvUkzwEXoN5afWNgOn+h1bR1wT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734611684; c=relaxed/simple;
	bh=oET6+uDNf4kR68e3trU5FsFxrPSJ+p2mnS3KEULc9H0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GdS82NmZ9RhpKdlUxaL34WXBgNGh9hYLzdFkny7O+xMce0IfVhQEiE3TRgh8M5L47lHl74jLdUmAOgq3lU0C83iizDYmihUSxrtqeg0V2ojpXmyLPeros7Frn21rIlv1hQjj3U2gPf5ycN9wCwjynPcNwrSjSuC0KW+U+nQ0z0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GhGC2Q8a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A354C4CECE;
	Thu, 19 Dec 2024 12:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734611684;
	bh=oET6+uDNf4kR68e3trU5FsFxrPSJ+p2mnS3KEULc9H0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GhGC2Q8ai0xJrb+hFv2iCyRXSfZiv9Hg1j4U0NtOx1LGDEjq3ORtPVJbxzb7ZdT6C
	 neg4j+GLc0PptW5dpz00W5dD8/I8EKcow7VbTgdR56wKUr+oyISPe+XkndEWGY4b7e
	 cSPguYKONb8DwdrQMDwFPCdlCC3+mKOklN1t5G0sHVKW7PmyL8f92hKcUF9pBsWzkc
	 +hA9SFbHTm2wLu9Rnm9CIFjRlePwI1JES8x3P1uwPuxCqzQCuF0rebV7olhOV3XpAe
	 JcAB4jazwfD+Xja9vvgD/Asy91jqjjQcRa/c9RMYWFO59LsikGVP4teJgpAzBaaAiP
	 +tifFGVzF23Zg==
Date: Thu, 19 Dec 2024 06:34:41 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <linux@fw-web.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@kernel.org>,
	Frank Wunderlich <frank-w@public-files.de>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v7 3/5] dt-bindings: pinctrl: add binding for MT7988 SoC
Message-ID: <20241219123441.GA4016373-robh@kernel.org>
References: <20241217085435.9586-1-linux@fw-web.de>
 <20241217085435.9586-4-linux@fw-web.de>
 <4ecfcdd3-3c81-4625-90cd-1d45f6d71a2f@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ecfcdd3-3c81-4625-90cd-1d45f6d71a2f@collabora.com>

On Thu, Dec 19, 2024 at 12:56:23PM +0100, AngeloGioacchino Del Regno wrote:
> Il 17/12/24 09:54, Frank Wunderlich ha scritto:
> > From: Frank Wunderlich <frank-w@public-files.de>
> > 
> > This adds bindings for MT7988 pinctrl driver.
> > 
> > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> DT binding maintainers, can you please review this patch and eventually release
> an Ack so that I can take it through the MediaTek tree along with the devicetree
> changes?

It's been 2 days... If you want to know the status and where you are in 
the queue, you can check patchwork[1]. But guess what, you're #1.

Rob

[1] https://patchwork.ozlabs.org/project/devicetree-bindings/list/

