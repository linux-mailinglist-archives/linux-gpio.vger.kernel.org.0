Return-Path: <linux-gpio+bounces-31185-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJgFFBk5eWkZwAEAu9opvQ
	(envelope-from <linux-gpio+bounces-31185-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 23:15:53 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 648739AF35
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 23:15:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7CE11302C6C6
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 22:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3FFC35B635;
	Tue, 27 Jan 2026 22:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VRFfMsiX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BF93570A0
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 22:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769552138; cv=none; b=NeKXMo/+2REZH25exidFmPFwuCmpWyaySevg/o+4ZQgh8yHugRwOyh3M8YOq6igNyvuO77OgaobgTPKwLr8j/r/G+HZ+ejfzd/j339F2gPN5Aot14DeQxqV/6E64IEipFxHU/pnvyjX0vHvEBiiFlh5ZpVZCnb3DdATNBwPisfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769552138; c=relaxed/simple;
	bh=TwMRVR4JPiCqluFN5GCDrX6bmKnCS/BpUIJaA9qie7o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c6UH8cFRhqepjrw6tj0PiWYmddqsVUbtL0Xy9b2IM0zTTWZQDMcnim4NtaOuLDyhK6v2wFXFI0w2cbvKixGJoCHsAEuUaTiQV/Ci9twDxCU/vbn6PZyVGxK4ML541/9o0mHHP6PGsPHijBIS2t12D4MXO24VZ3P2bhtbI41C2ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VRFfMsiX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ADA1C2BC9E
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 22:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769552138;
	bh=TwMRVR4JPiCqluFN5GCDrX6bmKnCS/BpUIJaA9qie7o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VRFfMsiXlGrFgXEPj5uhScqB60qnBKXNWD58MRM3oINCFZfJ+FKflt4hbvURJWT4e
	 aMpQ0uyHxvcJfF1BLjHe1I+/hQY0jn2R7YIgA7bcs1UwkL1/Cs6aO59QiBNgvJo8Ti
	 3WGrYxKDMPIfP7CxoiVFPjbM5JA/MZ6A+oxVjhcJFR5VhDrVS6dm9gzLwPW7ILsb9E
	 NDsUdjuER4IG1Nwqst2ZFq+x1rpRZNNfS/YPm/F/LY1RyNziqwHgQn4WfpyUDVI2AG
	 o9iYg04fk/xGIOWKfCz4ZlNUydxaIEX03kfOzivbN2W4zUXMXYjd/9NNJblEP+zV2O
	 ZD/fy7IksfPfg==
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-7945838691aso4336857b3.0
        for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 14:15:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVTG8/ntW3Twzi7DemN3DmTQhTDmmpkhqmp+Y3MMMykglwUnHSz4lYMtl+JpItCOx7nYYaS2VKCsMsJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzzoKVeJOWPWTGW3eq2AEbMpsaqZ3Dp5BhjqhUQr6OV+susfdaq
	nOAnUwdmbxtnBc+XxSiBhgQ5mDoFaiK+pPOT8ZkwZI9dM0NENUgpfD4o6MncrZkjsEMrCx5VKxh
	OIuKiWYiZavP/GGqepavzq2Fr/2ObMAM=
X-Received: by 2002:a05:690e:bc6:b0:649:60a9:bd74 with SMTP id
 956f58d0204a3-6498fb29b23mr2176803d50.42.1769552137859; Tue, 27 Jan 2026
 14:15:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260127214656.447333-1-florian.fainelli@broadcom.com> <20260127214656.447333-2-florian.fainelli@broadcom.com>
In-Reply-To: <20260127214656.447333-2-florian.fainelli@broadcom.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Jan 2026 23:15:27 +0100
X-Gmail-Original-Message-ID: <CAD++jLnH-A=nir6YSLnsEjLmF63D+kGV=JdYDQNy6QcHhx+J8A@mail.gmail.com>
X-Gm-Features: AZwV_QgrUdPwMsQ3oS8gzJSozvL58RrBTgR4nkrOKICAx_ZJLz6HuLBvQIuQ4SU
Message-ID: <CAD++jLnH-A=nir6YSLnsEjLmF63D+kGV=JdYDQNy6QcHhx+J8A@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] gpio: brcmstb: correct hwirq to bank map
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, Doug Berger <opendmb@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,broadcom.com,kernel.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31185-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[broadcom.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 648739AF35
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 10:47=E2=80=AFPM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:

> From: Doug Berger <opendmb@gmail.com>
>
> The brcmstb_gpio_hwirq_to_bank() function was designed to
> accommodate the downward numbering of dynamic GPIOs by
> traversing the bank list in the reverse order. However, the
> dynamic numbering has changed to increment upward which can
> produce an incorrect mapping.
>
> The function is modified to no longer assume an ordering of
> the list to accommodate either option.
>
> Fixes: 7b61212f2a07 ("gpiolib: Get rid of ARCH_NR_GPIOS")
> Signed-off-by: Doug Berger <opendmb@gmail.com>
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>

This looks right.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

