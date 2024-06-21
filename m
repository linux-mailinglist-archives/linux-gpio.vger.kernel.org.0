Return-Path: <linux-gpio+bounces-7619-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 10653912B15
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Jun 2024 18:16:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D82E1F29735
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Jun 2024 16:16:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 900B815FA65;
	Fri, 21 Jun 2024 16:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ulfri/PB";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xP5EUaaO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1B110A39;
	Fri, 21 Jun 2024 16:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718986568; cv=none; b=rnKjSzEKtx3yFUOl2OugxwX/41evLSRKv5uuRwoQTxIZuzDRhh2Ojpl1t8mROOHxgAm+tYeRqlh/9y66iII0c9MqTAQib8pz4IsFdRI7Myl4ML3uNq2NCZpAuKkvV0cjWzU3hQd4oGld356kMq3MueqJAXcTrRYUIslIt414dk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718986568; c=relaxed/simple;
	bh=T5itJaF2GPUPMgCUlRygdt6GZFkWUXcjmXdWNn25L+g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ttz5OyBxToyijQyKt3tuW3vzx2RgJrVnLJ/kUqi8xFv1OgFi0/DXlFIp6YPVYsoJW2XL+zfhIOurWjYTsIkom69wqgNRayUbdWn15m6MTViV8aqIFQcb+3guKxjOUiuJPoFPBLBvpPSeiWrr6jCVaosaM09J+fZwMHONH3RqV+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ulfri/PB; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xP5EUaaO; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1718986563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vKuUIHFoSQkLd3I03cNWLDqpfkajqHSdiXHRC5z6omo=;
	b=ulfri/PBejAvqRb3NTZ8PgzXPzjg6d3chywau9DvL5fcdlE2Spzag7r/qx4vjqtPQ7GDJq
	wwT5/CwUZTuWrI0dfguLorafCjxcljS5q5RoTVp7AE/G0TOZoIXU48F0bdKByFc3bMolY5
	bQr6PFX5ao7O8mCbBNaC6uGUPR0F1rJ6NtAsB4vqV3dps6Puwu5FeCFSsHr23pakC9jjJZ
	9k7lf1ssUHDjRieWgVGIrU5uPZJkAgg38kYMfqwy7rWWshniELCpNNh9LujKWd+9/OmRlg
	qnqzAVy2U9I6ys+nCTy/zbB8dxCxeVuhMrQdGBXgS6fq4GaZXTI8LHs/HMlDfw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1718986563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vKuUIHFoSQkLd3I03cNWLDqpfkajqHSdiXHRC5z6omo=;
	b=xP5EUaaOT6+h9hUX6myDe9FoqdJcvWOdzf1MeN2woWSj3B39vT1yinlMklsp5hwcswAT0d
	pHoWoZH7xqqk3rAw==
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz
 Golaszewski <bartosz.golaszewski@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] genirq/irq_sim: add a notifier for irqchip events
In-Reply-To: <CAMRc=MejZYpY=Nb60LJ63d3L9JK8zBj4154mpeLGsk+_=ZLwVA@mail.gmail.com>
References: <20240612115231.26703-1-brgl@bgdev.pl>
 <20240612115231.26703-2-brgl@bgdev.pl> <87bk3unw33.ffs@tglx>
 <CAMRc=MejZYpY=Nb60LJ63d3L9JK8zBj4154mpeLGsk+_=ZLwVA@mail.gmail.com>
Date: Fri, 21 Jun 2024 18:16:02 +0200
Message-ID: <877ceinuf1.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Jun 21 2024 at 11:59, Bartosz Golaszewski wrote:
> On Fri, 21 Jun 2024 17:40:00 +0200, Thomas Gleixner <tglx@linutronix.de> said:
> If you're opposed to the notifier, can we at least make it somewhat
> future-proof and more elegant with the following?
>
> struct irq_sim_ops {
> 	int (*irq_sim_irq_requested)(irq_hw_number_t hwirq , void *data);
> 	int (*irq_sim_irq_released)(irq_hw_number_t hwirq, void *data);

release wants to be void.

> };
>
> struct irq_domain *irq_domain_create_sim_ext(struct fwnode_handle *fwnode,
> 					     unsigned int num_irqs,
> 					     const struct irq_sim_ops *ops,
> 					     void *data);
>
> This way we don't have to change the other call-site over at IIO at all nor
> will need to change the prototype for irq_domain_create_sim_ext() if another
> callback is needed.

I'm fine with that. It's at least well defined, while the notifier
business is not :)

Thanks,

        tglx



