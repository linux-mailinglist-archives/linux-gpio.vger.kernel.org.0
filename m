Return-Path: <linux-gpio+bounces-37934-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1VBvCwc3IWrhBAEAu9opvQ
	(envelope-from <linux-gpio+bounces-37934-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 10:27:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA8F63DFC8
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 10:27:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=JYgD4xCV;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37934-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37934-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB35C3053DC3
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jun 2026 08:19:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FD8A3DEFE4;
	Thu,  4 Jun 2026 08:19:37 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181723DD514
	for <linux-gpio@vger.kernel.org>; Thu,  4 Jun 2026 08:19:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780561177; cv=none; b=VWeksEnd9sYuM6f1g6Iq2TC91oCXaBoDSIeQCpBUHWsQ3btucSd41e1RC4maU7dp1C69yXiOonSfOKgMsUf0yc2uVWszUQg9an2iR6/gQjH7T2ey+9NrcpbUj/eMg/HTXGjHmgBduwwWIzCKYvyMLb+5O2f5kuyDXV/YmH39T6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780561177; c=relaxed/simple;
	bh=ARE5xFxdD+U6yBSRgQksyzMzQDjMSU+RmKw/JrC7VVc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=blEjAWHoxJvZlqkZ0hECFVFJZ/zmLkiB2bz0vhSWLSUx7t/S9Z//V5mllg09VMQSQRNovi0YxLs2cvO+khUljOCrF4eRNTYWLCMkXev7mf4k1arDl6UwRKyUrHtYwMCBFDbOvantQ217SEec2OCDh9E1ij53aSY5dcQt3JwU8PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JYgD4xCV; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C29901F00898
	for <linux-gpio@vger.kernel.org>; Thu,  4 Jun 2026 08:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780561175;
	bh=ARE5xFxdD+U6yBSRgQksyzMzQDjMSU+RmKw/JrC7VVc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JYgD4xCVxp7ez0J8kRcr0Vfjghi5uF7hmD2o4sKMWJPHDbDeO3ByORYJY2Or91T42
	 fjpbT1fNJCfkolDr55rIIzmRCBP1Wl8iURv0B8AvgYOU7d5rtPweYMMeSsW47rR599
	 XpKiGKk9glwPiMQFsJww49XQvQYsE/4W1m6iXhPvAZV4sdUUQsWs0r1WxLxF8fwZBN
	 avJ2VOB9rUn63UuboBYR9pLDglJaa8YkiOL+TwT+ZTO3+gnNUSTPrd1ReGgHws4c+5
	 70TsJzKeKGEvP0YqW1nxNmKbxGM088bi2+SAVpzDDxm9j5b/nLlgDMGilc7UZgm7ng
	 BeVZqn+F7gPEA==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3967724bed1so4376881fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jun 2026 01:19:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ94hWcbpL2UF7KEx4klysEwdnMiLqQ+J8DkNh3fEEFhIj1V3GOfH6/VHj0VR9Qj65g5f3ju6Ta50xZQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyuneSKvqFg7cKRZRlCM6GwTThuJkXTnKJF1SUSK+Rdp8ydK43u
	MrBQ4lgfCewFJIyZcftQ4vuZek7H75Z1nnraiEEuJm08uzwNlfjdsfmc9Wn5v3xSPWi+sAQR53z
	GuviSf1TCKB8iCuhGDVA3oZNQCe0fVL0=
X-Received: by 2002:a05:6512:4045:10b0:5aa:6ede:51 with SMTP id
 2adb3069b0e04-5aa7c090518mr1760555e87.27.1780561174487; Thu, 04 Jun 2026
 01:19:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260604-b4-gpio-pcf857x-get-direction-v1-1-d9b13a7b4478@vaisala.com>
In-Reply-To: <20260604-b4-gpio-pcf857x-get-direction-v1-1-d9b13a7b4478@vaisala.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 4 Jun 2026 10:19:21 +0200
X-Gmail-Original-Message-ID: <CAD++jLmLMpWqcUJW_WaaUoduvEP_eOoA2PfS+0po-PJsbH9PLw@mail.gmail.com>
X-Gm-Features: AVVi8CdJDGjjOCPvR1_SH6gD8XWX-SrEl6IHDBxD0OmwO7nZcYr0LJIDn43G4bg
Message-ID: <CAD++jLmLMpWqcUJW_WaaUoduvEP_eOoA2PfS+0po-PJsbH9PLw@mail.gmail.com>
Subject: Re: [PATCH] gpio: pcf857x: implement get_direction()
To: Tapio Reijonen <tapio.reijonen@vaisala.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37934-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:tapio.reijonen@vaisala.com,m:brgl@kernel.org,m:akpm@linux-foundation.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vaisala.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6DA8F63DFC8

On Thu, Jun 4, 2026 at 7:25=E2=80=AFAM Tapio Reijonen
<tapio.reijonen@vaisala.com> wrote:

> The GPIO core warns (and taints the kernel) when a gpiochip lacks
> .get_direction() and a consumer queries a line's direction, for example
> via /sys/kernel/debug/gpio. pcf857x provided direction_input/output but
> no get_direction.
>
> These quasi-bidirectional expanders cannot report direction in hardware,
> and the 'out' software latch alone is ambiguous - a released (input)
> line and an output driven high both read back as a set bit. Track the
> direction explicitly in a 'dir' latch updated by the direction_input(),
> direction_output() and set_multiple() paths, and return it from
> get_direction(). Initialise it from the same reset state as 'out':
> released lines are inputs, lines flagged in the power-on latch are
> driven-low outputs.
>
> Fixes: 15fae37d9f5f ("gpiolib: pcf857x i2c gpio expander support")
> Signed-off-by: Tapio Reijonen <tapio.reijonen@vaisala.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

