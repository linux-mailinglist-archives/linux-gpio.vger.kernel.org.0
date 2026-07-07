Return-Path: <linux-gpio+bounces-39590-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vJcVAb0HTWpqtwEAu9opvQ
	(envelope-from <linux-gpio+bounces-39590-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 16:05:49 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3830D71C50C
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 16:05:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ky5eOcvl;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39590-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39590-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3D37324473A
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2026 13:49:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94D6340860C;
	Tue,  7 Jul 2026 13:48:45 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B43E3F4123
	for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2026 13:48:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783432125; cv=none; b=XOrGSHvz1jRs/dLVFFFzkU4PusU/GGArL4GLgMviVBh+uDoqnp7cZrKNSk/WeAQsykRQGAbnC98ILWIeLxy3OhHndenwF3djOFnyXkl1oxO1nS83OSvn736UAMRouvB/PpzEp6LuMmrxiqtldOXOOJmXIohqWtA8cqCOohuSqeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783432125; c=relaxed/simple;
	bh=1Yo7u0z6k8U7Mbjer68rrWV0r8Sh5LFdbkY5Y5c3Jrw=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d4ZfaroqGo+z7SPRnyOmLyP4sZVQS6Pi6fKerpgFFNvwVYeQRywgrWa0xc0WHL8ZFfWUVt4v5AURo57tbbCbzdfPl/4T3BspVw1d8sX6lmv8KM8Wzx/wNl6jAU/itoF0EUf2r5omD9QCpqFGVX91DZ2ux2vu1yTCvSciFDUKltA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ky5eOcvl; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35B2F1F000E9
	for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2026 13:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783432124;
	bh=1Yo7u0z6k8U7Mbjer68rrWV0r8Sh5LFdbkY5Y5c3Jrw=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=ky5eOcvlo1aG8xccfEkbFOgotVrnusNUxMziffYcBHfzWQzs6NwkX0Dunzgto7Lgm
	 Gyqtadeuv3h5j31G2mhSatHoV3Si5/XG8yPT7JvObHDCD0ihbMp8T1Q77e2PEQozms
	 I7cwvIOXxcdvBoe7dVx4MihFK0lbB5jKx1qYSX+BPMtH3WMAIYr+zGSolxLfi3URwo
	 36a2WDOyJ6DHUO6dBd31YLvN6AmZFNVkKHkTwApFm7XUluWDRMwk3BO9lY42rBmkuJ
	 +GADJy43YEzgdus/GdGI87WI23+1vVQlb7wenPUhrKBCRBVzkO1e26/l03mzqW6Lcp
	 TXWGdCUmVfUBQ==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39b3931e259so35082471fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jul 2026 06:48:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrIDYWhGT2tyCTiDPV+NojUKFI6JlcQCPICK/T51sY0tReDvICNQMX5iZxGA5HIKB919Fr1CRf2T0Go@vger.kernel.org
X-Gm-Message-State: AOJu0YzOr40BGDoIQmzcWctrXbZJ/Y1F6SvgxBKr6aY4v4h+Z5fZ6rqp
	kUDRgav9yGDizpICqjz+pt97iCw84jWHG1AzgfJ8o9W2glwy2DbhQbHhW0VjZKWJ9EBuuy+pDkq
	j6hi/NPGOGx5d/2fuRebkgUlafCam+Hcps8rMVQjgEg==
X-Received: by 2002:a05:651c:e15:b0:39b:d76:5cb3 with SMTP id
 38308e7fff4ca-39c60015570mr11010031fa.29.1783432122399; Tue, 07 Jul 2026
 06:48:42 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 Jul 2026 06:48:40 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 Jul 2026 06:48:40 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <edc7505e-1103-42d7-b88d-013ca10753b3@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260704151521.211335-1-marek.vasut+renesas@mailbox.org>
 <20260704151521.211335-2-marek.vasut+renesas@mailbox.org> <CAMRc=MeyKGv75rTLauZuGxSfgjCPXVE_r=A7uNduRr6kAd43aA@mail.gmail.com>
 <edc7505e-1103-42d7-b88d-013ca10753b3@mailbox.org>
Date: Tue, 7 Jul 2026 06:48:40 -0700
X-Gmail-Original-Message-ID: <CAMRc=MegYyuqMVkG4_E_TF4hzoy1PVx=omXgZUPvnARd-Eh+7Q@mail.gmail.com>
X-Gm-Features: AVVi8CfTXb7a9CnF1kG_J33U_VZ0A1Fo3nvdJCm7SCTOOAtgiE9VDcYDyKYQeEg
Message-ID: <CAMRc=MegYyuqMVkG4_E_TF4hzoy1PVx=omXgZUPvnARd-Eh+7Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: rcar: Add R-Car X5H (R8A78000) support
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39590-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,mailbox.org:email,vger.kernel.org:from_smtp];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:marek.vasut@mailbox.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:brgl@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3830D71C50C

On Mon, 6 Jul 2026 15:06:01 +0200, Marek Vasut <marek.vasut@mailbox.org> said:
> On 7/6/26 11:19 AM, Bartosz Golaszewski wrote:
>
> Hello Bartosz,
>
>>> +static inline int gpio_rcar_remap_offset(struct gpio_rcar_priv *p, int *offs)
>>> +{
>
> I am hoping to get some input on this remap function.
>

You mean its potential impact on performance or the implementation? In any
case, as Geert said: a table of function pointers could help to improve it.
I don't mind it in its current form if it works for you.

Bart

