Return-Path: <linux-gpio+bounces-38572-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LnmJAUcdMWpJbwUAu9opvQ
	(envelope-from <linux-gpio+bounces-38572-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 11:54:15 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E296168DBFE
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 11:54:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="Ns/tzrJp";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38572-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38572-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E6B2A3006923
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 09:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06FE0421EF5;
	Tue, 16 Jun 2026 09:54:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75B6421890
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 09:54:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781603646; cv=none; b=UOdaLh2QJnk2uZDU6bvWdMjqJHlkGb9luqQYDKMqQ9bU1J41gfNZjmolz1q/OK8vmyKbjAJkywV+T6ZH9j6CdaDwWDHpDOdCjbEeeGOlgqd7SyMZk2AO4NLr3eRF3dGViJsfApqcThhLtiVBADlKPtsPInaalCtCbIzN5ZDDNP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781603646; c=relaxed/simple;
	bh=+URwGBoKKQopuhgwzkoaWddBJJZzAiMnIIQn74OaPNo=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FKBihaomLzzbTuJt0uft9jyuq2G7Yp8gKkJx1BhzvjII31ex66A7etj169cv7NXf1lAIiDzaOXYAQdoHKwE4AM3D5fhvDp3yxN8SJR02OmnNYNKTHMygUEGxMpvQN5B9Bh4SS4UGPRQDUyLavIwTZM6rksUymgYdQJjQbxnWFdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ns/tzrJp; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1D201F00A3A
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 09:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781603645;
	bh=+URwGBoKKQopuhgwzkoaWddBJJZzAiMnIIQn74OaPNo=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Ns/tzrJpIglOiySBTbQdfr0f6rZR2z+BRM84629Fi0M9YFE8eUzX+UviGviW4mnyW
	 +LK6V7Q+ZsA3D4peLthUK8hWS6+MKP25gzeR1VRCnky8pj7h5GHL41J5S0BWvyHXK7
	 2BhesK0GP1nhcuSaKSRD9F3uQnwV0mzkIMv0rhco+hnK/lEHADi4wG3b4t+XrZ1mO4
	 B56J4+hk4af/FedqGCN0Lcruq5lL8olhq4jTyDNWDPnmQzm28gkAYP0C/kOEy9BgAm
	 J0ThWvyPswrGkjdfz7Rf91e0VmgWqJQEds1DHcAse4p+kQbRoBvLQ2naMdu0I75/C7
	 XYq7OLo+7pQFA==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-396aacc5bcfso39494711fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 02:54:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9PUumfwCJHEMtkQkFWnCVED3MwgnrG7/omXglXSBn7fz3X2kBupgM4pFg4eWpSHJIUTOaOLeX6P07e@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8sbh2rdsvmlxyyHnXoEBW8klsCvTKutuVbtj4N+pMIqSeCxGY
	uJu+aAY4+jSGLNsstnU1wZSaG54r70T5YUAWsgfT5Cafocwrr13cyIApOyhzZDcrXDq89mEZYpS
	vn0HO87oU+Y9T+hb2/PS/8D4YtlYaZsiJ7ZGaE8nm7Q==
X-Received: by 2002:ac2:52b9:0:b0:5aa:77e2:51b0 with SMTP id
 2adb3069b0e04-5ad43730740mr629116e87.45.1781603644454; Tue, 16 Jun 2026
 02:54:04 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 16 Jun 2026 02:54:02 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 16 Jun 2026 02:54:02 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260612085257.GY2990@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610154204.110379-1-scardracs@disroot.org> <20260612085257.GY2990@black.igk.intel.com>
Date: Tue, 16 Jun 2026 02:54:02 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mcv7SWVYA6rNZo+-tYx_ohOdedkewLZOa=X1Eei=1fTzA@mail.gmail.com>
X-Gm-Features: AVVi8Cf8SX-PFW9ubAlWfGkrgV7gQ9a14lXvOtYxhpfIKCXMWl99SlqnsWEeRzY
Message-ID: <CAMRc=Mcv7SWVYA6rNZo+-tYx_ohOdedkewLZOa=X1Eei=1fTzA@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] gpiolib: acpi: Add robust bounds-checking and safe
 address handling
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Mika Westerberg <westeri@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Marco Scardovi <scardracs@disroot.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38572-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,intel.com:email];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mika.westerberg@linux.intel.com,m:westeri@kernel.org,m:andriy.shevchenko@linux.intel.com,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:scardracs@disroot.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E296168DBFE

On Fri, 12 Jun 2026 10:52:57 +0200, Mika Westerberg
<mika.westerberg@linux.intel.com> said:
> Hi,
>
> On Wed, Jun 10, 2026 at 05:42:02PM +0200, Marco Scardovi wrote:
>> Hi all,
>>
>> The series adds explicit bounds checking for GPIO pin accesses and
>> ensures safe handling of ACPI addresses in OperationRegion handlers,
>> without referring to truncation or wrap-around behavior, which does
>> not apply.
>
> I'm fine with these now.
>
> For both,
>
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
>

Andy, Mika: do you want me to queue these directly for v7.2?

Bart

