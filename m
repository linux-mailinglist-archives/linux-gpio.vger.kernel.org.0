Return-Path: <linux-gpio+bounces-6681-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1510B8D06D3
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 17:54:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2B780B30A42
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 15:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A860160797;
	Mon, 27 May 2024 14:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="FzN2KyoQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD4C16078F
	for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 14:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716821706; cv=none; b=r8TGE2tactSPN7nTq6GIjaacon+Jdu3E2tL0za5l9oMVW+rSn0r+WY2DF7rb3d/FponPZ8CDLtTDLRIQCGY8NgUvvaSaar9Rv+/9LHO7BqhQ0XCzlcPepv9iZVJrcj5JuUDTaX2TbIxLohR/d7KIgsW62H7CjuLgbXuWaUMSUBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716821706; c=relaxed/simple;
	bh=5TD6+fP9zGBVCkWnjvWQY4Ucu0QI2ucP5yTRATx+ATE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ntftUN6T/INQsrUFhbwKFkftL0fOjoV/IFTZRan2B3syWuxqNNF0UfRMLaSkg+pdwvsjZno3r3foQOoX0yHVQHpmNXilAtLIVh8REpSzzhBbkgiExFpT8bKUUIoFkDI630IbI5HAkcCH+1CcMG1KQv7dlKjcn+DMAmRhiFw3ySA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=FzN2KyoQ; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2e719bab882so109524881fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 07:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716821704; x=1717426504; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5TD6+fP9zGBVCkWnjvWQY4Ucu0QI2ucP5yTRATx+ATE=;
        b=FzN2KyoQRXGJ5PiqXT8HuzkptLZdyml+tDdNuAwiBFtsZJXifQR1IaF+h2pDadjYgj
         HA98Q25DbUir1P8Em96kIycOto1xILQeTE3R1RgjwABHQ8RlI0qEU2q2XPTfky8u8blx
         q1yoijWX42uapWS/sybfs7AzOSM6ve+HCAywljseJbFSOgNtNljerpatjDxYXkRPxz10
         T6/WLRRpysk/DKjktBXzFaiDxidKp/hatQkXupKH63AmNBm9RsmomL0L4YF3/QoGQN/O
         xPgTCo4YEhReoMb9EF5secNWEoNxOnVb2gs6G1tbi4l6YJxAreGuBfPavlKFk2K+QYOZ
         72lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716821704; x=1717426504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5TD6+fP9zGBVCkWnjvWQY4Ucu0QI2ucP5yTRATx+ATE=;
        b=EHH7Yeyzw839LuvF9tlWKc1yh1+UUYcVnQR48wbnpmxoPYAVFLyfUceWdg8RKT0SVi
         2kfA/TFEt63yGuGo71Le3UhP7Imi1hGxUCWVvntULrT5EvaL8HEgee5j/Ka6ePQ50Gb+
         9wv+i2DWkjVSnvfv9+rGtaTY+Z6Kv/3ZmJ574mXd+Ndc4PQaV/O7kh+gYSDlWXhff0l4
         mqNdBrnjLIU+SiRVJTO8DSfEZYOMm+aWnnSA4vz3cwLhI8TY5V/FE47483WzptGm2b3A
         DHUkfNzPQOafp7LJKD+z8AE78YrzpPurlGGS+senZHuqn2NuHqMhTP0K5F+LzKgFuGyg
         wtnA==
X-Forwarded-Encrypted: i=1; AJvYcCUQKogI2lITKCbLKSAI7wUaYMKNqYbj4bNGXTzyFRAIYpKG0AJHPGasvac4kgQn5BN+Fq9U1p0JnKhbyJwcfIa7rpgn9PLDujhkDA==
X-Gm-Message-State: AOJu0YxeHAcQFZaWm+pdW8Nn30sMWFvYvepq/0LCOW0uNIrU5IWdSvaz
	AvRAZKOoC4wuBoLkKjfXyd/FmtN6u/3xeQUj1hcOzECzxJd1lU7fiLwufYJihJqCINtPlbn/Syg
	BIn+aSl9rt0EvJ6j4j07MJjF5V2y1sd8Y8/cP1Hn5DKFN+HfB
X-Google-Smtp-Source: AGHT+IEWEP0lfG2yK4OCOQAmDalN2VIZFxrErH+r4nSQ8/qZSUVrTMLkXMTAMXvfbr6eAaU2P2kpvtmtsnGulk2HYyo=
X-Received: by 2002:a2e:a0cb:0:b0:2e9:4c17:9c8e with SMTP id
 38308e7fff4ca-2e95b2d04a2mr63410011fa.44.1716821703725; Mon, 27 May 2024
 07:55:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240514041223.800811-1-foxhoundsk.tw@gmail.com>
In-Reply-To: <20240514041223.800811-1-foxhoundsk.tw@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 27 May 2024 16:54:52 +0200
Message-ID: <CAMRc=MeuHpu4_QbgW-6Kc-TGzhcBim7Eb-TZhPax6G2SZHR5iw@mail.gmail.com>
Subject: Re: [PATCH] docs: gpio: prefer pread(2) for interrupt reading
To: Huichun Feng <foxhoundsk.tw@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jonathan Corbet <corbet@lwn.net>, 
	Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 14, 2024 at 6:12=E2=80=AFAM Huichun Feng <foxhoundsk.tw@gmail.c=
om> wrote:
>
> In legacy sysfs GPIO, when using poll(2) on the sysfs GPIO value for
> state change awaiting, a subsequent read(2) is required for consuming
> the event, which the doc recommends the use of lseek(2) or
> close-and-reopen to reset the file offset afterwards.
>
> The recommendations however, require at least 2 syscalls to consume
> the event. Gladly, use of pread(2) require only 1 syscall for the
> consumption. Let's advertise this usage by prioritizing its placement.
>
> Signed-off-by: Huichun Feng <foxhoundsk.tw@gmail.com>
> ---

This doesn't apply on top of gpio/for-next, please rebase and resend.

Bart

