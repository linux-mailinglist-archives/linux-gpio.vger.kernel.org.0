Return-Path: <linux-gpio+bounces-10880-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 704B69919CC
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Oct 2024 21:12:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7AAEE1C212D5
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Oct 2024 19:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 300A4136E3B;
	Sat,  5 Oct 2024 19:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gxi5sV9I"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864AD487A5;
	Sat,  5 Oct 2024 19:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728155517; cv=none; b=FiOAJP+MbDrbzMek1kKjfE064ZZrGndiVDuM+OWJcEICYtP24Gt/JuflaTpGVrOMkQ3BtzZ2eYkGPXmcvdyQTRwDdTdws82smhJVp6avLIDTFfE9wrOBCU5eKsk4OnGJmZdxRKP1QswrNgpCA76foHwfjtRoKZjfGAsVa93FjRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728155517; c=relaxed/simple;
	bh=L7+LQAqNfJIxj3/haWkRVJlzJvdQPpjdqp0N5ciC5fI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=joW+lNrdgQIdFMnIr2gckVYa9+20ifB0h2UUJYwXPQ/7IKaEcFskCS3bvkT3QxxQ0U+yugBdZPHF3Mn95PmbYY2Jv9gXy63tbmJ40MohGSBbZHxZz08ZjnBaPtD3Nyypjzg6YndhHf0UyJWHMDjG5SLIOE2B0SgSLelbBpJZMzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gxi5sV9I; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7db1f13b14aso2564347a12.1;
        Sat, 05 Oct 2024 12:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728155515; x=1728760315; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qVU4kc0+lons09imsoFP1Tuxl4QApeUsx70KjHx/lY8=;
        b=gxi5sV9I77ZQywW2unXSOty+JzyvE/CM1IFJe84rAH8vpmv2ZKOklsFVeSUNjTAtnW
         1bu+q9xlLGWQdD9ZRCnpQhUXuAepDZ3Z84ahQ+kcYHD4QLMtMGgCAvcwjLB0pkAZz9Mv
         bdBvyIZ+RBgs515ZPARiBLXfTNOksaHU1so+jjDvz5czieC8B68S2BosQcnIJjVQX19S
         44mZbPFR0S/yQhFF2pzTY2Olqy2HAgpFJf52BnTESU/xV9u7Wau7Wn1GOWjmt9ZpTE32
         5yTxfoJLJYJKyCtpeMtX7nwzqjyUaOAQI4O2GwdrN8p7Kbq0ppTM/rGQRQ33jM2CTV9q
         aMpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728155515; x=1728760315;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qVU4kc0+lons09imsoFP1Tuxl4QApeUsx70KjHx/lY8=;
        b=joE7Ht2w3XsErKEYRqFWIqEC6jsHuiNe/hvDNXwtUL52R4Lvj8qo+GZxrP41t48W66
         dheEqm5Zp8FOeaMAu4LL7UlFPJaRHW/hIC0lKe2VZbizS9pV6ba2Ah35Bx9jpgFjz8RE
         lyuLzTConqL/Od5MF7v3h9zRaMNWEX/2PlGPwYdUbnc4hsnaBn4fXgJedSch5F7vcest
         7rDdCqq2SGJmsE3kzMazmXkqOZtpJLZOdlHP58I+SEjcHKCn6okAS0fPiP//ABvsj3f1
         p5d0b9KG0EbCOxyP97XoIIcxE0ZdrT+3+j1ZyaXcCxWhz32bpR3k2GY8hT6upPA/h+l6
         4imw==
X-Forwarded-Encrypted: i=1; AJvYcCVgyvGCpv8yQvxHNXutEuAqVAuTwyAM5RrbfbZhcYvs72nTHo/Lp8ZeuW9VnsG7dUsFADfhyYnASqxRPsSf@vger.kernel.org, AJvYcCXmjw5lu0DBjClhp6FC2/DncYoD+o78VYaUG9/U+P1PTtYhuTsDXzTAsraEIKAfJjG4bEIZZfPO/+JY@vger.kernel.org
X-Gm-Message-State: AOJu0YyCpOI/KCfNbtS8dbblL8Z9DF//VT4liMvdvtjoRHlJBUK4KAVL
	XVO0x8+C4QgWLFa0o6iszehjxBnOvJKfXbFMiOTIQYvbxcfkzf/j
