Return-Path: <linux-gpio+bounces-14407-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA2A9FF975
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 13:46:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F36FE18835F8
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 12:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91E00197552;
	Thu,  2 Jan 2025 12:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Ilhao3Ge"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A565E1B0F2F;
	Thu,  2 Jan 2025 12:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735821992; cv=none; b=T156n3hX8EJVwfWbYnGOZAnW6+rOhA/todNHOUyK+RdDkjG+xik8z2fUGZTi92K4i+3VI/iSNOR+66pteuENRcuZg1LGiX+Jcae0yT0uAgOX9hBHqqD5HpYGdWQnDhZ5SmkLC+L0COFd9PdmqKGM8sNzvidQ4bL1DKNMlW7U01c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735821992; c=relaxed/simple;
	bh=rPO//rEZigCKZoPA2paAhefsIjAROiOVo9/njcMMDyA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PkPdzRjDmG97ccW4coor41kYvLBkmrjFYHmb8DYl2sNcxTE+WpP+I8lfGGgm9yUyipjhr9JXD8o7DxTF5qn8Qvoy7GOJ/zd0K65qyN3mswuam3axoU68dW8TEc/l93RETQiHSud559GyyuD11oHoAjSakWB24lz+OtdIiWm6Ag0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Ilhao3Ge; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1735821987;
	bh=rPO//rEZigCKZoPA2paAhefsIjAROiOVo9/njcMMDyA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Ilhao3Ge3nqqAM5e0osgKqmIa1ciLQWuDU01ki117UmipDGQLJIJi/UIPISWToIYs
	 QKrDKIuEYwpF+OxbNlNaO0+KqyKqljNZdXlyqLZIeoyzoCT1k7yPBPJAqsCCd7xITU
	 PBCnOie3otlpOTYOVFKDFo7uEm7fy7C7S+EZLURkqzAglbFsWzIiSlhycNi+fWGQBF
	 S7miQjwpoLSukrroioioG7hMq4Ad1zMXbIH1nRQ91QqkCty47LQpck0PB4NQgUM1lt
	 IPHu+Ll+FFELMGuFBheAu3QH68RuKskt73j7qLoBm2vNcdVoYV3q9bBnCkxDeFZcys
	 Qq1bSM7LpsETA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C7FA017E156D;
	Thu,  2 Jan 2025 13:46:26 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>, 
 Frank Wunderlich <linux@fw-web.de>
Cc: Frank Wunderlich <frank-w@public-files.de>, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20241217085435.9586-1-linux@fw-web.de>
References: <20241217085435.9586-1-linux@fw-web.de>
Subject: Re: (subset) [PATCH v7 0/5] Add pinctrl support for mt7988
Message-Id: <173582198673.163596.6578000235046486411.b4-ty@collabora.com>
Date: Thu, 02 Jan 2025 13:46:26 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Tue, 17 Dec 2024 09:54:25 +0100, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> This series adds pinctrl driver, dt-bindings and dts node for pinctrl
> on mediatek mt7988 SoC.
> 
> changes in v7:
> - add const for pins and mtk_pin_soc as suggested by Christophe JAILLET in v5
> - left angelos RB because of minor change (hope this is right)
> 
> [...]

Applied to v6.13-next/dts64, thanks!

[4/5] arm64: dts: mediatek: mt7988: Add pinctrl support
      commit: e2e02b57f5689b37640263b152edf1997f26b081
[5/5] arm64: dts: mediatek: mt7988a-bpi-r4: Add pinctrl subnodes for bpi-r4
      commit: 6aecde28d98b66c7d526caf4e8a3be046776b727

Cheers,
Angelo



