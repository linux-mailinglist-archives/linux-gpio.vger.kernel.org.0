Return-Path: <linux-gpio+bounces-31432-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJEaEoJDg2nqkgMAu9opvQ
	(envelope-from <linux-gpio+bounces-31432-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 14:02:58 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 61765E622A
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 14:02:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D54D3043D1A
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Feb 2026 12:58:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03BCB407572;
	Wed,  4 Feb 2026 12:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kExNOxF7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC77156F45
	for <linux-gpio@vger.kernel.org>; Wed,  4 Feb 2026 12:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770209926; cv=none; b=r7ERKq61GWU/YT00sUreQkp6CIi3TciD4Qp3cEOuw3yPbQbnpmDXqE9YXZMyMD8vtkahtzm9RIPZhtACoN1fQxctzsFlmgVbbNtHVz184rm5gQiGvTMvkB8Gq3aSxwQn2yJYfV5Xjz+frQoW4ckP11Woa5XOxZ+JwSHWT9Xlh34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770209926; c=relaxed/simple;
	bh=ELhpneqwUCDgZ6KdocffVj0r0JmPKjyIsDF6WR0/XTo=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pjVWbltkzzOHbZ9te+d/WqMFoHAnoXHry5lf9BDD7Ijf1tigdXPyT1nd1VYRhBIB32pOeJqH+y1BRRLOew3rc5xRBm/OH5JZFwnsw+oG/42afawz3BircUPWlFeDduCo2GgwWlpVOmgOClUdyrbopWgeXNnUdRwn0dWhcW/vPvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kExNOxF7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9919AC16AAE
	for <linux-gpio@vger.kernel.org>; Wed,  4 Feb 2026 12:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770209926;
	bh=ELhpneqwUCDgZ6KdocffVj0r0JmPKjyIsDF6WR0/XTo=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=kExNOxF7zq+JrMtYFmtYDQMOKqtxfxU12BcC4UoQDhGs5aFxUTAL6oYBW5i0HUWLj
	 y8TMASe59IVA6VEGfpsGGEQPd3aJIUlB5S8VFaMPDYs4lZsRIC6UtNRNA7yNl+rhmB
	 OI8pnvu3d/iK85Qz1WkXRgiNAP90cN9Zw+B9JexFDeoCnCmaKKNwyCy/+iRhp4I58R
	 g25bBS3RPdT63znJj2Is+BA80/SgEh/wgFkpl539rCudXuC7u9/tmUstoXzYLN2/em
	 Ewv/5pyo0XTmefckI4UgVuelrR+hc67WZi6oCougMMpZ5i7Gy/0toGRhrO0JWSUMxD
	 BH++5rO0orwJw==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-382fb275271so65152811fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 04 Feb 2026 04:58:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWNQmATW7omrem3KA9kJa8rUfSmo8XRqzz5LtUdOg/HphpovV4uggaACItvvBs74GVCnR+/Xcx6M6z7@vger.kernel.org
X-Gm-Message-State: AOJu0YzoeBYc5qCFsrWMGzXGLWxOROiML33X/ZwDnvWyg9oo9V91kQQy
	oG+SUuZI2dmEBgVUW3x4PzjbMy3l9kZLpm/drqIc1CyMrmn6gNlP/EORnuyutIF/nuWfq/zycNj
	gI8j9/GSbH+aIFopaXnK+Wkvy6utsLFDGX4MmzRKDyQ==
X-Received: by 2002:a2e:bd04:0:b0:386:1ce2:1194 with SMTP id
 38308e7fff4ca-38691d86a23mr8919481fa.31.1770209925273; Wed, 04 Feb 2026
 04:58:45 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Feb 2026 07:58:44 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Feb 2026 07:58:44 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260203061059.975605-8-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203061059.975605-1-tzungbi@kernel.org> <20260203061059.975605-8-tzungbi@kernel.org>
Date: Wed, 4 Feb 2026 07:58:44 -0500
X-Gmail-Original-Message-ID: <CAMRc=MdYeoMxNFYeX_9S-M286aUjnsxLyy9_apmfPR4NeqVouw@mail.gmail.com>
X-Gm-Features: AZwV_Qh6Gi1pfyomIVbIDTzDh-vaqoE7doDZ1XfTeCeir74PnHIOe8829DAgfdg
Message-ID: <CAMRc=MdYeoMxNFYeX_9S-M286aUjnsxLyy9_apmfPR4NeqVouw@mail.gmail.com>
Subject: Re: [PATCH v2 07/11] gpio: Add revocable provider handle for struct gpio_chip
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, chrome-platform@lists.linux.dev, 
	Dan Williams <dan.j.williams@intel.com>, linux-gpio@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linusw@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31432-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 61765E622A
X-Rspamd-Action: no action

On Tue, 3 Feb 2026 07:10:54 +0100, Tzung-Bi Shih <tzungbi@kernel.org> said:
> The underlying chip can be removed asynchronously.  `gdev->srcu` is used
> to ensure the synchronization before accessing `gdev->chip`.
>
> Revocable encapsulates the details.  Add revocable provider handle for
> the corresponding struct gpio_chip in struct gpio_device so that it can
> start to hide the synchronization details.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---

[snip]

> diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
> index 3abb90385829..cd136d5b52e9 100644
> --- a/drivers/gpio/gpiolib.h
> +++ b/drivers/gpio/gpiolib.h
> @@ -52,6 +52,7 @@
>   * @device_notifier: used to notify character device wait queues about the GPIO
>   *                   device being unregistered
>   * @srcu: protects the pointer to the underlying GPIO chip
> + * @chip_rp: revocable provider handle for the corresponding struct gpio_chip.
>   * @pin_ranges: range of pins served by the GPIO driver
>   *
>   * This state container holds most of the runtime variable data
> @@ -79,6 +80,7 @@ struct gpio_device {
>  	struct workqueue_struct	*line_state_wq;
>  	struct blocking_notifier_head device_notifier;
>  	struct srcu_struct	srcu;
> +	struct revocable_provider __rcu *chip_rp;
>

Why __rcu? This doesn't live in a different address space, only the internal
resource it protects does. If anything - this could be __attribute__((noderef))
but even that is questionable as this is an opaque structure.

Bart

>  #ifdef CONFIG_PINCTRL
>  	/*
> --
> 2.53.0.rc2.204.g2597b5adb4-goog
>
>

