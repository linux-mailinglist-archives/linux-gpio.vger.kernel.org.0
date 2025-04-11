Return-Path: <linux-gpio+bounces-18685-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5BFA85169
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Apr 2025 04:12:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 958A31B826D6
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Apr 2025 02:12:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5A2527935A;
	Fri, 11 Apr 2025 02:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hYUDwJg6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05AEF157E88
	for <linux-gpio@vger.kernel.org>; Fri, 11 Apr 2025 02:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744337548; cv=none; b=YCWqvp6Q0bRax+apASIf8JGJLRs727BQSqUmNuC9sbFT8vdEiR4rJsZEN/9fS9I8JI2IEmJ5QgITRpYQo0x31CwPrUVnB7hEE53FyMHC2lZqndwiZffpcwf6hEWhDSNYCNW1lvHvAwMQ0AtI1Hu6DC60jLEQC4cAf415+X0ClnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744337548; c=relaxed/simple;
	bh=hDxFFGHZ4l2dyEYCHQD+ylYokGN5yR7nR/Fj9uAy6Io=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NPQQGUbK1BpagpjNGBIOJ9DpFpkFScEEZbPtsPWvYeHwbUSBU4Vab1gC2NryEkCRcBElgN/Q7MARxAzGE8E8HAYwzjx1eS9Dk3lyv3qvW+hOkzN2T2vHcOjojYbmNGmHagLnt5PiYCYqW9OjvF9Xqp2mM4075zZz5ehcaOMoHF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hYUDwJg6; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-306b78ae2d1so1448223a91.3
        for <linux-gpio@vger.kernel.org>; Thu, 10 Apr 2025 19:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744337546; x=1744942346; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Pf2JE0fIIta5IKE5Io4IaV9y5ldqO08565A6oWgaSRQ=;
        b=hYUDwJg6/twt8aWGIJ+CrgUAMmI76EiukhExWILeoMwbvN7/E2CtoYtJTpMMn0KiML
         sLCHlwfyG+D/o2z9Wi4v8ntPSi+3gOfIh/NWu2Gt5UGAYLnz6MphXHjZNnCmzDiE1h42
         Zu3jcOWa1DKpCrnVcx1s8vxbFx4EQME040aAs2hBem0/92cRnJOXJd0Ri9Eym8Eqpahd
         dg4oaPhniNJsb6mxycL1LWsyEF+nkGHMaaQucuclfYO4iUAHqoO0brZp5R+9tv2Rqchw
         NGVWWgNHIR8jUfpyhO/b8ZFmHAEWYR2Q9foOkxSFUbGhMTnTiBQBMuqkca3Ywb9DkPWo
         87ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744337546; x=1744942346;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pf2JE0fIIta5IKE5Io4IaV9y5ldqO08565A6oWgaSRQ=;
        b=Tr8wYO5TCDQLvSI6uL6bqliubU0ZWo9XUG+vrR7ubZ8EoXU9LIIE1qn3+O/I9dR0kS
         UejufNNgOQBRq7cZHN+VrFRN7jhXpn5roLcBD6xJelV3o9sz+1OKhbwzBu/kNiKwRqek
         EdhZ8fq0McbdFAV4dtmj4VOYj/9IjrpTELNzLyIOsg5nTrn//IM3phCWP4mn/E6RUxHQ
         aoyoIRMjV+Qi+LV5B3XA0aDgXnNTeaadli4S90wkPIYF+r7oKvrYm/gbidYpG9oHq4F3
         YwJp8oK68fwf9X4l05AIu7Fx7q3t8B4e8l96JkaQ8Cxg9igsjbr3VsOH9MmUAH1yH1kj
         0j2A==
X-Forwarded-Encrypted: i=1; AJvYcCWq/5D1r3Foj1amJgre3lIEGl9ECwcoikuoXfRWhC186gQ6SyDfCL9zJkW00Sbp6Mm+b09cnWJ/Ud+8@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2Jda/VCVdTU/UUTNmRhOgEez9dyAvcDQWKhEZgkkwlQLkTiQ8
	jWnk7QY6yqP/BFTVKfQBEWJPb4m0cTAg536G6A8OuJ87Ev0HGPM5
