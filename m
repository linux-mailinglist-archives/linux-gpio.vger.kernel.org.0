Return-Path: <linux-gpio+bounces-32205-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCftMoESoGlAfgQAu9opvQ
	(envelope-from <linux-gpio+bounces-32205-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 10:29:37 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F112D1A363C
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 10:29:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 24AF3303B7F2
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 09:27:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 767443A1A4C;
	Thu, 26 Feb 2026 09:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h6b4PjZZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3921A3A0EBD
	for <linux-gpio@vger.kernel.org>; Thu, 26 Feb 2026 09:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772097913; cv=none; b=Txmj+hBncYQXBXCObz3sMbqJFux7eVbfmpSB3OiW1V67w91mI1O3dP/RvEu0RMM46dZkJP9fGwKiutLyqVJ1B0RB87x6OTL7lc1xViVOsxfGNZpmzqiRFnMFOWA1qjiQYg6wKmpVW9ruHeCC/5qQcvvGqcM0YHAqYEP7h5+RLCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772097913; c=relaxed/simple;
	bh=TqktTORtkjtyruuI539OKxkbwtsx3Fb6sxG9G/Ygry8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PXGkVTeBhY4So13I76+FN8rTgNpH7JR8CFSLHqh01RhQ1r9iSgvIAZO0mSCRAb+f/UkNm/BQepuJCJxY+BGLKSsYqroh6giYbkn0uytwiIaOc7u1IAVBZBlFhZqkXVTT6rzNJZnaTa+/E0o5XFqV1eB5+7FnbZvn71/bpOMg+QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h6b4PjZZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F29DEC19424
	for <linux-gpio@vger.kernel.org>; Thu, 26 Feb 2026 09:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772097913;
	bh=TqktTORtkjtyruuI539OKxkbwtsx3Fb6sxG9G/Ygry8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=h6b4PjZZ8w3zCaSfQ1YoO6yC84kUq3fB04nq11KX7SUfZced4dTz0K9xEPBAS1e1S
	 uwZTxyFC3VSgsQkigcl5rbLCzZmOYZ1yYN/yJHeSoaczP4opF3P1H1j2++ogVu4deq
	 /MhiyM4xlNEH/A8SzNNHx3jm2bowDWp0AQe8EZUHv4qbDmIo4u0KPDkLmEQwk3l4lY
	 ykyWxzRXfzHgTdYAKORAvybA1PVwW6cIajou5LK++e0f6oXr0ZDlMgdSIZ9hvapQFE
	 bzyitr9z/tWkB6f+bbETRGQ2dAkpM7CnDhcooz8vRZcsapHmA5KBQOpPBHURmQ1MFf
	 zU4wykj6EDZkw==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-389fa352b0eso2548831fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 26 Feb 2026 01:25:12 -0800 (PST)
X-Gm-Message-State: AOJu0YyYfTcZ7oFhC8wQ9XJmjG6TvM+tO2aFH6sVIj8gf9Zj2bEEDuc2
	HNQdU43/YDHoRGQQBCa1jeLiJ7qz/bIE6nNxSiTlP4cdGpoja94+sON58f6y240rQwPZ9wZQwaJ
	Y/VrR3FGBCdYEYD8PqH4ToXyI5cEk6MmI76oV3Tgc3g==
X-Received: by 2002:a05:651c:31cc:b0:37b:8b7e:efd with SMTP id
 38308e7fff4ca-389f2fd20b0mr4700801fa.39.1772097911644; Thu, 26 Feb 2026
 01:25:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260226092023.4096921-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20260226092023.4096921-1-andriy.shevchenko@linux.intel.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 26 Feb 2026 10:24:59 +0100
X-Gmail-Original-Message-ID: <CAMRc=McM+Adk7fVp0jpWUvRQSa=Q3BK8BRC24RXoB0ussbsRww@mail.gmail.com>
X-Gm-Features: AaiRm51NT_GHt_Q3pGhuiXKoxtjStH0D-mdZs062nePLrvc_kvtVbTesM4vTtHk
Message-ID: <CAMRc=McM+Adk7fVp0jpWUvRQSa=Q3BK8BRC24RXoB0ussbsRww@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: generic: Don't use 'proxy' headers
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-32205-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: F112D1A363C
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 10:20=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Update header inclusions to follow IWYU (Include What You Use)
> principle.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpio-mmio.c     | 4 +---
>  include/linux/gpio/generic.h | 8 +++++++-
>  2 files changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
> index edbcaad57d00..0941d034a49c 100644
> --- a/drivers/gpio/gpio-mmio.c
> +++ b/drivers/gpio/gpio-mmio.c
> @@ -42,18 +42,16 @@ o        `                     ~~~~\___/~~~~    ` con=
troller in FPGA is ,.`
>
>  #include <linux/bitops.h>
>  #include <linux/cleanup.h>
> -#include <linux/compiler.h>
>  #include <linux/err.h>
> -#include <linux/init.h>
>  #include <linux/io.h>
>  #include <linux/ioport.h>
> +#include <linux/limits.h>
>  #include <linux/log2.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/platform_device.h>
>  #include <linux/property.h>
> -#include <linux/slab.h>

In that case don't we need device.h for devm_kzalloc()?

Bart

>  #include <linux/spinlock.h>
>  #include <linux/types.h>
>
> diff --git a/include/linux/gpio/generic.h b/include/linux/gpio/generic.h
> index ff566dc9c3cb..de43c06c83ef 100644
> --- a/include/linux/gpio/generic.h
> +++ b/include/linux/gpio/generic.h
> @@ -3,9 +3,15 @@
>  #ifndef __LINUX_GPIO_GENERIC_H
>  #define __LINUX_GPIO_GENERIC_H
>
> +#include <linux/bits.h>
> +#include <linux/bug.h>
>  #include <linux/cleanup.h>
> -#include <linux/gpio/driver.h>
> +#include <linux/container_of.h>
> +#include <linux/errno.h>
>  #include <linux/spinlock.h>
> +#include <linux/types.h>
> +
> +#include <linux/gpio/driver.h>
>
>  struct device;
>
> --
> 2.50.1
>

