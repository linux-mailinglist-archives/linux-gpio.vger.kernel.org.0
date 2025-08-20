Return-Path: <linux-gpio+bounces-24625-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E700B2DE0E
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 15:41:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 83633583B8F
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 13:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA367322752;
	Wed, 20 Aug 2025 13:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="BMyk2AYe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09D931E10D;
	Wed, 20 Aug 2025 13:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755696897; cv=none; b=GdTGCNTQPvVF4A+QmYo7EmJqcOGV9HOK6IRM4ZOphUVjWjojPBlIn5rALnqq2qQprjrr+M2/5Hv8Zu+PJoFr19qC7m+Q6ub91Y75Dn4ko3Jti9Mlpk6tdidBXEqm3pJp1WJxh/I602SSzKukGpJ2KYKdrg9aWQDNhM5NZxJlpV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755696897; c=relaxed/simple;
	bh=CXQSwAv8e6eEfacG/HeYdxYzZSrhuUbOicdQbourYnc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BxQz4X0lDO5ECWXxu55oEFXDgO1CXKhg8DZei9pJc2TN24R9clt+jAvPHJcvlHQ3OGEpSYW+xtNJWgk3ZKmz9gxNZNcuHRQcR18jdQaZf8UifphHxxBy8RPVccSaLVlWci4RIK4DGYQA+j32gnaliwiSfF+vwVP5A59pociwnAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=BMyk2AYe; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1755696894;
	bh=CXQSwAv8e6eEfacG/HeYdxYzZSrhuUbOicdQbourYnc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=BMyk2AYeLys2RolPoykxrhvNbeytaoF2/aKwgif7GzLleZCp2kTE5vHm5rsTNPH/9
	 wRxe1QgO5JRhTIelbfqDkmKX6vs1zhr7/ROYfDwXjLpBt/AG2VrjNl8hiDh1h/htNm
	 IytmPOMbYs3FKvK6FJ0fNXcWrwW+xQ4BATx/7a9O+D/rvH0RClxrICXYvHY23U6Xr/
	 LmqE3lHwB99RvuFO5LQLTAjXGVMlIYunVwGj0pRrkl8O33F18PYSKyyIjexX+O7gO4
	 t4KYJujfi0dUClNfSgIfIBkC/Lx/oTo76KmPAtaXRQYyIOtbLDJw6tn4iPnMYJmJdh
	 KQ+kdM7IIBeFA==
Received: from localhost-live.home (2a01cb0892F2D600C8F85Cf092D4aF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0D76817E02B0;
	Wed, 20 Aug 2025 15:34:53 +0200 (CEST)
Message-ID: <5ae569e8a1b3d00408d8ad4e934a4585a7479f7e.camel@collabora.com>
Subject: Re: [PATCH 6/9] ASoC: dt-binding: Convert MediaTek mt8183-mt6358
 bindings to YAML
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
Date: Wed, 20 Aug 2025 15:34:52 +0200
In-Reply-To: <20250801172927.GA3114452-robh@kernel.org>
References: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com>
	 <20250801-mtk-dtb-warnings-v1-6-6ba4e432427b@collabora.com>
	 <20250801172927.GA3114452-robh@kernel.org>
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

On Fri, 2025-08-01 at 12:29 -0500, Rob Herring wrote:
> On Fri, Aug 01, 2025 at 01:18:08PM +0200, Julien Massot wrote:
> > Convert the existing text-based DT binding for MT8183 sound cards using
> > MT6358 and various other codecs to a YAML schema.
> >=20
> > Signed-off-by: Julien Massot <julien.massot@collabora.com>
> > ---
> > =C2=A0.../sound/mt8183-mt6358-ts3a227-max98357.txt=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 25 ---------
> > =C2=A0.../devicetree/bindings/sound/mt8183-mt6358.yaml=C2=A0=C2=A0 | 59=
 ++++++++++++++++++++++
>=20
> mediatek,mt8183_mt6358_ts3a227.yaml

Ok, Thanks for the review.
Julien

