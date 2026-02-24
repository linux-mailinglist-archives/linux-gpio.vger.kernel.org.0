Return-Path: <linux-gpio+bounces-32128-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +AgnMlV1nWmAQAQAu9opvQ
	(envelope-from <linux-gpio+bounces-32128-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 10:54:29 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DB1184FB2
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 10:54:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F0623069D49
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 09:52:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC5DB37107D;
	Tue, 24 Feb 2026 09:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TRe05JmO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E14637106A
	for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 09:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771926755; cv=none; b=R1JBoM14JfY+Shq/Cj6kRei2TClkUigcIAzZPXqLO5bZN4RujIkNZWBmpKNMfqIDGIbhncea/RJyCiX6kHJ0gQUKU0+tRJ2DoDKmcfnq/Ks0cxw7fQu6KQo14/CK2uLTPiWFtqPdDWpiTkfOFns0GAGu3QUQtSVhdfm7tPEJn8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771926755; c=relaxed/simple;
	bh=m8HVzWzouKm2cXoM/hnZEz9vy29hL3PfIfqqpzFCC/o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oUYnbeD1mei/1oo5eA4KOtjNDyANZVXfg79wHndqA86MpbLB1sM0BO5oJIPrje0LTDpwgYdKGyG6TiX5wEuBMmZtJQ/T0Z5bzLKZwX+w5S08fboL/6fUF2w6JgDKfUKE1SijqLIxH+52M858onYcqzdkFU9ONQCaZ1Mt3kGP+2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TRe05JmO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FA0AC2BC87
	for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 09:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771926755;
	bh=m8HVzWzouKm2cXoM/hnZEz9vy29hL3PfIfqqpzFCC/o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TRe05JmOj0zrjkSzFH05uNJmpKrg9ivJSnNZidMu2MnVIUKZF2E8qd5SAYZSngaoY
	 O8vAPho2SoADBUurJnXaYQXTbwAs3BDM/1FyCQJRti9EE+T6XzDiKFI5obf+Kg+X3t
	 XxWheObEfdxROoSp6FAspV52lwIO7siyrt+q+VrDk/Ubp6/DpoE4jG0h0VGtGXMHOr
	 ot3zk8ELoOgk40t1EzX3B802yz94IAaFlz3R6aUQf11S+whbKxHnzKlO/9PsUtuYuB
	 67GU4vmMijyDU8a2MtR+3fW4D8MnvGrTnc7bjoj2cPaE3OeRz8B9v8+7nH24XsKtVN
	 jEXsifY9fwq+A==
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-64ad79dfb7cso5013565d50.2
        for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 01:52:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXeeuBrjHBTw/xgMq8YP9Xcwrr4Qa2SeNlV4FYHVWT8CysD6aa2ajWHma1QeoHjevFxZJ41y8bZDyob@vger.kernel.org
X-Gm-Message-State: AOJu0YzSnmXrb6kum0fHYHgPOtO0JDY/54QgQDPemPyez20cKT2nS/QR
	U/8sNiziR7HgKZcSjmack/DfOaR/RUpQucf2Ewa08hwA0bNxssG0a9Fqedgq98jJO6lJhVp4xMR
	qM9+r7a1lh6Q2qpN1k2I7UsOkXd6+Bs8=
X-Received: by 2002:a53:c94e:0:b0:64a:df24:813a with SMTP id
 956f58d0204a3-64c78ace3b7mr7721765d50.29.1771926754578; Tue, 24 Feb 2026
 01:52:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260224092419.1275016-1-wens@kernel.org>
In-Reply-To: <20260224092419.1275016-1-wens@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 24 Feb 2026 10:52:23 +0100
X-Gmail-Original-Message-ID: <CAD++jLnKxDi1GCp94zAUKhwBvQwVAdT8bgNyw5XM2+PTOhxq1Q@mail.gmail.com>
X-Gm-Features: AaiRm52BGBXQpCSo4y3loUoixsBJESk5D9jZK8HxDIglW3gm2oXSHNiHQK0JrJg
Message-ID: <CAD++jLnKxDi1GCp94zAUKhwBvQwVAdT8bgNyw5XM2+PTOhxq1Q@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: sunxi: Implement gpiochip::get_direction()
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	James Hilliard <james.hilliard1@gmail.com>, aprizel@wens.tw, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,sholland.org,gmail.com,wens.tw,vger.kernel.org,lists.infradead.org,lists.linux.dev,oss.qualcomm.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-32128-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 36DB1184FB2
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 10:24=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wro=
te:

> After commit 471e998c0e31 ("gpiolib: remove redundant callback check"),
> a warning will be printed if the gpio driver does not implement this
> callback. The warning was added in commit e623c4303ed1 ("gpiolib:
> sanitize the return value of gpio_chip::get_direction()"), but was
> masked by the "redundant" check.
>
> The warning can be triggered by any action that calls the callback,
> such as dumping the GPIO state from /sys/kernel/debug/gpio.
>
> Implement it for the sunxi driver. This is simply a matter of reading
> out the mux value from the registers, then checking if it is one of
> the GPIO functions and which direction it is.
>
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Pulled out v1 of my tree and put in this one instead!

Yours,
Linus Walleij

