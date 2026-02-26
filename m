Return-Path: <linux-gpio+bounces-32253-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AH8VNKnQoGmTmwQAu9opvQ
	(envelope-from <linux-gpio+bounces-32253-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 00:00:57 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3EC1B0B37
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 00:00:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CA56C3014FC9
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 23:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77712313523;
	Thu, 26 Feb 2026 23:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B/itnBvW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3917C218AC4
	for <linux-gpio@vger.kernel.org>; Thu, 26 Feb 2026 23:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772146855; cv=none; b=Ikqf/q1hzpEX2bpBMSks1jiNDi5tSuqmCFe6CsuzSpQsyOvOrzfkhnda4U0kR4hnQympeGfcTB/8QHrIsTf4EtkLbldb8kgGoajeoHcYkb2U4JToLlrhpqTwFhm8yBJsvUZEvCRKqSTnu/iXXvObnyoVZHcJg0zSKZB0B0oe1NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772146855; c=relaxed/simple;
	bh=8NfYHIs2u8PYfKkw4JpNbu7c/jRe8VpjpEv1ZVGuM/8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HveCTtUXGmFKjlP6q2s7Oy9Hb5MvPF9F8QGPS7Cw0ishKnXVkpmFqX4zNp1jFSTnrPnAHgqk88VMMFVqavIo3enrdxWW59X8Hmyd5wcnJnIB+nDMSfm4M8yoGE2DDDcmHQxPJb2ro1JcKAh8sJqCu6Osq6440hfUreBUJAbOSh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B/itnBvW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E625AC2BCAF
	for <linux-gpio@vger.kernel.org>; Thu, 26 Feb 2026 23:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772146854;
	bh=8NfYHIs2u8PYfKkw4JpNbu7c/jRe8VpjpEv1ZVGuM/8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=B/itnBvW2Z5XflU3hz8kop32RTtw7zbafsmciu8bA00tJbl0nsKjMYOsLjr5z/3zz
	 DmAKG1bwZ5xYkF1hfMovC4qvMJ/wWhRlNy8Az2v0vpTQLBmg2vj6OVUU0Un17UF9tO
	 14mKCu7wfADzBDM4EUDKWYm7PbVzqiFmD07+6ArArulcJEjos+okD4bvid2eUi9fAp
	 kVaD8AF0cCzHTF+SEduiypJloXtcsuERmvfsP7Z1Z2gAFSxNA9jBXle7XJMx1kdNq9
	 zR8vKlvbJ1ZijGGfkB5Hp/p2LMdECgMJdTYwaqyQPo5I45jM9kJ0eJARZhsFi+7TAo
	 /gAgBUAmpCbaQ==
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-79827d28feaso13947927b3.3
        for <linux-gpio@vger.kernel.org>; Thu, 26 Feb 2026 15:00:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWQZzEqmkIVuM/GybGASQSc3WZVzvIBu1Q7W/HuESYs6V77SOlCAhOor96pgXXQBEO2U12HgvOm6Jnc@vger.kernel.org
X-Gm-Message-State: AOJu0YxeYd/ONcH0dxa7T8iIQmOxiP9K5w4ja20jKuEEqXnI1DHji9E8
	fF+MYOtg5tyZDhN+IibjF42Igr0QBQ2DQ0MFYhuvmY8VMUwEa3sZq26TMnmDCj8I+Eedr5OwKIa
	MpsA1TKx4mka0fj+/UppzJFSkTp48CYM=
X-Received: by 2002:a05:690c:3506:b0:798:71e8:3e3c with SMTP id
 00721157ae682-798855a43eamr9121307b3.40.1772146854204; Thu, 26 Feb 2026
 15:00:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225171545.1980385-1-o.rempel@pengutronix.de> <20260225171545.1980385-4-o.rempel@pengutronix.de>
In-Reply-To: <20260225171545.1980385-4-o.rempel@pengutronix.de>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 27 Feb 2026 00:00:43 +0100
X-Gmail-Original-Message-ID: <CAD++jLnkfcgme27DbAUOKn60HJbJuBghetEqpC8dhGnuMPk=Kw@mail.gmail.com>
X-Gm-Features: AaiRm50m6oV6TlZxbQPsC6-EQt93_b_JUZykrqE8gN-rjOqdfnJE3otrxdt5BrE
Message-ID: <CAD++jLnkfcgme27DbAUOKn60HJbJuBghetEqpC8dhGnuMPk=Kw@mail.gmail.com>
Subject: Re: [PATCH v1 3/8] dt-bindings: pinctrl: add NXP MC33978/MC34978 pinctrl
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Peter Rosin <peda@axentia.se>, kernel@pengutronix.de, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-gpio@vger.kernel.org, David Jander <david@protonic.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32253-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,protonic.nl:email]
X-Rspamd-Queue-Id: 6E3EC1B0B37
X-Rspamd-Action: no action

Hi Oleksij,

thanks for your patch for this very interesting hardware!

On Wed, Feb 25, 2026 at 6:16=E2=80=AFPM Oleksij Rempel <o.rempel@pengutroni=
x.de> wrote:

> Add device tree binding documentation for the pin control and GPIO block
> of the NXP MC33978/MC34978 Multiple Switch Detection Interface (MSDI).
>
> This block manages 22 switch detection inputs (14 Switch-to-Ground,
> 8 Programmable) and acts as a GPIO controller.
>
> Additionally, it supports pin configuration for hardware-specific feature=
s
> required for long-term contact maintenance in harsh environments, such as
> adjusting the continuous/pulsed wetting current to penetrate oxide layers
> on mechanical switches.
>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

Are the hardware-specific pin configurations for oxide layer
penetration (!) and stuff excluded from these bindings? (It looks
like.)

> +++ b/Documentation/devicetree/bindings/pinctrl/nxp,mc33978-pinctrl.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/nxp,mc33978-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP MC33978/MC34978 Pinctrl/GPIO Driver
> +
> +maintainers:
> +  - David Jander <david@protonic.nl>
> +  - Oleksij Rempel <o.rempel@pengutronix.de>
> +
> +description: |
> +  Pin control and GPIO driver for the MC33978/MC34978 MSDI device.
> +
> +  Pin numbering:
> +  - Pins 0-13: SG0-SG13 (Switch-to-Ground inputs)

I don't know what a switch-to-ground input is, but I talked to an AI
about it.

It appears to be directly incorrect to use such a line without
flagging it as GPIO_ACTIVE_LOW in the consumer so this should
be mentioned here, GPIO lines 0-13 *must* be flagged
GPIO_ACTIVE_LOW. (I don't know a good way to enforce it
in schema, sadly, maybe Conor has ideas.)

> +  - Pins 14-21: SP0-SP7 (Programmable inputs, can be SG or SB)

What is SB now? Please explain :)

Other than that it looks good to me!

Yours,
Linus Walleij

