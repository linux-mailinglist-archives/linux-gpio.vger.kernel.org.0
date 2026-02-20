Return-Path: <linux-gpio+bounces-31981-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Rl3eAqXFmGnyLwMAu9opvQ
	(envelope-from <linux-gpio+bounces-31981-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 21:35:49 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 901F016AAB5
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 21:35:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2264A3007524
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 20:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3E92307481;
	Fri, 20 Feb 2026 20:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gM9R+VIT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DFC2FE584
	for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 20:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771619744; cv=none; b=rxb9wn2mRRtcGgKvX5ss+fNieOX0L2T12toQvlS6HavDB+/97Qs6OEL1e4EN4kk9rlbpfeu+iv6OyEkPuRnPSbgEUmUD6wbKk7sS2PAlkw7IONrqNeHGAbTVDx2TUrl7uom6gbETr4Txu/V2CMx2jqX54Si2ORhLCOeOMETpHIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771619744; c=relaxed/simple;
	bh=LoEhOaNYbruugEjCGOOxJY6yLg3numbyW5t1I2YNo00=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TgewOJ8kbqrnrOFxreg0HwvmzM02Muv9FP6yiXqBi37BJH+8NiARsqvDMGkuO3p+sMZFUUUBrqBKoTBilmbqlOq6+EFphxuBbfwtcVN8NP87wjQROYjxCnyu+Oy4OObw3D+uPejMOrR6C32o5Vb1YAUZC2GiBTZrp93erVd6/II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gM9R+VIT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6555EC2BCAF
	for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 20:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771619744;
	bh=LoEhOaNYbruugEjCGOOxJY6yLg3numbyW5t1I2YNo00=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gM9R+VITnm+zdVpJsDJCXBP1gvLN02vvPO83dUxII2hcUN+SRvwdhV+/J2w2r6DOA
	 ZIbD/aI1mi8Dy1QxGGndCuI69/1p0Q8AhKNaasaHqKfxIT43jUkQ+ixJquHKNKO+Oc
	 rStQC3fnUXQlL6zYsMJyrB+CEymZFCymPApdzEyYaXcGn40/NuAn6lg2fXQrxfcpBE
	 TbGYDRLTzO5JmUpEyzzwg0+CmOZV9+Iortiwl+gmHm3kIEMV/hHxeRPnKdJ5RYgewy
	 RdSTmu32WGTu0eL9C5IEDQj3itk8PYL8GqdrMPbIAmbeDZVClXOlfvvuez/mtA2n2e
	 v6BQUcfuJNwSw==
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-64ada2c30a1so2354125d50.0
        for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 12:35:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWXtvSjHjO0mgeaCMSbFusKzezG8T8qvlWxOvAT00jta4cREPdRlzCnmM3dW7CP0swoE6MqFbDgwPw1@vger.kernel.org
X-Gm-Message-State: AOJu0Yywdv0QzoS+8oMWwkZTapi3jD5pN3Kd+tlcONC32u6QnGZiESee
	Rr0XYw8Oj9QEfS2k846JYRV1JHW5kwBIMwqa+GefsrKs9ykVnRv5hU+w741JfB+qFBo3Re+xZPT
	OuzPot8emEiuFbnnJ/bSOrpjPf2xBL1Y=
X-Received: by 2002:a53:e210:0:b0:64c:2a4b:739 with SMTP id
 956f58d0204a3-64c78d17c4amr702684d50.56.1771619743496; Fri, 20 Feb 2026
 12:35:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260216211021.3019827-1-james.hilliard1@gmail.com>
 <CAD++jLnOouLSt324=iKVnYd5v3HMBaMG_U4=8k-ixoqkek5niQ@mail.gmail.com> <CAMRc=MdWb1ym-6=k3gaH6uAC+gniTmKW=c+_s=ce_J47nGu-Vg@mail.gmail.com>
In-Reply-To: <CAMRc=MdWb1ym-6=k3gaH6uAC+gniTmKW=c+_s=ce_J47nGu-Vg@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 20 Feb 2026 21:35:32 +0100
X-Gmail-Original-Message-ID: <CAD++jLkX+hCiSC3SscqoVa=gBtMBOR0gSB3P4pDNFMeuSy_SFQ@mail.gmail.com>
X-Gm-Features: AaiRm52QE5TVrqsiMOA6ngBKGlvrhx6_nPncdfioCDjvOv28D76KmnJWaAULdFU
Message-ID: <CAD++jLkX+hCiSC3SscqoVa=gBtMBOR0gSB3P4pDNFMeuSy_SFQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] gpiolib: of: add gpio-line node support
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: James Hilliard <james.hilliard1@gmail.com>, linux-gpio@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31981-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 901F016AAB5
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 12:40=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:

> I'm noting this but I will insist on making it into "default state" -
> state to which we revert when the line is not used: be it initially or
> after a gpiod_put(). And it must not conflict with driver-specific
> behavior so the reverting to default state must happen after
> gpio_chip::free() returns.

I see the point with this, and it is more elegant.

This may be hard for boot loaders to implement, as noted by
Rob: initial states need to be simple for boot loaders.

e.g. when the bootloader gets a GPIO with some "default" state,
then grabs that and toggles it, like Linux it needs to return it
to default state before booting the kernel. That is a tall order
for a boot loader. I think we ought to make the behaviour
simply optional for boot loaders in that case, but that doesn't
feel right either.

The current "set state on init and never change" as noted in some
thread actually has a precedent with a standard binding  in
Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml
line-initial-states.
(Not saying it's a good precedent though.)

> And as an unrelated mental node: there's nothing in gpio-hog binding
> that requires us to use of_ APIs. This should probably be ported to
> fwnode and put into gpiolib.c.

Agreed!

> The legacy GPIO_HOG macro is used in a
> single board file too and should be replaced with a software node once
> the former is done.

Agreed to that too!

Yours,
Linus Walleij

