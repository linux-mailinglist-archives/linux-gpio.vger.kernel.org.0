Return-Path: <linux-gpio+bounces-28487-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F68C5CE5A
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 12:41:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C3283BC7DD
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 11:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD8C43148AA;
	Fri, 14 Nov 2025 11:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="sPJ4+2wT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FD63128C1
	for <linux-gpio@vger.kernel.org>; Fri, 14 Nov 2025 11:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763120456; cv=none; b=f58gT0odo5+ewxRuH1bvzt5vFo5b/XTHaggq2n8L7AmMVxg3y4TgZonklJYa9sXsNr0XDd2Cshu25i1+5MBY+zWEb/JDJ0xCZktnG+buZpYX8KJQPaNBipwqRdtGr1+BaBUAsm5vrOJQnJ6GITGUYCOowXxVW5z1f98K4WSo7w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763120456; c=relaxed/simple;
	bh=aZyU/ElH6hMcrIBn8ZOUk9J+B9V1pZQ9uCzI7mYafL4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nVrqkGT9Y38RXeliwSlou9quTsNuIa8gqwyYBz39VeyPgMm4zQVuoXdDUHUNxpXfclhsPdUPoAoRI1K1+Kv7VaWPQXViVhytLjePc69TTUHewU1heMCCy44o0UDRYKQdBdWFDrFJmyCRNm6lLl73n3g4NbieXZm88++UV7MaVAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=sPJ4+2wT; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B4883C10F5E;
	Fri, 14 Nov 2025 11:40:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 70D616060E;
	Fri, 14 Nov 2025 11:40:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D179D102F292F;
	Fri, 14 Nov 2025 12:40:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763120451; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bXcbgC4hNhYtnxJo4MqBvSdSS5O8jgqGadYWZpV26P0=;
	b=sPJ4+2wTm70LMKJwP8taA+rz8t06WtEd6cGe/uhKEDPZHpFDeLgGBeSs19YIhmQ0hM4QfL
	L6+Kx2lvMG3DNKP6o3hYVKyn1ZUjttET5eGyAQHdI1gJpAiBdN4xMANtqGknNDi+AuOqmo
	yQET6mVMrzh/y1u9/WErZRVjqBU5vVlbaj3jJwO6I8LdYUKixLMN2Q7ycRwdveTyZu3DuD
	H5GKT8331M0D+8lZ6PHwlmqoTCXxZ34J0WRxMRMzf89v1zK4AFTfHwYBTuMQQR6EkQErv/
	ywbE2w2G8Nzm/R8XbUG3BFNxdyWAHdQvwZcDIuWovtXIRyi6obqR7yDC/gHMtg==
Date: Fri, 14 Nov 2025 12:40:45 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Saravana
 Kannan <saravanak@google.com>, Serge Semin <fancer.lancer@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Hoan Tran
 <hoan@os.amperecomputing.com>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Phil Edworthy <phil.edworthy@renesas.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Pascal
 Eberhard <pascal.eberhard@se.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v6 0/8] gpio: renesas: Add support for GPIO and related
 interrupts in RZ/N1 SoC
Message-ID: <20251114124045.16204839@bootlin.com>
In-Reply-To: <CAMuHMdU1NmeCyNu8mHJ=Pb5WKjLkCucZ-XyNKPS5t1Kmt90bmw@mail.gmail.com>
References: <20251027123601.77216-1-herve.codina@bootlin.com>
	<20251114084122.01a0d281@bootlin.com>
	<CAMuHMdU1NmeCyNu8mHJ=Pb5WKjLkCucZ-XyNKPS5t1Kmt90bmw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Geert,

On Fri, 14 Nov 2025 10:43:40 +0100
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi Hervé,
> 
> On Fri, 14 Nov 2025 at 08:41, Herve Codina <herve.codina@bootlin.com> wrote:
> > On Mon, 27 Oct 2025 13:35:52 +0100
> > "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com> wrote:  
> > > This series adds support for GPIO and GPIO IRQ mux available in the
> > > RZ/N1 SoCs.  
> >
> > The series seems ready to be applied even with the minor feedback from Wolfram
> > on patch 6.
> >
> > Do you expect a new iteration from my side or do you think this v6 iteration
> > can be applied as it?  
> 
> Sorry, I only realized yesterday that the GPIO Interrupt Multiplexer
> driver resides in drivers/soc/renesas/.  Before, I mistakenly thought
> it was part of the GPIO subsystem.
> 
> Anyway, it is a bit late in the cycle for me to take more patches for
> v6.19 (I am about to send my last PR right now), especially given the
> patches touching the DT and irqchip subsystems (with the DT ones being
> a hard dependency).
> 
> So I suggest Rob takes the first two patches for v6.19, and we revisit
> the others for v6.20 (including late review comments), without having
> to worry about dependencies.  Does that sound OK to you?

Sounds good to me, thanks.

Best regards,
Hervé

