Return-Path: <linux-gpio+bounces-32365-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLkqEyNOpWnS8QUAu9opvQ
	(envelope-from <linux-gpio+bounces-32365-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 09:45:23 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1311D4CEA
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 09:45:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E92A6304BCEC
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Mar 2026 08:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76D9D383C8A;
	Mon,  2 Mar 2026 08:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gvP6k8HF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A371212FAD
	for <linux-gpio@vger.kernel.org>; Mon,  2 Mar 2026 08:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772440960; cv=none; b=T343tvGmOtzmcps2hvYFAI3Tst6BqEYrLKydvtR5rWAcuZy5OAE8hZ1kDFui/efO8p9Sb2hBeSfS/j/n74vtjKaMjAYdXyrFsxolOJyY8Us26DT87dbx4SVlWG7MGj+il4UcoJsVpXynmTDfejXCXT7ZSBuz6NYa7O6HS3uTE+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772440960; c=relaxed/simple;
	bh=AdVXYlX75o87T2/vM1ZSqQrZC3MJ8EAF6Jumy/wnbXY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZqF6580QiRGbJk1LgWXwTY/HnqHUlbYHwvRHLOkGK9dbJ5d00ELFwT/FSedLfJxtPOzAbSzz+sg6Q6I8KEhdWYg7bBw1GZU/5dVYvQPnTIvRb9tnkl2wZfRnFSZqH2NllYdLzM5y604K4b6V53NykQQN/p+i8T/MIGQif1tkbUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gvP6k8HF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6296C4AF09
	for <linux-gpio@vger.kernel.org>; Mon,  2 Mar 2026 08:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772440959;
	bh=AdVXYlX75o87T2/vM1ZSqQrZC3MJ8EAF6Jumy/wnbXY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gvP6k8HFt6Dd8o2q8mo9CpDQ5jGSnlPXCx2IMmv0z/bo4fRbu0pjwx7NG1Tj5/0yg
	 qKU5m7OUvpV3rWud4njV07CRfF9rNxBUBbi+yab8EKtuUDvlGy0kxrn3awWUoHEOZT
	 Z6d78LU0hsqtLrfgPanTiS/WjEPuZoVivT5qPugTKVxHdQTvvT02DlD1WqneC1eUxn
	 Lu8+gWbz4Z5l/fxc9eKRsuoaC/Uuv2NZoK4yfz0pqukBQb7nDXTXyinHmZq/ygpvWG
	 vx1OfkvYwVtayss+2spMCH8pmYlUl/lse3DPEDg1a8qmwD3HJKankammPnMbue8fip
	 2E0yOYsjwCKFg==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3870902760cso64414581fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 02 Mar 2026 00:42:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWyzjNYwuIEoHTMfqprJTJns/1zN+0vWvyy6w1DOldR1o0uwjbvQIh3HKMPscrB10ykZj7pe1js6g4j@vger.kernel.org
X-Gm-Message-State: AOJu0YxOhx/Lb/eJSX00y/BICKTtiwInI2H6x/sdTAaS5do+TB4ceNsH
	tpzUJyeVq8RVYDcG/SezXhLliNv5Kf0A9+/e5J5PbjEjocZfbmtB9UOYC6Q9nlY1LGT4UtEyMQz
	L7PHjfg4fQ9Z6DqH1GtIsLK5ccIFQLBu8rS5qQZd7bA==
X-Received: by 2002:a05:651c:2357:10b0:383:21aa:60a0 with SMTP id
 38308e7fff4ca-389ff119e2fmr52988401fa.14.1772440958550; Mon, 02 Mar 2026
 00:42:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260228131430.102388-1-tzungbi@kernel.org>
In-Reply-To: <20260228131430.102388-1-tzungbi@kernel.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 2 Mar 2026 09:42:26 +0100
X-Gmail-Original-Message-ID: <CAMRc=MeEkN4spd07wmsVftXNYUWXYk7p6GTPbxh+8jpgw1GgGQ@mail.gmail.com>
X-Gm-Features: AaiRm53b6OiSQ2mW6nks_CMGW5KV2z20StO1KWsT0IAENlW4gJoGVZXBWfa57GM
Message-ID: <CAMRc=MeEkN4spd07wmsVftXNYUWXYk7p6GTPbxh+8jpgw1GgGQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: Fix lockdep warnings in gpiolib_{cdev,sysfs}_register()
To: Tzung-Bi Shih <tzungbi@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32365-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,samsung.com:email]
X-Rspamd-Queue-Id: AB1311D4CEA
X-Rspamd-Action: no action

On Sat, Feb 28, 2026 at 2:14=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> A lockdep warning is reported in gpiolib-cdev driver:
>
>   WARNING: drivers/gpio/gpiolib-cdev.c:2735 at
>   gpiolib_cdev_register+0x114/0x140, CPU#1: swapper/0/1
>   Modules linked in:
>   CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted
>   7.0.0-rc1-next-20260227-00065-g6af4b9cfeded #12259 PREEMPT
>   Hardware name: Samsung Exynos (Flattened Device Tree)
>   Call trace:
>     unwind_backtrace from show_stack+0x10/0x14
>     show_stack from dump_stack_lvl+0x68/0x88
>     dump_stack_lvl from __warn+0x94/0x210
>     __warn from warn_slowpath_fmt+0x1b0/0x1bc
>     warn_slowpath_fmt from gpiolib_cdev_register+0x114/0x140
>     gpiolib_cdev_register from gpiochip_setup_dev+0x4c/0xd0
>     gpiochip_setup_dev from gpiochip_add_data_with_key+0x960/0xad4
>     gpiochip_add_data_with_key from devm_gpiochip_add_data_with_key+0x20/=
0x5c
>
> This is because the SRCU wasn't held in gpiolib_cdev_register() when the
> caller is from gpiochip_add_data_with_key() instead of
> gpiochip_setup_devs().  gpiochip_sysfs_register() shares the similar
> concern.
>
> Given that both gpiolib_cdev_register() and gpiochip_sysfs_register()
> are only called from gpiolib but no external users.  Remove the lockdep
> checks to fix the warnings.
>
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Closes: https://lore.kernel.org/all/506ce9b3-d492-4fce-9d02-330e411911e2@=
samsung.com/
> Fixes: cf674f1a0c98 ("gpio: Ensure struct gpio_chip for gpiochip_setup_de=
v()")
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---

Marek: could you please leave your T-b if this fixes the issue?

Bart

