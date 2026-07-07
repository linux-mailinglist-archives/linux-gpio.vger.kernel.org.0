Return-Path: <linux-gpio+bounces-39572-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KATxNaS4TGq/ogEAu9opvQ
	(envelope-from <linux-gpio+bounces-39572-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 10:28:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7701B71917A
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 10:28:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=L0RTCN1n;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39572-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39572-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 299713028EF9
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2026 08:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A29973126BF;
	Tue,  7 Jul 2026 08:22:30 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D07F2C237C
	for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2026 08:22:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783412550; cv=none; b=FDjnLVZxdfYUi8PB5sqOysVbeOQzodZ8WOiD0McsOjApKrCfZKbOLba3p3pJaUgUx/XBUCBF9yAufb8VzunRvREqjuD+vZk3R7V1uJf1RZsWnPlAJZloqWAqMhVinJcVioHVtPt4PenamM9GLzGAKuhsYLVTYM0AdPEuLcJzJq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783412550; c=relaxed/simple;
	bh=ltAiiJOY4Rh6R3USCVTRewP6JRiLBCJCatFHoJxYfOY=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BYkI69aZkjqXRA8UksH+SON5YRXXCu/G1YXIGMxa12A0x3Ak2CqglsxU0y5AuN/LAzQzdFYNf8F3v84hS/SWnc9EJ1xnzDtKSpi3oVQ2J9gaerDg6QpMrw55QXFz2ORaRY1qKlqzupZd+P9glvYLLWD8g/h7LRJ53u+PmI4faDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L0RTCN1n; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CBD01F00ACF
	for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2026 08:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783412549;
	bh=ltAiiJOY4Rh6R3USCVTRewP6JRiLBCJCatFHoJxYfOY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=L0RTCN1n4h2MOCTtx/K1SWL7s1kbREzTYeE3CG9SXhN/tB5cuOAFtujxs59gfZM/B
	 H+2JJCNXQcWYFpd54b2GOsZWCrPavSHZX4v2nbHDU9oQZAQPRHqnf6fsdSicTG+kzw
	 0dBl9jrxU6w4/JDKsri7DfGc15iEe5DXDX2zjXNvJoL3hzIV4/kO5JxFtgpythM9dM
	 wafj4/9Yvblp1ubcGoy9DqcPVpQYdGkhHURM3IBd1KV1cTe2BthukMMG9fT2cN9KhM
	 9PCcJKoTz+gNcksL23jQwultmJ1GeyKYcyWNNxwr0slpIGzxbEVNyFAQnEuDQVq5Bi
	 HZ/aDKVkdrpSA==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39b38198496so33391501fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jul 2026 01:22:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqJ9l3gB/0qCk5mqYBgyIIGmUyoGIolnAME27FMQObHOMQKB1i2DL45A67/w/0sk3n4mrPP45dOx+dd@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4c8KqQX8/V4tZnUJoZKVmc8YQzrDDO67qK3N7T1Vt0rAKrb5Y
	TfUbzWvrPs5Npg+mSLea+6pUFXiOD71j8j4r6KT08NwuXZIu/ELRgljoPl2Q4xQqhyFaDmdOngj
	qkO3ZFXkm066hVfzkIr4yu7PTt0MG7zrIIMHTp8IGhA==
X-Received: by 2002:a05:651c:234d:10b0:399:8a8e:64e4 with SMTP id
 38308e7fff4ca-39c5ffc9258mr7569231fa.19.1783412547763; Tue, 07 Jul 2026
 01:22:27 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 Jul 2026 01:22:26 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 Jul 2026 01:22:26 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <akyxXxtj8nyCs-yf@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622092335.1166876-1-eleanor.lin@realtek.com>
 <178246069898.6685.11577448681947659397.b4-ty@oss.qualcomm.com>
 <a00c475a6ce0469682305c4b4269b181@realtek.com> <CAMRc=Md-iOQ5qb5uPZcKJkpS8fmYscw8TRXqe7rRrJS7acE32w@mail.gmail.com>
 <akyxXxtj8nyCs-yf@ashevche-desk.local>
Date: Tue, 7 Jul 2026 01:22:26 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfD2j3xt1dXojFbyn=Df_9epMgEmLvSdCAfS7BSS6HD6w@mail.gmail.com>
X-Gm-Features: AVVi8CfM53nWTpEzDBmB2ofkWlre7XvkEwA0f3764nQdW9C9z_xUKQQo5Zl9o_8
Message-ID: <CAMRc=MfD2j3xt1dXojFbyn=Df_9epMgEmLvSdCAfS7BSS6HD6w@mail.gmail.com>
Subject: Re: (subset) [PATCH v4 0/4] gpio: realtek: Add support for Realtek
 DHC RTD1625
To: "andriy.shevchenko@intel.com" <andriy.shevchenko@intel.com>
Cc: =?UTF-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-realtek-soc@lists.infradead.org" <linux-realtek-soc@lists.infradead.org>, 
	=?UTF-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>, 
	=?UTF-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>, 
	=?UTF-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	"linusw@kernel.org" <linusw@kernel.org>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"afaerber@suse.com" <afaerber@suse.com>, "mwalle@kernel.org" <mwalle@kernel.org>, 
	=?UTF-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?= <tychang@realtek.com>, 
	Bartosz Golaszewski <brgl@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-39572-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,vger.kernel.org:from_smtp,realtek.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:eleanor.lin@realtek.com,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-realtek-soc@lists.infradead.org,m:cy.huang@realtek.com,m:stanley_chang@realtek.com,m:james.tai@realtek.com,m:bartosz.golaszewski@oss.qualcomm.com,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:afaerber@suse.com,m:mwalle@kernel.org,m:tychang@realtek.com,m:brgl@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 7701B71917A

On Tue, 7 Jul 2026 09:57:19 +0200, "andriy.shevchenko@intel.com"
<andriy.shevchenko@intel.com> said:
> On Tue, Jul 07, 2026 at 12:24:16AM -0700, Bartosz Golaszewski wrote:
>> On Tue, 7 Jul 2026 08:55:26 +0200, "Yu-Chun Lin [=E6=9E=97=E7=A5=90=E5=
=90=9B]"
>> <eleanor.lin@realtek.com> said:
>> >> On Mon, 22 Jun 2026 17:23:31 +0800, Yu-Chun Lin wrote:
>
> [...]
>
>> >> Applied, thanks!
>> >>
>> >> [1/4] dt-bindings: gpio: realtek: Add realtek,rtd1625-gpio
>> >>
>> >> https://git.kernel.org/brgl/c/8f32808e1530b2229e07695fb39c54fee910bd4=
a
>> >> [2/4] gpio: Replace "default y" with "default ARCH_REALTEK" in Kconfi=
g
>> >>
>> >> https://git.kernel.org/brgl/c/b5d23fcdb12972c522e96f90ab48be8a0d971b0=
e
>> >> [3/4] gpio: realtek: Add driver for Realtek DHC RTD1625 SoC
>> >>
>> >> https://git.kernel.org/brgl/c/a57e27c43b0315ee86c6896510d69be5257e093=
e
>> >
>> > Thank you for applying the patches!
>> >
>> > I'm currently working on v6 of the patch series that incorporates Andy=
's
>> > gpio-regmap patches, and it should build on top of gpio/for-next. Howe=
ver,
>> > I have a conflict with the driver patch that was already applied.
>> >
>> > Could you please revert that commit from gpio/for-next?
>>
>> Can you just post the series as a follow-up? I try to avoid rebases unle=
ss
>> absolutely necessary.
>
> Would be just leading reverts in the series appropriate? Otherwise it wil=
l give
> a lot of additional work for peanuts.
>

Yes, that's alright. It will make the review easier. We can then squash the
reverts with the new patches when applying.

Bart

