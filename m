Return-Path: <linux-gpio+bounces-31934-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KB9BGJISmGmL/gIAu9opvQ
	(envelope-from <linux-gpio+bounces-31934-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 08:51:46 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 826E3165680
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 08:51:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0B6E43006804
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 07:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7111432C939;
	Fri, 20 Feb 2026 07:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lXq7VnqI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E87309EE9
	for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 07:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771573901; cv=none; b=ea5tmoScktXqpsMkEnqFFy+rIg/e3Rdto+8/HqKg6kWjg5NQ1z4dfHOgQtCN1qVFw3c/yrpY0qTwPcxr6Gw0EJ/BntdyQDMa/KDsPTY1clgo+vb4KPnvugIchEvxEPps5nF1hWj9X9l9r6rW6RGPGT1pF3Gh+5BzSIfQK+DQZv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771573901; c=relaxed/simple;
	bh=oiflSM6gYbeTj0TmrVYHD4ZZM3D4l4EXVDqgwe/yO/k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y8w5Yc+Obvq3sHmQTjT8MEW5lL8mH2R4Rje6dPTZLanfLbJj7NdBSPle18vi9G9XaRejR58ovhlPA/MGDVl5b23yiNQIJIDrYfbTWN4PQ2bHz5E42/buQGeDKSLXMBUzT1E48PxyH0M5z1ckv4rMEoI32+BzjhFbh/0LmZomKVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lXq7VnqI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02D39C2BCB1
	for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 07:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771573901;
	bh=oiflSM6gYbeTj0TmrVYHD4ZZM3D4l4EXVDqgwe/yO/k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lXq7VnqIblbO+BnaYEXkCj7C7uUZcA6FwSRjmwBWpC0PlGv8ptfktfJJ3nDKTziv4
	 FKEuCIrV8nVXpObbtbHv+MkxRDP46aK1seuDVut98XaEr5K646atT/HMVM27j6kJOm
	 vncoYIZAsZzvsyxJWylHW7uLE/uLjOmYdSdRKyO0g4eZhD5qaRQWev6v8WN02gJZfy
	 4y0gzICjyFdKxx5fKSYYQ1GQnd3FBTZZzI+Yd6kvXxfOWJDh4w9vZcusIJw6Hfv1Tk
	 OU2RG2oMSonLfz4qfxvzrs472/u8iu+5p4o4DNgmHEqG4Sn67JzMqM8NMzIDGOkqUy
	 KzPC8EYtoulUA==
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-64ad8435f46so1578431d50.1
        for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 23:51:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXrXvyj/hyZEMXlsB6bMb/Wg2Iuld8BIwnoyPriwJdKgMSMixUe5BQFSx6yXRewoR0Z/9/IReoqUyXH@vger.kernel.org
X-Gm-Message-State: AOJu0YwU09EUC3yAhqdK5ozPnYCZNcxcnMXjS5/zJWbu/MoD0Fz4DBsQ
	Uu+K3rKupykVABNqEcQ+taGOTYpWjX8Raa3Q9gTfJ4tiS2PhDzgNMtRYYC9LD93dFe2cOWSlECW
	bZ5cIEUyVElLblizTUjHklOnV7q1JmWQ=
X-Received: by 2002:a05:690e:4189:b0:649:4906:770a with SMTP id
 956f58d0204a3-64c21a40bf5mr14993420d50.8.1771573900157; Thu, 19 Feb 2026
 23:51:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260213092958.864411-1-tzungbi@kernel.org> <20260213092958.864411-4-tzungbi@kernel.org>
In-Reply-To: <20260213092958.864411-4-tzungbi@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 20 Feb 2026 08:51:29 +0100
X-Gmail-Original-Message-ID: <CAD++jLn6XxLp7hdBOHbvAJ2bxY4dnfiWDV_UVT+EAyaKmV3Naw@mail.gmail.com>
X-Gm-Features: AaiRm51U0_fc9geEqiP5FW1MP92Ex0sMe_rh2hTztlhJlTdYXe4YiGdLqNQRa2Y
Message-ID: <CAD++jLn6XxLp7hdBOHbvAJ2bxY4dnfiWDV_UVT+EAyaKmV3Naw@mail.gmail.com>
Subject: Re: [PATCH v3 03/11] gpio: sysfs: Remove redundant check for struct gpio_chip
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Johan Hovold <johan@kernel.org>, "Paul E . McKenney" <paulmck@kernel.org>, 
	Dan Williams <dan.j.williams@intel.com>, chrome-platform@lists.linux.dev, 
	linux-gpio@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31934-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 826E3165680
X-Rspamd-Action: no action

Hi Tzung-Bi,

thanks for your patch!

This is semantically correct, so the comments are not about that.

On Fri, Feb 13, 2026 at 10:31=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org>=
 wrote:

> gpiochip_sysfs_unregister() is only called by gpiochip_remove() where
> the struct gpio_chip is ensured.
>
> Remove the redundant check.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

(...)

> -void gpiochip_sysfs_unregister(struct gpio_device *gdev)
> +void gpiochip_sysfs_unregister(struct gpio_chip *chip)

Here it is chip

> -static inline void gpiochip_sysfs_unregister(struct gpio_device *gdev)
> +static inline void gpiochip_sysfs_unregister(struct gpio_chip *chip)

And here.

> @@ -1286,7 +1286,7 @@ void gpiochip_remove(struct gpio_chip *gc)
>         struct gpio_device *gdev =3D gc->gpiodev;

But you can see that we call it "gc" (gpiochip).

Chip is more ambiguous I think, can you use "gc" everywhere?

Either way, because the patch is so nice:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

