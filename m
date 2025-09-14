Return-Path: <linux-gpio+bounces-26134-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A9AB56BE2
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Sep 2025 21:47:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37DC63B1A00
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Sep 2025 19:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C8672E54D6;
	Sun, 14 Sep 2025 19:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b="K0v43KNh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB402DAFC4;
	Sun, 14 Sep 2025 19:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757879246; cv=none; b=otX4kHfTn/G5ONsZqia4abA6LVojSUny6TUdFvvmLj25YAotdEhOlVD0yed4q0WDHsrq4rc2J6dfyjinv7LD2TF8s9Ns76gr3gO2s3bu1PMnPAkgQ1e8P/V4MToP4CGHEGlNzOlKU2aDJzy7wpLnLOLgsf8QaSl5S/sLrFneU88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757879246; c=relaxed/simple;
	bh=/4oORWxT3GCiIj7It7+nD1OxVv4/w6v87vfNkdvuwPc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DLTZkWCuKAPeU2gcIh2o6SnS6o81RcNb+sjWT3VRJjj18qfOaXwrjCe6f8IlCcz1xCK/6N+SUCk6U2DFbS4LFI+xor3U5ERRd/kl8XSE9zAs2jmRPZYOSD5bb3p9iyrCZvJBzxMCViq7Y1xlt9I8HQYkrHpebKH2esKrf73V8qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro; spf=pass smtp.mailfrom=chimac.ro; dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b=K0v43KNh; arc=none smtp.client-ip=185.70.43.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chimac.ro
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro;
	s=protonmail; t=1757879243; x=1758138443;
	bh=/4oORWxT3GCiIj7It7+nD1OxVv4/w6v87vfNkdvuwPc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=K0v43KNhYt5MYQxTsxPaQAjVy2zOoEvAAgyz7JPJo+0mctK3gNE0V4ziHxxhRDMuv
	 5dj9GF9iVr3UZDFE9aql7/YeciylFCV0Qn3bdN/cKPTvdr0hTNh8UZ6nEeqxHgL56+
	 6CXsV/Bsupu2PazGVUnAiEf8IcZxLZwQPg3qgi7fskx0h8Q/ZrWx6fEHlAahUrVrhn
	 ++TdTPv7fAMA1WtHWOBfh0y3PuXywrCA1OmFyUNg0boDfzcuEcPKvQAOnSIYGy/NQM
	 krEV8UTngLUG8OqaY01+XzubykuVApVSNM+ILYOiTJFkXiLFbP80wz9voIJQG7ud/D
	 oYuzeBYzeB5+g==
Date: Sun, 14 Sep 2025 19:47:18 +0000
To: Alexandru Chimac <alex@chimac.ro>
From: Alexandru Chimac <alex@chimac.ro>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Conor Dooley <conor+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Rob Herring <robh@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 0/3] pinctrl: samsung: add Exynos9610 pinctrl support
Message-ID: <jK4UF0gSnN6odWToPcqZBg0JpcmWN2xotlc7Sw5J8r4ZSrvtTD0GUATPou5d1WMWq8OcrYXR-O4jjjwZh2RwWw8UgFGykoWSuCxEdoeJWrU=@chimac.ro>
In-Reply-To: <20250914-exynos9610-pinctrl-v1-0-5b877e9bc982@chimac.ro>
References: <20250914-exynos9610-pinctrl-v1-0-5b877e9bc982@chimac.ro>
Feedback-ID: 139133584:user:proton
X-Pm-Message-ID: 7f4286e46f67aa9e926ed1afa0bd894d887ee469
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Sorry for the duplicate patchset, I have used b4 send --reflect on this one=
, thinking it would only send it to me for previewing.

