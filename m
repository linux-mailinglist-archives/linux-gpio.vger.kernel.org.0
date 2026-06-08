Return-Path: <linux-gpio+bounces-38093-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RZPTE3DPJmq4kwIAu9opvQ
	(envelope-from <linux-gpio+bounces-38093-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 16:19:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFFF65713F
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 16:19:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=P7A7hAK3;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38093-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38093-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A11A2311C32E
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2026 14:09:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3497E3C4565;
	Mon,  8 Jun 2026 14:08:15 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136E13C343E
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 14:08:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780927695; cv=none; b=EpgdFMhI3hbuVxVp7VNdJekeUevvOzQ0aVhT1Yuxd/SMDG7lz2qPSieaJ1Cdo986Cg+Np0gYqZDM2uuPbojiRBqinWAEwoy4A9YBmnkHpBE8+4fBPr80f6mhZ0I8jpA1DyAflcCBz/5MSdjgepSOU2yLGw+X6FzdhNbiXVwDQa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780927695; c=relaxed/simple;
	bh=/IfNYAsgcVBUJ3iV9H+bBn+K485HVA2i7gzc4reABEc=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=boBAhepSIcJDFMbVgXWxNhRYCiZboAqtChg5r9LK6mQbJQCRWUDhHPmZXf+YXgFoHqShnMyyuocvRnEK6YWorp3uzvDfiC2FgE1q1QmMaLwa34XMspzYkqYXel2nJeNRy2/KjzB4fJPtorqVN1xbsMxGpbMcNsPPGYm55IvHh8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P7A7hAK3; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDCD91F0089C
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 14:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780927693;
	bh=/IfNYAsgcVBUJ3iV9H+bBn+K485HVA2i7gzc4reABEc=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=P7A7hAK3N7YN6x6hn9cemCYKXEFk5TCE+nUtuc+X+aHIvajLpLgET7t+Gmr+FCs4e
	 u9bM+VphTyHDzuri9+9jzpvQDFV5QaArCd3fpxZH5ydojQild9fK+Z0+dGTSXHesPC
	 FUZ18fq14UYf9AFxbStNH/c9tDxZL6EffsI2HYZOAaDUhUUsmbFTolSxiLGjAqyPrm
	 PDCPrmuSUhSFofa2ECC0qzJFkoEOZie4P/eHGIF358Jy6CFHGof96pmYgvCu9n//3K
	 FxIA4JmSXXZbqZ/crU24zVvnac6B4tWGWvgt17tWFtCQ/2JJRWQVT9ZOgkCZuqXKAb
	 eTw3Z0h6xNKrg==
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-138188a7dccso3916911c88.1
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 07:08:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ94l58i12yFRqX80NdjPe4zVXrbHGBL5EgR99FIRNIoO3/PYRAeIfZkdJwM3ET8ABGAzi+RvrkRxu7H@vger.kernel.org
X-Gm-Message-State: AOJu0YzRH1F+hDAK9cM9DXF1XSUbxTSCo9DKRxpNqNg7WTJ6AgZ71cNJ
	xU3PuuFuYnyZSdH1+zV6f9Vie8QTTweNbsytgaUb3DwbXHdcGqCndxW+JijCDyCr0k58ywbBdQ4
	zLsZNqMJS3x95A/njtD7LEP+PYw21aaNqqzz9BCDvaA==
X-Received: by 2002:a05:7022:671e:b0:12d:de3f:d843 with SMTP id
 a92af1059eb24-1380674bb87mr7270124c88.38.1780927693201; Mon, 08 Jun 2026
 07:08:13 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 09:08:09 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 09:08:09 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260608-mfd-si476x-v2-1-da5f779c1888@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260608-mfd-si476x-v2-1-da5f779c1888@kernel.org>
Date: Mon, 8 Jun 2026 09:08:09 -0500
X-Gmail-Original-Message-ID: <CAMRc=MeuGmH-6v-WuhBAHcLZybJkBQ3T+iabR6R6XWY5U8wFhg@mail.gmail.com>
X-Gm-Features: AVVi8CclM1FTC9MXHwfPRLizv-NMV9RX9p-AEMY-kjKBcTc2wrDOUz1FdIij9mA
Message-ID: <CAMRc=MeuGmH-6v-WuhBAHcLZybJkBQ3T+iabR6R6XWY5U8wFhg@mail.gmail.com>
Subject: Re: [PATCH v2] mfd: si476x: Modernize GPIO handling
To: Linus Walleij <linusw@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Andrey Smirnov <andrew.smirnov@gmail.com>, Lee Jones <lee@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38093-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:andrew.smirnov@gmail.com,m:lee@kernel.org,m:brgl@kernel.org,m:andrewsmirnov@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AAFFF65713F

On Mon, 8 Jun 2026 10:57:34 +0200, Linus Walleij <linusw@kernel.org> said:
> The SI476X driver depends on the legacy GPIO API. As it only
> really use a single GPIO for reset, and this can be easily converted
> to use a GPIO descriptor, modernize the driver.
>
> The "reset" GPIO is obtained from a device property, such as a
> device tree ("reset-gpios", which is standard, but this hardware has
> no DT bindings as of now) or a software node for static platforms.
>
> Out-of-tree users can easily adopt to providing a GPIO descriptor
> this way.
>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
> Changes in v2:
> - Rebase on v7.1-rc1
> - Link to v1: https://lore.kernel.org/r/20260327-mfd-si476x-v1-1-93298ca35d6d@kernel.org
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

