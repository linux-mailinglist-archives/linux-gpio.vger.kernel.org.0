Return-Path: <linux-gpio+bounces-7617-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7C7912A7D
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Jun 2024 17:41:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B44E1B2942E
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Jun 2024 15:40:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9F4B82D7C;
	Fri, 21 Jun 2024 15:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="u6AjwV51";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Afsw9X/1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191A4824B0;
	Fri, 21 Jun 2024 15:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718984409; cv=none; b=fMJ8IoiXA/DzAICxkkeOK6vNpgbLtQuG8HwUignAhVkNVgD28pGOUQL6iivOFLOi7BcTaxI2AYP5mUTpsqlhtpjvyRWFUg/c/ra0MxUYnGqfZNVRvQwULk17WRUtVGng61Bcz+u6lcjEes8j3XWy+Lk8NzaVKbL75QI6uYQrs4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718984409; c=relaxed/simple;
	bh=6+yU8e4zWvcHFlNvDgjUwZOGtYWm00dY0X4TmU69Q2Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=a3kmJbgYcCtqBFUC4f7RqK0wFnjj8E966y/U98O+3HErk3/96eRRwcS3xTOIamW+9wMb98dwi2cbeYp9xljXbjPp0pcJuVMwBUlHiXOtvminEeZxLAU4U1jE4W4+rV2ztBogDbehinExuQEc8On3yBbIXJAGZaQXNq2Th0ryPic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=u6AjwV51; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Afsw9X/1; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1718984400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hFSdBqUW0GIpxRymj0qfM1z3eAiGqq4pucay28K1qKs=;
	b=u6AjwV51VOpOGEcqQEfAJzXn7UPa2W0ItyATYqa3RPwodjXPqqyHivoLC1rWOGhxdTdcAI
	FF2qY42WfrGid6Rvray0yjKumzLk+L1OOEttmwhz0mXQBjMsnHU3ta4/im+aYY7SPFWROr
	5wyn8c0gC494R3skDQl3T5YkiW7usbJ1C7UYrDco2L8INd87bfNMJcb+xmBiASw5aL3Yat
	/0HuKhWzArORR8Cdy1mlS26OXfII++G9QvDok7IILrplPeZL73efOb5EnH0G6X7jYAVwAN
	S1r+Kd9rNJp8bCKOyfT19k/0mwTANZc19nHrIEp9heX1iaf5RXbFErQK52A34Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1718984400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hFSdBqUW0GIpxRymj0qfM1z3eAiGqq4pucay28K1qKs=;
	b=Afsw9X/1ZBO4drkZ8kBvKSSrZMi6UMRsnHlHToAMDKLygPJ/QFRKcNA614pJ2b593bwswH
	NAOISXdHLc7w5TBQ==
To: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij
 <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz
 Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 1/2] genirq/irq_sim: add a notifier for irqchip events
In-Reply-To: <20240612115231.26703-2-brgl@bgdev.pl>
References: <20240612115231.26703-1-brgl@bgdev.pl>
 <20240612115231.26703-2-brgl@bgdev.pl>
Date: Fri, 21 Jun 2024 17:40:00 +0200
Message-ID: <87bk3unw33.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Jun 12 2024 at 13:52, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Currently users of the interrupt simulator don't have any way of being
> notified about interrupts from the simulated domain being requested or
> released. This causes a problem for one of the users - the GPIO
> simulator - which is unable to lock the pins as interrupts.
>
> Add a blocking notifier and provide interfaces to register with it, then
> use it to notify users of the domain about interrupts being requested
> and released while also leaving space for future extensions.

Why a notifier?

There is only one usage site per simulator domain. So there is no reason
to have a notifier with handwaving about future extensions.

The right thing to do is:

typedef void (*irq_sim_cb_t)(irq_hw_number_t hwirq, bool request, void *data)

struct irq_domain *irq_domain_create_sim(struct fwnode_handle *fwnode,
					 unsigned int num_irqs,
                                         irq_sim_cb_t *cb, void *cb_data);

You get the idea, right?

Thanks,

        tglx



