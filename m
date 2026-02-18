Return-Path: <linux-gpio+bounces-31791-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJhXIniWlWk1SgIAu9opvQ
	(envelope-from <linux-gpio+bounces-31791-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 11:37:44 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1ABF155875
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 11:37:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 23E5830A455E
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 10:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82F6B2C0298;
	Wed, 18 Feb 2026 10:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NKc7qnps"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465A615ADB4
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 10:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771410277; cv=none; b=I2uKn/YBvcpuHMyzYd5MtN8oaTpt/89vsj1Jx0CTghqPG6KP8nvhGUPPW/rZWE4FuGY7ssHAyJiN6nQtr85HcyFbnWPweOGoo48Ep/aiGGdpzY2q5+G+9kdp9wr/e9RX6BcY/WHwyYOM1pR71htJ9R/P4cCYQwyd4nui0fdUUeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771410277; c=relaxed/simple;
	bh=9jn4Wz1Euhv/tXTL+lfU4IPp3yVNOZMtz7lWcvIds3Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M+iWb37ki7ZYziK0mvL4TD1KGPO/sguBmZMgTdUmQl5KkLQ1M28MrDsKU1Ou/Edq0TXgPmPuwPjbelrTsO1ZvNljN4BRtyBBKZq0Lr1LSH+S1ZTz8uW45M9jjcrgaS89N/3gNcufwgamfUEPodLAYOIPiL6P+APzd71ghF1bgrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NKc7qnps; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21C99C2BCAF
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 10:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771410277;
	bh=9jn4Wz1Euhv/tXTL+lfU4IPp3yVNOZMtz7lWcvIds3Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NKc7qnpsY2rrgICXiqMGinW6DLrYQi6HM/2hHugj3FPJ6dKwDkHyORPQEuqKyu0dF
	 pCAd+Q7F0xnecSieKHaFh6LqUiuWOHdUewE4fexHUl2xaoL7T6uid4A6L2lVvHOIhT
	 QTkBNGbul6BoktV31rGvMqiBwC6qJyQVYrocEVRzYLrACBrgiMTOqHb/mZckWu8HLr
	 PvLf4iMUJz17X8O23NgLmm4eq5H7FTayPlbAatkFBsTwvNa4oOplvfsoJFo6fZPk77
	 4OCJevoxbGBKcAuJMzAy+VBnqW06l2XHFHZgf9aWMKHrYOeu+ZzlmFH9u8LKfJLluY
	 HVtcd9bJ6ZDjA==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38707d4c8b9so53959481fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 02:24:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWKMTaGasK0SEWHQWhVQLQUlJq/Gutokf2JlMF7FMtfY54KkUDXCFJB/sztP/kIolz9fFVPF5ahEKzL@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj53BV60YA7G69l3rx68XGgzP2fSTEUaW6849FuL8eTL+X3ldG
	iA5RYfFVrQasQO4v0yyHp0OcnPyXUP//hfx1L491+JqxVHuHMrgWzNcgcYaayhGY0k1gVq2Aae0
	1Vhbl4err1scCoeCz8c//UvWJlutwa/lofI5AGGeMKQ==
X-Received: by 2002:a05:651c:2108:b0:37a:4bab:ca09 with SMTP id
 38308e7fff4ca-3881b8b4218mr45707811fa.6.1771410275722; Wed, 18 Feb 2026
 02:24:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260213092958.864411-1-tzungbi@kernel.org> <20260213092958.864411-5-tzungbi@kernel.org>
In-Reply-To: <20260213092958.864411-5-tzungbi@kernel.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 18 Feb 2026 11:24:22 +0100
X-Gmail-Original-Message-ID: <CAMRc=MeD9txV07dnLbdF59em-g2cvYc1jD7b21Xb7_gSzs0nrA@mail.gmail.com>
X-Gm-Features: AaiRm50krmUrFN63p_jh4DIUA9nO4nbrcRFLsK3aroEGAH04aMPbJbcyNTGwkL4
Message-ID: <CAMRc=MeD9txV07dnLbdF59em-g2cvYc1jD7b21Xb7_gSzs0nrA@mail.gmail.com>
Subject: Re: [PATCH v3 04/11] gpio: Ensure struct gpio_chip for gpiochip_setup_dev()
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31791-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E1ABF155875
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 10:31=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org>=
 wrote:
>
> Ensure struct gpio_chip for gpiochip_setup_dev().  This eliminates a few
> checks for struct gpio_chip.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
>
> -int gpiochip_sysfs_register(struct gpio_device *gdev)
> +int gpiochip_sysfs_register(struct gpio_chip *chip)
>  {
> +       struct gpio_device *gdev =3D chip->gpiodev;
>         struct gpiodev_data *data;
> -       struct gpio_chip *chip;
>         struct device *parent;
>         int err;
>
> @@ -994,12 +994,6 @@ int gpiochip_sysfs_register(struct gpio_device *gdev=
)
>         if (!class_is_registered(&gpio_class))
>                 return 0;
>
> -       guard(srcu)(&gdev->srcu);
> -
> -       chip =3D srcu_dereference(gdev->chip, &gdev->srcu);
> -       if (!chip)
> -               return -ENODEV;

I think it would make sense to add lockdep checks when removing guards
in non-static functions.

Bart

