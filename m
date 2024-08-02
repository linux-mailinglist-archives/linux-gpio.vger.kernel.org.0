Return-Path: <linux-gpio+bounces-8540-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F109945C33
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Aug 2024 12:40:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBE6C28330A
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Aug 2024 10:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72A0B1DC48B;
	Fri,  2 Aug 2024 10:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="AzSP5L4P";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ptkKcq9E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0FE1C233C;
	Fri,  2 Aug 2024 10:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722595246; cv=none; b=c630yOXISZ8X61i22b+CEIGhxwKpl7wK+9K57kqv/fU6ToWdqOyeoG1+OO4Vyp3yT+9OW7HiU2BbTvpVFFiLzPqURFwxYG9zzd86aNzJTz+ttxIYWsjacTmuHXkjcHyUEp3vNQ9xXtQxQchpGSKn8y4+7Y6nclBbjMhTtZARW7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722595246; c=relaxed/simple;
	bh=HjcU+WlrtSOzPwf1PAQT6g0nTUOXd9zvEKGllmTWMLs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EfnMmgqMZ/aZiuFvzzdaAW5+AFOc1D+FBNoU7UPWyx4GXZ+9Ocf5jBwYZhbpr0wlkbd0yaf/E+g9dZcL5RTBL4gaQpFbgBAmy12i+ffD8Q6PwvTNyZJPvWtG8a3hys7GjjKw9rGgf6XtQOZY3X+WKbWJlf7VOBBnYTRufLmvmXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=AzSP5L4P; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ptkKcq9E; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1722595238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r5vcAD1A0hzoKaR1+uEiFQRM12R8jXW3cvyQsxzJHwU=;
	b=AzSP5L4PVK1Psz6ROzsn/+qgcr5czSeOz9pJT3SZNRVlFsfBf4l7hlmVxgJdAuppfu9MP1
	fWfIAt8VkRfgypz9+3U0/bphlE1tsR7CXYISZorUhWhqIWYgbP0FwLIkC9FgfhOOjyydqe
	Smhem1Q6SPLtS5lUb7OkW8yVzcD7IEZbnPsc+bhm34U6r2XfQ2/w+1z3w+NxXo0R48h2cN
	BUN3C+kd2/R+qOMYe8HccK6xc2zJ829pTwiQ4RNyetGcT44NmiNby3eJp8l7AAQMUF6Vej
	GLsLZ2fFqkjxucGl9KMntUWod7u1yHeGpwDMhq/ChJbhOx7FTXT2Diuw+7vUCA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1722595238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r5vcAD1A0hzoKaR1+uEiFQRM12R8jXW3cvyQsxzJHwU=;
	b=ptkKcq9E4q4meolmKHP98h7IiQ4UpvvwtTr/CKaxtp505Ffy4MUlxuPJrTh1NcBCvi7JsW
	E3K8GdMmxoeIkpBw==
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-kernel@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, Daire McNamara
 <daire.mcnamara@microchip.com>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [RFC v7 3/6] irqchip: add mpfs gpio interrupt mux
In-Reply-To: <20240802-rippling-clubbing-5318f914f16a@spud>
References: <20240723-supervise-drown-d5d3b303e7fd@wendy>
 <20240723-flatworm-cornflake-8023212f6584@wendy> <87le1k8oq2.ffs@tglx>
 <20240801-palpitate-swinger-7bc8ae8deaaf@spud> <87r0b82i57.ffs@tglx>
 <20240802-rippling-clubbing-5318f914f16a@spud>
Date: Fri, 02 Aug 2024 12:40:38 +0200
Message-ID: <87sevn1a3d.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Aug 02 2024 at 09:08, Conor Dooley wrote:
> On Thu, Aug 01, 2024 at 08:49:08PM +0200, Thomas Gleixner wrote:
>> On Thu, Aug 01 2024 at 16:09, Conor Dooley wrote:
>> > On Mon, Jul 29, 2024 at 12:41:25PM +0200, Thomas Gleixner wrote:
>> >> > +	/*
>> >> > +	 * If a bit is set in the mux, GPIO the corresponding interrupt from
>> >> > +	 * controller 2 is direct and that controllers 0 or 1 is muxed.
>> >> 
>> >> This is not a coherent sentence.
>> >
>> > It should read "controller 0 or 1;s interrupt is muxed". Does that make
>
> Heh, I even typoed here, the ; should be a '.
>
>> > more sense to you?
>> 
>> No: If a bit is set in the mux, GPIO the corresponding...
>> 
>> I'm already failing at 'GPIO'. My parser expects a verb there :)
>
> Ah, so double mistake in the sentence. s/GPIO// I suppose. An updated
> comment could be:
>
> "If a bit is set in the mux, the corresponding interrupt from GPIO
> controller 2 is direct and controller 0 or 1's interrupt is muxed"

That's actually understandable for mere mortals :)

