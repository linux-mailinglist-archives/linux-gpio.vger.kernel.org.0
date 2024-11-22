Return-Path: <linux-gpio+bounces-13204-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C3C9D64B6
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Nov 2024 20:54:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2109A1616B8
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Nov 2024 19:54:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3A6C1DF996;
	Fri, 22 Nov 2024 19:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="flyHTufq";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TZw7czQ3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D20A14D452;
	Fri, 22 Nov 2024 19:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732305269; cv=none; b=Qfk+Gxs9CvX0J4vm9zruAeDs4JUD2RFiVLdZJhkniya3bNKtzkbo2WLhsGY/8RvcrxVsvEVKvJurHF0YWxscv+zmjHGDPAIXtP5kA+MHV+Mf1zovO2nZGj1tNDg/YZBMWjAiFwcpfoTBNupKheEjWaU7oFCrChL7boqpAr1r7b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732305269; c=relaxed/simple;
	bh=9+IZS4Yfb3rbRo3ljFPTzWg/seCk6l7dP3p0wc4yl4I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=c3dGbDPYcbx+r0JG4xGu8UxE/gyfqUDpc7cDGjTPLHQ9f1x2Gxt5pqQt/WvAH2RNG5+1PpYhq8zmFDlZA0UUXo0+e/grrPze8Qxw4irecCFAvIgYYtNfExaxa9AXhr3zdvCmupCNEGE89ZMDAE+SVsM9myFPE5ebbQtvoT6yiec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=flyHTufq; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=TZw7czQ3; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1732305265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cxFExT5Drf6NKwKhIQJ7MjREdvTfWvKaWmJ9u6IeRMs=;
	b=flyHTufqhQfVZcPb8mKZbjOazdkgooW9JiIQA4QpSLli8fLjG28QqmJYreG9HDru6L3oao
	Gw6Dv0Yxxl98Qazxa634oOytkG8ARAjy7ugbX1o3n9D0sFsM+ARAWLGJvDX3KqpkqPt4jm
	9ZEa64VsqOC5eAe18ZZLHldCYJRlY4cpkoFGuecbI+XNVyBzqs+9Deq1TxQ0E4D5jj41cV
	fljfKJ87tdv+BOxa/1IBjlY49cEoZVrTl13Nyyt+dPPsJJm59xq2ojtxH1q+r3sCQDlyr7
	lHH/IxI3r0ykiXc1O1tvbdDKTdcRnW0rnblo9TDFayKM6Tlgb9ylmwnyTgzLrQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1732305265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cxFExT5Drf6NKwKhIQJ7MjREdvTfWvKaWmJ9u6IeRMs=;
	b=TZw7czQ3entCag+JjNorSv4qdPQLoz++ypKYd+/J4WebLTPm1vIb0IoLSJ2la5qPriRONA
	vmMqVYdXpzupJ6Bg==
To: David Wang <00107082@163.com>, linus.walleij@linaro.org, brgl@bgdev.pl
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 geert@linux-m68k.org, David Wang <00107082@163.com>
Subject: Re: [PATCH] Fix a potential abuse of seq_printf() format string in
 drivers
In-Reply-To: <20241120053055.225195-1-00107082@163.com>
References: <20241120053055.225195-1-00107082@163.com>
Date: Fri, 22 Nov 2024 20:54:29 +0100
Message-ID: <878qtbyrgq.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Nov 20 2024 at 13:30, David Wang wrote:
> Using device name as format string of seq_printf() is proned to
> "Format string attack", opens possibility for exploitation.
> Seq_puts() is safer and more efficient.
>
> Signed-off-by: David Wang <00107082@163.com>
> ---
>  drivers/gpio/gpio-aspeed-sgpio.c            | 2 +-
>  drivers/gpio/gpio-aspeed.c                  | 2 +-
>  drivers/gpio/gpio-ep93xx.c                  | 2 +-
>  drivers/gpio/gpio-hlwd.c                    | 2 +-
>  drivers/gpio/gpio-mlxbf2.c                  | 2 +-
>  drivers/gpio/gpio-omap.c                    | 2 +-
>  drivers/gpio/gpio-pca953x.c                 | 2 +-
>  drivers/gpio/gpio-pl061.c                   | 2 +-
>  drivers/gpio/gpio-tegra.c                   | 2 +-
>  drivers/gpio/gpio-tegra186.c                | 2 +-
>  drivers/gpio/gpio-tqmx86.c                  | 2 +-
>  drivers/gpio/gpio-visconti.c                | 2 +-
>  drivers/gpio/gpio-xgs-iproc.c               | 2 +-
>  drivers/irqchip/irq-gic.c                   | 2 +-
>  drivers/irqchip/irq-mvebu-pic.c             | 2 +-
>  drivers/irqchip/irq-versatile-fpga.c        | 2 +-
>  drivers/pinctrl/bcm/pinctrl-iproc-gpio.c    | 2 +-
>  drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 2 +-
>  drivers/pinctrl/pinctrl-mcp23s08.c          | 2 +-
>  drivers/pinctrl/pinctrl-stmfx.c             | 2 +-
>  drivers/pinctrl/pinctrl-sx150x.c            | 2 +-
>  drivers/pinctrl/renesas/pinctrl-rzg2l.c     | 2 +-

Can you please split these patches per subsystem (gpio, irqchip,
pinctrl) so that the respective maintainers can pick them up
individually?

Thanks,

        tglx

