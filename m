Return-Path: <linux-gpio+bounces-24943-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 31291B34684
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 17:58:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 281592A4B14
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 15:58:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84A663002A2;
	Mon, 25 Aug 2025 15:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="E3+JVySO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F26F2F4A1B;
	Mon, 25 Aug 2025 15:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756137483; cv=none; b=tMgquhpxKQfkkzzuBiPvNlagTYmpauLpAoQNBD51WYnZkwAM3RXtvbg+x4n9FTlc1TvZl2zDIZjHxPsXJmOifMH250czbqgQGDhjhVGkqxm5ZFtg+EA4R8CIb/Nbd1BL+qTgrH9TZ+lW0qbgnhcguz2fERw5e1mMr8kp+DHrv6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756137483; c=relaxed/simple;
	bh=J5bupA+heQtL5Wcp4JAPKY1z0JPnUwdB+YBwuYoNau8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VnRzDFhDFVEkTnb92m6u2JICkc/6zkkCZKHlG7i503lh26WqMkrP9vm9AvX1N7aswl3DhUCHfUTUpppiSlI8WYm6McaCzeoWAgoN0i5U6nioSxI6PcC8YBG0Q56djfwdE49mdHtQhs2UpohIOZ+md5GQedMxdbEAWCQGoIYEVlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=E3+JVySO; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756137479;
	bh=J5bupA+heQtL5Wcp4JAPKY1z0JPnUwdB+YBwuYoNau8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=E3+JVySOtDo6B73FegZ6Or80M/ila2fRd1xu2TVpmdEKV9Sc/1jbhYN+Iic29PXGo
	 ImJeCh0eMufQ8BWvZ/gXuqKyQQP79mjfpwEY1P8VUEMsz5UwauFcm7kPxheNobMKec
	 NyHFDDwFCs1N3p1feTcjEZK+bSrPSbd5gsDYVqJG2Kd9B1o82RnzEAOkJu9j25SwMc
	 Hiv0f6eatIri3ZDVVflvsaROY9xNzvxaDkvOG5o61OKcKhBPq59cJ2ITFzx8I9Ab66
	 qWC0Yn5VFl4k+YA9E5p7XZO8m8uF4RD4Al07heeqORCxhtPYonbw2jvJBUAnV2L7aY
	 ik/bz0vcVCXFQ==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892f2d600C8f85CF092d4AF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 22E0C17E07FB;
	Mon, 25 Aug 2025 17:57:58 +0200 (CEST)
Message-ID: <c3b6c0ff993b7ebc9fb8abd8104b537f0c7f5fb3.camel@collabora.com>
Subject: Re: [PATCH v2 0/6] MediaTek devicetree/bindings warnings
 sanitization second round
From: Julien Massot <julien.massot@collabora.com>
To: Mark Brown <broonie@kernel.org>
Cc: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, Ikjoon Jang <ikjn@chromium.org>,
  Enric Balletbo i Serra	 <eballetbo@kernel.org>, Chen-Yu Tsai
 <wenst@chromium.org>, Weiyi Lu	 <weiyi.lu@mediatek.com>, Eugen Hristev
 <eugen.hristev@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Julien
 Massot <jmassot@collabora.com>, Sean Wang	 <sean.wang@kernel.org>, Linus
 Walleij <linus.walleij@linaro.org>, 	linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-mediatek@lists.infradead.org,
 linux-sound@vger.kernel.org, 	linux-gpio@vger.kernel.org
Date: Mon, 25 Aug 2025 17:57:57 +0200
In-Reply-To: <d02d2a5f-b8d7-4fdb-b3c5-6e6d21127733@sirena.org.uk>
References: <20250820-mtk-dtb-warnings-v2-0-cf4721e58f4e@collabora.com>
	 <d02d2a5f-b8d7-4fdb-b3c5-6e6d21127733@sirena.org.uk>
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

Hi Mark,

On Wed, 2025-08-20 at 15:21 +0100, Mark Brown wrote:
> On Wed, Aug 20, 2025 at 03:44:51PM +0200, Julien Massot wrote:
> > This patch series continues the effort to address Device Tree
> > validation warnings for MediaTek platforms, with a focus on MT8183. It
> > follows the initial cleanup series by Angelo
> > (https://www.spinics.net/lists/kernel/msg5780177.html)
> >=20
> > The patches in this set eliminate several of the remaining warnings by
> > improving or converting DT bindings to YAML, adding missing
> > properties, and updating device tree files accordingly.
>=20
> What's the story with interdepenencies between the patches in this
> series?
>=20
> Please fix your mail client to word wrap within paragraphs at something
> substantially less than 80 columns.=C2=A0 Doing this makes your messages =
much
> easier to read and reply to.

Thanks for the feedback, and apologies for the long lines =E2=80=94 I have =
fixed
my mail client for follow-ups.

Regarding interdependencies in the series:

  * Patch 1/6 can be picked up independently.
  * Patch 2/6 is standalone.
  * Patch 3/6 depends on 2/6.
  * Patch 4/6 fixes the DTS node name as expected by 3/6.
  * Patches 5/6 and 6/6 are independent.

So the only ordering requirement is that 2/6 should land before 3/6, with
4/6 included as well to avoid introducing a temporary new DTB warning.
All others can be applied in any order

Regards,
Julien

