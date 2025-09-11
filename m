Return-Path: <linux-gpio+bounces-25955-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E6FB53494
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Sep 2025 15:55:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF8515A7073
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Sep 2025 13:54:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 668263375CD;
	Thu, 11 Sep 2025 13:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="LkK6jdpx";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HnHouNSe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1C8335BBB;
	Thu, 11 Sep 2025 13:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757598746; cv=none; b=Uze7yOf9Du22il+82coWq8ABTekp7TCJWf1Kkxrv+7CqbB2XHs1kq9Q9kNKDA04HdUnrd+YbRwB8aUxNs0TYfB+At9VM4NAN5Pa1ofLNrgcdhNF67BVuvNsSimdEeVcNiPL4WpZklsIb+ucBr3fUVdyu7j2MlAg+trrNFNAHDEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757598746; c=relaxed/simple;
	bh=deGvupzM/LLKwOeN5SKhrOyqbm5RrItp4EoBaXJwJCM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=O2WzBguI/jdHVobNGI098Bm+zRFNRxM7WRW3HXBvFBJOcfYpNEbmpiq3rMgjIYFJunsqejQ2zONpARPCR7FUfxc6LSwkP+B3dxYET7qa3EYrT2U37TVg+gU95D55EV6QkgZYvcNle5Hv0WyXVe7+ILqLg7LdUs5TfLwLGfAW8c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=LkK6jdpx; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=HnHouNSe; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1757598742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C92gKHTmPMKru6z9KnmAjno8euROQELszOPMKezd0q4=;
	b=LkK6jdpxw21FjYkLcj1CNXjZ4trzKKHygKuDeJVQAC72SCjmTtdwpmSDIVJtOfvxUTtu/E
	MrkjH9BZm9gcLa8xnTG+kkxvGY2DQJ/zGj+PXZSKW99G0V5DeX96wFvl+85VdqGdOisqAe
	JrXYBwsSYyn9+ed/hrwNvwa9k6kWby3U9Po8aMzo6jNERFwwiCSK72ldY/U1f/hR+uqIZE
	Oq9BVCOQutMM7+wZJIkIxg5h3u4koSSlorKovwuReQMFsYxcFeZ9oqhEanhx5i0mB1ogxg
	4mRhgP43rBruIFfHEXSdV6yYmTXwKqDoLXKk7fTjaWRU0UnDAHpbrnnMfPGWGg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1757598742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C92gKHTmPMKru6z9KnmAjno8euROQELszOPMKezd0q4=;
	b=HnHouNSegRS6LE+/7RLUmAhvPaJKyUXtknAuAb6SrGfH+ZreDU91Pnl0x68VvI5zDFg8m/
	fIoDD0wV6LaRjvDg==
To: Herve Codina <herve.codina@bootlin.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Hoan Tran
 <hoan@os.amperecomputing.com>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus
 Damm <magnus.damm@gmail.com>, Saravana Kannan <saravanak@google.com>, Serge
 Semin <fancer.lancer@gmail.com>, Phil Edworthy <phil.edworthy@renesas.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Pascal
 Eberhard <pascal.eberhard@se.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 0/8] gpio: renesas: Add support for GPIO and related
 interrupts in RZ/N1 SoC
In-Reply-To: <20250911090450.32c7cdbe@bootlin.com>
References: <20250909120041.154459-1-herve.codina@bootlin.com>
 <87y0qntkmy.ffs@tglx> <87segvtkha.ffs@tglx>
 <20250911090450.32c7cdbe@bootlin.com>
Date: Thu, 11 Sep 2025 15:52:21 +0200
Message-ID: <87cy7xrt9m.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Sep 11 2025 at 09:04, Herve Codina wrote:
> On Tue, 09 Sep 2025 22:54:41 +0200
> Thomas Gleixner <tglx@linutronix.de> wrote:
>
>> On Tue, Sep 09 2025 at 22:51, Thomas Gleixner wrote:
>> > On Tue, Sep 09 2025 at 14:00, Herve Codina wrote:  
>> >>   Patch 5 (new in v2)
>> >>    - Convert irqchip/ls-extirq to use for_each_of_imap_item
>> >>
>> >>   Patch 6 (new in v2)
>> >>    - Convert irqchip/renesas-rza1 to use for_each_of_imap_item  
>> >
>> > How are those two patches related to adding GPIO support?
>> >
>> > AFAICT, they are completely unrelated and just randomly sprinkled into
>> > this series, but I might be missing something.  
>> 
>> Ah. I missed that this iterator got introduced in this series. Did you
>> check whether that creates any conflicts against pending irqchip
>> patches?
>> 
>
> Indeed, I have a conflict in my patch 6 with 40c26230a1bf ("irqchip: Use int
> type to store negative error codes").
>
> I can rebase my next iteration on top of 40c26230a1bf and mention this commit
> in my next iteration cover letter but an immutable tag and referencing this
> tag in the cover letter should be better.

No. Don't do that.

> What is the best approach?

Just base it on upstream and mentioning the conflict in the cover
letter. For actual merging, if it's ready before the merge window, we
can sort it out by:

  1) You putting patch (3-6) in front of the queue

  2) Me picking up these 4 patches into a separate branch based on rc1
     or later, which gets tagged and is consumable by the GPIO
     maintainers.

     Then I can merge that branch into irq/drivers and resolve the
     conflict, which is trivial enough

Alternatively GPIO folks pick up the whole lot and sort the conflict out
with -next and Linus themself. No real preference from my side.

Thanks,

        tglx

