Return-Path: <linux-gpio+bounces-36611-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHJpIhM2AmocpAEAu9opvQ
	(envelope-from <linux-gpio+bounces-36611-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 22:03:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4441515680
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 22:03:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B4FCE305BFB6
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 20:01:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BF4C329C54;
	Mon, 11 May 2026 20:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lFfnP2XZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0242E8DEC
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 20:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778529681; cv=none; b=bxUe1jOp80iRXeZJHhovr/hOIzoEjLnCZqWkik0Byyukt8WxueFQeG4+mjJY9FSFdemc7c/ew5QRtnzy0/dbRCLVYDGhONTwPUKylzW5KCKPEjb7SwUMlqv5CryFdxWKLKvJ7vXdQC5NWAeuXURoZMVQnB26Tw+yK6n5qSdkeds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778529681; c=relaxed/simple;
	bh=SidA+dUAZZZvheU90fCA8wbYd1elVlbPIUNjX+RGP3w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q8Z5SRLjK4jSNGBw5i86UNiswGt2NbMYMfyMEvK//fdmJ/iIV/Nw+Eyh4v6e35jz4sPIiHx7NnTkmoXolHoDF+gxFANbx2LoabpEVjgGLIoWlndAmCHHjpUdnSdgc5ly670veCnEbbJLtrDrYI6ohHaLstBX2B2L3oBZSfgYoJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lFfnP2XZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08BA8C2BCF5
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 20:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778529681;
	bh=SidA+dUAZZZvheU90fCA8wbYd1elVlbPIUNjX+RGP3w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lFfnP2XZwjdBo4BTtgU8O72MJ2clLfMZEmrgu4EPtnG9wmNecb3uP3lL1p0qjlg/s
	 CRKMRlAcaVuJTRGosEXCfpKdoxLL2hInuLQRKbudZUW59x0Q+h0lv/O+/Ch1TowO5Q
	 C7Z1o6/ws/Bz/2C+AR/s2fDux1u+3Fn1p/l4dPz2Cfqu0nLbA2UqVSpr0AxwAowRHd
	 ozhfrqhlatOaTkxDHUvBUtmDFLMxF6o7h6UW40LropWMLQZszYnJc3ktkI2AXo3P2e
	 xt0XwPPYunL9X5OAZQQ1xPY3lqgAPOLfOQbSfAKJb4V5QFTT5p+q6GLy/EakVTxuTM
	 Qpt2sm3uqMlEw==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a525aedb24so4730577e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 13:01:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8IMn0m2uUk7j8vA8m8+FGLPfCienqkcdIif/1AgWMcqdoWhGZmPxnZCbhwF17Z8XXYdIsdYwBnTSMK@vger.kernel.org
X-Gm-Message-State: AOJu0YyLj2vovTmLIjxjxM4rAMkH5rWGzKbu73FeKehi+oub31J3/K0m
	YX7S1j4tHCcQbK6Cjhi3fbOg5VzFazu4kcwnM4Q4fx7lCeqCprXA3nHptZH7ozcFdY0UnFRlls0
	Fn9TGK4mURIhmTxC+DxVBzXAf9aa8/4I=
X-Received: by 2002:a05:6512:3186:b0:5a8:691e:abe with SMTP id
 2adb3069b0e04-5a8e31ec72bmr5414e87.30.1778529679763; Mon, 11 May 2026
 13:01:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505104056.1812343-1-wenst@chromium.org>
In-Reply-To: <20260505104056.1812343-1-wenst@chromium.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 11 May 2026 22:01:06 +0200
X-Gmail-Original-Message-ID: <CAD++jLkoiJN_gxv0y4ARBMG7bTc07OjvDR1d8DykkNp7g1LOUQ@mail.gmail.com>
X-Gm-Features: AVHnY4K7pYfonqtNSNtLkl02aFuSTA7FYZ67VUeH1tI-OzuQASo_yecrO3Z2b_c
Message-ID: <CAD++jLkoiJN_gxv0y4ARBMG7bTc07OjvDR1d8DykkNp7g1LOUQ@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: mediatek: common-v1: bypass pinctrl GPIO
 layer in set GPIO direction
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: E4441515680
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
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,collabora.com,lists.infradead.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-36611-lists,linux-gpio=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Tue, May 5, 2026 at 12:41=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:

> pinctrl_gpio_direction_input() / pinctrl_gpio_direction_output() take
> the pinctrl mutex. This causes a gpiochip operations to need to sleep.
> Worse yet, the .can_sleep field in the gpiochip is not set. This causes
> the shared GPIO proxy to trip over, as it uses gpiod_cansleep() to check
> whether it can use a spinlock or needs a mutex. In this case, it ends
> up taking a spinlock, then calls pinctrl_gpio_direction_output(), which
> takes a mutex. This causes a huge warning.
>
> Since the Mediatek hardware has separate clear/set registers, there is
> no risk of clobbering other bits like with a read-modify-write pattern.
> Also, once the GPIO function is selected / muxed in, further GPIO
> operations do not involve pinctrl operations or state. The GPIO direction
> and level values do not require toggling the pinmux or any other pin conf=
ig
> options.
>
> Switch to directly calling mtk_pmx_gpio_set_direction() in the GPIO set
> direction callbacks to avoid taking the pinctrl mutex. Drop the
> .gpio_set_direction field in mtk_pmx_ops to signal we are no longer using
> the pinctrl GPIO layer for setting the direction.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Patch applied.

Yours,
Linus Walleij

