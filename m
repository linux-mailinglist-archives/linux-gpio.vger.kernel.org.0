Return-Path: <linux-gpio+bounces-24711-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE7FB2EF43
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 09:18:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD6CF3A7C0F
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 07:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C49D02EA73A;
	Thu, 21 Aug 2025 07:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z4HgHHSW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC47287275;
	Thu, 21 Aug 2025 07:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755760613; cv=none; b=WKpBEwbkeg8hBHQCX66Q5EQF1mOZXo96+i+RkQkWbb8JPKA2Td8qtSA60Er9rMOQimHPyndIo/k+vYRSIbQILYUK/VC7NS9A/HhMpk/Cp+a9yoYpI6HZ7fKN0p7UFOvQSxwgoy5aaCZNJcslp6U4bL5QqftrB6eekMHoVyLgS44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755760613; c=relaxed/simple;
	bh=Up9g/vI3BHwIi+2MZpJPHWZDdmmaSTnrlf6OaSDp48E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QsYPCh08zxqcuW1Zm0sErj2/cg8tJo7X1hg8s8U4z3deh7Wr7xzSmqMXmIF6+UPgJwOSz7dN1rOU44Eq1x91vSsqDkdpOtrYSq+gJ/ip25X0G1enqRblu1FrfDIIHeGm9ClRPYknAGDD72byzizo8GLUZxXF3pptqv+b+E6zUy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z4HgHHSW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C277C2BC86;
	Thu, 21 Aug 2025 07:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755760613;
	bh=Up9g/vI3BHwIi+2MZpJPHWZDdmmaSTnrlf6OaSDp48E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z4HgHHSW26FlK4PTq5Po5duNBcyGsieoINkWA0JLtgZFu0Za+g3yXAzJogDq3TOHN
	 muD88A6G1NLSRF1QtrshCP+o3FBA5xRw5rxGFlTtajuLG93TJyuM03PwX+6xbvHyX5
	 Ar31qrHmZ1T+zTHSCVRKheegezxxIdck5GESemAchjeSFbg6dq9W004RgkRJJ/76rY
	 XtksCiXETk0d8P/q4fBEH9r4ivd3ZoFdwhQ8WLzuua/zNrQSOaOZerABC4MoFgCZLY
	 oR7oCCSHTFO4En8VwwcCUn9YaXdCFO0tHS9wsu8m5P4yE+GtHowh+9J+Bab8Os4Vd8
	 75AvpDAmni6+Q==
Date: Thu, 21 Aug 2025 09:16:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Julien Massot <julien.massot@collabora.com>
Cc: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Ikjoon Jang <ikjn@chromium.org>, 
	Enric Balletbo i Serra <eballetbo@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Weiyi Lu <weiyi.lu@mediatek.com>, Eugen Hristev <eugen.hristev@linaro.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Julien Massot <jmassot@collabora.com>, Sean Wang <sean.wang@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: clock: mediatek: Add power-domains
 property
Message-ID: <20250821-whimsical-mustang-of-champagne-ca7a7d@kuoka>
References: <20250820-mtk-dtb-warnings-v2-0-cf4721e58f4e@collabora.com>
 <20250820-mtk-dtb-warnings-v2-1-cf4721e58f4e@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250820-mtk-dtb-warnings-v2-1-cf4721e58f4e@collabora.com>

On Wed, Aug 20, 2025 at 03:44:52PM +0200, Julien Massot wrote:
> The mt8183-mfgcfg node uses a power domain in its device tree node.
> To prevent schema validation warnings, add the optional `power-domains`
> property to the binding schema for mediatek syscon clocks.
> 
> Fixes: 1781f2c46180 ("arm64: dts: mediatek: mt8183: Add power-domains property to mfgcfg")

Checkpatch complains here, but more important - where is explanation of
dropped tag?

> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

But this tag appeared? It wasn't even given!

You remove public tags and add tags never given on the lists.

Best regards,
Krzysztof


