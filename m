Return-Path: <linux-gpio+bounces-7618-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E688912AC0
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Jun 2024 17:59:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A13728926C
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Jun 2024 15:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B92515F336;
	Fri, 21 Jun 2024 15:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="BKvIC7q/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F33415B0E2
	for <linux-gpio@vger.kernel.org>; Fri, 21 Jun 2024 15:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718985549; cv=none; b=Py3TZwJvvI963QGB6RAPwuoa+n+4TcBBwl851FcpreEoU+sSeIetoBbIJ6afEDvFy08Zl1Eql4SvOhnvWPJuab0k6jI6p8slAvDG0piKazhrmiVtDhqj1VFulsV+T5gLSn9Lxab4gV5gXHzuuYMVuLEqbScnF7FaAujer5wYgo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718985549; c=relaxed/simple;
	bh=JcoGo90O9fpAyKRX8hSh/3ThrAHfXBfltV1hNBro2gE=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aj7cAPGGuw03arclCTqoEj8jIBrZLan5/bpC9ZqFmx6SffoY0AOR8AWb4aJnsa6pMIWzu3UNee3eiO6tQi5TbZbf9cZWI0IHeo8c1FPHzkHt/bxQR8UvmaODc1Jj7H2SKGZNxFBJDFaBxWr8e9cRrFugUMBiaaMrjvZ4ezwt060=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=BKvIC7q/; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ebe40673e8so22304701fa.3
        for <linux-gpio@vger.kernel.org>; Fri, 21 Jun 2024 08:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718985546; x=1719590346; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jCL4k6ytpJwF22chMBB6UsWYBToKnk1GvIqPZ1Dy/eo=;
        b=BKvIC7q/JelEXk9X0vCKkl6dsZOeYnBQYhAkY5VCdrr2/K7ktzghZB4zS/dgFd3vFw
         BrrpEIApEbmbCqU09R3Wrm3G9ho4wHb3GNYr7xJJu0riDdSX2rN0nAGa9iG2seGnvDrS
         DnCc5M2GCiiXvT5hhLYel3eXM/jMBDwRQXEeSThFzFtoVgY1ZWf3MndTGEpxDiA2BAl3
         3BYuN46eZSA1Z4QqAXz1H68a9Bq70BX9v4bl6ztflhjD2TyOx34taKgs/PU16KgD2UcL
         ONEDzr6S1Ml+LmUj/0lLkrRl41oa/o2IkDUA5RpQALHTXf+cYf0b5NzRXkQGx0HFDARi
         kvqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718985546; x=1719590346;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jCL4k6ytpJwF22chMBB6UsWYBToKnk1GvIqPZ1Dy/eo=;
        b=q5HauZJzZHS2geaf6j5Un8f3YMXbQ3ykJT2ypPW+HdQIc1dEZf3Ngfgg1a1YHIKzMw
         RxLb/KITKxIAP2mtINz6F+c9JKyU7zvxJb51hvJgyzrJXuOJvWkBkBoGWbFHlQbDuvIz
         tIAW+tbPYqlCU+KLaX8XnkRo/6v3HzMzBRqNkboJ5HpccdI7fUpGLv6kPwuBCaRmw8Ce
         UqDbFwv8eB8zQSWfQflqeB9zZlbqUIbLFndCu0xeGe+2l9MQvfpuI1Y33jcUVGGXRwhd
         1EKbzGmTUu5s8McGA1s1/SDPNVqlCwSC0IkZgQf4LjS3NvhN2N0x57OA4w+lRsNzf5Ex
         t7tQ==
X-Gm-Message-State: AOJu0Yzhk5mA21Sifw2pumRzdznW69NkyEWYayS62zlHbT+sdT9OtlB4
	rsuCmvxilCCcpN+y7/Moz3SQsR1JC8yxhACNZ/NZzQxlYp5N+3hNPolaRp5OMgszI3kcTk6/xpn
	ClSoDzzbMzPxJJTjFpLhKKKv4zVLh45vtZAMMcA==
X-Google-Smtp-Source: AGHT+IGS1dn+UVCepB7paIwbC5MDNTn6+BfUiAHRn/RdMz17uf/2wecgvNmTvB2WV8bld7kf/PLjBLdM/V26JEqv7Wg=
X-Received: by 2002:a2e:90d1:0:b0:2eb:d816:7a67 with SMTP id
 38308e7fff4ca-2ec3ce94159mr55087391fa.16.1718985546082; Fri, 21 Jun 2024
 08:59:06 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 21 Jun 2024 11:59:05 -0400
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <87bk3unw33.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240612115231.26703-1-brgl@bgdev.pl> <20240612115231.26703-2-brgl@bgdev.pl>
 <87bk3unw33.ffs@tglx>
Date: Fri, 21 Jun 2024 11:59:05 -0400
Message-ID: <CAMRc=MejZYpY=Nb60LJ63d3L9JK8zBj4154mpeLGsk+_=ZLwVA@mail.gmail.com>
Subject: Re: [PATCH 1/2] genirq/irq_sim: add a notifier for irqchip events
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Jun 2024 17:40:00 +0200, Thomas Gleixner <tglx@linutronix.de> said:
> On Wed, Jun 12 2024 at 13:52, Bartosz Golaszewski wrote:
>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>
>> Currently users of the interrupt simulator don't have any way of being
>> notified about interrupts from the simulated domain being requested or
>> released. This causes a problem for one of the users - the GPIO
>> simulator - which is unable to lock the pins as interrupts.
>>
>> Add a blocking notifier and provide interfaces to register with it, then
>> use it to notify users of the domain about interrupts being requested
>> and released while also leaving space for future extensions.
>
> Why a notifier?
>
> There is only one usage site per simulator domain. So there is no reason
> to have a notifier with handwaving about future extensions.
>
> The right thing to do is:
>
> typedef void (*irq_sim_cb_t)(irq_hw_number_t hwirq, bool request, void *data)
>
> struct irq_domain *irq_domain_create_sim(struct fwnode_handle *fwnode,
> 					 unsigned int num_irqs,
>                                          irq_sim_cb_t *cb, void *cb_data);
>
> You get the idea, right?
>


If you're opposed to the notifier, can we at least make it somewhat
future-proof and more elegant with the following?

struct irq_sim_ops {
	int (*irq_sim_irq_requested)(irq_hw_number_t hwirq , void *data);
	int (*irq_sim_irq_released)(irq_hw_number_t hwirq, void *data);
};

struct irq_domain *irq_domain_create_sim_ext(struct fwnode_handle *fwnode,
					     unsigned int num_irqs,
					     const struct irq_sim_ops *ops,
					     void *data);

This way we don't have to change the other call-site over at IIO at all nor
will need to change the prototype for irq_domain_create_sim_ext() if another
callback is needed.

Bart

