Return-Path: <linux-gpio+bounces-31637-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IVoADknjmlrAAEAu9opvQ
	(envelope-from <linux-gpio+bounces-31637-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Feb 2026 20:17:13 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E53130A0D
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Feb 2026 20:17:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4DF15303B4C2
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Feb 2026 19:17:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF36B27EC80;
	Thu, 12 Feb 2026 19:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bgWOb0on"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E29246BB2
	for <linux-gpio@vger.kernel.org>; Thu, 12 Feb 2026 19:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770923826; cv=pass; b=RtZsTFMIhXct56889B6cuLVG5iAewSL90VfKf30B9oQDTN/k9/zmSyDWKVN9fBmthV7SvsjvtRdfY/0gOwEVGBpeWCW2uI4aR5/b6++BoDZ+YBiDbH9hJ6h8Byu3l+hPeVf5guizGyzjHuSq9hYyVSBuVcdLA8vQGv+MGyV3eeI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770923826; c=relaxed/simple;
	bh=+5DH5ijzAvOtI7eX5+/+AuuQ4e/7LkgnyQJmj+MOH7M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W66uoGNX4oIwH84mA3VfDfs9EWadUbON4UshPTgnS2WOmMAKc3ols8HGmdfSut926kgotGJGlm4G6omGubKkb0ir0MxdsUDu9LDMxGpPgW3gS1ba+JgYB9QUt40cdqpJqaW2k6e4HEGf/WA3NU2jCEgvIsLZQE8fwQUClqUNDbQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bgWOb0on; arc=pass smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-948a076d6ecso56459241.1
        for <linux-gpio@vger.kernel.org>; Thu, 12 Feb 2026 11:17:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770923824; cv=none;
        d=google.com; s=arc-20240605;
        b=K6js42OU74OzMDprJeAJ7tvOmjchvm6iOryjVR3gmKSUPvpt/d1b8y1/nT7oA8J4tD
         1tA1jgMn9cPlVjqDg5I5AXX1TQpyyC1jmXH7LC1469RAQ78GWFz5ZcS6ioB7Vaw9heok
         6FO6Z/KUF6JnkXqPdU1b1tCKpXWtQDuHzATUv2JajzWwHXhumEAaqUsVH9cbAPkQwU54
         ecsVAZULTUVV/3gKCCve1828ZOxNrESLnRogeUzbnjmUYhJPzI+AOXCtoYPnJYVIhjcH
         UqPqVNbMS49NTEnN8wsciQjnTzzmHiIljpSMIZtx0BrssyLZKifI6RLRxj8X/91OX1k4
         C7YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+5DH5ijzAvOtI7eX5+/+AuuQ4e/7LkgnyQJmj+MOH7M=;
        fh=Rt/7ayWIPxd2Qc+C83q5ytl0gwshWdwsCWduMYjRfp0=;
        b=llcMhhagGZLC1ozwuB1zGdQS5Y9Sw0deAJjbRkRzBiHdvbyjFaApDtA1z3LI2b2HXX
         wjdOAb0Dzrhd8xWFMKtTSGykuFiMUqxN/SsWkxuxmODvMkL2aQl734BcJTVuqMs115mD
         TjN+4YDZQuMzktWOpsS/w0ovIk5VsExpaz9+v6LoWbklEJ0F0TpodMh1kRkIGdoG3uOJ
         F0Z6tCIbtI+r70k4wBgrPG+U3DiOR6Gd2Ji9FSCOkGQ/K2uttkRcutKsYxn6OYBRh9jO
         H7wyrJvJ3AhzG4cQfKogq6Hjyr1vCIZFeG/gHmYh69m3rdPJQPu+Dv9OHPopTlmSW2pb
         ExDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770923824; x=1771528624; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+5DH5ijzAvOtI7eX5+/+AuuQ4e/7LkgnyQJmj+MOH7M=;
        b=bgWOb0ongsiTVcBqPgk82k9gFKb4Kdf11JY81uD91F99pkMhX5EiIZ6pGjbXPtTcaC
         Ho5uApMMiSBCw0qSn690v6PZ6Yov3HeR9DWgvEBGsoBZwzgwomwrRwbEKqZkkhDUiunq
         D2qHTlHgvyvH9Onew0b/21MOJL6rRMzhho1sbWd3K9Tp64hSHJUDoxLHElIwB4eaO4VO
         V8umfn7RqcQDdYd+HvZgPrpXG2ImNvpkO+KUN6nStRv3lsXHuHTvItM8442wFyY072dd
         Dz5YSLtNSE3k3BUlfmHrDy7XyV0lAe2QS3CocKExTXWU8K0rBCQAqax/3Pckz5zJWKQ9
         i99g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770923824; x=1771528624;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+5DH5ijzAvOtI7eX5+/+AuuQ4e/7LkgnyQJmj+MOH7M=;
        b=H54KfjFGpM0OWsGy2BKK1LJ+IJmZVF0wWEUYPOl7ILjqIwLv3xnv2DK88DRAIZ+99j
         50U63aWFaIX4A7EpHmEmr3C4ImWWL8huYNMFoxfbYyDiXM/D+Cf5Evb9R6TKSxoeYKCZ
         hD+tbaIMheeV1mWpjrYIgedG6OBKRiQbgCu96T77CBuaQefEZA7oM+CVYaeve7j9RCkS
         3gtjWrVHvxJgJX8GxnkVjMtCWpS0SRUBoqyAiJvXsKMqZLjsPw3FC1efQpr5QcL/ARDy
         7PswDMsaGD/jrNZ1q1wAUaq/5Qu3e4Y9rETe6ei1KlyXPEGCtffSM5fFSf64Y1dz0ELt
         w43A==
X-Forwarded-Encrypted: i=1; AJvYcCXVarhAnRhR7iLfr2WVZnzRuBF17NRiBB68ncLJbesNYhoNjsSpcIVO4OQdmY5ipTpqg7W6e5HKdB5/@vger.kernel.org
X-Gm-Message-State: AOJu0YyxH8YK9dhcOi4lv6fo/Fa9KeVedJkjqGa+4idlm16+zjTx2G9+
	4R4huNJm3ImvM9MGJ0F+oTFTmiGbxQnUJlsoPT28l+ySsFtV2xmuGyqKwy5Pcha+K1ef++LMzHL
	ALpSXNdxXSRwxkh9M2nP8HRAVjC+rfXs=
X-Gm-Gg: AZuq6aIwexxKxpFQNpWtiroFivwsq/CqKDTYQFgHXAsjRKa8VfJkZQ/t7a8BvJVwVdF
	SMUWAvGtdqii92kgHCZmvDQx0rOtTcUjlfmVwZe7GO6nWJjT+ZmHu8y0bTDzkd0r3/Lr66I41JL
	wLJE24vyUlsOXjrZV6uWxlHzTZf9mzPQlBUJJ6032gRegHMOs/fYZLixZXMU/Em2+7A4oTqVPWu
	p/IQ9E2lX6wiAe+sPBioWE6ex/VnBeUxduA/LGfWiMIHG7r3d+TYUTBvyBuNEdEzYQG+bblxHRj
	xR7RKC9z9v6lt9kfMUtZBrGuA3Tv8JF5DSvCxlpbpk27yg5D4+LkeyuxD9nGbklDG0Un
X-Received: by 2002:a05:6102:160f:b0:5ee:a0de:65ea with SMTP id
 ada2fe7eead31-5fdfbb9efc0mr1372507137.38.1770923824150; Thu, 12 Feb 2026
 11:17:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211081355.3028947-1-james.hilliard1@gmail.com>
 <20260211081355.3028947-2-james.hilliard1@gmail.com> <CAMRc=MfgoKmsNAmn3rO2jDL-ZArMX2Jh-n4SnV6rpzRY3KSwuA@mail.gmail.com>
 <34a9b531-4f53-47ee-861e-1b18ff1a5752@kernel.org> <CAMRc=MfwQ8J7eT_geEf7Kj230SOvmO-LDHz9a_YgfRY-QB5V8w@mail.gmail.com>
 <20260211214708.GA3947691-robh@kernel.org> <CADvTj4p-zHMrXW+GJstB2sKS-7Wij98JNJGoiPiYmaP5RHhNQg@mail.gmail.com>
 <9afa52c1-b7de-4ccb-9114-a142567d21af@kernel.org>
In-Reply-To: <9afa52c1-b7de-4ccb-9114-a142567d21af@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 12 Feb 2026 12:16:54 -0700
X-Gm-Features: AZwV_QjTJOnpuLDi2ZHGibY0A42KReJLVkc_FuXVhU2nbfu1jpgvU9PmIjUN8P8
Message-ID: <CADvTj4pmAXo+KUMyB0=+x3HRdUdUq=baj_pnoa44oxnugZuTOg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: aggregator: add gpio-aggregator DT compatible
To: Krzysztof Kozlowski <krzk@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Rob Herring <robh@kernel.org>, linux-gpio@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alexander Stein <linux@ew.tq-group.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Herve Codina <herve.codina@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31637-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jameshilliard1@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,bootlin.com:url]
X-Rspamd-Queue-Id: B4E53130A0D
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 12:18=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 11/02/2026 22:49, James Hilliard wrote:
> >>>>>
> >>>>> Regardless of the DT bindings - this change is perfectly fine. We d=
o
> >>>>
> >>>> You cannot have compatible without DT bindings, so this alone is not
> >>>> "perfectly fine". Maybe you wanted platform_device_id entry for
> >>>> ACPI/legacy/MFD devices?
> >>>>
> >>>
> >>> Sure you can, you just can't put it into upstream devicetree sources.
> >>> We have had a compatible for gpio-sim for testing purposes for years.
> >>> Why would it be illegal to enable matching of platform drivers over D=
T
> >>> for testing purposes?
> >>
> >> The primary issue is undocumented ones show up in 'make
> >> dt_compatible_check'. I would like that to be warning free.
> >
> > Would adding it here make sense?
> > https://github.com/torvalds/linux/blob/v6.19/Documentation/devicetree/b=
indings/incomplete-devices.yaml#L243-L245
>
> What would you like to achieve with that? The binding patch did not have
> rationale why do we want it and here is the same question - what sort of
> problem is being solved by adding it to incomplete (so wrong) devices?

