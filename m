Return-Path: <linux-gpio+bounces-7386-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8CA904EBC
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2024 11:03:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73F671F239D6
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2024 09:03:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 883A7155CA9;
	Wed, 12 Jun 2024 09:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PGJ7OELG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488AF12B89
	for <linux-gpio@vger.kernel.org>; Wed, 12 Jun 2024 09:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718182999; cv=none; b=X4ITlem7Yp2XgCPkdlcWkwlT9c7RNOtL+VEkvJI5dGwnf8i8KFP+ieMA6+Dk06qqd1hS48ze1FFvRrhtIwUV7u8ztt4vJ1/9zLfk3+fHOY8W67QdSt+EH1061Qm0slDUVJD4ORdZ31JDsIKUlY6jVQoAIeAfhSHLbBupkdGsKhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718182999; c=relaxed/simple;
	bh=N7O8wUeSGwMt41wGQrYX/oB8zULL+aX6gls6wIWk9tE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZhUCGRKJruIC0/rasJq+8wkGLaTa+H6/3VYDLfE8rt+NhM7j4b4bkjIY9/EbspPOWHCLnf3NokQGOLbXcpBNtYSZE9IRzM8h0jaicKarWHUZ+Ify7QcfcvpJVxEc+tVtPrMafFIb9OGyY3XTiCVEG9kVSTQai3BFMEL5RSLCi9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PGJ7OELG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D07E2C3277B;
	Wed, 12 Jun 2024 09:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718182998;
	bh=N7O8wUeSGwMt41wGQrYX/oB8zULL+aX6gls6wIWk9tE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PGJ7OELG8ivglB+l1lbR0kJNWEaD9YHwCEoqxOqcprz+sfOaUN6bQcm0aZ8ZUxWyw
	 s8KaibfmZmNvNRURAOyMzpY28zgodXfWn1OJ7KwcP6o4H5wrRHJurf2lD6NbrTOjwd
	 4Ir5FVTddRwNb1W1tqdpdI+BoYw+GI3zrpEuO7gp39wf8QfoJ6hmJAnP+EnA+CXq7Z
	 eyif8O3OFUNkzG2flk0YN51z2exgT3mfpA1mnJGae0/TYN43CzJX3lQpsI+yiHOWqO
	 Snc5FcpS+0KhkDIYKIJu5LvAy0DX5t4ofwTVLzEIIyEXU7E4hgLxjDs9YAAvlSyzY7
	 l3NF+St3OIq9g==
Date: Wed, 12 Jun 2024 11:03:14 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, linux-gpio@vger.kernel.org
Subject: Re: how to request gpiochip line which is only valid as an
 interrupt?
Message-ID: <20240612110314.68c5ef7c@dellmb>
In-Reply-To: <20240612105555.70323f9c@dellmb>
References: <20240610160155.5ca7e0d7@dellmb>
	<20240611110305.0f0c5b1f@dellmb>
	<CAMRc=McoyXp1v7fmOJffob4BWgrTV9he05JNTAx4JBBzOxV8sA@mail.gmail.com>
	<20240612105555.70323f9c@dellmb>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 12 Jun 2024 10:55:55 +0200
Marek Beh=C3=BAn <kabel@kernel.org> wrote:

> > Users can still read the value of this pin but won't be able to set
> > direction to output. =20
>=20
> Users are not supposed to read value of this pin, because it is not a
> GPIO pin. The corresponding bit is not set in gpiochip.valid_mask.
> It is for example impossible to export it in /sys/class/gpio.
>=20
> This line is valid only as an IRQ (the
> corresponding bit is set in gpiochip.irq.valid_mask).

I am starting to thing that this might be the problem, that the line is
not valid as GPIO, only as an IRQ. gpiolib seems to be unable to handle
that.

Indeed, the definition of the function
  gpiochip_irqchip_irq_valid()
first checks if the line is valid as gpio:

  static bool gpiochip_irqchip_irq_valid(const struct gpio_chip *gc,
                                         unsigned int offset)
  {
          if (!gpiochip_line_is_valid(gc, offset))
                  return false;
          ...


