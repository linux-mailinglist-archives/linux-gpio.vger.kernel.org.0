Return-Path: <linux-gpio+bounces-38335-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DU9HFbSkKmoHuQMAu9opvQ
	(envelope-from <linux-gpio+bounces-38335-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 14:06:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97931671A59
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 14:06:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=WqNzIICo;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38335-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38335-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A31CE336FC82
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 12:04:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F0BF3EC2DB;
	Thu, 11 Jun 2026 12:04:24 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B711233921
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 12:04:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781179464; cv=none; b=cN/Kqea30gUmBj34IDjQRRaRZxnTZVVv6c3PxZvyeuvGBKb87AfyczDSZfstL+JU5gUO4mBLTD8gHetKoJhgzB6DkQ3eoIjDWtE7+eB5OnuP+69MvtnIzrLIShLOVcXYE/6UzUA/IwbQqu/L11g+459tKn0my+KiDVEw7LbMAig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781179464; c=relaxed/simple;
	bh=ROPHg9VN1Qhr0+agsTuMoXUjyKJkHv25AxjLVLVB9ek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UJmm6lcHxUs0An5tcf7UvYNZbjbJ6nsPRmBLG2ZSToQEgQKIbyGfb1ITxRZwiMqoCgCWTMrzG86dw1S3k1HVJehRDK3lzV69KSVn7PLuxMr7f9B21AMSedCJHact9OEgaolxoyrj1LVwMs+bIK7cWoNXOj08JNKrKFLE8NIvUZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WqNzIICo; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2DAC1F0089C
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 12:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781179462;
	bh=ROPHg9VN1Qhr0+agsTuMoXUjyKJkHv25AxjLVLVB9ek=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=WqNzIICo+obv4DW2P/S4zWisBI95KJURZs6ph0420I4hs6fEtE9JnZrkxyRzdDlle
	 rKjJTwduhcu56ZLlQGbbJAwR+6FIv/Aj5dnnWmPGFCvS7zZuklnAVb5jrZ2HayX2dv
	 taLnJH837+n2iaTXsaGgjCMLD7FAkK9i1+N1Lda3gmp1cL/GeSosO+Mwg+H/vqAyPW
	 UVVZu8dePgI+IEbvMBCX4Fz07/XJRjPEXjHCc1Gd+oUBflk32eSz7vF4sefbxHBiIF
	 oXsiVA2oRJxqUkJrTovKyDy0YOh9zPJDcqPlXYaXtA+Z2FuCdxjtDfKOHMg80f79Lf
	 pNXsSsGgRJp7g==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-39664fe2dd8so64695461fa.3
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 05:04:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/ne5AhSFtz7pDbwiLD1Jrl5VMZrUg2NezaS/6x9gWiOm1OgHjxxmB4j2TGESqp97wHcWzNLSXtNxQE@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2F1m1hlTgdmzUFLIIsW/QlRaW+QR12/+/RFFSmJDUUj6AA6kT
	OVIf5/SUnz8Cp5X8htrfv+MPJFyiKyGEukawsFsME2eq04Sg7sPlKX1atUpemTHWY5jJDRY4WVT
	ox87Pfb8qsWj0caUDDPmgMoSXz4dzJvw=
X-Received: by 2002:a05:6512:124c:b0:5ad:bda:4e87 with SMTP id
 2adb3069b0e04-5ad27fb6a9bmr780946e87.30.1781179460707; Thu, 11 Jun 2026
 05:04:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260608094122.1245189-1-pshete@nvidia.com> <20260608094122.1245189-2-pshete@nvidia.com>
In-Reply-To: <20260608094122.1245189-2-pshete@nvidia.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 11 Jun 2026 14:04:08 +0200
X-Gmail-Original-Message-ID: <CAD++jLn0FwBGrzdFp2dqXnUg60jnma6BCKNDyirEO4BFZh6Yzw@mail.gmail.com>
X-Gm-Features: AVVi8CcCDaOf4-MRCZfqSOQvD3MxIOCKTrbjtHNT3eOWDtAlzq1F4eMyJsM7JZU
Message-ID: <CAD++jLn0FwBGrzdFp2dqXnUg60jnma6BCKNDyirEO4BFZh6Yzw@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: tegra238: add missing AON pin groups
To: Prathamesh Shete <pshete@nvidia.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38335-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:pshete@nvidia.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:arnd@arndb.de,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid,nvidia.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 97931671A59

On Mon, Jun 8, 2026 at 11:42=E2=80=AFAM Prathamesh Shete <pshete@nvidia.com=
> wrote:

> Add 24 pin groups on ports EE, FF, GG and HH to the AON pin controller
> group table (tegra238_aon_groups[]). Their pin arrays, drive-group
> macros and pin descriptors were already defined, but the matching
> PINGROUP() entries were not present, so these pins could not be muxed
> or configured through the AON pin controller.
>
> The pin arrays were not referenced, so the build emitted
> -Wunused-const-variable warnings, and commit 119de2c33d96 ("pinctrl:
> tegra238: remove unused entries") removed three of them. Restore those
> arrays and add the full set of PINGROUP() entries to make the pins
> usable.
>
> Fixes: 25cac7292d49 ("pinctrl: tegra: Add Tegra238 pinmux driver")
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>

Patches applied.

Yours,
Linus Walleij

