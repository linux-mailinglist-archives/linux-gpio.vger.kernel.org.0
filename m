Return-Path: <linux-gpio+bounces-25929-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D94E6B5298B
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Sep 2025 09:05:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B1B4A00C43
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Sep 2025 07:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1C12265632;
	Thu, 11 Sep 2025 07:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="R81DX7l4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E300226D1F;
	Thu, 11 Sep 2025 07:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757574348; cv=none; b=G+YZiZLpzIwcAiAgqDNG+JkZai6mFT3KyEwyq5TnaFw78Wjpr+oHVBM1PVo22XjJGngJBrTRBNOMyt67wrhz9f1E3yppmb2jkZL3iTB4C6Bcbjv3jQpnluCmbf/cc5DCxx78Q2bJVR6AGHZGHSyXe1PRynW+x63WrYE7HDHx3bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757574348; c=relaxed/simple;
	bh=yyiUFUCUBmqE1yB6VFtqNmcfwBmBV2+S6J/sE/W3Yq4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ezXL84eHjJcnH5ERw5IXfqOiqSNUOl2HZDRolLrcFez30kdIliD38nq4ODwc6EoGgsquzuC8CSOAJkDtiATN0qQpHlQtV0rEgX/uTKCTHmuUWB57JsRfx+CDS9hRmcpM1BXo4bL4/G0C6Zv02QQdi8dChlaOlJdXp31owwosm98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=R81DX7l4; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7394CC6B3AB;
	Thu, 11 Sep 2025 07:05:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 29A29606BB;
	Thu, 11 Sep 2025 07:05:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D42F0102F28D9;
	Thu, 11 Sep 2025 09:05:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757574342; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NVEKI7kAnykMj9HJvXc3qX3+FSJ439W0rcfUBK46rSw=;
	b=R81DX7l4+R9LcCwr7NzF9EUT276PBC5ktIypbV1Fuac8PHzflskebnl//yUwDRQIcH/klV
	auTbKgwMC3TCiRzV0GylY3Q4GdhXGR19/JVFLKHcWyjEJqNLzbEOM60/c+z2EOL7if4k6H
	BQT8B8lVwAXjHqMrsBi6Js48w5J+byicIuk7va5tDOcoo/PCs9FSkCEAsvSWxJHbfaEtV3
	LVK84lT2lghh1Q8Fw2ipSmW3NPRHndCeso4AWmXR8jNudsf17jk5saTmU0qLu7XvrgfjEZ
	qmI67rmjvsrzXvtGvfHS6H7xqd3wifwYho9+pqXxcAg4XxduYfsJhcld7zSN+Q==
Date: Thu, 11 Sep 2025 09:04:50 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Hoan Tran
 <hoan@os.amperecomputing.com>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus
 Damm <magnus.damm@gmail.com>, Saravana Kannan <saravanak@google.com>, Serge
 Semin <fancer.lancer@gmail.com>, Phil Edworthy <phil.edworthy@renesas.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Pascal
 Eberhard <pascal.eberhard@se.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 0/8] gpio: renesas: Add support for GPIO and related
 interrupts in RZ/N1 SoC
Message-ID: <20250911090450.32c7cdbe@bootlin.com>
In-Reply-To: <87segvtkha.ffs@tglx>
References: <20250909120041.154459-1-herve.codina@bootlin.com>
	<87y0qntkmy.ffs@tglx>
	<87segvtkha.ffs@tglx>
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

Hi Thomas,

On Tue, 09 Sep 2025 22:54:41 +0200
Thomas Gleixner <tglx@linutronix.de> wrote:

> On Tue, Sep 09 2025 at 22:51, Thomas Gleixner wrote:
> > On Tue, Sep 09 2025 at 14:00, Herve Codina wrote:  
> >>   Patch 5 (new in v2)
> >>    - Convert irqchip/ls-extirq to use for_each_of_imap_item
> >>
> >>   Patch 6 (new in v2)
> >>    - Convert irqchip/renesas-rza1 to use for_each_of_imap_item  
> >
> > How are those two patches related to adding GPIO support?
> >
> > AFAICT, they are completely unrelated and just randomly sprinkled into
> > this series, but I might be missing something.  
> 
> Ah. I missed that this iterator got introduced in this series. Did you
> check whether that creates any conflicts against pending irqchip
> patches?
> 

Indeed, I have a conflict in my patch 6 with 40c26230a1bf ("irqchip: Use int
type to store negative error codes").

I can rebase my next iteration on top of 40c26230a1bf and mention this commit
in my next iteration cover letter but an immutable tag and referencing this
tag in the cover letter should be better.

What is the best approach?

Best regards,
Hervé

