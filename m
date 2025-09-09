Return-Path: <linux-gpio+bounces-25843-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CE4B50777
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 22:51:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EB4144E35CB
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 20:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58D923570DD;
	Tue,  9 Sep 2025 20:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="EQVWFM/P";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xox5oHEC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA85731D360;
	Tue,  9 Sep 2025 20:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757451081; cv=none; b=LG+7SrTIufMWfxSlIVbBq7fto2urlKX2X12JmGQ+J+lv+QQKWfCbP6OfqtZbUQqp8EErh7e7rTJkeVKQbKmiTCGLxtISjkhuPZSZyIf+QTc9pqv3a8fy9D0aRKeNDrxfYDWBheIbHikzHraQL1zd54N8iMJ/0Eh1zDMDfrmAVzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757451081; c=relaxed/simple;
	bh=xUEK4jzi4Vz4eWm4g+qhOIKAE5TwzpnPITRSNh8X3kU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jUsxmu0lwNb35JQhseddXi/qaNuDEc45+TrcsdJtfognesZ2IsY7+l/UqIBDThR+0bXKQYHTuHP031TRsSv+K8C1T+rcgnFHImCVq8JWNRpEusXOydsngqtx7XUjcFhJL0g/8n1khCYeaJ8ebaPH1ATDyUUWgcYj7KGF/8lnL2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=EQVWFM/P; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xox5oHEC; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1757451077;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p8QUBgQ3WJF+KMNYhEdzp9jwBsMUpUyniiH5ZXHVhO0=;
	b=EQVWFM/P+NynyZKIFzI7567v418vGpUh6F28b5/kN8FxyDuOF7YFYw8y91RRroWl3X4GEo
	bZ/UO4qDysBgUw4q8P+HPfQiyBbIPShhSF31g4NYIh3EEWiDhmGg79LamHIVLdDgelBDAd
	0A+U+F2sE5Kwb+0Rxa6MTW8x+xeEmNyfnHJNIk3AYXaK4b4zu5PQoUsgIBlu6P7PZjMpsh
	jxIZN4S2zx5TNV8Pkq3VKBdB2cC5/R5bDkpCfeopUlcfybVU138/QtmhEYlQwTCZR+NyCG
	mJZ4CRwv0XJfJ/kDP+3NcsvQqd2/mau9LtohjKadD722Ol1pxkbZuYeyCByBRg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1757451077;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p8QUBgQ3WJF+KMNYhEdzp9jwBsMUpUyniiH5ZXHVhO0=;
	b=xox5oHECkG96HqLQ8D9/vnmywIxK6L3jV5OCTFaq1ik9/c1Dmh/tmLsocg4k+eKzRiKuu7
	zZkeWK0FJBOk7GCA==
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
In-Reply-To: <20250909120041.154459-1-herve.codina@bootlin.com>
References: <20250909120041.154459-1-herve.codina@bootlin.com>
Date: Tue, 09 Sep 2025 22:51:17 +0200
Message-ID: <87y0qntkmy.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Sep 09 2025 at 14:00, Herve Codina wrote:
>   Patch 5 (new in v2)
>    - Convert irqchip/ls-extirq to use for_each_of_imap_item
>
>   Patch 6 (new in v2)
>    - Convert irqchip/renesas-rza1 to use for_each_of_imap_item

How are those two patches related to adding GPIO support?

AFAICT, they are completely unrelated and just randomly sprinkled into
this series, but I might be missing something.

Thanks,

        tglx