X-Google-Smtp-Source: AGHT+IEmnBwaeuMPiTpMxnqOdZzcWy+If31AO23LmXQ8PIGaDso9GLNnp8TvLQ7Cw0lM7K04PDwzKg==
X-Received: by 2002:a05:6a20:c793:b0:1d2:e9e8:5e78 with SMTP id adf61e73a8af0-1d6dfa4270dmr12518333637.23.1728155514659;
        Sat, 05 Oct 2024 12:11:54 -0700 (PDT)
Received: from rigel (14-202-6-222.static.tpgi.com.au. [14.202.6.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0d7b993sm1786019b3a.189.2024.10.05.12.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 12:11:54 -0700 (PDT)
Date: Sun, 6 Oct 2024 03:11:49 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 5/5] gpiolib: notify user-space about in-kernel line
 state changes
Message-ID: <20241005191149.GA387059@rigel>
References: <20241004-gpio-notify-in-kernel-events-v1-0-8ac29e1df4fe@linaro.org>
 <20241004-gpio-notify-in-kernel-events-v1-5-8ac29e1df4fe@linaro.org>
 <20241005074635.GA174602@rigel>
 <CAMRc=MdU5+AC4PyPjuXuG_S7R59OJ-DaaCdX2fZfoCcs5BveJg@mail.gmail.com>
 <20241005095436.GB238189@rigel>
 <CAMRc=MesxXkwQtDHX4vuE+W3KAboM0PNWy6ezScrc_i10=x2=g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MesxXkwQtDHX4vuE+W3KAboM0PNWy6ezScrc_i10=x2=g@mail.gmail.com>

On Sat, Oct 05, 2024 at 08:45:17PM +0200, Bartosz Golaszewski wrote:
> On Sat, Oct 5, 2024 at 11:54 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Sat, Oct 05, 2024 at 11:42:34AM +0200, Bartosz Golaszewski wrote:
> > > On Sat, Oct 5, 2024 at 9:46 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > > > On Fri, Oct 04, 2024 at 04:43:26PM +0200, Bartosz Golaszewski wrote:
> > > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > > >
> > > > > There is a problem with gpiod_direction_output/input(), namely the fact
> > > > > that they can be called both from sleeping as well as atomic context. We
> > > > > cannot call the blocking notifier from atomic and we cannot switch to
> > > > > atomic notifier because the pinctrl functions we call higher up the stack
> > > > > take a mutex. Let's instead use a workqueue and schedule a task to emit
> > > > > the event from process context on the unbound system queue for minimal
> > > > > latencies.
> > > > >
> > > >
> > > > So now there is a race between the state of the desc changing and the
> > > > notified reading it?
> > > >
> > >
> > > Theoretically? Well, yes... In practice I don't think this would
> > > matter. But I understand the concern and won't insist if it's a
> > > deal-breaker for you.
> > >
> >
> > I don't like that correctness depends on timing, so this is a deal
> > breaker for me as it stands.  I would like to see the relevant state passed
> > via the notifier chain, rather than assuming it can be pulled from the desc
> > when the notifier is eventually called.
> >
>
> We could potentially still use the workqueue but atomically allocate
> the work_struct in any context, store the descriptor data, timestamp
> etc. (except the info from pinctrl which is rarely modified and would
> be retrieved just before emitting the event in process context) in it
> and pass it to the workqueue which would then put the data into the
> kfifo and free the work_struct. We can enforce ordering of work
> execution so we wouldn't mangle them, userspace would still see the
> events with correct timestamps and in the right order. Does this sound
> like something viable?
>

That is what I had in mind.  The passed/queued state only has to be the
fields subject to change, which isn't all that much.  You have to keep any
queues finite and deal with potential overflows, though that should be
unlikely if they are reasonably sized - and as you noted earlier this is not
a hot path so even "reasonably sized" is probably going to be small.

Cheers,
Kent.