X-Gm-Gg: ASbGnctNCKFHCI1O5J9J/Dla+OZl7eeXWiWnqKBxz/w2JMsNtrk22h7/NxIQNZnSG9X
	n3de6eYoDw2U+kD+t5UoUxham+5wrKrg2+3LduY5CXvnSS27abjxdrmBG5YiMevbfNDYgG5Euj/
	khbICfXbN3SpjXC+wCnetYPbBRuE6icUrty+GDPT6PY1Fj/Ucl7CLnZ2buuCc23oUk/yl10BBFp
	6x6hixWbnItrC7gPzMN6hw96uXgXBs3IsFOAq//sfO8EF5ZKUgHuk9nqeJqo+9YuXxoEy0/v61E
	AXqSJzXvxBk4ScZMrR00DKGFn+BEWOq3jOMvK3aEWSs8
X-Google-Smtp-Source: AGHT+IEfTMFbSwzXW8SxYC2k4F8UZm5+L28HGqrj1cB1ZYihQt8bIi40OTgebDHxC8dvH+/rx0FxDg==
X-Received: by 2002:a17:90b:2552:b0:2ee:8e75:4aeb with SMTP id 98e67ed59e1d1-30823673a71mr2039685a91.17.1744337546098;
        Thu, 10 Apr 2025 19:12:26 -0700 (PDT)
Received: from rigel ([115.131.241.66])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c9725asm37927135ad.158.2025.04.10.19.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 19:12:25 -0700 (PDT)
Date: Fri, 11 Apr 2025 10:12:12 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH libgpiod] tests: uapi: add test-cases for open-drain and
 open-source emulation
Message-ID: <20250411021212.GB47403@rigel>
References: <20250410-open-drain-source-tests-v1-1-a062d2280cc5@linaro.org>
 <CAHp75VfMPGiv-oZb91OAr31GWtXKefu72syp3Gjods3r1=827w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VfMPGiv-oZb91OAr31GWtXKefu72syp3Gjods3r1=827w@mail.gmail.com>

On Thu, Apr 10, 2025 at 08:34:37PM +0300, Andy Shevchenko wrote:
> On Thu, Apr 10, 2025 at 12:17 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > The kernel GPIO subsystem can emulate open-drain and open-source by not
> > actively driving the line for active and inactive output values
> > respectively. The kernel does it by setting the line to input in these
> > cases but this still must be reported as output to user-space. Add new
> > test-cases that verify this behavior.
>
> Thanks, that's indeed a good idea!
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
>

FWIW, the test suite[1] I wrote for my Go library along with the uAPI v2
also covers these cases, and more - particularly error cases.
Not that I've run it over Bart's changes yet, but it is my first stop when
checking for uAPI breakage.
It is written in Go, as there obviously was no libgpiod v2 at the time.

You can run the whole uapi test suite yourself by grabbing that repo and Go and...

~/go-gpiocdev/uapi$ go test -c
~/go-gpiocdev/uapi$ sudo ./uapi.test --test.v

I believe the cases above are covered (mostly) by

$ sudo ./uapi.test --test.v --test.run "TestGetLine$/output_[drain|source]"
=== RUN   TestGetLine
=== RUN   TestGetLine/output_drain
=== RUN   TestGetLine/output_source
--- PASS: TestGetLine (0.01s)
    --- PASS: TestGetLine/output_drain (0.00s)
    --- PASS: TestGetLine/output_source (0.00s)
PASS

which request the line then check that the reported info corresponds.

I don't seem to have any tests that cover setting the value of
open-drain/open-source outputs yet, so I might have to add some.
Though my existing set value tests check the value reported by the
gpio-sim, which will behave differently for emulated outputs...
Which probably explains why I didn't test that already - it is getting
into the bowels of gpiolib so it is really testing gpiolib behaviour,
not just the uAPI.  (I do have a few kernel specific tests, but they have
generally been added to test specific bugs that were visible though the
uAPI.)

On that point, it might also be handy if we could turn open-drain/open-source
support on and off in the gpio-sim (per sim), so tests can control if they
are getting the emulation, or not.

Cheers,
Kent.

[1] https://github.com/warthog618/go-gpiocdev

