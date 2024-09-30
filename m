Return-Path: <linux-gpio+bounces-10544-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EFE9899CA
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 06:38:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D7520B21F84
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 04:38:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B78F077F11;
	Mon, 30 Sep 2024 04:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="O9tPJYQZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102562F29;
	Mon, 30 Sep 2024 04:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727671103; cv=none; b=I/lkQ3O78MaOF9GDB0sprt/RWAy25QEblIK50LHYVMDcvRxTI4Ll+lCagirVSBGm2VUDzkN8PsSIGJok4WIB6BthOCQ3iJR5QVfRYTiWsRCkEgcVZuMluUNhvI2EBULvhbOR3zQBwh18ikGGYYFXyrRPSRJLCtMYfyuWkB9UigI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727671103; c=relaxed/simple;
	bh=URG6eboprcEIgY7CaSGCDE/rTne4uZU4fMz0sjWKlIE=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Jbet0Y/PDLDbD61HMB75UFew/EbFrNox3ZKmpZdvGWICy6ThUnYTo8E60UuJjWAIyke6dN9l/f9uCKx/7WwiPhZstHRKk+VEDV1fU6Wa1h61OBiLtK7p0wDjKiUcATlNhNEyBhturUgd/HjgPWaZaIneEhxJpV71eMyx2KA1Ht8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=O9tPJYQZ; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1727671099;
	bh=URG6eboprcEIgY7CaSGCDE/rTne4uZU4fMz0sjWKlIE=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=O9tPJYQZXX6v1lvPJe58M3PJkTSW2Zr9Z/2oUAfOLHIohUWxFyR+xJp6/FBryhWcb
	 c5nrWXh531GidqIlFPcrapJkD5T1MXJTFFkxHZCQtIXR2rMqhtam3tjbDsSJdUOeAs
	 IMuo2jwNuWHIGDH7oGy7kYpQdB7mNZpWRR/D2D9zhHTYwLrxyj/Wq56pH+XNclixX1
	 vPyUOD33mUzFWEcxrmuT+SpASrj2TFl1OcUMDT2DKi5zFQsZZQJWyrgQteYM+PZUl5
	 C9wsK4Va5h5eSeQOo/TDXbgGQiJsNI9gfw0hlh8y/LR+rQyBNyJWRhjRKq4ulg74MQ
	 1WEkCJkmshE3w==
Received: from [192.168.68.112] (ppp118-210-73-17.adl-adc-lon-bras32.tpg.internode.on.net [118.210.73.17])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id F1F0E6511E;
	Mon, 30 Sep 2024 12:38:18 +0800 (AWST)
Message-ID: <97163102cad92e9bf6cc3609295a27af60c8df7e.camel@codeconstruct.com.au>
Subject: Re: [PATCH v6 6/7] gpio: aspeed: Add the flush write to ensure the
 write complete.
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Billy Tsai <billy_tsai@aspeedtech.com>, linus.walleij@linaro.org, 
 brgl@bgdev.pl, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 joel@jms.id.au, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com,
 Peter.Yin@quantatw.com,  Jay_Zhang@wiwynn.com
Date: Mon, 30 Sep 2024 14:08:18 +0930
In-Reply-To: <20240927111744.3511373-7-billy_tsai@aspeedtech.com>
References: <20240927111744.3511373-1-billy_tsai@aspeedtech.com>
	 <20240927111744.3511373-7-billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2024-09-27 at 19:17 +0800, Billy Tsai wrote:
> Performing a dummy read ensures that the register write operation is full=
y
> completed, mitigating any potential bus delays that could otherwise impac=
t
> the frequency of bitbang usage. E.g., if the JTAG application uses GPIO t=
o
> control the JTAG pins (TCK, TMS, TDI, TDO, and TRST), and the application
> sets the TCK clock to 1 MHz, the GPIO's high/low transitions will rely on
> a delay function to ensure the clock frequency does not exceed 1 MHz.
> However, this can lead to rapid toggling of the GPIO because the write
> operation is POSTed and does not wait for a bus acknowledgment.
>=20
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

