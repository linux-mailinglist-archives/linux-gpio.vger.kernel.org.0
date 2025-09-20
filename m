Return-Path: <linux-gpio+bounces-26415-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C96AB8BFF7
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Sep 2025 07:45:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC99EA02370
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Sep 2025 05:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9B24235360;
	Sat, 20 Sep 2025 05:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cGpfmWnd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7FD3770B;
	Sat, 20 Sep 2025 05:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758347099; cv=none; b=S631VLu2DasskeT7jvDbH/FQuFgMUJGAfliQcuvCDa8/KUlkDsnLzsft3R8zauc+Jm0vPd5D369oaV4aOYIl6qBuMH3mSakrXhO+PR4Fl7NijsmdW1kz076t2/BEM2PRq4EuyFRL+FERbNjNtJ9+c+38ENxjyAB0has+WwsgjZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758347099; c=relaxed/simple;
	bh=rTQs86DAm2tZv18wSt1opDcS3zS26ZYKcrgH0Yd9fmQ=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=CS397kouhAuM1v/g+nzE2IpCDV6PUma2m6/2dMU+U4N6UR1O3zr9kNkgi98yyiTqxuAbGAtZFefW9uPrSQ+Ab0XQAc6xtJweZ/qHDC8zqOE3dvQBuy7JiQqOhrhepP+xORz71j58PJ9v5bey/riBStMqWBSXddeQLIejEv/ClsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cGpfmWnd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E65DAC4CEEB;
	Sat, 20 Sep 2025 05:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758347099;
	bh=rTQs86DAm2tZv18wSt1opDcS3zS26ZYKcrgH0Yd9fmQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=cGpfmWndf5HUwxCZa9NfrgZLcoIsJ1CoQN4e4qsm1oNoisRq5jF4TsDewMKr7ZKCt
	 BRwsS8tjb7XQ77Kb621epmaGTL4+1moxlokJq2zHDuAqWuKV3uZevwYaIZ2/S/QSon
	 VU/jcHBIzQPMcj9+QtNL7/J5MhNBQW23rGy/Mr04Ry6BHNcrL7hresy+qXbOQB0sgZ
	 zHN4R2a5UjaO8XY1zRrKhJY5WOqZ2SMoUZDw4I/c1ifITPAtfsxZ+fI8Yn/Nz2bEX+
	 PFwfA8QOwzN1IQfJ66+Gr+sjjSSgXd+vX5cCY2sDxug1EAPfviYAuzbrQbisb5x+yI
	 HI/u24mCsYofA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250826-mtk-dtb-warnings-v3-1-20e89886a20e@collabora.com>
References: <20250826-mtk-dtb-warnings-v3-0-20e89886a20e@collabora.com> <20250826-mtk-dtb-warnings-v3-1-20e89886a20e@collabora.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: clock: mediatek: Add power-domains property
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, Julien Massot <julien.massot@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, Conor Dooley <conor+dt@kernel.org>, Enric Balletbo i Serra <eballetbo@kernel.org>, Eugen Hristev <eugen.hristev@linaro.org>, Ikjoon Jang <ikjn@chromium.org>, Julien Massot <jmassot@collabora.com>, Julien Massot <julien.massot@collabora.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Sean Wang <sean.wang@kernel.org>, Weiyi Lu <weiyi.lu@mediatek.com>, kernel@collabora.com
Date: Fri, 19 Sep 2025 22:44:58 -0700
Message-ID: <175834709805.4354.2882057128826835319@lazor>
User-Agent: alot/0.11

Quoting Julien Massot (2025-08-26 00:39:34)
> The mt8183-mfgcfg node uses a power domain in its device tree node.
> To prevent schema validation warnings, add the optional `power-domains`
> property to the binding schema for mediatek syscon clocks.
>=20
> Fixes: 1781f2c46180 ("arm64: dts: mediatek: mt8183: Add power-domains pro=
perity to mfgcfg")
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> ---

Applied to clk-next

