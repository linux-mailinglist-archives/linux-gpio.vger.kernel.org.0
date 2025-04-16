Return-Path: <linux-gpio+bounces-18923-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D904A8B402
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 10:37:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20CC4189CD8C
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 08:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4B2022FAF4;
	Wed, 16 Apr 2025 08:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="IeoBFVwX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF22221572;
	Wed, 16 Apr 2025 08:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744792662; cv=none; b=gs+SayJ9TZPrK6p7z26obmL/ZGrI/vB4AjZEbRsJL9OM5j5J+wlN4LFC/TvKQOnOlboHi12iwlg4pZIEJ1b0Y6sJnYwcJRIDbMyM2rLvEM+eYwjkaWASqjFG6YTT2i/eYLwIySjABfjvIYCa/UrSpUyAIuIl1mut/MNCO6aTguA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744792662; c=relaxed/simple;
	bh=SFK4utDb6BiPvIgZqYxn3f+Q+Jaf4K4/kobGg3X7CUw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ibx331G8Mml7k9rtYsZ55s0Pjt5vljTspkxKaX0ZUF03ZjPTcsUXqMW/G2vJIcn9XsCYPhHJ0l+BdsclahmP5GJ1gtbme9ZWEG2QwPFMlSD88eL42Ugg8YIurpNJOvm2cs6+Vmau9hi+P1UAegUJ2bng52aiOcZZ3fo0mqhsDjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=IeoBFVwX; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744792659;
	bh=SFK4utDb6BiPvIgZqYxn3f+Q+Jaf4K4/kobGg3X7CUw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IeoBFVwX2ltZCXPMVn+ySHACWJJN4sHulUsnvMqFYeug52ZWQgBfH2WbnZxmR9d04
	 /1vKBKB0h0NCMJ564QZM5UyiWP1ffShol2DM2etow3w6kbHjEd4SSm/x3b5w7jj/J+
	 QKal0lkL//mqk0ry87XcDDbQe274ek84fv0ZG7n7NFw6LlAGt3ECgBrVqH37LZYUv8
	 i55EIOMaXkiecMwDgl0zp/PW+JIA1PlBdY9+LwZV45CtgJ06KgQqPeFDhuTh5egiEf
	 /P5bkayrf74kuMHao7+9NbOrswg/gppmm52kVCPYjdV2pvrlQ70R6QLQAagZ1BIYZ1
	 evRUB+1sVE8AQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5127C17E05F7;
	Wed, 16 Apr 2025 10:37:38 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linus.walleij@linaro.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 matthias.bgg@gmail.com, sean.wang@kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 kernel@collabora.com
In-Reply-To: <20250410144044.476060-1-angelogioacchino.delregno@collabora.com>
References: <20250410144044.476060-1-angelogioacchino.delregno@collabora.com>
Subject: Re: (subset) [PATCH v1 0/3] MediaTek Dimensity 1200 - Add Pin
 Controller support
Message-Id: <174479265826.19309.1291310983060738038.b4-ty@collabora.com>
Date: Wed, 16 Apr 2025 10:37:38 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Thu, 10 Apr 2025 16:40:41 +0200, AngeloGioacchino Del Regno wrote:
> In preparation for adding basic support for the OnePlus Nord 2 5G
> DN2103 smartphone, this series adds support for the pin controller
> of the MediaTek Dimensity 1200 (MT6893) SoC.
> 
> AngeloGioacchino Del Regno (3):
>   dt-bindings: pinctrl: mediatek: Add support for MT6893
>   pinctrl: mediatek: Add pinctrl driver for MT6893 Dimensity 1200
>   arm64: dts: mediatek: Add MT6893 pinmux macro header file
> 
> [...]

Applied to v6.15-next/dts64, thanks!

[3/3] arm64: dts: mediatek: Add MT6893 pinmux macro header file
      commit: c0f1fd9eeb317ee57b62127c8da48b309da0525d

Cheers,
Angelo



