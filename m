Return-Path: <linux-gpio+bounces-39229-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AC5OIGHNQ2paigoAu9opvQ
	(envelope-from <linux-gpio+bounces-39229-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 16:06:25 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE266E5378
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 16:06:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Ssx8+8uZ;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39229-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39229-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8D209300E6BC
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 14:06:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D8DD37BE97;
	Tue, 30 Jun 2026 14:06:08 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7692366566
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 14:06:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782828368; cv=none; b=UOt1zy5pbNSwMBgF9aVYZ+/JRMzyDHGZFbkB7Lm9QpVdPa5ZEEQrG2JFc6dL4MAGaa0IhewGfyKTQ/GCoCH2pBoy1ooJnLAajamHWGHOTJLjfsRQOKgChDtvETr/7Lr/rp+h+s9C5Cw3jJfux+yz2C5GiUQONQT4ySao1gMIaxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782828368; c=relaxed/simple;
	bh=KZE8PERg9mDPVZNcBjLhSl+mypn89lWn+zelpMIYuqc=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tVVD7O2hmJjqLeCLao6w23EYsvG6Df1BqneKBN1wNZZ51vD91VctZHc16EqL2hhUnTRh2XXg3GmhkBGlgfeiNeciNfLL2b+TZp876ap6MTmEN6z5C/WSiszM/7PF9bp+9wQW68NnzPn/YQNixEYtegwbnp64lMKEMXLqJ9YaJXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ssx8+8uZ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C07F1F00ACF
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 14:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782828365;
	bh=KZE8PERg9mDPVZNcBjLhSl+mypn89lWn+zelpMIYuqc=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Ssx8+8uZ0Y4OP+CEnjvqnXDa84ZyQPh7l9SD9BcsSqMV0Zn3PeIuTYVZs+Ncgw41m
	 /QOYTZlR8mmQue/AJ3/+7cs++45c7/f7YmtcL5Ys75rkpHAVJbQwRoL1pXK2RnGo7V
	 /5SFOSuQWXc/4AKwMNr426Owcb3SqgnE1NSxCq6sajfVUtuKjS6Wuo+FodGrBLawBj
	 TI2y6d6sxOxaCWtXpVkVWZq5WcIA7vxiGkMWxM3rqATwliZGTqszxsIu5JEuFaet1r
	 Cp5o4J0dSIMhyxPNv+lS1p7wKOhAfx/i2/fBvu/jmsSSMxLse4KDar47lCau+537vC
	 h7HhJ/TKQG66g==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39ad1d2555aso38538831fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 07:06:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq117qO3sUYi+jR2tcmpAfRxvh/KK5dAKL5xiY2bOsQltx3fRDqjpdv5ch8nEgIReax2cBtzpZBNsIy@vger.kernel.org
X-Gm-Message-State: AOJu0YzdW3WwUTFYGk+L2SDxvNQVVOAKVKzBhJ+XUOFoFu8bIW5+gf9c
	5P02bluOUypwTEZ4iok6B+7lJZ+K/PqQjBPdfDiOIUVVClrX71RA1XmxidF7mbnXJaPRkcFva/9
	YMMMw+zNrpRHX8kZRcUDR1jNrPSopJIpf/dmGEnVvzw==
X-Received: by 2002:a05:651c:890:b0:396:7fa2:e090 with SMTP id
 38308e7fff4ca-39b1dfa89a6mr9139571fa.29.1782828364161; Tue, 30 Jun 2026
 07:06:04 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 30 Jun 2026 07:06:03 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 30 Jun 2026 07:06:03 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260626060112.2498324-4-sergio.paracuellos@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626060112.2498324-1-sergio.paracuellos@gmail.com> <20260626060112.2498324-4-sergio.paracuellos@gmail.com>
Date: Tue, 30 Jun 2026 07:06:03 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfiSePgA+Vc2GHz_5QUGZWFhnPrXPZoCV+32b9RJos5xg@mail.gmail.com>
X-Gm-Features: AVVi8CfCtJrxZdB_aayhUMnyKmkOqnmeYDZ9Pam7vPg_2SWx29HyVqbCNBbdF9M
Message-ID: <CAMRc=MfiSePgA+Vc2GHz_5QUGZWFhnPrXPZoCV+32b9RJos5xg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] gpio: mt7621: be sure IRQ domain is created before
 exposing GPIO chips
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: linusw@kernel.org, brgl@kernel.org, vicencb@gmail.com, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39229-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sergio.paracuellos@gmail.com,m:linusw@kernel.org,m:brgl@kernel.org,m:vicencb@gmail.com,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:sashiko-bot@kernel.org,m:linux-gpio@vger.kernel.org,m:sergioparacuellos@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7FE266E5378

On Fri, 26 Jun 2026 08:01:11 +0200, Sergio Paracuellos
<sergio.paracuellos@gmail.com> said:
> Function 'mediatek_gpio_bank_probe()' registers three GPIO chips using
> 'devm_gpiochip_add_data()'. At this point, the chips become live and visible
> to consumers. However, the IRQ domain isn't allocated and set up until
> 'mt7621_gpio_irq_setup()' is called after the GPIO chips setup finishes.
> If a consumer requests a GPIO IRQ concurrently 'mt7621_gpio_to_irq()' can
> be called and pass a NULL irq domain pointer irq_create_mapping(), that can
> corrupt the mappings or cause a crash. Fix this possible problem seting up
> irq domain before GPIO chips setup is performed.
>
> Cc: stable@vger.kernel.org
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Fixes: a46f2e5720f5 ("gpio: mt7621: fix interrupt banks mapping on gpio chips")
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---

Seems like sashiko still complains about this one. I'm not overly worried about
this path but since the commit's purpose was to address this very issue, do you
want to rework it further?

Bart

