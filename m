Return-Path: <linux-gpio+bounces-25845-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 269ACB50786
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 22:54:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D5DA41721DD
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 20:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D62D3570CF;
	Tue,  9 Sep 2025 20:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="YLGyeoiV";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Us2q6nyK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E971FF5F9;
	Tue,  9 Sep 2025 20:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757451286; cv=none; b=RgpoH1k0jDrL0d/wxscGUbJI1icU4h+QDA0+J4pf3vOH55RW6HCs0fgaygdUqgSceMaydyj2lwvChs0s7+SAi5xCk6E3gQyca/1goDwYbG0m7MyRAMvxCDnqdktIVCUkKLtUOhPSTBqx5ATPzYclmkm2RBbui9Kha8ujs0RI8mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757451286; c=relaxed/simple;
	bh=XqAqhs3y0VFflsnQgSawTmFxYdZPDglEn3soXAqjbn4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=s+XnximxRrRnPbQ5wpuoQbc9aKj2IICLQ2P8hL+GFilR1sUCZOniOTMlENybXGS+0/7ysxxQxDn26rOVb+8jvIZXz2BeSnUNqbAlht+00KiTY1NyC8Dkn4m1EEyGbb15iUrkG1rJfPuBPAlxoEZqj3cuReJHPGXIu6a87U0HlUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=YLGyeoiV; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Us2q6nyK; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1757451282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0vN8pz0yrXIMQO5xb2df9jFntmcg9mOG5Xw2A6HyEOU=;
	b=YLGyeoiVRytupSrkj9SJrPIb+In1vLcBc2XxDqOryD1DkuiH8ardu2gUngweYC1MKNNCuQ
	khYwSZsJkCwu/iaLJSTzOJdZ71S6jyYviw3BuoUeCOFSrx7wDuGM7FnWpjmc/PyAZ8+zNF
	uoOGgGq2u0w1WEd2CW8y9D3Ypcdtn5CZ3PVqYUSe8adNJU/5LG3CAl5irfYe+SbmSMgVg+
	Nan1/wN3LgzkivGmSqu98RjmudERF9L31F/gPQaw/MYnRstVA/tbAieGO5BDi/rkhWSoMs
	/jbZaBYrxr3ktpKBTC0OSrTL/lndCeVrQ5uVPvxMsYtC69u3C63B9d7h17YCuQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1757451282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0vN8pz0yrXIMQO5xb2df9jFntmcg9mOG5Xw2A6HyEOU=;
	b=Us2q6nyKqrdxCgWq3ewZ1jXKN7R0zAJY7SV0jsE0uKbq5bN6rzuc17UcdgtambATo02FS9
	fwZfeDevc1CRudBA==
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>, Wolfram
 Sang <wsa+renesas@sang-engineering.com>, Hoan Tran
 <hoan@os.amperecomputing.com>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Saravana Kannan
 <saravanak@google.com>, Serge Semin <fancer.lancer@gmail.com>, Herve
 Codina <herve.codina@bootlin.com>
Cc: Phil Edworthy <phil.edworthy@renesas.com>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Pascal Eberhard
 <pascal.eberhard@se.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 0/8] gpio: renesas: Add support for GPIO and related
 interrupts in RZ/N1 SoC
In-Reply-To: <87y0qntkmy.ffs@tglx>
References: <20250909120041.154459-1-herve.codina@bootlin.com>
 <87y0qntkmy.ffs@tglx>
Date: Tue, 09 Sep 2025 22:54:41 +0200
Message-ID: <87segvtkha.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Sep 09 2025 at 22:51, Thomas Gleixner wrote:
> On Tue, Sep 09 2025 at 14:00, Herve Codina wrote:
>>   Patch 5 (new in v2)
>>    - Convert irqchip/ls-extirq to use for_each_of_imap_item
>>
>>   Patch 6 (new in v2)
>>    - Convert irqchip/renesas-rza1 to use for_each_of_imap_item
>
> How are those two patches related to adding GPIO support?
>
> AFAICT, they are completely unrelated and just randomly sprinkled into
> this series, but I might be missing something.

Ah. I missed that this iterator got introduced in this series. Did you
check whether that creates any conflicts against pending irqchip
patches?

Thanks,

        tglx

