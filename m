Return-Path: <linux-gpio+bounces-31018-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCwFLh+Fc2kDxAAAu9opvQ
	(envelope-from <linux-gpio+bounces-31018-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 15:26:39 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD487705E
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 15:26:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F5163029E4C
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 14:25:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C05432695C;
	Fri, 23 Jan 2026 14:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AQeAdTF5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF47B320CD5;
	Fri, 23 Jan 2026 14:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769178348; cv=none; b=DoSG5gdfso/t6Ox76HpNDyy5fkEkAz/8kPrjMxuqfQfgn15LLkCN+LFZbMXSEdjzAx6H0oWRcyKP/5iSP4X6qeP6KKU6sIBHRsoZHnbHlu5tFMUzJve6csvEaqgIc0zjB5gRRL+m58VgAgK/U+vB92W05VPwHwJRb1RzeB3UKD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769178348; c=relaxed/simple;
	bh=nv6Gu3hn7KrejUZT2v0TkUViUCcfKYD9DY1jT6q+9tI=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=UWIVkQ4gQH7m97aMd8P3164ixElhDNJEQkdxGCWAXYirE1IueQoXVltgZ7HzxOBX9IzKaDwL1WupYLTXr+bWDGEHq8ej1WQN5kX7nd8Lcj4MBY0x8XFEjoaI9KJ3d0RM8g0s+cdnt8Jh2+pwHh/PxQ9rPmJ3hN4TJV9G6NzJqZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AQeAdTF5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17257C4CEF1;
	Fri, 23 Jan 2026 14:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769178347;
	bh=nv6Gu3hn7KrejUZT2v0TkUViUCcfKYD9DY1jT6q+9tI=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=AQeAdTF55CAN56yIIippY+AVaoT9h+j/izMr6kvAz3Cw0B+wAwmyI5/bmM9YRwEVg
	 v71pvyspk11Cmm48Qu8h8rX8qy8shLahKCwekKz9zRBI/rHeaZQOgCOVRm8MoZIPYe
	 S2YofWtd0QFo5GDMkAXcTqMHFxSTYjjWm3to2Z7DcdCj7E+JEFc54D3nggdpqZj39T
	 Y78iTtmE9+dQGUpGVoFE3Amvq7lxk3D7Cs0GveWqBq2fqCI4iWomKbqD9wGODIjhMt
	 4Z/C0cwVnQYMILqGebWWTSdafSbLql2Jp59OV71vlWdiMvunyymeBVga71wl4K1Cnh
	 43z2GUHpHInPw==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Jan 2026 15:25:43 +0100
Message-Id: <DFW1DQTKRQS0.YXYIGV3FF6TK@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] gpio: omap: do not register driver in probe()
Cc: <rafael@kernel.org>, <broonie@kernel.org>, <will@kernel.org>,
 <grygorii.strashko@ti.com>, <ssantosh@kernel.org>, <khilman@kernel.org>,
 <linusw@kernel.org>, <brgl@kernel.org>, <driver-core@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>
To: "Greg KH" <gregkh@linuxfoundation.org>
References: <20260123133614.72586-1-dakr@kernel.org>
 <DFW0SC4QG4W8.C7BRHX02W3IK@kernel.org>
 <2026012354-stinging-lapdog-2a54@gregkh>
In-Reply-To: <2026012354-stinging-lapdog-2a54@gregkh>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31018-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1BD487705E
X-Rspamd-Action: no action

On Fri Jan 23, 2026 at 3:19 PM CET, Greg KH wrote:
> On Fri, Jan 23, 2026 at 02:57:45PM +0100, Danilo Krummrich wrote:
>> On Fri Jan 23, 2026 at 2:31 PM CET, Danilo Krummrich wrote:
>> > diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
>> > index e136e81794df..8db71a2db9ff 100644
>> > --- a/drivers/gpio/gpio-omap.c
>> > +++ b/drivers/gpio/gpio-omap.c
>> > @@ -800,9 +800,7 @@ static struct platform_device omap_mpuio_device =
=3D {
>> >  static inline void omap_mpuio_init(struct gpio_bank *bank)
>> >  {
>> >  	platform_set_drvdata(&omap_mpuio_device, bank);
>> > -
>> > -	if (platform_driver_register(&omap_mpuio_driver) =3D=3D 0)
>> > -		(void) platform_device_register(&omap_mpuio_device);
>> > +	(void)platform_device_register(&omap_mpuio_device);
>> >  }
>>=20
>> On a second look, it recognize that this did abuse the fact that
>> platform_driver_register() fails when attempting to register a driver mu=
ltiple
>> times to avoid registering the same static device multiple times.
>>=20
>> So, I guess this has to be changed to:
>>=20
>> diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
>> index 8db71a2db9ff..3e1ac34994fb 100644
>> --- a/drivers/gpio/gpio-omap.c
>> +++ b/drivers/gpio/gpio-omap.c
>> @@ -799,8 +799,13 @@ static struct platform_device omap_mpuio_device =3D=
 {
>>=20
>>  static inline void omap_mpuio_init(struct gpio_bank *bank)
>>  {
>> +       static bool registered =3D false;
>> +
>>         platform_set_drvdata(&omap_mpuio_device, bank);
>> -       (void)platform_device_register(&omap_mpuio_device);
>> +       if (!registered) {
>> +               (void)platform_device_register(&omap_mpuio_device);
>> +               registered =3D true;
>> +       }
>>  }
>
> But there are no platform resources for this at all, shouldn't this be a
> faux device instead?

Probably, but that's for another patch, since this one may potentially be
backported beyond the existence of the faux bus.

> That being said, ignoring the return value of platform_device_register()
> is probably not something we want to keep around.

Yes, as mentioned below the commit message, there are a couple of things th=
at
need to be followed up on here.

With this patch I only intend to fix the deadlock condition and otherwise k=
eep
all the existing semantics as it is.

I.e. maybe it is intentional and this driver should not abort probing if th=
is
can't be registered for some reason.

