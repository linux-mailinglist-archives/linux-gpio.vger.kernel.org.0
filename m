Return-Path: <linux-gpio+bounces-27010-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21197BD27CD
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 12:12:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4D723A6E18
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 10:12:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8E0C2FE583;
	Mon, 13 Oct 2025 10:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="BfIjGVpt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FB42FE06F;
	Mon, 13 Oct 2025 10:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760350359; cv=none; b=aCqCUh47Au6SL++MGq7ZrjMYB59YMDb5OeJNvGxkq2Gbgz6hX4EUrdv5gsg8pYmibnGGeL3qvqMysgEjcqk2N/O6qIz7q1jSVGdAryKRMPPOikgbl46Uo78Lo5UWEez6EiG/0njbLExa+EYFi30PF8aXg7OgZb1NbNDvkqRLLyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760350359; c=relaxed/simple;
	bh=fvody/N+TtFr8YaKm9xxOM5M8VJxlmWe1gbQsXl9S3I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JQLd1q04DllgKDPIZp5V8FXBoI6oeBWfz3h8ZsW97UGPLxkKagp36yU8brGSJMORwuVl1NyjFl0yeuxCyyLeuYRxrfjBv/yFx6fV4quuCi+DRVzq9woPunGjslCM71w2a6v8W31lck/agB7WeWvc2CECgkMJgASCu8S2nzkDRtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=BfIjGVpt; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760350355;
	bh=fvody/N+TtFr8YaKm9xxOM5M8VJxlmWe1gbQsXl9S3I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BfIjGVpt7PFZysR2qzYqH7yRDuXrtlLlkPcg+gY1dpqRUy4/kFznU2Cdl6wteExCi
	 U66JuBxEwNJmDCavBRifnBvh7t4zUi0AEgMg8Z0DlD5PZr3fFkSifQ5ShBsGgWQTpk
	 znqHKMUNA3pWtUFAJt5nbaZgEwW7MLOGL5/OoOiJGOI6d2W99Cb/inkR/NxaSe/v89
	 Uio+8tLkFxIdFR7KdZM316wVx/8Pr0AvWJsorriCVDjw3Uc3PxP3PrBYEDpr3wrmbZ
	 CjgDy+0v/g3v9SNjRTyN26HFJCnLkjWGVSLZEp4AQ6c+1Q4zmPPWQlSDiMTCNpnJJz
	 sHcz6pNssAUHg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 45CF817E0023;
	Mon, 13 Oct 2025 12:12:35 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20250915-mt6878-pinctrl-support-v3-0-593cc007d4cf@mentallysanemainliners.org>
References: <20250915-mt6878-pinctrl-support-v3-0-593cc007d4cf@mentallysanemainliners.org>
Subject: Re: (subset) [PATCH v3 0/4] Add support for mt6878 pinctrl
Message-Id: <176035035521.25543.3841544464727224416.b4-ty@collabora.com>
Date: Mon, 13 Oct 2025 12:12:35 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3

On Mon, 15 Sep 2025 14:46:22 +0200, Igor Belwon wrote:
> This patchset adds support for the pin controller found in the MediaTek
> MT6878 SoC. This SoC has 9 pinctrl groups, and 4 EINT controller
> instances.
> 
> This SoC also uses the new "eh" bit for controlling i2c driving, support
> for which is also added here.
> 
> [...]

Applied to v6.18-next/dts64, thanks!

[4/4] arm64: dts: mediatek: Add MT6878 pinmux macro header file
      commit: 07a9bd3079e307fb214d391e4cae7d4090d02c89

Cheers,
Angelo



