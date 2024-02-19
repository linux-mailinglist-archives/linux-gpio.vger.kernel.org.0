Return-Path: <linux-gpio+bounces-3446-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2693E85A7C3
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Feb 2024 16:48:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58D661C21203
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Feb 2024 15:48:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A096B3A260;
	Mon, 19 Feb 2024 15:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="zdOn2NYb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D3F38DD4
	for <linux-gpio@vger.kernel.org>; Mon, 19 Feb 2024 15:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708357697; cv=none; b=umBB7+OGv3cO2KqNAPED93GXb4j402g8Sw9CEhM+ZhkdDeRHHsNXPNRWSOTfNJ79ZLxe/FshEc1Lhm3JfFk8Arbhr4XYFxC5C6p0jMQopeJZr4tM++Qo325Plc9fDQt74a+7aUHysxtTIAgrL43Nr+hYPJuhqVxiFvSPi/nMQ94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708357697; c=relaxed/simple;
	bh=RR2f0fl51Nm9ERWn6nYb6QWvscpg0khyaR837FJGXRE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YjqrJcEPuwQPYwpGlPYJadis8GU/ae8XcjmADseY+ILAkgF8yd7jYqQZ099lPOjysPut01KWL5oAH/fsjRqPpmd50axII5+y1HVyKfrrKKB6eJCYGIcxY9eLspq1lS1PTtibpAQtIhzd/xxTN3PbJApF1yd6tJ7fo7rJkIxpTR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=zdOn2NYb; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4704f3e2a99so199991137.3
        for <linux-gpio@vger.kernel.org>; Mon, 19 Feb 2024 07:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708357695; x=1708962495; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RR2f0fl51Nm9ERWn6nYb6QWvscpg0khyaR837FJGXRE=;
        b=zdOn2NYbHVl1ZG5FTEQTwiBJ/xWLwgvqHevPJv/cqNrMjhYNg35MqSBntFOPgRHZoZ
         P6EADPVad5Y2RJ+fjZ3RtxUKVtbkRhjvI/OT/czp4QCKy1O+HOVWd/w7MI/IfhTddXXi
         6qHa503DZ1oyt4QY4cb9fC7xszwKFREULLB2H+uSHl65ClzaA3Av9BAwxtrs/rCS5WC8
         V6hWa51nCgPR5ViKv2qu6WjfU2kCJVcjKEpp0HbDJ75Zu28db66IOGTM8cUIIfzYXvfD
         +5Nrpm4cfgMbFAwMyvqA6Wc1k9MSXXG38gNMosRGuGG78KXsleX3gz7IieR0bKV2HbbV
         h4FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708357695; x=1708962495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RR2f0fl51Nm9ERWn6nYb6QWvscpg0khyaR837FJGXRE=;
        b=JMrXDhH7Z7Zu95CttR+GzKpxGd3nrMije3f50K0S9wFp/PkvSeeo86DnQb3SJy7NDs
         gtPMnR90VdZz2TFZMMXRNxo8wevpQM5eTP1uVAaG6I29Ix21L8152TPApnBdUdAJuIGv
         8tMbloL4hpGB5fxjZAKO98YVWA7ggkGqC6OzFe76pyBQ42p4x0IOSsC+DL39Wt0dEkaf
         Wq8RJ8PQFpkWuuqxyRmaxo0r8Sikeaj4zi5bvIqOUpisRQlMXpzOn3pG++6VPZ7Om6kl
         z/12BIvuQTC0NmM96qM9OuZO+qywMwFF7y5zal4WCNh+LLySRH4L5XwCDEuB7lS+iz04
         zb9w==
X-Forwarded-Encrypted: i=1; AJvYcCVJiXcrMbCOF38ewvureJrWHFRAUxmmizzoCoftJ9IWvJQ/V3scky3QD3Y2ZlLZtYU7LKljtN/VBR8MO+yrmJzzyvzN5/iaz3pPWQ==
X-Gm-Message-State: AOJu0YwL3oWcA6IbRDt1z3tdrHx9pUfkP2EW59pY5JGbYIrN+73fJp5x
	PQRTo8tigSPgRS4mspvwsiOQplDWSCvYn2kk1xNALJPRgJNSuwI3MmVUGUNqYKgI9Ez9tBYbtBQ
	JzBqJNwNyW+lhexJbpFlA2Xmtc6elB+fJ9k9/ZA==
X-Google-Smtp-Source: AGHT+IGiWJgrmCqbK7aQyPTJtCa5KCNu+JLCwp5Do3vOiuFUcYfqKWV9UZ44MjFV0PlyQ9qV/64x2LvUaSr2AvUx5ZQ=
X-Received: by 2002:a05:6102:903:b0:470:4712:58c with SMTP id
 x3-20020a056102090300b004704712058cmr2684643vsh.4.1708357695021; Mon, 19 Feb
 2024 07:48:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240214-mbly-gpio-v1-0-f88c0ccf372b@bootlin.com> <20240214-mbly-gpio-v1-16-f88c0ccf372b@bootlin.com>
In-Reply-To: <20240214-mbly-gpio-v1-16-f88c0ccf372b@bootlin.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 19 Feb 2024 16:48:04 +0100
Message-ID: <CAMRc=MdFBFFTYKHgDfOieNZJ+-x7ZZMiYty6buOp2J=eFUjt0Q@mail.gmail.com>
Subject: Re: [PATCH 16/23] gpio: nomadik: support shared GPIO IRQs
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 14, 2024 at 5:24=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@bootl=
in.com> wrote:
>
> Support a single IRQs used by multiple GPIO banks. Change the IRQ
> handler type from a chained handler (as used by gpiolib
> for ->parent_handler) to a threaded IRQ.
>
> Use a fake raw spinlock to ensure generic_handle_irq() is called in a
> no-irq context. See Documentation/driver-api/gpio/driver.rst, "CHAINED
> CASCADED GPIO IRQCHIPS" for additional information.
>

Any reason for not using preempt_disable()?

Bart

[snip]

