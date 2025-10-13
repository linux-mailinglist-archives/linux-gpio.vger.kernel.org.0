Return-Path: <linux-gpio+bounces-27006-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1481CBD24E2
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 11:32:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0C5D1897EF7
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 09:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F23EA2FDC36;
	Mon, 13 Oct 2025 09:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="oWA4MZYB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E85426FA6E;
	Mon, 13 Oct 2025 09:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760347933; cv=none; b=Pu7AsyvCNph0infX43xej2MiOkwMYUpP9HAVvd+/GwpbEm4DruoAfkrYHeQt2mYh48FYgV9Z7V3nRk8J42njWWjfKnwb9U1KUHSgHRrK5Pyoj8CVQlXYjtrIGW+OKkQxqcfxKOCkm/fwJ4/4gw0WdXAFD779uWCEcdqayko1owE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760347933; c=relaxed/simple;
	bh=gJp0KJN5JsnAs44g7Qv8Flla0ZPEoI3EDaHQ5Ie/TbE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=k0xlnvWSFIQMbsaJVUSTxv164vYJINudf7s2yyyltz+5D5ep6LiO1er8EaqcgOOVCCJleNtTzJRPFIsmB8vcxdxNGQWNA4RZ8qvYVUKJjNvcJn9vJf9eAbQqSMTUqlU4Idx1MzvKSj63HLsv2jEm69ACWZAIuBau151YVcOMEag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=oWA4MZYB; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760347927;
	bh=gJp0KJN5JsnAs44g7Qv8Flla0ZPEoI3EDaHQ5Ie/TbE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oWA4MZYBiGExivnYMXUDxTPU+xKdquwfvIIDwrBYfG+KGl9zWe9TAn80ESph/rNit
	 +wn9QGLV+81ZMhtsp9Mq1T0uxX3r2eInBu0BCsFGY2M9ZBE8fnwTonMf2Bt+HufGpZ
	 UHqRfvVxkV/Cet+U/y+oqGUxKMJTamPfdtk2SOuh+QZfAV6JxaHjGnTYA5VfbPfeWn
	 QzvQtrbMTRUSijnDknZ0Nl+HzQ56kRKoL9z2/r1BQNjyv/AYqzKXOQAAcXypfxozmQ
	 WfQWASb+hJiB264YsedQBiHVjcGBbhEZrnnLKGurpispFL+zUGJ9Fo7qGUBWM3JObN
	 CTu6ShfYITw+w==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 847BF17E0023;
	Mon, 13 Oct 2025 11:32:05 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Ikjoon Jang <ikjn@chromium.org>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 Chen-Yu Tsai <wenst@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>, 
 Eugen Hristev <eugen.hristev@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Julien Massot <jmassot@collabora.com>, Sean Wang <sean.wang@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Julien Massot <julien.massot@collabora.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org, 
 linux-gpio@vger.kernel.org
In-Reply-To: <20250826-mtk-dtb-warnings-v3-0-20e89886a20e@collabora.com>
References: <20250826-mtk-dtb-warnings-v3-0-20e89886a20e@collabora.com>
Subject: Re: (subset) [PATCH v3 0/6] MediaTek devicetree/bindings warnings
 sanitization second round
Message-Id: <176034792547.20821.16275876241287095581.b4-ty@collabora.com>
Date: Mon, 13 Oct 2025 11:32:05 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3

On Tue, 26 Aug 2025 09:39:33 +0200, Julien Massot wrote:
> This patch series continues the effort to address Device Tree validation
> warnings for MediaTek platforms, with a focus on MT8183. It follows the
> initial cleanup series by Angelo
> (https://www.spinics.net/lists/kernel/msg5780177.html).
> 
> The patches in this set eliminate several of the remaining warnings by
> improving or converting DT bindings to DT schema, adding missing properties,
> and updating device tree files accordingly.
> 
> [...]

Applied to v6.18-next/dts64, thanks!

[4/6] arm64: dts: mt8183: Rename nodes to match audiosys DT schema
      commit: 872fa3ea0c0e4602e4775d0fbe84ed3d6aa60e67

Cheers,
Angelo



