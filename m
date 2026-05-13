Return-Path: <linux-gpio+bounces-36708-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIpJAkMqBGrfEwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36708-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 09:37:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C88D52EC38
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 09:37:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 83BD33042BCC
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 07:36:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25DE63D6491;
	Wed, 13 May 2026 07:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hbi/KOBR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8E03D1A8A
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 07:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778657787; cv=none; b=eOG/uTJ57uQn8RyJg8EdLulvzDvp0C7umHuRwVPUB4C5LKW05ln/hzoKD6/C9w47RCZ/TibxwfZlh3V0YjuV8UJOdVqmGnyAmRKzkwVGE0tptxE+aoKxoL4UPZRcelBrgeU9+Qs6e+JarLXrSBUKuwAPud0yZVmz2JtHFW4m+Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778657787; c=relaxed/simple;
	bh=96ytaBIvoVox2cv7ds6H6bYbxRBwuO8y2v9kZvcQ6Ro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XC3Z6Oqn7BUCbNpc1bpA+S894wIEwwRQ56ioTeKQFGZKXh8HkuU92ORGBHL2R2ZOzQ06uuJ7MOwND1g7EFkJjGPFWeFzkLDjFuQeGFwbpkEsjX6lPvtqu+pM7Lp0JLiX+ughik0W9snzPyBDOnIiHNW6H8c/VvVmeLjkPbIsiUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hbi/KOBR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C4B2C2BCC7
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 07:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778657787;
	bh=96ytaBIvoVox2cv7ds6H6bYbxRBwuO8y2v9kZvcQ6Ro=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hbi/KOBRswqmxPSU22NITm/BbpELvqomCzCSF9vW4bRlNrm+yVq2YcR5iIar/w8py
	 I86xuObfMj1u3Ebjl/p235lWYqlcU6+Q0IbmwtTkc1sSohH68/FbH50uHhvGUqqmoZ
	 d8Kt0bj/j/AvcqqLxIwOINYljkhJ0hLzFm9KxTDpvevJmclCgrIWlwhLaotjwBQvoc
	 cm1nylTpEsKvTkeR8IF6Ra3J1F+XDMYs9qfTykVR/vId3prH+Rjn7f2h3fv581p1Zy
	 dxJ3vTqXfuhiVl6sUe7GbB/Q5GAmljlVtogyejGuUpgD6IeD7utiyy3bGpWwf+N0GZ
	 yIk14Uj/Eu6ug==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a8d1f43432so4519654e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 00:36:27 -0700 (PDT)
X-Gm-Message-State: AOJu0YxE9ejGusdGOYdkDeV9qGRfcpveyG8FYYEUbH9oTZCZrD0fw8K4
	/fqVOFeCgeKePNwzjszhxn/rZ3OaYe2QbtYdgqePkgpI0Exq30MXcQq1mN6ZUzUMro2Cwpp3+h4
	fAaMiy1EZVXGJrbJHPSgNz/1EtgYzXHQ=
X-Received: by 2002:ac2:4e10:0:b0:5a4:6f5:6c4e with SMTP id
 2adb3069b0e04-5a8f39c5f4bmr554701e87.19.1778657786283; Wed, 13 May 2026
 00:36:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513061338.9348-1-hardikprakash.official@gmail.com> <20260513061338.9348-2-hardikprakash.official@gmail.com>
In-Reply-To: <20260513061338.9348-2-hardikprakash.official@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 13 May 2026 09:36:14 +0200
X-Gmail-Original-Message-ID: <CAD++jL=vG4fO_30jLF1GrwDsfYVH=odMQV0xD4OX2cuqSmb+Bw@mail.gmail.com>
X-Gm-Features: AVHnY4JVEsXYloe7nVkhuKP3kiNaHShoTMM0NI9LbGDzes7tcrop1eWqa0XxReU
Message-ID: <CAD++jL=vG4fO_30jLF1GrwDsfYVH=odMQV0xD4OX2cuqSmb+Bw@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl-amd: enable IRQ for WACF2200 touchscreen on
 Lenovo Yoga 7 14AGP11
To: Hardik Prakash <hardikprakash.official@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linus.walleij@linaro.org, wsa@kernel.org, andriy.shevchenko@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 3C88D52EC38
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-36708-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 8:14=E2=80=AFAM Hardik Prakash
<hardikprakash.official@gmail.com> wrote:

> On Lenovo Yoga 7 14AGP11 (83TD), the WACF2200 touchscreen controller
> is wired via I2C2 (AMDI0010:02) with its interrupt on GPIO pin 157
> (confirmed via ACPI _CRS GpioInt decode). After amd_gpio_irq_init()
> clears all GPIO interrupts at boot, pin 157 is never re-enabled,
> preventing the touchscreen from signalling the driver.
>
> Windows keeps GPIO 157 INTERRUPT_ENABLE (bit 11) and INTERRUPT_MASK
> (bit 12) set after initialisation. Add a DMI quirk to restore these
> bits after amd_gpio_irq_init() on this hardware.
>
> Signed-off-by: Hardik Prakash <hardikprakash.official@gmail.com>
> Assisted-by: Claude:claude-sonnet-4-6
> Assisted-by: GPT-Codex:gpt-5.2-codex

You forgot to carry over Andy's ACK!

I see that the only real change was the addition of the two AI tags so I
just added these to the commit already in my tree.

Yours,
Linus Walleij

