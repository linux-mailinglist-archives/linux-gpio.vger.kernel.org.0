Return-Path: <linux-gpio+bounces-31426-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CoiMiUhg2lKiAMAu9opvQ
	(envelope-from <linux-gpio+bounces-31426-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 11:36:21 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D934E499D
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 11:36:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5642430097C9
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Feb 2026 10:33:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 814CA3DAC02;
	Wed,  4 Feb 2026 10:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jR/iRkSa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428D43DA7F4
	for <linux-gpio@vger.kernel.org>; Wed,  4 Feb 2026 10:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770201235; cv=none; b=gYOUFYMsWCRHjmE1lB7qBZezy832swSoRqUhpMwmB98o/RpB4iLUNTyhlMBfq4ySEWPPtwFAc2r0+yaMpMxi1Agy9/Hid4a9upDlNfGHQrMMsyNb6kNIZ06zc1ecs/YZx/Tkp0TFSfd3MYSAJ2ZPVdkTUiDTnU8cTrXmeIQywRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770201235; c=relaxed/simple;
	bh=5OSL+7WcWh98AmsDv3ZmrtGEZRnhu6O+5lr9ibRn8JM=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JSncVhPjrsMzVxvt4DmKXsCwpKW8eD4P5y6MgA60eUFY10665cRMLNAF0niwocTGsyfgVSgd2UgT768+be0U4rnIt1NCul7P9379KlrDE1CbSu8YBcChsWa2Pu8vKiJE0AZa5lE0LeQD6IxLeYRDKenYFAzbbkIVa5ALPHIjeYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jR/iRkSa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED812C16AAE
	for <linux-gpio@vger.kernel.org>; Wed,  4 Feb 2026 10:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770201235;
	bh=5OSL+7WcWh98AmsDv3ZmrtGEZRnhu6O+5lr9ibRn8JM=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=jR/iRkSaXDd6bkJ1onH7EvTLRK0L1C+N/CFUwmCRwXHTRkCbf4LEFnbBg8akH2uFG
	 Uyj+l8CtalAnpfFIGmodm+NX6rWX2vigajIUNlAroVRy3iO7T8c1LroI2Lxnw4n3C7
	 jy9wVZCKRYav8UTieeL343zfayOpPbIifthjy5zmvzyF9kG13GerPJRlfofbO+jBKF
	 w4/Hpz0aFs1WBpKIr+qqZriA5J8BmqEb4cxHhn7iRgfU3IpDX44u2KEawyIvp87Voz
	 itQOX2/zZE6gBEDWG1oHxCscT2O5FwYz4ewyZ4rv/FADugbCUWavafGW0YJUzsJj9n
	 FHS68cBjxymXw==
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-124a635476fso9798554c88.0
        for <linux-gpio@vger.kernel.org>; Wed, 04 Feb 2026 02:33:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXeEplRcDjbq/r0pqyURkZ8G2f8mvNQQTSmIPuQW2oFsPRuF9QI6xnaidGqqI+lhzCqsCCRw7SiZ4+U@vger.kernel.org
X-Gm-Message-State: AOJu0YwXTHqOQYnZEfmwXHAdHpNNnKY+4McYvEBSTKzjCg3ECN94wK55
	Va8ISFKMxS7j9IeYdmfCd0oxNZKnQZ0U2893+rV7/jTqwRxp8AS6QIjkuZ/JWjU412ZktrEtvS7
	g6vH2TDv86Dspl8xw6Yhq36/RcvCff+FHbbBSPw6C9A==
X-Received: by 2002:a05:7022:311:b0:123:3500:b688 with SMTP id
 a92af1059eb24-126f478f004mr1069615c88.19.1770201234321; Wed, 04 Feb 2026
 02:33:54 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Feb 2026 04:33:50 -0600
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Feb 2026 04:33:50 -0600
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260203061059.975605-4-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203061059.975605-1-tzungbi@kernel.org> <20260203061059.975605-4-tzungbi@kernel.org>
Date: Wed, 4 Feb 2026 04:33:50 -0600
X-Gmail-Original-Message-ID: <CAMRc=Mf=gUMEaeExH6mVrhMSNWbCchRfkrugr492Ccp-j3V8Ag@mail.gmail.com>
X-Gm-Features: AZwV_QhEv-yhMkubasYNV84XftIGHjdrMbauFxWu6WSjB5e2tMs6x5Bsi0Ob9Uc
Message-ID: <CAMRc=Mf=gUMEaeExH6mVrhMSNWbCchRfkrugr492Ccp-j3V8Ag@mail.gmail.com>
Subject: Re: [PATCH v2 03/11] gpio: sysfs: Remove redundant check for struct gpio_chip
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31426-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 6D934E499D
X-Rspamd-Action: no action

On Tue, 3 Feb 2026 07:10:50 +0100, Tzung-Bi Shih <tzungbi@kernel.org> said:
> gpiochip_sysfs_unregister() is only called by gpiochip_remove() where
> the struct gpio_chip is ensured.
>
> Remove the redundant check.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
> v2:
> - No changes.
>
> v1: https://lore.kernel.org/all/20260116081036.352286-9-tzungbi@kernel.org
>
>  drivers/gpio/gpiolib-sysfs.c | 9 +--------
>  drivers/gpio/gpiolib-sysfs.h | 6 ++++--
>  drivers/gpio/gpiolib.c       | 2 +-
>  3 files changed, 6 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
> index cd553acf3055..8e6b09d8b559 100644
> --- a/drivers/gpio/gpiolib-sysfs.c
> +++ b/drivers/gpio/gpiolib-sysfs.c
> @@ -1048,11 +1048,10 @@ int gpiochip_sysfs_register(struct gpio_device *gdev)
>  	return 0;
>  }
>
> -void gpiochip_sysfs_unregister(struct gpio_device *gdev)
> +void gpiochip_sysfs_unregister(struct gpio_device *gdev, struct gpio_chip *chip)
>  {
>  	struct gpiodev_data *data;
>  	struct gpio_desc *desc;
> -	struct gpio_chip *chip;
>
>  	scoped_guard(mutex, &sysfs_lock) {
>  		data = gdev_get_data(gdev);
> @@ -1066,12 +1065,6 @@ void gpiochip_sysfs_unregister(struct gpio_device *gdev)
>  		kfree(data);
>  	}
>
> -	guard(srcu)(&gdev->srcu);
> -
> -	chip = srcu_dereference(gdev->chip, &gdev->srcu);
> -	if (!chip)
> -		return;
> -
>  	/* unregister gpiod class devices owned by sysfs */
>  	for_each_gpio_desc_with_flag(chip, desc, GPIOD_FLAG_SYSFS) {
>  		gpiod_unexport(desc);
> diff --git a/drivers/gpio/gpiolib-sysfs.h b/drivers/gpio/gpiolib-sysfs.h
> index b794b396d6a5..93debe8e118c 100644
> --- a/drivers/gpio/gpiolib-sysfs.h
> +++ b/drivers/gpio/gpiolib-sysfs.h
> @@ -8,7 +8,8 @@ struct gpio_device;
>  #ifdef CONFIG_GPIO_SYSFS
>
>  int gpiochip_sysfs_register(struct gpio_device *gdev);
> -void gpiochip_sysfs_unregister(struct gpio_device *gdev);
> +void gpiochip_sysfs_unregister(struct gpio_device *gdev,
> +			       struct gpio_chip *chip);
>
>  #else
>
> @@ -17,7 +18,8 @@ static inline int gpiochip_sysfs_register(struct gpio_device *gdev)
>  	return 0;
>  }
>
> -static inline void gpiochip_sysfs_unregister(struct gpio_device *gdev)
> +static inline void gpiochip_sysfs_unregister(struct gpio_device *gdev,
> +					     struct gpio_chip *chip)
>  {
>  }
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index a6dd07be126c..3137e6f1108a 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1281,7 +1281,7 @@ void gpiochip_remove(struct gpio_chip *gc)
>  	struct gpio_device *gdev = gc->gpiodev;
>
>  	/* FIXME: should the legacy sysfs handling be moved to gpio_device? */
> -	gpiochip_sysfs_unregister(gdev);
> +	gpiochip_sysfs_unregister(gdev, gc);

I understand the intention here but I really don't like passing both gc and
gdev here. We can get the address of the gpio_device from gpio_chip so why not
do this and pass only variable?

Bartosz

>  	gpiochip_free_hogs(gc);
>  	gpiochip_free_remaining_irqs(gc);
>
> --
> 2.53.0.rc2.204.g2597b5adb4-goog
>
>

