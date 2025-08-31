Return-Path: <linux-gpio+bounces-25242-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B6672B3D27D
	for <lists+linux-gpio@lfdr.de>; Sun, 31 Aug 2025 13:33:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75AE117CC4D
	for <lists+linux-gpio@lfdr.de>; Sun, 31 Aug 2025 11:33:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 906A8256C91;
	Sun, 31 Aug 2025 11:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="BAuJaLot"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF772376FD;
	Sun, 31 Aug 2025 11:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756639991; cv=none; b=d0t1RY8HmKFoWcJ9HnOi9VS52tAsgW7kExSddLvTT86I2Tm8KK+3xWFSsTuMxNxyfTKjXf1wvIFeKmvmOCmtugXPBhKp0QyiZb6TmwPbycarpCNNpWaVHgJK7ojfKx/5N0BS0XipJ6x8ojVLvmDIDEMuI9/HPNEP4UXs8XzWk08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756639991; c=relaxed/simple;
	bh=N6aTPDmdRCL+AEhB5sRE31SuZeCdrOZpV6vf6qMg3wY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U7CiCnF7+Fz1ifoz5QRd7/EFNARswXvhxQUU95pri6WvwMetc0KOmybu3uIkdWU64Efju5pwa17HvwDofcNtOukFO8g5v2QN5VjAnk0Jr14y0a6y26WDagGTW0chC4PQASWhkTN67tIguHHW1i+J7d8nWDo1JK/dK+TNguVZjpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=BAuJaLot; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id CB71E25CC7;
	Sun, 31 Aug 2025 13:25:42 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rLnMHuF2prBy; Sun, 31 Aug 2025 13:25:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1756639542; bh=N6aTPDmdRCL+AEhB5sRE31SuZeCdrOZpV6vf6qMg3wY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BAuJaLotQdE1du/blkqh9q6wAF5LU7Kiw6BI8wvIC/I3IpPzoo+uY2ZK2RyaZLKnu
	 C9lUU+5wWNCxYu/6VtNaj2l/E2REngKkBOtKKK3N7SRrogSoP6EQWNzlc119SFp2hG
	 ijqwo0t7SqKmQ72qdyOCSUp0G4oXpM475pWvwicdl8pyR/XZsy9l9oPNQPEy1w9R3n
	 +RLTigVz7OEV0Xoq3DTKfRiTM3xc4ro/CZQH54VCAq0pF+TvfqNCRSyyz2HkAkAQc0
	 Np+yDrGYF2gjGIDd24e0sae6NsfrxcVX/91gNiLFgWMJWQjACHUdgLzNJsgCl8P7px
	 WcMI/b+D1+e8g==
Date: Sun, 31 Aug 2025 11:25:23 +0000
From: Yao Zi <ziyao@disroot.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Yinbo Zhu <zhuyinbo@loongson.cn>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, Mingcong Bai <jeffbai@aosc.io>,
	Kexy Biscuit <kexybiscuit@aosc.io>
Subject: Re: [PATCH 0/3] Support GPIO controller of Loongson 2K0300 SoC
Message-ID: <aLQxI9oixzsFX4NG@pie>
References: <20250816035027.11727-2-ziyao@disroot.org>
 <CAMRc=Meed_x_OODv1fw1m7rpLY4uGic=0pacjV+Mj147_WMZPg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Meed_x_OODv1fw1m7rpLY4uGic=0pacjV+Mj147_WMZPg@mail.gmail.com>

On Sat, Aug 30, 2025 at 09:49:46PM +0200, Bartosz Golaszewski wrote:
> On Sat, Aug 16, 2025 at 5:50 AM Yao Zi <ziyao@disroot.org> wrote:
> >
> > This series adds support for Loongson 2K0300's GPIO controller. While
> > being mostly identical to previous implementation, its interrupt
> > functionality hasn't been implemented in gpio-loongson-64bit.c. PATCH 2
> > implements its interrupt support with an IRQCHIP, and the code could be
> > reused for other Loongson SoCs with similar interrupt functionality like
> > 2K1500 and 2K2000.
> >
> > Tested on CTCISZ Forever Pi, reading/writing GPIOs works correctly, and
> > both level and edge interrupts could be triggered.
> >
> > The devicetree patch depends on series "Support reset controller of
> > Loongson 2K0300 SoC"[1] for a clean apply. Thanks for your time and review.
> >
> > [1]: https://lore.kernel.org/all/20250816033327.11359-2-ziyao@disroot.org/
> >
> 
> Hi!
> 
> This doesn't apply on top of current gpio/for-next. Can you please
> rebase and resend?

Sure. I'll send v2 soon.

> Bart

Best regards,
Yao Zi