See details for what I'm trying to accomplish with gpio-aggregator:
https://lore.kernel.org/all/CADvTj4oBtO0Yhib1rE8QQwgtJvy-x_hK46C63mjVAydtxH=
OV8g@mail.gmail.com/

I'm basically trying to use it for the reasons described here:
https://bootlin.com/blog/gpio-aggregator-a-virtual-gpio-chip/

Is there a different device tree mechanism that can be used to
name individual gpio lines on a gpiochip without having to name
all of them for non-hog lines?

I'm confused why a "gpio-delay" compatible is allowed but one
without the delay param is not?

Or is the issue just with the name of the compatible I used being
called "gpio-aggregator"?

> This is not a pure virtual device, but for use with actual hardware.
>
> Nacked-by: Geert Uytterhoeven <geert+renesas@glider.be>

I'm trying to use this with actual hardware, I just called it "virtual"
because that's how it was described in the bootlin blog post.

I'm confused about what the issue is here as "gpio-delay" is also
a virtual device in the same way.

> Well, it is a virtual device in that there's no actual "aggregator"
> device on the board. It virtually aggregates GPIOs into a separate
> chip for user's convenience. While there's no such device as a
> gpio-aggregator - and so we must not put it into bindings nor into
> mainline devicetree sources - having a compatible matching in the
> driver is perfectly fine IMO. Just like gpio-sim.

There's no such "gpio-delay" device either right? I'm confused
why that compatible can exist but one without the delay param can
not in the mainline sources. Aren't they both virtual devices?

