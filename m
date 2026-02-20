Return-Path: <linux-gpio+bounces-31938-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YH7JIJAamGki/wIAu9opvQ
	(envelope-from <linux-gpio+bounces-31938-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 09:25:52 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D01A5165A2C
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 09:25:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C2323005D37
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 08:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A43AA3358BE;
	Fri, 20 Feb 2026 08:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AydUpqxt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D2F21B9F6
	for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 08:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771575863; cv=none; b=F9hyoc1lTm89LQMH1VQl4XRu99RhDmuZArKMQWa+Rnqe4ekGenc3LZuW07GVwWuucfEKI7cZp8DY8EFBtLdXqZQMnIdltkyhJAi3rk4fB5qyEndsz+7hFvGEc/en7g4VNUkHi8102uYyjM+SygTy943UeoHFPsZnaOQcJCkGm5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771575863; c=relaxed/simple;
	bh=jiMzU474S3iv+d3BlkATB38/oga7BseIyjETmSSIQDM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A7ExwJBDVqhOFMY6FP6iuzCpcY5NvfTGJKjv3FYm4aZmWsiyFCP3CxENaO5FykLYeowA6U0OjcjrBLs/7OUQY5hmB2z1zxn9uoWb2BRcedDh5x9HmXtyLeJ7fivtbcZ9J2HOiNsp/21BAU+/KmoxtU8VxHBo4OkM+HPbPGQvepc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AydUpqxt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EB17C19424
	for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 08:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771575863;
	bh=jiMzU474S3iv+d3BlkATB38/oga7BseIyjETmSSIQDM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AydUpqxtqEQCjpf5jNPBLvlgWrVz9ke49j1rwY7YNzvEyMQTNhFeBwDHQzgp4lyb1
	 C1ky0pahF9F53X1t8DdvD6VWI2wCUNjTXExHcWY1+ZMgLDBKO1+1mm3YhJ/BV/pCys
	 bDMDin0lbKuwBbAu/Gnj0uatbVVxSkjWYJ/GiTj7gUtfWK0zAEGqbQDVOTPbOA5ida
	 2n88hgdpWWpKPQhwpsrKsC82bIokyCVKOu6QRXVH2shzlsKdvBUesUlGUOAZQ14s37
	 3rtbyzdjKuISyJhgarY28JN+4gHv9kd0Nr1tC+7xt8wVIZZRJ05VxfgJDA7Ae/cH0E
	 6qaimZJcZTFRA==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-797ab169454so17333977b3.3
        for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 00:24:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWXAjn0g2oaGuKMt2zfmNEeTb2FMS7UKS6PbF7xLPT/2dqHjzrRrOKW8jwja+YikdU3cmgXROEuOd05@vger.kernel.org
X-Gm-Message-State: AOJu0YyxZz1At/oRk1u6xozEf2hgwO0ZA3vqB9/sWus7CK7lX0imG551
	o7KsKbLu/qt0R0jVYTZRxpJG19nSD3IwV0x3J9Hwu15UEjTirUfeE3rD3g+FXhDjF4sQMm3m7LP
	YcM+kZ28VAOZybS9VS1FuuQ+qZTrQXVc=
X-Received: by 2002:a05:690c:e006:10b0:797:bc43:79ac with SMTP id
 00721157ae682-797bc437ab0mr109889797b3.32.1771575862231; Fri, 20 Feb 2026
 00:24:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211081355.3028947-1-james.hilliard1@gmail.com>
 <338e6575-ec44-4179-94af-9086a7ca79ac@kernel.org> <92359c6d-06ac-4f8d-baa5-6fa45a536455@kernel.org>
 <CADvTj4q74H__JZftOiXkdsY3+E_Xmcx6Y6i70RQDJ0K09=XOHQ@mail.gmail.com>
 <30026ed7-cd19-4be2-adbb-e8bb155a75b8@kernel.org> <CADvTj4oBtO0Yhib1rE8QQwgtJvy-x_hK46C63mjVAydtxHOV8g@mail.gmail.com>
 <20260212195423.GA787785-robh@kernel.org> <CADvTj4rPq8D5piqEijCdAjkWmZtq3Bi_Kxv-4F0aU4xi_O5WKg@mail.gmail.com>
 <CAMuHMdXmMVgPJv=HhkfttiRnSwFC6c2PnFjYwmL2hu3ikv+t3g@mail.gmail.com>
 <CADvTj4r95E2rLA0ZhOYPeFYpFbj0EXfb=omCN2Mab-Dj4T-cYA@mail.gmail.com>
 <CAMuHMdXTg8w3R1BVq3JO2z=gvTdB=qXY=aXvC7Lb8FtkEqz9ow@mail.gmail.com>
 <CAD++jLmp+47f-Ah4YdFJ+9dU0OFrnQdOcVyrQ61p0-_P61eBrA@mail.gmail.com>
 <CAL_JsqJK7PwyB=NoM+uXOgQk-RT49h4emogvYAfUAbZUpnd6Vg@mail.gmail.com>
 <CAD++jLkJE0ruzPeRMuVKJbJTjHoa-fTKn8djN+0es+hpqhELFw@mail.gmail.com>
 <CADvTj4rd3jS5VAPK1wyC8wKqohZ4kAX4tAJ9CfnBk64+cqrMUw@mail.gmail.com>
 <CAL_JsqLyF71Jq2QuY9SL2RZ4OS5GAeZhVRbRfXngMjjHGob36Q@mail.gmail.com> <CADvTj4qt6ubU+9f-b8ZP5+=RPfTD9wZqOui-c08via6mHPy5yw@mail.gmail.com>
In-Reply-To: <CADvTj4qt6ubU+9f-b8ZP5+=RPfTD9wZqOui-c08via6mHPy5yw@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 20 Feb 2026 09:24:11 +0100
X-Gmail-Original-Message-ID: <CAD++jL=b3RwgB9taGe1+o-u6kM3QMzmtcx8oenxDpfPmkbC3+w@mail.gmail.com>
X-Gm-Features: AaiRm51frwShpefvOM7B4BBou8uGh5Zku9wLXVw7u0X1boX5liMmwJU3a9e_gp0
Message-ID: <CAD++jL=b3RwgB9taGe1+o-u6kM3QMzmtcx8oenxDpfPmkbC3+w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: add gpio-aggregator binding
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexander Stein <linux@ew.tq-group.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Herve Codina <herve.codina@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31938-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D01A5165A2C
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 5:57=E2=80=AFAM James Hilliard
<james.hilliard1@gmail.com> wrote:

> Yeah, I did investigate adding gpio-line-names support to gpio-map,
> but there was no clear way that I saw to actually implement it in the
> kernel. Maybe there's some way I missed however.

Check commit bd6f2fd5a1d52198468c5cdc3c2472362dff5aaa
"of: Support parsing phandle argument lists through a nexus node"

of_parse_phandle_with_args_map() in drivers/of/base.c is where
the magic happens.

This is called from drivers/gpio/gpiolib-of.c, in of_get_named_gpiod_flags(=
),
so as you see mapping doesn't really happen until you use it.
There is no way we can assign the line name on the mapping
path itself.

What we would have to do is to add code to gpiolib-of.c to scan the
whole device tree whenever a new gpiochip from a gpio-controller
node is added and look for any "gpio-map" with phandles to the provider,
and if that exist, index and parse gpio-line-names from the nexus
node to override the default (if any) that is set for the gpio controller.

Not impossible just a bit quirky.

Yours,
Linus Walleij

