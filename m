Return-Path: <linux-gpio+bounces-39952-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id T09wHSafVGphoQMAu9opvQ
	(envelope-from <linux-gpio+bounces-39952-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 10:17:42 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC49748914
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 10:17:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Dvirtr+1;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39952-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39952-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7C9FC301A44A
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 08:17:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC60B3A9616;
	Mon, 13 Jul 2026 08:16:55 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664E83A545E
	for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 08:16:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783930615; cv=none; b=CqWH2vQFav9kJ+cBFv8fYZOvryXDMi7T3t8yrv/MuKtjNYLJL5bB5cm3OnwwvBo15kFxJ3hZpXZpxAytIcovmrgojQ1HexavzbaVqeEU6/6YY+dMgE/Cy5zEzImwcAlSLxKMSjX9mHeFBljSDRKdsk6cCFVm+6K2RqZzJcpq3I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783930615; c=relaxed/simple;
	bh=9+3Sww1C+uYKIwyUcbIIOb42X2ECv7xamrybHeNLRDQ=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CRWCI2HqYW3E3Rc4kAEvMy1xDU1Pqrbr6N0j4qdPGSRJLJYqNxK9emL0IJjn1JW40H6A6mMtqFMHwbi6FfkTHQBRJNMeg/58cnEPsZKqPKhJtdUmA+mTPcAQrZ52LNFpQlIFmdMM1mu54TQqlUDW9D9wqUUU16H9dTx8jRosyvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dvirtr+1; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 383A01F00ADF
	for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 08:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783930614;
	bh=m5F0084nQCC/QhRXj90Uv+t8Z3rbI8iJLW2IgXjNKdk=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Dvirtr+1Ru0jx55LjsZRFcmWDXDLldQ0A030RudZy6rYxe2N4W/UZ0UvwF4W9KDHm
	 fJLxw6HyEQYLDhzML215WQo4PWKZdHRBuGgEYX4eViR9xDilYz/R9pvLNsmn5XDVFF
	 OQZziqazFDqDRiohOECkNpqIGeFxKdOq36aKTQGpilxXpLluIHw2ffjwb8htvdpBsF
	 Wxeh3/Vob3pS07O6toE0vsSOMgrNqxmCvgdVfvXFxGWq9dK+I/IeQ2BardntupAQqM
	 p3peqmiViDs7PQgzN89DQ6ciQb33DZg0vIqAZhQ3/qVVhV1uf3nhXxy974dmT9acRT
	 V8VpOe5XPcQlQ==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-39c86945164so22006151fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 01:16:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rpah+Zne/a1XXbbDO7sgKYvAd6tvIb1JSHEJ3fr6MIO+83IDvwhnvFO4HPy3CA6AVOJIj2F2jT43+kl@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0jM6FUamSQGXvmiJQ3zi6SGyMU4Pd3eCowvT1/DbnWgJMcETF
	Y0YPcyJ3WlmSifZq/2b+5TmKSmWFZx5E/6TjrJUxXJUJW6as4Ouk8KPY1QX4gAcsA8JXV47RvkQ
	1EvlDl1Dxv4F0b+FdXFncPq2LCDe7X9CZ7x8bgSGAUg==
X-Received: by 2002:a2e:a9a5:0:b0:39c:6f89:c9b3 with SMTP id
 38308e7fff4ca-39caa13ca2amr17346001fa.14.1783930612774; Mon, 13 Jul 2026
 01:16:52 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 13 Jul 2026 01:16:51 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 13 Jul 2026 01:16:51 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CANhJrGM9ciyBfgGWBwOM3kNmcXGSq4QVM6a6Js+wtbr9ANtSJA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1782909323.git.mazziesaccount@gmail.com>
 <27fb93d0e61704d495e3adf4ed614edac1642267.1782909323.git.mazziesaccount@gmail.com>
 <CAMRc=MccLRKb8ZjChcR7WK3TqV3=waSnKX=UX9LR=5hOT=_tsg@mail.gmail.com> <CANhJrGM9ciyBfgGWBwOM3kNmcXGSq4QVM6a6Js+wtbr9ANtSJA@mail.gmail.com>
Date: Mon, 13 Jul 2026 01:16:51 -0700
X-Gmail-Original-Message-ID: <CAMRc=MedLP3XBqoUv_zUr5gxBVc+gqwY3ozAyXagBhc_70Kykw@mail.gmail.com>
X-Gm-Features: AVVi8CfyQ1TAFYvyEQ1X0jI6L1cKq7pX3giTRDhFSopr0iz61Po6th7LT6u3Xr0
Message-ID: <CAMRc=MedLP3XBqoUv_zUr5gxBVc+gqwY3ozAyXagBhc_70Kykw@mail.gmail.com>
Subject: Re: [PATCH 7/8] gpio: bd73800: Support ROHM BD73800 PMIC GPIOs
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@linux.dev>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Linus Walleij <linusw@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org, 
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39952-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mazziesaccount@gmail.com,m:matti.vaittinen@linux.dev,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:linusw@kernel.org,m:alexandre.belloni@bootlin.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-rtc@vger.kernel.org,m:matti.vaittinen@fi.rohmeurope.com,m:brgl@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,gmail.com,baylibre.com,redhat.com,bootlin.com,vger.kernel.org,fi.rohmeurope.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4EC49748914

On Sun, 12 Jul 2026 17:42:17 +0200, Matti Vaittinen
<mazziesaccount@gmail.com> said:
> pe 3.7.2026 klo 16.11 Bartosz Golaszewski (brgl@kernel.org) kirjoitti:
>> > +
>> > +     if (!g->num_pins) {
>> > +             /*
>> > +              * The BD73800 may or may not have pins allocated for GPIO
>> > +              * depending on the OTP used at manufacturing. Free the memory
>> > +              * and go out if there is no pins as then we have nothing to do
>> > +              */
>> > +             dev_dbg(dev, "no GPIO pins\n");
>> > +             devm_kfree(dev, g);
>>
>> No need for that, because...
>>
>> > +             return 0;
>>
>> ... this will still leave a bound device in the system, I'm not sure we want
>> it? The correct error code in this case is -ENODEV.
>
> I am a bit uncertain. This isn't really an error. It should be very
> much Ok to configure the support for PMICs with GPIOs to be compiled -
> and also very much Ok to have a PMIC with no GPIOs. Returning an error
> doesn't feel right. Furthermore, I am afraid that returning an error
> might hurt the system start-up? Do you see some really problematic
> consequences if we return Ok without registering the GPIOs. I'd assume
> that wastes some bytes but I don't see other really severe
> consequences.

But -ENODEV/-ENXIO error codes are meant to do exactly that - tell the driver
core to assume this device legitimately cannot be enabled on this system. There
will be no error splat in the kernel log and the probe will not be deferred.

This really isn't the first device to need this behavior. :)

Bart

