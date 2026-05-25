Return-Path: <linux-gpio+bounces-37435-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNz7AIANFGphJQcAu9opvQ
	(envelope-from <linux-gpio+bounces-37435-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 10:51:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7299E5C8139
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 10:51:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E1A393024A2F
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 08:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23D733E317F;
	Mon, 25 May 2026 08:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h3X7fIVk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F26F3E1CEB
	for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 08:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779698879; cv=none; b=ZK6yg5w3EC0Gfqc8a9ozuF3umLXmjdUKWlZSPKPivMHgVliebJd2C74oF1p72i/UlwsUsDIaDwzKxTRySzNdHxTuobdnMXlbuooKcHIM9HKypyxRiYNdiNR8lBZQiqckKuyFalSB8yy9XY7srjIbLzvYhKfXCAtfCxrq0eyEeZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779698879; c=relaxed/simple;
	bh=FBpRH8Z/da6LFKxE2gt1Yw5SEYEq7GdWXOLZCB2Um+Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VEQrD9RbDZDLvyGrFR1LdFw5kfWAFkMXipQpp61gMpUfo3gJXHRBQgdQ5gAo2yK55qnjRiLN/+phh/DzJkm/wNmqur89FU2kWYM30rXcqo2uhpw8DrzxJEKdJ8Bt9VSVklFtbB7G2GqD1FSWqRpNXzZfZr8aOE8lOoxeWffkW6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h3X7fIVk; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5250B1F0155C
	for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 08:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779698878;
	bh=Uiez2tUH2lHzvinGDgjZTRw1gLY54bFofTb+3SZa2AI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=h3X7fIVkXFqcRMVu0vwPhrdLPxDBY24EoTdRpcPfjUB7D88HSdGbkXMAOKn203Rqd
	 0DzIRM399hU19P7lZ46lThAdDzUllgFmSZFU6VfePho2oBIZq0NujvomUwOplXdLIw
	 vhu1OOYbrv281Vz2W1AuiHCBEQmsS8mJ5gVYROpnFr4JVPowSDKF2+/AlpO1s0LFXl
	 vSnai+Th2Iu0Xt5khb2l72inbHXQ+u4h/xgMe4gyUoTMuzsFmuSarRN8ZiFqLd9E/j
	 NB/nY6r5SY0Uxfjoh5mmYiED1PGcnA6NXkTNgh7ORNE1IsVynEyi7H3mtlAnqBuJgp
	 EEt0O8gUPtVrg==
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-48543ae6e39so2059040b6e.0
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 01:47:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8cynrul4nQ+GLpEu4zKlbAKPCQJw/wzAHAtXUeTULxHXaTMP57WDaAM/nS9EoWkafwfPkAHfYCpTlj@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/EzIg9l4xKI94eJq88Ny6WAgOxyrG0kT3ta00665K76ghvDlB
	j68+59f8DPvlItWhNS3aXKdNPUewjyUwY+jG5z3H1551MF5Syko3q0Fk7aAHZOfb/zk2tr7VP+F
	ogpBIjbxFvEZHZyFUPzru7mqWo4SrfTI=
X-Received: by 2002:a05:6808:3a0e:b0:482:48e1:cdf1 with SMTP id
 5614622812f47-48549ed026fmr8979404b6e.5.1779698877682; Mon, 25 May 2026
 01:47:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519164007.122574-1-gaohan@iscas.ac.cn>
In-Reply-To: <20260519164007.122574-1-gaohan@iscas.ac.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 25 May 2026 10:47:43 +0200
X-Gmail-Original-Message-ID: <CAD++jL=1zGiwyqut3m-9h2VSTEbu4yGfUe6eo6b2azHm4kSJ+Q@mail.gmail.com>
X-Gm-Features: AVHnY4JnR7v4dqg5BWRjELg39bXhmUzIb9bOP06stD31r1dff2wvUSgEgPdnLIU
Message-ID: <CAD++jL=1zGiwyqut3m-9h2VSTEbu4yGfUe6eo6b2azHm4kSJ+Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: spacemit: fix NULL check in spacemit_pin_set_config
To: Han Gao <gaohan@iscas.ac.cn>
Cc: Yixun Lan <dlan@kernel.org>, Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>, 
	Anand Moon <linux.amoon@gmail.com>, Junhui Liu <junhui.liu@pigmoral.tech>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, linux-gpio@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Han Gao <rabenda.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FREEMAIL_CC(0.00)[kernel.org,hammernet.be,gmail.com,pigmoral.tech,linux.spacemit.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-37435-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 7299E5C8139
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 6:40=E2=80=AFPM Han Gao <gaohan@iscas.ac.cn> wrote:

> spacemit_pin_set_config() looks up the per-pin descriptor with
> spacemit_get_pin() then checks the wrong variable for failure:
>
>         const struct spacemit_pin *spin =3D spacemit_get_pin(pctrl, pin);
>         ...
>         if (!pin)
>                 return -EINVAL;
>
>         reg =3D spacemit_pin_to_reg(pctrl, spin->pin);
>
> pin is an unsigned int pin id, where 0 (GPIO_0 / gmac0_rxdv on K3) is a
> valid pin, so rejecting it here drops the PAD config write for the first
> pin of every group. On K3 Pico-ITX the GMAC RGMII group lists pin 0 as
> its first entry, so its drive-strength / bias configuration was silently
> ignored.
>
> The intended guard is against spacemit_get_pin() returning NULL when the
> pin id isn't in the SoC's pin table. Check spin instead, which both
> restores PAD setup for pin 0 and prevents a NULL deref on spin->pin.
>
> Fixes: a83c29e1d145 ("pinctrl: spacemit: add support for SpacemiT K1 SoC"=
)
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>

Patch applied for noncritical fixes.

Yours,
Linus Walleij

