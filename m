Return-Path: <linux-gpio+bounces-17423-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7999AA5C153
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 13:35:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF9241885504
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 12:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EA342566DF;
	Tue, 11 Mar 2025 12:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonic.nl header.i=@protonic.nl header.b="SaoEPgfw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp15.bhosted.nl (smtp15.bhosted.nl [94.124.121.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923682571A6
	for <linux-gpio@vger.kernel.org>; Tue, 11 Mar 2025 12:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.124.121.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741696222; cv=none; b=IlXAkNlrN3RkmeNMCgkxEEZHWMdt84oNszdMtt2Ss9jwyRiTnPMeAAKkG1mixel1643svYwvG9RLKdX8AlpSJyeWYfyDGfbC5+fhctHcReb3AYTWageh04W8IL2odvKvkn3XpWHu6FRateNiijtg5Olb8cEqQI71z2PfY6UFfSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741696222; c=relaxed/simple;
	bh=iGzfkjKIKGQ3nIRCtf8/atYf8W5Mghy7B9NvHDLqI4U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b/x4TzJ+e8Zxrn8YkDE8tx0c4sabICGKJ4C4AXQvbeFLTuPLQ0KG3naGteZrF12XIs6C6ksMKiIy/ltcYukua/GYoO18BpYqdanVz+RQSIO8MW5fB6TltNn148rpq9hKectVQvVNhc8m99B5apsYJMWzGHJ9uPzoAZHrKFEATq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=protonic.nl; spf=pass smtp.mailfrom=protonic.nl; dkim=pass (2048-bit key) header.d=protonic.nl header.i=@protonic.nl header.b=SaoEPgfw; arc=none smtp.client-ip=94.124.121.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=protonic.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonic.nl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=protonic.nl; s=202111;
	h=content-transfer-encoding:content-type:mime-version:references:in-reply-to:
	 message-id:subject:cc:to:from:date:from;
	bh=GBW0Y8yGR5o8MgBeufRUfD01/b7zRBYHTos8St3c3AM=;
	b=SaoEPgfw/rsLhvKxWH4sQGvHUrsaWHmccdd7YxC6ibKkB5hLWIt7PA0nd+8zlefWFUEvkgjtxjef3
	 UdtS7Hf+Unc3uQYcrPsK3tsEIygSfuAiXroDT7F/x7U22FGE4sjt6YEpNFg1TJgTrblAsaglhskFsM
	 jTKytl4vqNAvLMI5PqAhGUm2XdDu2I380gElYUrSeKXmhMW0ska4+YogBWwBpz2n4ym6anJ9mrAcG5
	 MoivYVcqjTbFW1EBgP1be0Qp1lCemyh45bGUrgTLl0LK7xscNurTY0JVsNzJtmVhLDQnaJp4JCy/ye
	 BgM/H1dRyD6mBZOH+/1w+7L1iQXHTlw==
X-MSG-ID: 93500ca2-fe74-11ef-a3a3-00505681446f
Date: Tue, 11 Mar 2025 13:30:10 +0100
From: David Jander <david@protonic.nl>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Kent Gibson
 <warthog618@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: regression: gpiolib: switch the line state notifier to atomic
 unexpected impact on performance
Message-ID: <20250311133010.760abd61@erd003.prtnl>
In-Reply-To: <CAMRc=MewC-7XFfWxPS7cmMycxo-62NDrUKFyjnnCbwqXQXWuZw@mail.gmail.com>
References: <20250311110034.53959031@erd003.prtnl>
	<CAMRc=MewC-7XFfWxPS7cmMycxo-62NDrUKFyjnnCbwqXQXWuZw@mail.gmail.com>
Organization: Protonic Holland
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 11 Mar 2025 12:45:51 +0100
Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> On Tue, Mar 11, 2025 at 11:01=E2=80=AFAM David Jander <david@protonic.nl>=
 wrote:
> >
> > On kernel 6.13, after git revert -n fcc8b637c542 time is back to what i=
t was
> > on 6.12.
> > =20
>=20
> Interestingly: I cannot reproduce it. Obviously gpiofind doesn't exist
> in libgpiod v2 but I'm running gpiodetect with and without reverting
> these changes and am getting roughly the same results: ~0.050s real
> time for 1 up to 4 chips.
>=20
> Any idea why that could be? Can you reproduce it with libgpiod v2 (I
> don't know why that wouldn't be the case but worth double checking).

I had libgpiod version 1.6.3 and I have now built libgpiod version 2.1.3.

Here are my findings:

1. time gpiodetect on kernel 6.13 and gpiod 1.6.3:

