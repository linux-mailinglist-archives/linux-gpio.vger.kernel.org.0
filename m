Return-Path: <linux-gpio+bounces-35688-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJ/9I2aN8GkuUwEAu9opvQ
	(envelope-from <linux-gpio+bounces-35688-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 12:35:18 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EEC482B81
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 12:35:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ECF2B3018C27
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 10:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0487A3EDADB;
	Tue, 28 Apr 2026 10:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IadyuzCc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CFA225A38
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 10:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777372475; cv=none; b=Bc4wanWghxCwGbh0peJcJLatPu+9GNsvLiRibk2OHAHUsNBgtybQHkifwGfJHI8U/PCgdufUjBQKlC0LLeSvWYzgLGMJYI8A73jEnz98agAB0CdiD3S4erAi3zJ5nSZhcLd0Is3qb3j/0ntSRYHVT2mfNol84W88RgJWK70gDF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777372475; c=relaxed/simple;
	bh=gfkP8u/is+YdXUFtrO/ofQ1MfyxFL2J12FWjzi6PQRE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E/L2dCfXWTcGu+4DKgpVihu6jQr5f3NibSgJtqx0HEbGybjFi1xJ5YpZOoyy9fdBe26oHDcArZff2mXSVyPjJmMLo2zWAr3ni/OaIwwNxam2Uv18wglM7aRk6gQF2iTzaqa96ybmX0vLL9WC21JU4a2b47S+SXItpQ/PHvnYNqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IadyuzCc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D846C2BCB9
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 10:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777372475;
	bh=gfkP8u/is+YdXUFtrO/ofQ1MfyxFL2J12FWjzi6PQRE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IadyuzCcEFJRKbK1/nNcNjLcPqQVstV9hLpn7AAkd6qYTkJFJMlogQgOEPeqrgWck
	 Fqg96jElAD2FXMXcsqG6d7vqpIZPq3iaC5FuOnHEr6VCoRgmVruv1z+h0f15AG+tow
	 NgjExlmnunaOXmqQwSacVbgwUorzt+VgqfTNKiaptnQNEbzSuzZXuK3L55ZD0zHQNB
	 oLajaIuOvF4zywmbGTpjgt/SV7Jwq6vDERMdqH3QRbFcfnO4q+3nneqnVvLUph7voD
	 lKpO9RZCIwNMgijsqVAQPywrc8VANaQbJJJHunh6wBFfWfFYZ2nGxrb8TAAudzVEbs
	 mP/AmRSUBQ6uQ==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-392445f11c5so4928511fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 03:34:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9e5DkagcTDMw/aWKIvHOPFXYmkvLGyATiYDwV4A/2892BlCkiM5aTC94e+sMuR9S+L/08Zn1hWPSYO@vger.kernel.org
X-Gm-Message-State: AOJu0YyxDxCFL6XCG+HXtWXz8TnbaO1bYFg2ZCj5DSXKGeCwaiqp+tiB
	ntwTUEedAKsSJdqkmV6fBF0YeBppVmy9YXD/tLLbwkShU8+CCArUtacTsfvm89OUkj+/dwJCEA6
	L3Gc/VNj7kzCBRQV/EhhcMFuxNQIU6zQ=
X-Received: by 2002:a05:651c:4406:10b0:38e:8aff:b657 with SMTP id
 38308e7fff4ca-392403e0b2cmr6629161fa.22.1777372474178; Tue, 28 Apr 2026
 03:34:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260424111330.702272-1-changhuang.liang@starfivetech.com> <20260424111330.702272-2-changhuang.liang@starfivetech.com>
In-Reply-To: <20260424111330.702272-2-changhuang.liang@starfivetech.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 28 Apr 2026 12:34:22 +0200
X-Gmail-Original-Message-ID: <CAD++jLkJZ3R9H1jmB0xS90w7AiboxmUkrVf0q3kb9Os=QEVe9w@mail.gmail.com>
X-Gm-Features: AVHnY4JRDyRgCHQroy6EcXp3lxK1Vk4EH6R59HQQOsESeJNnC-Dck6eQQIL6w6Q
Message-ID: <CAD++jLkJZ3R9H1jmB0xS90w7AiboxmUkrVf0q3kb9Os=QEVe9w@mail.gmail.com>
Subject: Re: [PATCH v1 01/20] dt-bindings: pinctrl: Add starfive,jhb100-sys0-pinctrl
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley <pjw@kernel.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: E4EEC482B81
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35688-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,starfivetech.com:email]

Hi Changhuang,

thanks for your patch!

On Fri, Apr 24, 2026 at 1:13=E2=80=AFPM Changhuang Liang
<changhuang.liang@starfivetech.com> wrote:

> Add pinctrl bindings for StarFive JHB100 SoC System-0(sys0) pinctrl
> controller.
>
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
(...)
> +        properties:
> +          pinmux:
> +            description: |
> +              The list of GPIOs and their function select.
> +              The PINMUX macros are used to configure the
> +              function selection.
> +
> +          bias-disable: true
> +
> +          bias-pull-up:
> +            type: boolean
> +
> +          bias-pull-down:
> +            type: boolean
> +
> +          drive-strength:
> +            enum: [ 2, 4, 8, 12 ]
> +
> +          drive-strength-microamp:
> +            enum: [ 2000, 4000, 8000, 12000 ]
> +
> +          input-enable: true
> +
> +          input-disable: true
> +
> +          input-schmitt-enable: true
> +
> +          input-schmitt-disable: true
> +
> +          slew-rate:
> +            enum: [ 0, 1 ]
> +            default: 0
> +            description: |
> +                0: slow (half frequency)
> +                1: fast
> +
> +          starfive,debounce-width:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            default: 0
> +            description:
> +              Debounce width 0 =3D Disabled, Others =3D 80ns*N stages

The argument to the existing
input-debounce is expressed in microseconds. Just recalculate
that value to your "width"? If you need more granularity add a
generic property input-debound-nanoseconds =3D <...>;

The code you submitted contains these undocumented properties,
copied from the driver review:

> +static const struct pinconf_generic_params jhb100_custom_bindings[] =3D =
{
> +       { "starfive,gmac-vsel", STARFIVE_PIN_CONFIG_GMAC_VSEL, 0 },

Can't you use the existing "power-source" instead? It's fine if it's only
applicable to a few pins. This is overly specific.

> +       { "starfive,drive-i2c-fast-mode", STARFIVE_PIN_DRIVE_I2C_FAST_MOD=
E, 0 },
> +       { "starfive,drive-i2c-fast-mode-plus", STARFIVE_PIN_DRIVE_I2C_FAS=
T_MODE_PLUS, 0 },

It's not special that things are for i2c. Use the generic
slew-rate for these two, it describes how fast something is.

> +       { "starfive,i2c-open-drain-pull-up-ohm", STARFIVE_PIN_OPEN_DRAIN_=
PULLUP_SELECT, 0 },

Use the existing drive-open-drain; with the existing bias-pull-up =3D <ohms=
>;
two properties. No need to be fancy and create a new property for this.

> +       { "starfive,vga-rte", STARFIVE_PIN_VGA_RTE_SELECT, 0 },

No idea what this is...

Yours,
Linus Walleij

