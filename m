Return-Path: <linux-gpio+bounces-31109-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPfADa1/eGkFqQEAu9opvQ
	(envelope-from <linux-gpio+bounces-31109-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 10:04:45 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8EB9176C
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 10:04:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6ED6B301625F
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 09:04:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DF31332904;
	Tue, 27 Jan 2026 09:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ufUbQ9Hy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219BC3314D7
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769504682; cv=none; b=CC20uKcRGLT0xBufRc9rE4KV7ItZBA/scGw33TyHnOEUVLqMi86lLIQxCeeKfOE2ezFbUFL1Y/Ukff+0czB3VOBxwi+1rXrQz496AwmNL6wSNDC2uCB83cNTbTICJGMqTKl7xm55eQTpoBxqxQMS0+GVafaN5uWlA5kaA6z3NU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769504682; c=relaxed/simple;
	bh=Q/JJyBgIKopeUfA8NklLc4z/xE2kc091yoVhcHuiuIo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MFAcFjaT73zk62MUJa5N5QgBtUIdGnRoQhkJnOO0XLYuyLhFynwOO0kWJeErpNIfGtk7J3CKeqKg4O3PdXzCw8Zg82VTC9OPWf2GjmFVATWdTnTHK6ev5IsnGa4BNVRg9ObW+MmkJbyaQ/Dil72lV8JZurpuNGiLVlCENdLwf1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ufUbQ9Hy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0560FC2BCB1
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769504682;
	bh=Q/JJyBgIKopeUfA8NklLc4z/xE2kc091yoVhcHuiuIo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ufUbQ9HyE9EsE87owfkO7iQmRtYkLXoPiEBT3NHsT2Rhq6a5oY2SSmH/MilZ7wRmu
	 cZiuP89biRnXbL+qE5PNcamgJuJe4SWf0YC89HToYrmgOfkinWytqwUXyEkKa0YRn4
	 b/A4lzAJ+pEVKOyzYHf0SSaqgXZTMLjQYm4qg0AeMCVfKkP+RHCWKmBLmORLL/ptkm
	 eqvp4SIF1kJ8z+72eyNQVB6zDkOVPZU2bBQyqxXk5uYKp1ixNOr7hxflPGhJeTpq/b
	 +q8VQckpK1bz37ewZCiGCRL+0QKsKrtjommZQwT6quGcvJqCfITqSwPS18qgok/1VB
	 mDF5vFCVc6fNw==
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-6496804204cso2492596d50.3
        for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 01:04:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWqwXEXXnxrmEwOw6Ju5P+smoOHH6+A3OKCjsQSa27gSO9tho6Vz+vlNGPtO+9RjIdKG7ZX50U2bH5J@vger.kernel.org
X-Gm-Message-State: AOJu0YxmaPoTlQ1bsCO86hnyLtDjFhcSdOt+pkzbs9JG0AirdJcyBb84
	wARaTDeVAwIdajeyst88ZVyUgxwL5QPT+w9HR4734Mgsw15ssQNhDPktWTJnQ8YiIGViFwapkYu
	ykrqP6BBez5iuNSbyuMUqbxbX/NjpEDE=
X-Received: by 2002:a05:690e:1487:b0:644:46c8:b990 with SMTP id
 956f58d0204a3-6498fbf2026mr555083d50.32.1769504681302; Tue, 27 Jan 2026
 01:04:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260119-pinctrl_ocelot_extend_support_for_lan9645x-v1-0-1228155ed0ee@microchip.com>
In-Reply-To: <20260119-pinctrl_ocelot_extend_support_for_lan9645x-v1-0-1228155ed0ee@microchip.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Jan 2026 10:04:30 +0100
X-Gmail-Original-Message-ID: <CAD++jLnKeY8SW7Vq7N4_Y=xcKChZdqEZbB8MFfFVbYgA9+hvVA@mail.gmail.com>
X-Gm-Features: AZwV_QjyuNMsW79s55Q3evWTLf5W6h0jcSV3tYXB4lCF1T_v23wavZJQZP6M53U
Message-ID: <CAD++jLnKeY8SW7Vq7N4_Y=xcKChZdqEZbB8MFfFVbYgA9+hvVA@mail.gmail.com>
Subject: Re: [PATCH 0/3] pinctrl: ocelot: Extend pinctrl-ocelot driver for lan9645x
To: =?UTF-8?Q?Jens_Emil_Schulz_=C3=98stergaard?= <jensemil.schulzostergaard@microchip.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Lars Povlsen <lars.povlsen@microchip.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Steen Hegelund <Steen.Hegelund@microchip.com>, Daniel Machon <daniel.machon@microchip.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31109-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,microchip.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 7A8EB9176C
X-Rspamd-Action: no action

On Mon, Jan 19, 2026 at 4:07=E2=80=AFPM Jens Emil Schulz =C3=98stergaard
<jensemil.schulzostergaard@microchip.com> wrote:

> LAN9645x is a switch chip family with several on-chip peripherals, such a=
s
> a GPIO controller. The LAN9645xF subfamily has 3 SKUs with the difference
> being number of supported ports. There are 5, 7 and 9 ported SKUs.
>
> The LAN9645xF family come in a VQFN-DR package and supports 51 GPIOs, and
> up to 7 alternate modes per pin.
>
> Due to the way this GPIO controller modifies alternate modes on a pin, th=
is
> means the usual pin stride is 2, but the alternate mode stride is 3. This
> is the first device supported by pinctrl-ocelot where these two numbers
> are not equal. As a consequence the register address calculation in the
> REG_ALT macro is generalized to handle this.
>
> Signed-off-by: Jens Emil Schulz =C3=98stergaard <jensemil.schulzostergaar=
d@microchip.com>

Patch applied!

Yours,
Linus Walleij

