Return-Path: <linux-gpio+bounces-24621-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45169B2DDC7
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 15:29:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8C023AB438
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 13:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4737031E11A;
	Wed, 20 Aug 2025 13:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="iTq12KNW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E09302CA4;
	Wed, 20 Aug 2025 13:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755696524; cv=none; b=Sqkba2HQkhgsMCtkixFEeMCZXg50d8wlTWdSP1rjt9CRW3dBLfvuUd9bN5hYI+QygsQoDY5RW69UmR8sRUMAH5rwzPrPXcXrfmEJTsV4vqqufz/k1OYpJDTakOtJehi6XAdyrWdu6Xz6fOGSOilWQ3lGUwmQFRmTkWE0zC++EpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755696524; c=relaxed/simple;
	bh=71Qkw8Hy/P+iGBViOApzul3IXKCx7c5tsaWiYZHLSgg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oPqt5uHgrhqgyHR4Z6ihtXVczsv2FJ32RMt1ofnJP0Ic4OpQ9mvc8njjRQEEWHR6FbFY7pNiPij3SkaeBxiP1gPRrqkwdpIFzGbW3GV1GPClfQkiBoYoQroe4WDEHKBga7VX7lW3GhijWebBC4c3O3aiw4AVfm5c13zRcfdrjJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=iTq12KNW; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1755696520;
	bh=71Qkw8Hy/P+iGBViOApzul3IXKCx7c5tsaWiYZHLSgg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=iTq12KNWSC9E9H/1v6af6iHkChbR9pZyRLHBaUbD7YIJFBKOSy6riJ/C4k8FtnIEH
	 6Fiv4EAvB6E7GkwTHALIMoffHcUGvuCwzeMyr6k/zQMnwPQGQQv+JZ+dDw3jtyU8R8
	 fUbxoOGNK2jvDcXAITiU9PJUR0V4Tj3UbKkC1OTWyg6E3mtW/P1Hqs8cr0srLyJ3NI
	 jjvJZKrCYzD0cWrQG8FK59eyvluG2va4mWnIhod/92fvUVHtPXKcy6NlRz1y1/gUpP
	 bY2857VT7F9P0svczGWlSHx07jjQyStRDyX0JEH+LukctjvB9BTUYNjhPy5ZA1pQGA
	 /pSyslgYppzwQ==
Received: from localhost-live.home (2a01cb0892f2d600C8f85Cf092d4AF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 65A6917E01F5;
	Wed, 20 Aug 2025 15:28:39 +0200 (CEST)
Message-ID: <58234e996f245216aa93b5520e4792f7c1ff4a4f.camel@collabora.com>
Subject: Re: [PATCH 2/9] dt-bindings: arm: mediatek: Support mt8183-audiosys
 binding variant
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
Date: Wed, 20 Aug 2025 15:28:38 +0200
In-Reply-To: <20250801172136.GA3104927-robh@kernel.org>
References: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com>
	 <20250801-mtk-dtb-warnings-v1-2-6ba4e432427b@collabora.com>
	 <20250801172136.GA3104927-robh@kernel.org>
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
On Fri, 2025-08-01 at 12:21 -0500, Rob Herring wrote:
> On Fri, Aug 01, 2025 at 01:18:04PM +0200, Julien Massot wrote:
> > Update the mediatek,audsys binding to support the mt8183-audiosys
> > compatible, which uses a different audio controller binding
> > (mt8183-afe-pcm.yaml) compared to the legacy mt2701-audio controller.
>=20
> Looks like this one needs 'memory-region' added?
Correct, I will add 'memory-region' in v2.

Regards,
Julien

