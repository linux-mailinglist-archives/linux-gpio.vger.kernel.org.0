Return-Path: <linux-gpio+bounces-39558-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UvQgB8asTGrenwEAu9opvQ
	(envelope-from <linux-gpio+bounces-39558-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 09:37:42 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4787188C2
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 09:37:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Dogw9t1q;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39558-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39558-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A09B531AE516
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2026 07:30:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDA893F44EA;
	Tue,  7 Jul 2026 07:24:33 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62DB3C98A2
	for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2026 07:24:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783409069; cv=none; b=FUNAAXvWhG269j1eCjnzQTrhb3R6VzRJ4oLwxwcC0fHAzhQyNWw6i3SOD3Yw8S80n8QokPl/k/yqHo10r4wTYl7w9cdXsTxxVwCQvlLSNoxv8xZECgEcw4BGRfljlm85n4gOCC1njq5/fJwWkNR982gBaIcvIroEn4Wdm0xfgRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783409069; c=relaxed/simple;
	bh=BmN/CtMHKh2mi0fzV1uYYinbEdOJFdIHKPvunHZGayg=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VfdL/8RxY5Urv5nm8caXdUAuKdhkTlprt+VCOYQMxwG3kK5uFqUYEsqsLvZEqzB4kfoTR4ndyhmedqoe3YnQWu/Q4EO5h79TJH0NleCRLmJCwSN3e3PvmILJwxDmfdsX/oNmzVbhfZx7t5QPUWBc1oXzoNN4SN/ZSGK+9/3a9os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dogw9t1q; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5095D1F00A3E
	for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2026 07:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783409059;
	bh=BmN/CtMHKh2mi0fzV1uYYinbEdOJFdIHKPvunHZGayg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Dogw9t1qgCmIsDdnvQaTCTWALTInBBGi8HB27yI7UrR0lEhiFFIeMPUhr0hfDd7sw
	 V1D5uUhbXTZr8TUwRxxBd8GAek6ajzymnUT3DSem7drqjehorC2XXBqA4mhEV7Pe2N
	 d/hK4U1KZSltIZO3Pp2tSstITinTjvjwKhq1ZDHpIak/AMDBglQ4Xmz48vVOJrzb8v
	 wAAZyPCqjoP++rNIVXgZw91GSI/r8MJ9N0GVDCrv6i0eVQwVcvR+w+GPsC+A0dyVm+
	 K/gzHXactxhE5XUoiobevKTvCBUFG+nGjJ+091KQp6/BGAegiFYYiZYeKMUxK1gKyN
	 z23TuGevvYhcA==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-39b38198496so33006351fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jul 2026 00:24:19 -0700 (PDT)
X-Gm-Message-State: AOJu0Yz9tkbJDP3JRPkLFKo2sOGz+zLhZzHeHdEWDN3bATiErxH2xMRs
	AmzxPD1g6I06q+jwH5v+0PgXWZy36VEwiVjsqQMASLFzWBUtjFRyetpGuWL+t0OxTX+2SEDt3EF
	K2U/D7XimRqNUrPgwvDY2exiacAI9WeQMuYvWDB+5Dg==
X-Received: by 2002:a05:651c:1a25:b0:39b:2ff8:64ae with SMTP id
 38308e7fff4ca-39c5fd460femr9013721fa.9.1783409058001; Tue, 07 Jul 2026
 00:24:18 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 Jul 2026 00:24:16 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 Jul 2026 00:24:16 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <a00c475a6ce0469682305c4b4269b181@realtek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622092335.1166876-1-eleanor.lin@realtek.com>
 <178246069898.6685.11577448681947659397.b4-ty@oss.qualcomm.com> <a00c475a6ce0469682305c4b4269b181@realtek.com>
Date: Tue, 7 Jul 2026 00:24:16 -0700
X-Gmail-Original-Message-ID: <CAMRc=Md-iOQ5qb5uPZcKJkpS8fmYscw8TRXqe7rRrJS7acE32w@mail.gmail.com>
X-Gm-Features: AVVi8CcrbLMeNkZ5-bNIIYKlmy2rYvKumhuTS6KL5a6DXiAW3YJ-4dQor06ihkY
Message-ID: <CAMRc=Md-iOQ5qb5uPZcKJkpS8fmYscw8TRXqe7rRrJS7acE32w@mail.gmail.com>
Subject: Re: (subset) [PATCH v4 0/4] gpio: realtek: Add support for Realtek
 DHC RTD1625
To: =?UTF-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-realtek-soc@lists.infradead.org" <linux-realtek-soc@lists.infradead.org>, 
	=?UTF-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>, 
	=?UTF-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>, 
	=?UTF-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	"linusw@kernel.org" <linusw@kernel.org>, "brgl@kernel.org" <brgl@kernel.org>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"afaerber@suse.com" <afaerber@suse.com>, "mwalle@kernel.org" <mwalle@kernel.org>, 
	"andriy.shevchenko@intel.com" <andriy.shevchenko@intel.com>, =?UTF-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?= <tychang@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39558-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,vger.kernel.org:from_smtp,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,realtek.com:email];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:eleanor.lin@realtek.com,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-realtek-soc@lists.infradead.org,m:cy.huang@realtek.com,m:stanley_chang@realtek.com,m:james.tai@realtek.com,m:bartosz.golaszewski@oss.qualcomm.com,m:linusw@kernel.org,m:brgl@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:afaerber@suse.com,m:mwalle@kernel.org,m:andriy.shevchenko@intel.com,m:tychang@realtek.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6D4787188C2

On Tue, 7 Jul 2026 08:55:26 +0200, "Yu-Chun Lin [=E6=9E=97=E7=A5=90=E5=90=
=9B]"
<eleanor.lin@realtek.com> said:
> Hi Bartosz,
>
>> On Mon, 22 Jun 2026 17:23:31 +0800, Yu-Chun Lin wrote:
>> > This series adds GPIO support for the Realtek DHC RTD1625 SoC.
>> >
>> > Unlike the existing driver (gpio-rtd.c) which uses shared bank
>> > registers, the RTD1625 features a per-pin register architecture where
>> > each GPIO line is managed by its own dedicated 32-bit control
>> > register. This distinct hardware design requires a new, separate drive=
r.
>> >
>> > [...]
>>
>> Applied, thanks!
>>
>> [1/4] dt-bindings: gpio: realtek: Add realtek,rtd1625-gpio
>>
>> https://git.kernel.org/brgl/c/8f32808e1530b2229e07695fb39c54fee910bd4a
>> [2/4] gpio: Replace "default y" with "default ARCH_REALTEK" in Kconfig
>>
>> https://git.kernel.org/brgl/c/b5d23fcdb12972c522e96f90ab48be8a0d971b0e
>> [3/4] gpio: realtek: Add driver for Realtek DHC RTD1625 SoC
>>
>> https://git.kernel.org/brgl/c/a57e27c43b0315ee86c6896510d69be5257e093e
>>
>
> Thank you for applying the patches!
>
> I'm currently working on v6 of the patch series that incorporates Andy's
> gpio-regmap patches, and it should build on top of gpio/for-next. However=
,
> I have a conflict with the driver patch that was already applied.
>
> Could you please revert that commit from gpio/for-next?
>
> Best Regards,
> Yu-Chun
>
>> Best regards,
>> --
>> Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>

Can you just post the series as a follow-up? I try to avoid rebases unless
absolutely necessary.

Bart

