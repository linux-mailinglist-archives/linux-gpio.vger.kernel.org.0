Return-Path: <linux-gpio+bounces-37532-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIfaLBSIFWpXWQcAu9opvQ
	(envelope-from <linux-gpio+bounces-37532-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 13:46:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F575D518E
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 13:46:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D415E306BA86
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 11:39:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C04D53E715E;
	Tue, 26 May 2026 11:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GqDdBRdO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25483E3D9D
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 11:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779795510; cv=none; b=LdXT2W8H1kR9bzY7OMNRq3OPta/Bac8c3nEqGpSZd1MA6N+LDj2XrlIDb956NWFCv8/sN6bafW0O1sIyeN8a4G8/YcCb7fY/uU7G2jYJGorZ9OY1AP5UwW7pm/f7bLCrtha1XiWO6nR/J3xDR9TbEnj4E0OUepSaT8E6TJN05Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779795510; c=relaxed/simple;
	bh=Qy1yB1ZZ44JmyWq5xY8U6S2jSpvgbY8JJbQJ45lYzy4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tKThskfAxQV01QJhZBaY3FXo3E9tKM8Oi+JmAGxP5H/bEX6g64DzSnmsVE6eeH3uw4wkK+d+tbaYQ6qUBLg1zZhpKzPgip0Q2NdFkcUZ4kUrobOLb2zweDgzaSEWQ1K815upKjom+oeHRsiMF7+UkSizUcac5ZdAW7ONVg+8C4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GqDdBRdO; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08B091F000E9
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 11:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779795503;
	bh=Qy1yB1ZZ44JmyWq5xY8U6S2jSpvgbY8JJbQJ45lYzy4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=GqDdBRdOx04hxqbhPYR2PNPv1oPgY0ASW8i2tPFxM6PcWw6uqNObeY93xFjM0T7Do
	 FbBZrmgkC08faZxiIYEbSbT6NcTPaB/iM+n1gpB9JGXnodtAmArvBBqWtfNDdJDx5y
	 zYJ4gJ8Tq9/NtcotVgTENqaxjc6pNl3PPpftjBYqErvp6UCMbaP1ZBxeoZneVHEnk7
	 6HRNrDLS9qCynJrCy8xwJ/6AZbyo+LwBg8XHlvk+hPOIjx71YK6vP04zuUK969dyx9
	 m8SmHaxju6pEcrnzj0RS8jRGn9aPFKjqW19SZcxdYUlmGODXHmwTlBl3bt7FvopK6M
	 aKDxj6ip724jg==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-395f24a5f2cso25691541fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 04:38:22 -0700 (PDT)
X-Gm-Message-State: AOJu0YxLbcMZaI0p2mwQN3EBTYyEwKMPfNhMQcIOP2ZQUkZvfaivRNmF
	3GlqPgTN3MnkiYeEOJV6V1HNVfGlCJoVlo6WlcMt72TZjK0uoOJQvxVqfgsUcxfIoHJ+n9ump36
	3sfcA5cab4rvjXQByDuK3yOPTZVYleUc5af7E+Eui3Q==
X-Received: by 2002:a2e:b8cd:0:b0:393:fe12:579c with SMTP id
 38308e7fff4ca-395d8c92c20mr67076301fa.7.1779795501720; Tue, 26 May 2026
 04:38:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMhs-H-dHfQeMxmQYOpVS-tnj++nX5_mNKcu1xot3SQETyh4Xg@mail.gmail.com>
 <20260522072904.2028774-1-sergio.paracuellos@gmail.com>
In-Reply-To: <20260522072904.2028774-1-sergio.paracuellos@gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 26 May 2026 13:38:08 +0200
X-Gmail-Original-Message-ID: <CAMRc=Mejrj2NedWx7JQvg2rkH4ubWfDMxRdQhAZ5US7p5Ly-ow@mail.gmail.com>
X-Gm-Features: AVHnY4Le3DWbzUTY_d14x4PPhSe0Vb5Mdy1tkFt4Trx5wiCjDRVWzHZrurDKAdY
Message-ID: <CAMRc=Mejrj2NedWx7JQvg2rkH4ubWfDMxRdQhAZ5US7p5Ly-ow@mail.gmail.com>
Subject: Re: [RFC PATCH] gpio: mt7621: fix interrupt banks mapping on gpio chips
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: linux-gpio@vger.kernel.org, linusw@kernel.org, tglx@kernel.org, 
	grant.likely@secretlab.ca, anna-maria@linutronix.de, vicencb@gmail.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,secretlab.ca,linutronix.de,gmail.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-37532-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 22F575D518E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 9:29=E2=80=AFAM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
>
> Regarding the issue reported by Vicente[0], we have been trying different
> things and we are still having issues to make this work. I have noticed
> that the gpio-brcmstb is similar to our use case sharing one interrupt
> for all the banks and also using gpio chips instances with 32 pins each.
> That said, I tried to setup mt7621 driver in the same way as you can see
> on the following proposed code. With these changes, we are able to make
> properly working the previous problem with the touchscreen that was
> registered on bank 2 instead of bank 0. Now it is properly registered
> on bank 0 and interrupts works perfect and the device is properly
> working. However, every single gpio-keys fail to claim the IRQ HW as
> follows:
>
> mt7621_gpio 10000600.gpio: Mapping irq 41 for gpio line 38 (bank 1)
> gpio gpiochip1: (10000600.gpio-bank1): unable to lock HW IRQ 38 for IRQ

At which line in gpiolib.c does this fail exactly?

> genirq: Failed to request resources for S3 (irq 41) on irqchip mt7621-gpi=
o
> gpio-keys keys: error -EINVAL: request_irq(41) gpio_keys_gpio_isr 0x0 S3
> gpio-keys keys: Unable to claim irq 41; error -22
> gpio-keys keys: probe with driver gpio-keys failed with error -22
>
> So IIUC the kernel is saying that the gpio chip is not IRQ-capable someho=
w.
>
> Once I touch the irq field just setting up the irq_chip_ops on gpio chip =
to bypass
> this issue:
>
> gpio_irq_chip_set_chip(&rg->chip.gc.irq, &mt7621_irq_chip);
>
> the kernel stops calling our custom to_irq callback and calls gpiochip_to=
_irq
> callback instead and also warning as follows:
>
> gpio gpiochip0: (10000600.gpio-bank0): to_irq is redefined in
> gpiochip_irqchip_add_allocated_domain and you shouldn't rely on it
> gpio gpiochip1: (10000600.gpio-bank1): to_irq is redefined in
> gpiochip_irqchip_add_allocated_domain and you shouldn't rely on it
> gpio gpiochip2: (10000600.gpio-bank2): to_irq is redefined in
> gpiochip_irqchip_add_allocated_domain and you shouldn't rely on it
>

Are you calling gpiochip_add_irqchip() in your changes?

Bart

