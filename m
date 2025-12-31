Return-Path: <linux-gpio+bounces-30018-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A222CEC8F0
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Dec 2025 22:13:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0CB8E300CBAD
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Dec 2025 21:13:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20A832F83A7;
	Wed, 31 Dec 2025 21:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QZ9IZKMf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38752E228D
	for <linux-gpio@vger.kernel.org>; Wed, 31 Dec 2025 21:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767215587; cv=none; b=Wm9ph17TicmTif7Farm8ejwmeKKyYZ8nSi7c8HVt9wi1qqxNrdmRIgslp7MrftsSyxO8yHn6wJ1C22UGMSh7VFXyAmcQO1MurRvatmqxMAEpKPfBASL+vjJEcnGuQlIRS5ALh4IY6FyFAzYXkZv5qUX/F9DwTpgY31kMqSvF9SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767215587; c=relaxed/simple;
	bh=x7vb6kXWtlKUuGx05ngsu+JusxV51eT2zPRcBHPCOzM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mlv0Q6eo1AZQRvUqphNj1uNH9o97cVmWejf/VjuZohyCAlI4LIoZlZ8G/jgFlCjL6BlHTVTqGrZRUh3TxzSiKPPcjVCruN8Agw22Tw3NeboX/PFxdR96WozB+6anP5fEsdUlX4bgHh1t1vesGYufYder4dq83G14OR645hlqoM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QZ9IZKMf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D806C113D0
	for <linux-gpio@vger.kernel.org>; Wed, 31 Dec 2025 21:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767215587;
	bh=x7vb6kXWtlKUuGx05ngsu+JusxV51eT2zPRcBHPCOzM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QZ9IZKMfgRG+yXORo1uNJmDYrUzJ54l8csaLLhyPk39UWAdLkszb3ZaxP4LO9CYRj
	 UynHVMPqKjzayCIhhQZVAJJTK5S+zZtdPzA6VIiXlscDDmAx/oa55qwEKDy8ncehQo
	 jXBIjyAKsxtL7e1tva8ge10SWK5JjGpHCLmZN0njgw8V++bsknxOpXhADQi4ffBi8k
	 RMR5Y7XJYnUlgbGxIWDd+MASKPiW+foRsysEJJtwGp+LOVWxWJmLqn5umspEuIRrPd
	 gaG5zX56p+hIoQou4Lvk4bNlwa1Ly+Sex34B8dt0fTkYobulrOfIQFLr2KYZiIM6t/
	 ZCr2K3m4nuRTQ==
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-7881b67da53so92040177b3.1
        for <linux-gpio@vger.kernel.org>; Wed, 31 Dec 2025 13:13:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWS/iaNSCcDitHXmvEDqOYd91i6eaOeiIPJ9DW5Wz6umoLf4P772GnIr7BPWMkAm32AsAhpPRm2M3W2@vger.kernel.org
X-Gm-Message-State: AOJu0YyN+O8hhDjO74DPcPMHR/UfOp62b0f393SuQqlfuT7CG17TCvoO
	dMRyYEYaE2bFClEdqHAhuPi/sHKNXDYSmbEE+1jQvRfa+1T9EGyPWK7lGAEFjSn+Qz0FJubNf1x
	bUElQmBcY/kW6188DCTlDPZ/xLYDArpU=
X-Google-Smtp-Source: AGHT+IEcp3a62mstciWUIcVndIe52/9cQwt7d/YtQeDhyaUNqbmXgvqu6T/7pOVRdCkxQqFehpqEHHQ6u/ZiYaoAGGo=
X-Received: by 2002:a05:690c:6705:b0:78a:6e1d:cc0f with SMTP id
 00721157ae682-78fb40c8d29mr320754387b3.66.1767215586810; Wed, 31 Dec 2025
 13:13:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMVG2svCF06KF0e8MDCVGGjxP-FM16UE1Fip-toHUcVs-kqBQA@mail.gmail.com>
In-Reply-To: <CAMVG2svCF06KF0e8MDCVGGjxP-FM16UE1Fip-toHUcVs-kqBQA@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 31 Dec 2025 22:12:55 +0100
X-Gmail-Original-Message-ID: <CAD++jLng8aAhKJ-qCvrywm1k-_yZAMnwoVxkwT51EJozFQ8Vfw@mail.gmail.com>
X-Gm-Features: AQt7F2oX3uQW8Rt5C9gxNSA2tXRCyPxivz43jmdHZLmd3HlvjGRHMZKWN1ilHss
Message-ID: <CAD++jLng8aAhKJ-qCvrywm1k-_yZAMnwoVxkwT51EJozFQ8Vfw@mail.gmail.com>
Subject: Re: [6.19-rc2 arm64] sleeping while atomic in gpiod_configure_flags
To: Daniel J Blueman <daniel@quora.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	Linux Kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 28, 2025 at 8:18=E2=80=AFAM Daniel J Blueman <daniel@quora.org>=
 wrote:

> When booting 6.19-rc2 [1, 2] with lockdep enabled on a Qualcomm X1
> Lenovo Slim7x ARM64 laptop, I am seeing mutex usage while atomic
> during gpiod driver registration:

OK...

(...)
> gpiod_direction_output (drivers/gpio/gpiolib.c:3026 drivers/gpio/gpiolib.=
c:3019)
>  gpio_shared_proxy_direction_output
> (drivers/gpio/gpio-shared-proxy.c:188) gpio_shared_proxy
> gpiochip_direction_output (drivers/gpio/gpiolib.c:2830)

Aha it's something with the shared proxy, it's related to the whole
trail of commits adding and fixing this feature, part of which you see
if you do:
git log drivers/gpio/gpiolib-shared.c

But don't worry: it's shared proxy and it's qualcomm which means Bartosz
will be all over it as soon as he's back from holidays!

Yours,
Linus Walleij