$ time gpiodetect=20
gpiochip0 [GPIOA] (16 lines)
gpiochip1 [GPIOB] (16 lines)
gpiochip10 [GPIOK] (8 lines)
gpiochip11 [GPIOZ] (8 lines)
gpiochip12 [unknown] (22 lines)
gpiochip13 [mcp23s17.0] (16 lines)
gpiochip14 [0-0020] (16 lines)
gpiochip15 [0-0021] (16 lines)
gpiochip2 [GPIOC] (16 lines)
gpiochip3 [GPIOD] (16 lines)
gpiochip4 [GPIOE] (16 lines)
gpiochip5 [GPIOF] (16 lines)
gpiochip6 [GPIOG] (16 lines)
gpiochip7 [GPIOH] (16 lines)
gpiochip8 [GPIOI] (16 lines)
gpiochip9 [GPIOJ] (16 lines)
real    0m 0.19s
user    0m 0.00s
sys     0m 0.01s

2. time gpiodetect on kernel 6.13 and gpiod 2.1.3:

$ time gpiodetect=20
gpiochip0 [GPIOA] (16 lines)
gpiochip1 [GPIOB] (16 lines)
gpiochip2 [GPIOC] (16 lines)
gpiochip3 [GPIOD] (16 lines)
gpiochip4 [GPIOE] (16 lines)
gpiochip5 [GPIOF] (16 lines)
gpiochip6 [GPIOG] (16 lines)
gpiochip7 [GPIOH] (16 lines)
gpiochip8 [GPIOI] (16 lines)
gpiochip9 [GPIOJ] (16 lines)
gpiochip10 [GPIOK] (8 lines)
gpiochip11 [GPIOZ] (8 lines)
gpiochip12 [unknown] (22 lines)
gpiochip13 [mcp23s17.0] (16 lines)
gpiochip14 [0-0020] (16 lines)
gpiochip15 [0-0021] (16 lines)
real    0m 0.22s
user    0m 0.00s
sys     0m 0.06s

(note that it became slightly slower from v1 -> v2)

3. time gpiodetect on kernel 6.12 and gpiod 1.6.3:

$ time gpiodetect=20
gpiochip0 [GPIOA] (16 lines)
gpiochip1 [GPIOB] (16 lines)
gpiochip10 [GPIOK] (8 lines)
gpiochip11 [GPIOZ] (8 lines)
gpiochip12 [unknown] (22 lines)
gpiochip13 [mcp23s17.0] (16 lines)
gpiochip14 [0-0020] (16 lines)
gpiochip15 [0-0021] (16 lines)
gpiochip2 [GPIOC] (16 lines)
gpiochip3 [GPIOD] (16 lines)
gpiochip4 [GPIOE] (16 lines)
gpiochip5 [GPIOF] (16 lines)
gpiochip6 [GPIOG] (16 lines)
gpiochip7 [GPIOH] (16 lines)
gpiochip8 [GPIOI] (16 lines)
gpiochip9 [GPIOJ] (16 lines)
real    0m 0.03s
user    0m 0.00s
sys     0m 0.01s

4. time gpiodetect on kernel 6.12 and gpiod 2.1.3:

$ time gpiodetect=20
gpiochip0 [GPIOA] (16 lines)
gpiochip1 [GPIOB] (16 lines)
gpiochip2 [GPIOC] (16 lines)
gpiochip3 [GPIOD] (16 lines)
gpiochip4 [GPIOE] (16 lines)
gpiochip5 [GPIOF] (16 lines)
gpiochip6 [GPIOG] (16 lines)
gpiochip7 [GPIOH] (16 lines)
gpiochip8 [GPIOI] (16 lines)
gpiochip9 [GPIOJ] (16 lines)
gpiochip10 [GPIOK] (8 lines)
gpiochip11 [GPIOZ] (8 lines)
gpiochip12 [unknown] (22 lines)
gpiochip13 [mcp23s17.0] (16 lines)
gpiochip14 [0-0020] (16 lines)
gpiochip15 [0-0021] (16 lines)
real    0m 0.07s
user    0m 0.00s
sys     0m 0.06s

(roughly same speed difference from v1 -> v2).

Can you describe your platform? Is it a multi-core or single-core CPU? What
RCU implementation does it use? Tree or tiny? If it is multi-core, is there=
 a
difference if you disable all but one core?
Maybe some kernel CONFIG option that makes a difference? I am not an expert=
 in
RCU (in fact I barely know what it does), so maybe I am missing something t=
hat
makes this problem go away?

Best regards,

--=20
David Jander

