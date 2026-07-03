Return-Path: <linux-gpio+bounces-39394-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wdJSBoZ4R2ohYwAAu9opvQ
	(envelope-from <linux-gpio+bounces-39394-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 10:53:26 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 685A07004DF
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 10:53:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=g7tv8UyY;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39394-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39394-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E1C9A30A7415
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jul 2026 08:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 636EC348C67;
	Fri,  3 Jul 2026 08:34:47 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC433019AA
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jul 2026 08:34:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783067687; cv=none; b=nAxMCA2Fq7H/25EbJFryYEE/BEcVgtPNwaM+dAeMCUrGyeHR/2olN7X5EvETKL/S3+KPTUEp6/YMXluF+FxIznBUqbKUMWzstY++K6rU22AOy54prGEOyhzmDji6jtqZvbDQX/vv62+oZCGXY3hJrhMEQyUov34fWfDBGuKHn5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783067687; c=relaxed/simple;
	bh=7UrfT2JsQHudxkWYp9RoYzKbZ+8m910as+OlKIblj+A=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hu57KqKsTZ2wz3edadysOJT4uw72nC4UgUByX0yhXEynTqomGNBBtInhdSC2vKrskMLpEjVHcMp+SYl+j8/KQWw/6SClXDNhWUOtIKk4XiJ0QhvI7+b0JzkI+vPvydp7sUE2GTgDdf3VrHdaSU7l2XsMBuHOuMeXu7+CELfC2xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g7tv8UyY; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 383521F0155B
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jul 2026 08:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783067685;
	bh=7UrfT2JsQHudxkWYp9RoYzKbZ+8m910as+OlKIblj+A=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=g7tv8UyYT3EsT7J1CcpuLsu1W2UqbXKl/QpExGJ+ZgWpj8oySBozalTcBCYH4AaUJ
	 gdu1AgXhY1rZw22B4HrSR9qykSIILXvWdMX+gYukIbjRf1VEoWk7NDAlUcrkWycoSM
	 aLCEnQ1Cr+Q3Uo0zV/eHtPxgruTRCWbZxzuASkH9qlfyP0YJOM7XmifDo35aptYf9K
	 SpxYTrvYlA2ZqvNHVDVU76tI1AjzH4mgzjwn0YGhZ6wb3IpAegBXy8eC+mEuuKKE6F
	 Dh91hTGX1wkGstj77CB8jsw2jNV6ZkWKs18hiq1opz3PGNLkz8DHmSklMWEFlD7xRX
	 ACayFJTU2vWSQ==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-39b27812c96so2825951fa.0
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jul 2026 01:34:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RplQSnxlyVSfh2ey8zM1J288dqjWPXKipHeSFekugMI8GcV0p0e5tBd671dlc5ZzuOIqy7hQ2b/RxKM@vger.kernel.org
X-Gm-Message-State: AOJu0YxPk22r1NmsnyLUHHtBsTngvrW1u1IiTFu3CPPpXwmdum3z6lw4
	+LTbgEZ8RNo2qBNeElvrBXQhNc5EyLGtzXyICetMTAMfuE+HPBQ6TBxGM34mYOyphNPjTI9D7yG
	BeAzfxIDKubhfJ5oFgb6Fq6aCupJt83FiczACzPBysA==
X-Received: by 2002:a2e:ae0a:0:20b0:39b:88:4c0b with SMTP id
 38308e7fff4ca-39b33fab85dmr15702771fa.9.1783067683886; Fri, 03 Jul 2026
 01:34:43 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Jul 2026 03:34:42 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Jul 2026 03:34:41 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <dfe56aa625c54f95ab4baf2fff2776ae@realtek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702130903.1790633-1-andriy.shevchenko@linux.intel.com> <dfe56aa625c54f95ab4baf2fff2776ae@realtek.com>
Date: Fri, 3 Jul 2026 03:34:41 -0500
X-Gmail-Original-Message-ID: <CAMRc=McgA_K-A6LVycafgwjRuDHMs6E0aUyfFSH9t3h1TZ6ETA@mail.gmail.com>
X-Gm-Features: AVVi8CfOIjlCOD6LavYR9Nxf737trPNgUOcqgAvonGfFjVHItz5sMVKfVzOACL0
Message-ID: <CAMRc=McgA_K-A6LVycafgwjRuDHMs6E0aUyfFSH9t3h1TZ6ETA@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] gpio: regmap: Keep tracking IRQ requests and releases
To: =?UTF-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linusw@kernel.org>, Michael Walle <mwalle@kernel.org>, 
	William Breathitt Gray <wbg@kernel.org>, =?UTF-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>, 
	=?UTF-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>, 
	=?UTF-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>, 
	=?UTF-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?= <tychang@realtek.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mark Brown <broonie@kernel.org>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"driver-core@lists.linux.dev" <driver-core@lists.linux.dev>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39394-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:eleanor.lin@realtek.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:linusw@kernel.org,m:mwalle@kernel.org,m:wbg@kernel.org,m:cy.huang@realtek.com,m:stanley_chang@realtek.com,m:james.tai@realtek.com,m:tychang@realtek.com,m:andriy.shevchenko@linux.intel.com,m:broonie@kernel.org,m:mathieu.dubois-briand@bootlin.com,m:brgl@kernel.org,m:linux-kernel@vger.kernel.org,m:driver-core@lists.linux.dev,m:linux-gpio@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,realtek.com:email];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 685A07004DF

On Fri, 3 Jul 2026 10:17:04 +0200, "Yu-Chun Lin [=E6=9E=97=E7=A5=90=E5=90=
=9B]"
<eleanor.lin@realtek.com> said:
> Hi Andy,
>
> Thanks for your patches!
>
>> During the review of the v3 [1] of the series that adds a driver for Rea=
ltek DHC
>> RTD1625 SoC GPIO the gap in the GPIO regmap implementation has been
>> discovered, id est the IRQ chip that is created by regmap IRQ doesn't ha=
ve IRQ
>> request and release callbacks and hence in terms of GPIO does not track =
if any
>> line is locked as IRQ. This might lead to undesired and most likely faul=
ty
>> behaviour. This series is to fill that gap. Currently it only fixes the =
only user of
>> the automatic IRQ chip creation facility provided by GPIO regmap, but al=
so
>> provides the exported callbacks for others to be possible to call them f=
rom
>> customised versions of the callbacks in the respective drivers.
>>
>> Most of the affected drivers if I am not mistaken are the Industrial PC1=
04 ones,
>> hence I Cc'ed William to look at this and perhaps even test.
>>
>> Yu-Chun, can you give a try with your v3 based on this series? I believe=
 we can
>> use regmap approach after all.
>>
>
> I tested them on the rtd1625 SoC board and it looks good. If no one else
> has any issues with Andy's patch series, I'll send out v6, which will be
> based on my v3 and this series.
>

Please just fold Andy's patches into your series for easier review.

Thanks,
Bartosz

