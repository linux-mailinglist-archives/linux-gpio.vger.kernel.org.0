Return-Path: <linux-gpio+bounces-24944-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F88B34695
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 18:00:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5156A1A80A58
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 16:01:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB78C2FE580;
	Mon, 25 Aug 2025 16:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="K5cSiuiN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908B61946A0;
	Mon, 25 Aug 2025 16:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756137648; cv=none; b=dXrlrzMHmc24Y+rXw54dDKSExBdQsXKbc2vz8xL3Ld3XN6Gm9eM0zM5QIC/0t6s8DrWQXhIl1r94WlGNAW/Q9ByQjstraKx90kJZP0xOxMHnWFHi5cgLeqrNUpYZNtoetyhPD5E6abGWyYBIwQezzaHgEnvLbtDGBivueIcobI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756137648; c=relaxed/simple;
	bh=gaSCgp+9x9wgETscmsm6/J/E9Z0jSnaLlgjGoTawuZE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IYBXMMHtTqlrqDVy1gmy5uXmAjGd0imtSOc1U0p0rSQFqolwGSlaoPIv8MsspQkaI86oHSd0iaFO4A5josE1VciHqHc7Rh+QNBdGWyQZ0nV1A7Msl6frtjjygsBbLXikA6I4kt12pMAIFWIsxi/iFlMNhk7ISnLBM/hYWOkQ7UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=K5cSiuiN; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756137644;
	bh=gaSCgp+9x9wgETscmsm6/J/E9Z0jSnaLlgjGoTawuZE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=K5cSiuiNyUlYig3gKw/Pjj8VRjMsSG/tQRnivKT87u8PoxdsqfWiKfs/lEN/BjDul
	 YXcr+hei3+I2ZidXLOkn8JZnAmouiTOcVvtekkzgZkg2fjxKznWWD1UoyquCGhh5F5
	 lM8M/Mqx2PvIN0+1c+3CA64FuDBiBS26UgHtt0fNtR+3h4O4/EcTl4Qjnu0p0Ve0v8
	 g5U0haJrieuKeHvC5yLqOY0MSLzy2UdA8XXs1vKabJ9EMn5dA+cTVh8xXMpml6gf7c
	 fKWl9gSQTYKapeF5r+YHs4yQN5nxRNeHiJCEYT3MzfbinYdWkeM1FivxAGgdiyLVg7
	 LOYmef7KeMQqA==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892f2d600c8f85Cf092D4Af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A47A017E053B;
	Mon, 25 Aug 2025 18:00:43 +0200 (CEST)
Message-ID: <9c544d68ec10da176b062333b8a04903ce77a406.camel@collabora.com>
Subject: Re: [PATCH v2 2/6] ASoC: dt-binding: Convert mt8183-afe-pcm binding
 to YAML
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
Date: Mon, 25 Aug 2025 18:00:43 +0200
In-Reply-To: <20250822143945.GA3709669-robh@kernel.org>
References: <20250820-mtk-dtb-warnings-v2-0-cf4721e58f4e@collabora.com>
	 <20250820-mtk-dtb-warnings-v2-2-cf4721e58f4e@collabora.com>
	 <20250822143945.GA3709669-robh@kernel.org>
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

Hi Rob,
On Fri, 2025-08-22 at 09:39 -0500, Rob Herring wrote:
> On Wed, Aug 20, 2025 at 03:44:53PM +0200, Julien Massot wrote:
> > Convert the MediaTek MT8183 AFE PCM Device Tree binding from the old
> > .txt format to YAML schema format to improve validation.
> >=20
> > While converting, also document all clock inputs and memory-region
> > used by the AFE block.
> >=20
> > Reviewed-by: AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com>
> > Signed-off-by: Julien Massot <julien.massot@collabora.com>
> >=20

> > ...

> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +=C2=A0 - |
> > +=C2=A0=C2=A0=C2=A0 #include <dt-bindings/clock/mt8183-clk.h>
> > +=C2=A0=C2=A0=C2=A0 #include <dt-bindings/interrupt-controller/arm-gic.=
h>
> > +=C2=A0=C2=A0=C2=A0 #include <dt-bindings/interrupt-controller/irq.h>
> > +=C2=A0=C2=A0=C2=A0 #include <dt-bindings/power/mt8183-power.h>
> > +=C2=A0=C2=A0=C2=A0 #include <dt-bindings/reset/mt8183-resets.h>
> > +
> > +=C2=A0=C2=A0=C2=A0 afe: mt8183-afe-pcm {
>=20
> audio-controller {
>=20
> like you changed the .dts.
>=20
> With that,
>=20
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Thanks, I will fix the node name in V3.

Regards,
Julien

