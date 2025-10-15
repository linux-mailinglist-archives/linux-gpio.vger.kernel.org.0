Return-Path: <linux-gpio+bounces-27142-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A3CBDCB28
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Oct 2025 08:21:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CED5F1894F62
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Oct 2025 06:22:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3ACB30FF28;
	Wed, 15 Oct 2025 06:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="rePeuf/p"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CC026E16E
	for <linux-gpio@vger.kernel.org>; Wed, 15 Oct 2025 06:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760509290; cv=none; b=WwOxlvIfyBjClZ+JUfQ4ANbrd1YgKd15nFtGpSW+8c33rksilleZ+JoJndrpRGX0eWCUqvWXjDLfG+CfxZLeV9xprv+9pXtsgumyp0BNO8Jd1Bpza40dJSFmJEofCOtccFDLszkXoYLR1qg928+dNGJCQsJR36Q+qEbegI8mxzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760509290; c=relaxed/simple;
	bh=DicfJkkTsiij02qIVcRFiHOl97sEIvQS0/C6n7EV7gQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W2fBkYOxbkkfz9rrDKCXXZPrKcXX6wJzXFteXnoHVi2HBZeXk6rXup5dPEkgTgscXgzvO4U+eEtNNHbNRtHa5E4Kmdfbk/+4C982Y1dcCfOD3OlQSXnlSgu3trpwJRW3bsGZcZ+T88vV5ydRlUtjexEpsyvYx75ZRJ8Vw7vi1/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=rePeuf/p; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2826E1A13A2;
	Wed, 15 Oct 2025 06:21:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E634B606F9;
	Wed, 15 Oct 2025 06:21:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 59C5E102F22AA;
	Wed, 15 Oct 2025 08:21:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760509277; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fJomQq7OE3Maiesqwu9sZQP6LCVhewRSpZqk8JBWs78=;
	b=rePeuf/p5urYuOHJ7Zc4gd2xvA5MR+RBRetK2TQGnYv3G82ImEFQQA1N5ktsEIh14SeIAx
	9bH4ohXrP0yiFVsi1Qu/mYchA8TM5xuzpWGlDOGT3254tDREKHcnCfElp6LIG2GhcdidM/
	8TN5kaMTuf3zdluXLUBnzuAYmqEHEMkUQ20/z7ZgBv8/qHHoTfW9IwradnDyX8jG5pS3m1
	6FKTWFrbIlhVRROiQg6Y54Tc4YLJrMGHCN0V6wLTskGZgeAWH504REFi/k43+yOMVWkaSt
	wgerD0FWa8rOO2YZWyDQtXlqOxoMSpy++EaoxBNiR/sg9QRdOFQsPXA5/83H5A==
Date: Wed, 15 Oct 2025 08:21:03 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Hoan Tran
 <hoan@os.amperecomputing.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Saravana Kannan
 <saravanak@google.com>, Serge Semin <fancer.lancer@gmail.com>, Phil
 Edworthy <phil.edworthy@renesas.com>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Pascal Eberhard
 <pascal.eberhard@se.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 7/8] soc: renesas: Add support for Renesas RZ/N1 GPIO
 Interrupt Multiplexer
Message-ID: <20251015082103.7907e019@bootlin.com>
In-Reply-To: <CACRpkdacJCp8aCCrCAzD5F=_K3g25t_8kZGzaEoXMBnhY8hkzA@mail.gmail.com>
References: <20250922152640.154092-1-herve.codina@bootlin.com>
	<20250922152640.154092-8-herve.codina@bootlin.com>
	<CACRpkdZPURiag1cUQZ319_QA83u+qOCSRALxpe10_+cTcevy+Q@mail.gmail.com>
	<20251001174205.71a08017@bootlin.com>
	<CACRpkdZ1qg6ecA5DyVEGUHQxLh0SnC=GC5JZdevT99YVWU0ypA@mail.gmail.com>
	<aO5ekPxeg7tdFlHi@shikoro>
	<CACRpkdacJCp8aCCrCAzD5F=_K3g25t_8kZGzaEoXMBnhY8hkzA@mail.gmail.com>
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

Hi Linus, Wolfram,

On Tue, 14 Oct 2025 22:13:50 +0200
Linus Walleij <linus.walleij@linaro.org> wrote:

> On Tue, Oct 14, 2025 at 4:30 PM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> 
> > Because the HW design kind of suggests it, I'd think. The GPIO
> > controller is a standard Synopsis one ("snps,dw-apb-gpio") without any
> > extras. The GPIOMUX (which is extra) is according to the docs part of
> > the system controller with a dedicated set of registers. Luckily,
> > self-contained and not mangled with other functionality.  
> 
> Aha I see. If this is so tightly coupled with the Synopsis
> designware GPIO then it should be mentioned in the commit
> I guess. Also:
> 
> config RZN1_IRQMUX
>        bool "Renesas RZ/N1 GPIO IRQ multiplexer support" if COMPILE_TEST
> 
> +      depends on GPIO_DWAPB || COMPILE_TEST
> 
> ?
> 
> I understand that it is convenient to make this a separate driver.
> 
> I'm not sure it is the right thing to do, but it's no a hill I want to
> die on so if everyone else thinks I'm wrong, I can just shut up
> about it, it's not like this driver is a big obstacle or anything.
> 
> Yours,
> Linus Walleij

I don't think the mux should depends on GPIO_DWAPB (the gpio controller).

Also, several gpio controller instances are connected to the mux.

The 96 GPIOs connected to the mux come from 3 GPIO controller instances (32
gpios per instance). I don't think it makes sense to have the mux handled by
the gpio driver itself. It could have make sense if 3 muxes were available,
one per gpio controller but this is not the case.

As Wolfram said, the mux is an hardware component really outside of the
GPIO controller IPs.

Best regards,
Hervé

