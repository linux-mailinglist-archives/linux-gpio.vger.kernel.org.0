Return-Path: <linux-gpio+bounces-24624-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 79998B2DDEC
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 15:36:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4D9454E54DD
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 13:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D142B326D78;
	Wed, 20 Aug 2025 13:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Lxm4LncN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C413218CD;
	Wed, 20 Aug 2025 13:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755696827; cv=none; b=t1D/El1YK3ZnXyD+LEVPXeXhD/xoH5ycZv5L4tUv4NV+90RDtH4rhTO7Zpoi0ORkSzkU7t6BGEAdbK0tt9d9/VAM+oJJsrw3zMR/YMMQqIKqxTHMxX3+ijGSs18eWjIbwqFtWFPraXV44dEg0itR/c9OcVQB77366VxuMA73vN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755696827; c=relaxed/simple;
	bh=SaNvr16XH7ej2OcXCQ1iRpF9atHKPorFp7MQLGCnfjs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aO6cvDOn2adYCDiiic0Cg2hJbRBRatnDgUeRrDEypXOvKFw3FgrsrVDDnQnKh6IS/cwOTyRWDb5nTwEn//TMstZHOsqFvLJqVlNVdkWMEF3Uu5M89PnfG6kSqeVSNx6XMbfvIynXN66zsWqDuYv1di5xW5WJiCFV/zlLTnqW5yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Lxm4LncN; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1755696823;
	bh=SaNvr16XH7ej2OcXCQ1iRpF9atHKPorFp7MQLGCnfjs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Lxm4LncNaa+hg66D90Mv8uIt9ZS7bBKPXRKwixPiMamgBj+MlLq+GKRCnrEYXF9Zv
	 K4O8DdzbWKptMKtRuyiZ7EjsNS+tf+n0ANEkVcr48rZMtt9G2/ZUuyMAODBbMVdyBw
	 9bzbx38MYoYqDzZapd6D4Ah7dii3KOWJuwKjEUI3aMzYlk25d25qqAE1IrG9Ul4qH5
	 TXn6ihImAU13F73fbOTBpViQKDeYQ4FPOQnMtp/BplzrTCOV6E3whfMybGMIr7MfJf
	 gq8sWrk4z7VK/CpH34VO45pG1rc5YU/B4oCTJxS9gCfQwCIAY3vykR2iEeXME3lepv
	 5LhB/otf/pKvQ==
Received: from localhost-live.home (2a01cb0892f2d600C8F85CF092d4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 99DDF17E02B0;
	Wed, 20 Aug 2025 15:33:42 +0200 (CEST)
Message-ID: <ff583d9675181e2e6f39169a55da8958014f0ea5.camel@collabora.com>
Subject: Re: [PATCH 5/9] dt-bindings: sound: Convert MT8183 DA7219 sound
 card bindings to YAML
From: Julien Massot <julien.massot@collabora.com>
To: Rob Herring <robh@kernel.org>
Cc: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,  Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Ikjoon Jang
 <ikjn@chromium.org>, Enric Balletbo i Serra <eballetbo@kernel.org>, Chen-Yu
 Tsai	 <wenst@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>, Eugen Hristev
	 <eugen.hristev@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown	 <broonie@kernel.org>, Julien Massot <jmassot@collabora.com>, Sean
 Wang	 <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Date: Wed, 20 Aug 2025 15:33:41 +0200
In-Reply-To: <20250801172821.GA3111733-robh@kernel.org>
References: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com>
	 <20250801-mtk-dtb-warnings-v1-5-6ba4e432427b@collabora.com>
	 <20250801172821.GA3111733-robh@kernel.org>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-08-01 at 12:28 -0500, Rob Herring wrote:
> On Fri, Aug 01, 2025 at 01:18:07PM +0200, Julien Massot wrote:
> > Convert the Device Tree binding for MT8183-based boards using the
> > DA7219 headset codec and optional MAX98357, RT1015 or RT1015P speaker
> > amplifiers from the legacy .txt format to YAML schema.
> >=20
> > This improves binding validation and removes DT schema warnings
> > for boards using these audio components.
> >=20
> > Signed-off-by: Julien Massot <julien.massot@collabora.com>
> > ---
> > =C2=A0.../bindings/sound/mt8183-da7219-max98357.txt=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 21 ----------
> > =C2=A0.../devicetree/bindings/sound/mt8183-da7219.yaml=C2=A0=C2=A0 | 49=
 ++++++++++++++++++++++
>=20
> mediatek,mt8183_da7219.yaml
>=20
Ok, Fixed in v2.

Thanks,
Julien

