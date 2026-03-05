Return-Path: <linux-gpio+bounces-32579-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEJCLe19qWnA9AAAu9opvQ
	(envelope-from <linux-gpio+bounces-32579-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 13:58:21 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D66C0212376
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 13:58:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 32CAF305C3CB
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Mar 2026 12:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 963663A0B35;
	Thu,  5 Mar 2026 12:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S+QZVT4R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497AC3A0B36
	for <linux-gpio@vger.kernel.org>; Thu,  5 Mar 2026 12:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772715274; cv=none; b=IhGakNF3qsChkzlWzLJGfVvHqJy+wiEEqKr/73jrO7FSkjmg/R0/hx4j1jvfKNQhER/LZtykM+TwpS/vu5hUH0PG38yjSJyFxwf1l1ipA97gxILrr4yvUAcJ6T2RXo3BgSpWFv5lQCbnOxtReY8l1B07e1h7NentO398Mge7vtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772715274; c=relaxed/simple;
	bh=cu1oUJaDlhadNZdXZeA7Rjo/Km1gQ9Mb1DfAEjrTJ2w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SKdQMpqGItspwdhv/PxTxsTzojhu/0qTg2VzbXHGTkaP/HgGAdoj6V3+N6R15UFLDOAGAyBCSQgW9kDDYxHzjWxc1jGLFNonxXFOnFn5Dq//T1K18ATuagKCSUX0m2xK57Tk7DC5kW8CBh5PYRthW3KrhloWAAU/ID+rqfd2PTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S+QZVT4R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03D26C4AF09
	for <linux-gpio@vger.kernel.org>; Thu,  5 Mar 2026 12:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772715274;
	bh=cu1oUJaDlhadNZdXZeA7Rjo/Km1gQ9Mb1DfAEjrTJ2w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=S+QZVT4RT0FLmiZb/7pVI2B73TrycHXpt1F/2QFKoOIBZ5xZeuqA4nRau2E2EhaZy
	 eUZuoMdY9O2quh8Pgvd4wyC14ZzyThxDtQVuc9qc1puWBLW2VpozZ22D9asc3b1frM
	 /auNoRJJWpKdZr0bY5MJ3YrnVF5kvNoisCV1ptx0Vy/0Yv96OuSLfp1YoznhGlvwFC
	 mV6TuJ21d1Pm/1nGBG9n9rE831rLCesZ341q7SnrrbIeshbkblvL+c92dBZoE0xUVb
	 ShV0dmTcy7dVNsoda/iHhsv3K0r6fM5aGuEa8DGUnp731TlIJVzDQPt65buYIRkdqO
	 UU/pkmXVNm5xA==
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-64caaacb9bcso7679120d50.1
        for <linux-gpio@vger.kernel.org>; Thu, 05 Mar 2026 04:54:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXs2PXdCjJOuuCa7Etr6qTFDkB5zhfF5phK527Uzc5x6y+3WPK2KPumRqi2aIbikMMXuzdmmJvAfMbg@vger.kernel.org
X-Gm-Message-State: AOJu0YwOvd1YUzyMT/ex56eSc+SOwYkzKYTKX3ocb1bc5whyt3AVKmYL
	4DSN0JvAhLQ3cx5lcQihRgrDOiSLfo1fA43RX376Qz+YEdQ5oKYUsEiHRzD/mCjR46YC30+XO4v
	qHmgJQGIHgFFK4hbeaCnaTUo/2HGrt5w=
X-Received: by 2002:a53:e197:0:b0:64a:cdf1:99f6 with SMTP id
 956f58d0204a3-64cf9ff1cc4mr3631131d50.63.1772715273377; Thu, 05 Mar 2026
 04:54:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303133947.1123575-1-o.rempel@pengutronix.de>
 <20260303133947.1123575-2-o.rempel@pengutronix.de> <177254885509.3251575.14819823286886805862.robh@kernel.org>
 <aacH7NmkOzZued0Y@pengutronix.de> <20260304-graceful-sweet-bittern-98efdb@quoll>
 <20260304100642.44d00b99@erd003.prtnl> <4d4c6ebc-698b-44c2-9a91-607381d6ece1@kernel.org>
 <20260304112500.4766f21b@erd003.prtnl> <98debf2d-cc29-42dc-bb93-ee97439683fd@kernel.org>
 <20260304131731.4d54f051@erd003.prtnl>
In-Reply-To: <20260304131731.4d54f051@erd003.prtnl>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Mar 2026 13:54:20 +0100
X-Gmail-Original-Message-ID: <CAD++jLkK5od7cODqQ2BsEKE7tvp8vVAsv6erLu1dEzcn35F8QA@mail.gmail.com>
X-Gm-Features: AaiRm52hABlQPGceianpxeT2EH5vBUlmCgYDsJIaxmSxvInyVQGTDhdoIviYV4s
Message-ID: <CAD++jLkK5od7cODqQ2BsEKE7tvp8vVAsv6erLu1dEzcn35F8QA@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: mfd: add NXP MC33978/MC34978 MSDI
To: David Jander <david@protonic.nl>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Oleksij Rempel <o.rempel@pengutronix.de>, 
	"Rob Herring (Arm)" <robh@kernel.org>, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Rosin <peda@axentia.se>, 
	kernel@pengutronix.de, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Lee Jones <lee@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: D66C0212376
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32579-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Wed, Mar 4, 2026 at 1:18=E2=80=AFPM David Jander <david@protonic.nl> wro=
te:

> > OK, thanks for the explanation, but then primary function is not GPIO
> > either, because nothing on linked page says it is a generic purpose IO.
> > It says it is switch detection. Maybe better generic name is then
> > "pinctrl", thus also "pinctrl" child should be folded into the parent..=
.
> > but switch detection is also not a pinctrl. :/
>
> I agree. This chip is indeed not very clear-cut with respect to the corre=
ct
> Linux subsystem. It could also be an input device if you view it strictly=
 from
> the "switches" standpoint. I thought about this also, but figured that it
> would be more flexible to just view it as a pinctrl device, which could a=
lways
> be used in combination with something like gpio-keys.c if one really want=
ed
> the input functionality. For context, our use-case is primarily for indus=
trial
> control reading digital sensors such as mechanical switches or industrial
> optical sensors, and that is AFAIK the main application for this chip any=
way.
> For this the gpio UAPI is a good match.

I have read the datasheets and GPIO+pinctrl is the best fit in my opinion,
mostly because there are a lot of electric properties involved and there
are industrial use cases, which is a good fit for the GPIO character
device and the pinctrl+GPIO generic pin config options, some which
are already identical.

The alternative would be to create something new in drivers/iio
which I think is overkill.

Yours,
Linus Walleij

