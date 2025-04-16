Return-Path: <linux-gpio+bounces-18924-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC1DA8B408
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 10:39:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D4CA97A5134
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 08:37:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07A1322FF2D;
	Wed, 16 Apr 2025 08:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="DTbkxz0o"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E707218589;
	Wed, 16 Apr 2025 08:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744792735; cv=none; b=f+HNyBggGivUFuEp3Hur+FHVATowtsTv/Qd6Zdqi3V0OWY49bIsWClkG5/qrHD4qKgeCutax6GAbFwErG6wqmIMJhgKgagbZWakUvIzd1Ze7dV1hIETAYK3DgH9tP/VR8pbu7yeo2Hdflxswsh2dW4yG9E4tfYz+AnqOfupR714=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744792735; c=relaxed/simple;
	bh=rVMvB7xgFNPgzuqLZd8OCvJUjQSmCDojTUXmC5Tq3bE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IGho3I4g9yFWu9iuRcdYJQrYzU359cGxBXnG+FwGrZSz/Y6RrubHNkDl2rSSlUocdN7K8OhYskHUvZonrXBsGd9NJCmf6A3xSsWivVU03wUzzxHwalCigH8VhRVjxVVJcx2gPhKenRQDKxafDKFGxxE4lhstq7x6z2HIRqJUb84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=DTbkxz0o; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744792731;
	bh=rVMvB7xgFNPgzuqLZd8OCvJUjQSmCDojTUXmC5Tq3bE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DTbkxz0otazEBKvCZ2k2CPy5ldjlEKAvtJQp5/OKPZmh/fHZUQ9U1I8oigWHX5/Z3
	 qYgo6UBc/JEIbvt6cBIhsVzvcbByES6/v73nI13zRre8KOanV0Wu+OK4e8GL7Ltywe
	 XAVdtUhIMIWmclxEos4LAKGKDM1YxiuxnBoc8l7WoQ+OLdgHznI8RUh/WzZKdOaRNJ
	 H2PDFBWIi1Yyrq3xxhfAAO2u/Q/Ynd1h9tqPTScuxbM1++1S9jCR31wz5l5S2Lf6D/
	 wrd7I5N02N7sNtERmfkmQC9PZPLLswUDHFv4t8Acyh4wnCAjFu0ypF7GfW5bswf884
	 113cVwjGQ3pfw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 62B1117E0B2D;
	Wed, 16 Apr 2025 10:38:50 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>, 
 Lei Xue <lei.xue@mediatek.com>, Cathy Xu <ot_cathy.xu@mediatek.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, yong.mao@mediatek.com, 
 Axe.Yang@mediatek.com, Andy-ld.Lu@mediatek.com, Wenbin.Mei@mediatek.com, 
 Jimin.Wang@mediatek.com
In-Reply-To: <20250414090215.16091-1-ot_cathy.xu@mediatek.com>
References: <20250414090215.16091-1-ot_cathy.xu@mediatek.com>
Subject: Re: (subset) [PATCH v7 0/3] pinctrl: mediatek: Add pinctrl driver
 on mt8196
Message-Id: <174479273033.19737.2333999277114741703.b4-ty@collabora.com>
Date: Wed, 16 Apr 2025 10:38:50 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Mon, 14 Apr 2025 16:59:25 +0800, Cathy Xu wrote:
> Changes in v7:
> - Add eint registers in dt-binding.
> 
> Changes in v6:
> - Simplify the register description and adjust the order of properties
>   in dt-binding.
> 
> [...]

Applied to v6.15-next/dts64, thanks!

[2/3] arm64: dts: mediatek: mt8196: Add pinmux macro header file
      commit: f5d2cbe5d8374fd094235102688f511283573abc

Cheers,
Angelo



