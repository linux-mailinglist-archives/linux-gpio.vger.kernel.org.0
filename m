Return-Path: <linux-gpio+bounces-35248-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFFpF6Hy5WkMpgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35248-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 11:32:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EF343428E43
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 11:32:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E7374305C8FB
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 09:27:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34DA638F232;
	Mon, 20 Apr 2026 09:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lcx+2Fc2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC7338945C
	for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2026 09:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776677220; cv=none; b=I0chRXu1ZSTMk5sBv4UPp125K4kYK8MXsX60/OiB2/V6T93BP5DuOABqZPZVdUsiP7pL1EaNvOC57QpXSbSytBoIB6Zxp2dr0pliNKxLO3XDc6ja0mnNRbU/xIC0aH+8onJflroRC8xL5uxEp4T5HNzRX2+kFNzobv25cfY50xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776677220; c=relaxed/simple;
	bh=WyyI5qiClm0Zcy0XJGbhBQfHxOIxoioFTl8Pb+GthJE=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tKWgw6CEbftLV/fENu3dO6AMvCfey43QVblki4K9Yg6g2Muwjirh7nHlYetJJgVngtMLGEjVEPkT8IaUFSxbH+ny6ye2vwrnN7ahG0dj/S+GMyL20lfHa9xRh4mcIKf5y3CLs6kzg1vaCFiGMiz7gXkrIH3vfx4S9aGnqK7jZl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lcx+2Fc2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF1F4C2BCB9
	for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2026 09:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776677219;
	bh=WyyI5qiClm0Zcy0XJGbhBQfHxOIxoioFTl8Pb+GthJE=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=lcx+2Fc2Pq1sy5Tzftr4gndpgsvvexJd5j03bOQGEO/mHbrZZjjOZgH4cpg7j8AvA
	 Mng5qTeGSeIdbLBeL6d66Gzc9uPqJIAT9g10ANOrz4/tn+209vMdSUmnRPXP3SY+ga
	 h5HrHG4BAGlC6Wn9osQ2MEoMIb5hEGzlHsFNjA17GjoRQ8nTNyNM+nbgZZ1N4M2XCC
	 Iu+504VeMQD8xyKkxoj0ez9P+dHKiRymxkBAz1quEWecQPolwRnPyB5Oq4X1jwWlgb
	 M/AxHYckGDAn8LjAh9piZYWgemLESBolAKCjlmNlels0uFhyBj0aVJusC6VXaVrtLD
	 zqXbPKCULSGTA==
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12c8ccc7755so799266c88.0
        for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2026 02:26:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ//+6aZCDFZ7HMHwlf/HiyeMLW/oUt36YfYWZhUgMZGD8H4P5AOqPzbOfOoZvzhcXExDFQaCln4iMaz@vger.kernel.org
X-Gm-Message-State: AOJu0YzAiv2OiapLRsaz4GGkfRvbDtvSNHERqQdmsRwAsXYIapO85gWd
	bYyIesOnY0SYahAemME3eRfeYTrOdPEeCvVCu7Qy2DZvVkxdMmCgin2tbTVW429C7Be3ip4Vg6s
	92Nz/WQRbos/6248juLafOYqcDMnCoSDsXUKiq21fRA==
X-Received: by 2002:a05:7022:458d:b0:127:5c3d:bd95 with SMTP id
 a92af1059eb24-12c73fa2c95mr6030242c88.32.1776677219053; Mon, 20 Apr 2026
 02:26:59 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 20 Apr 2026 05:26:55 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 20 Apr 2026 05:26:55 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260415-6-12-gpiolib-cve-2026-22986-v1-0-3a7a6de332eb@cherry.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260415-6-12-gpiolib-cve-2026-22986-v1-0-3a7a6de332eb@cherry.de>
Date: Mon, 20 Apr 2026 05:26:55 -0400
X-Gmail-Original-Message-ID: <CAMRc=MfJGJYQaQO4gv774NJmSo8pwFSO8puzCtpPB8okXF9dAw@mail.gmail.com>
X-Gm-Features: AQROBzApwb9ajDjm_t5Hs0DJRySxg8Y3Y8B05MHQ5Ft3fFtAqSg468AhG_f6NBs
Message-ID: <CAMRc=MfJGJYQaQO4gv774NJmSo8pwFSO8puzCtpPB8okXF9dAw@mail.gmail.com>
Subject: Re: [PATCH 6.12.y 0/2] gpiolib: backport fa17f749ee5b and a7ac22d53d09
To: Quentin Schulz <foss+kernel@0leil.net>
Cc: Heiko Stuebner <heiko.stuebner@cherry.de>, stable@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Quentin Schulz <quentin.schulz@cherry.de>, 
	Kent Gibson <warthog618@gmail.com>, =?UTF-8?Q?Pawe=C5=82_Narewski?= <pawel.narewski@nokia.com>, 
	Jakub Lewalski <jakub.lewalski@nokia.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35248-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[cherry.de,vger.kernel.org,linaro.org,gmail.com,nokia.com,oss.qualcomm.com,bgdev.pl,linux.intel.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0leil.net:email,qualcomm.com:email,cherry.de:email,mail.gmail.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,kernel];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EF343428E43
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 15 Apr 2026 13:15:39 +0200, Quentin Schulz <foss+kernel@0leil.net> =
said:
> Backport a7ac22d53d09 ("gpiolib: fix race condition for gdev->srcu") to
> 6.12.y. To make the git context difference between commit a7ac22d53d09
> and its backport in 6.12.y smaller, also backport fa17f749ee5b
> ("gpiolib: unify two loops initializing GPIO descriptors").
>
> a7ac22d53d09 fixes an issue reported as being present since 6.9. It's
> been fixed in 6.19 and backported to 6.18.y in fb674c8f1a5d8.
>
> The git context difference could be even smaller if we also backported
> d4f335b410dd ("gpiolib: rename GPIO chip printk macros") but its
> cherry-pick conflicts so I decided to not include it for now. It was
> backported to 6.18.y though (because it applied cleanly and helped
> a7ac22d53d09 being cleanly applied as well, see
> https://lore.kernel.org/stable/2026011530-owl-savage-9b8e@gregkh/).
>
> The changes between a7ac22d53d09 in v6.19 and the second patch of this
> series is (according to git range-diff):
>
> """
>       ## drivers/gpio/gpiolib.c ##
>      @@ drivers/gpio/gpiolib.c: int gpiochip_add_data_with_key(struct gpi=
o_chip *gc, void *data,
>         gdev->ngpio =3D gc->ngpio;
>         gdev->can_sleep =3D gc->can_sleep;
>
>     -+  rwlock_init(&gdev->line_state_lock);
>     -+  RAW_INIT_NOTIFIER_HEAD(&gdev->line_state_notifier);
>     ++  BLOCKING_INIT_NOTIFIER_HEAD(&gdev->line_state_notifier);
>      +  BLOCKING_INIT_NOTIFIER_HEAD(&gdev->device_notifier);
>      +
>      +  ret =3D init_srcu_struct(&gdev->srcu);
>     @@ drivers/gpio/gpiolib.c: int gpiochip_add_data_with_key(struct gpio=
_chip *gc, voi
>      @@ drivers/gpio/gpiolib.c: int gpiochip_add_data_with_key(struct gpi=
o_chip *gc, void *data,
>                 ret =3D gpiodev_add_to_list_unlocked(gdev);
>                 if (ret) {
>     -                   gpiochip_err(gc, "GPIO integer space overlap, can=
not add chip\n");
>     +                   chip_err(gc, "GPIO integer space overlap, cannot =
add chip\n");
>      -                  goto err_free_label;
>      +                  goto err_cleanup_desc_srcu;
>                 }
>         }
>
>     --  rwlock_init(&gdev->line_state_lock);
>     --  RAW_INIT_NOTIFIER_HEAD(&gdev->line_state_notifier);
>     +-  BLOCKING_INIT_NOTIFIER_HEAD(&gdev->line_state_notifier);
>      -  BLOCKING_INIT_NOTIFIER_HEAD(&gdev->device_notifier);
>      -
>      -  ret =3D init_srcu_struct(&gdev->srcu);
> """
>
> s/gpiochip_err/chip_err/ aside, the rest of the diff comes from feature
> commits which do not fit the rules for backporting to stable.
>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
> Bartosz Golaszewski (1):
>       gpiolib: unify two loops initializing GPIO descriptors
>
> Pawe=C5=82 Narewski (1):
>       gpiolib: fix race condition for gdev->srcu
>
>  drivers/gpio/gpiolib.c | 43 +++++++++++++++++++++----------------------
>  1 file changed, 21 insertions(+), 22 deletions(-)
> ---
> base-commit: e7a3953084a7050ca349010deb22546834c2e196
> change-id: 20260415-6-12-gpiolib-cve-2026-22986-f0b4331c0aa1
>
> Best regards,
> --
> Quentin Schulz <quentin.schulz@cherry.de>
>
>

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

