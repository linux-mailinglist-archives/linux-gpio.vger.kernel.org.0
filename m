Return-Path: <linux-gpio+bounces-34265-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cEByGZFtxmmkJwUAu9opvQ
	(envelope-from <linux-gpio+bounces-34265-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 12:44:17 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D1F343AF3
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 12:44:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C64D13074ACC
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 11:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 352D2379ED2;
	Fri, 27 Mar 2026 11:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aBB5QBSP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4913793C1
	for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 11:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774611553; cv=none; b=R4GM+wAF4OpxKRaScEBjDvPXG0ipS68xC6woJAPqTu59jz5v6UZYPaEhORd3RzxWNUeyHL62XgE16MAXpK4nP+iEWn/VCADfY/g5H/5JMWC8LZQ2rbA6mq91puGS5h60yiyjK1YuD0NmFFLw6wFJgvn8buGxOP2Tp9KVgOssNqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774611553; c=relaxed/simple;
	bh=UxVql3iCinYZAEcrJtRq8tsCHQHw2MKzaZSxc+FzXBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nU6G694G2rbNO8LkbPEt+su0jYrKmaXphGOZnM0QfFIdbylCc3LAqu91vB5rDWriDE8Z1gsSskQMtMZNpN/whGgJFQdFfWhLcr8vrWVDJRNOS4NqWjLEH+WrhvN3fAPmFC4OW84Fl2Vj8Hou2H8Ej38gL28s9ZyA68ufgFjUXEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aBB5QBSP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D10D7C2BCB2
	for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 11:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774611552;
	bh=UxVql3iCinYZAEcrJtRq8tsCHQHw2MKzaZSxc+FzXBY=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=aBB5QBSPdZ8H06YVMHSfO2RDMnS704X33I/f6sHYSordXKiAogB5hyrBbhJ7pI7C3
	 XjvE+jIdsIjAqSDr22e8xQasM58LZa8avm2kYjOQkNSGhmGtRisckM4OxGow1QICIc
	 AWw4lLWhT6XF4bh08nO/5ubD12xKXlJxHKBJCrBWCsARyrc4TZ8GDMoQafDhXqo2b9
	 RsaVcB7nlBmJDuCxJLF++U2gEeMTBf9udkoulwe3y/LoB5vnCj6UCm5sxufzGoOZUr
	 apKxwYqY0Edmsx3CuADADE+DmR155OTwlFMIwIXDH5x0MxkHtG5K7cN939VIvpSRLn
	 oFBv5OZ/YKW/g==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38ad26e3992so15642041fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 04:39:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUtKLB7T9AHGWYQk/peM9+NEWvwwBb06GRZue7ekH0YF51fPo7SvfVb2ZkBvdOwB/vz/q3CJ8ZwtQrG@vger.kernel.org
X-Gm-Message-State: AOJu0YwwcS7Umw4PsMvtuoi8ezHFX8rpOXOUyR9HyP3wuAwgNuKw5AA3
	SVnQ3tXwYcMIPBK079fN4ABKpgi+DXOw3dbi7Ff43IpTtmSZRiek6TomSC6uW0Ey+TQxiRbWd+N
	OoPlPy90vvm0fWJkYciC9PMJ2k/ywPGw=
X-Received: by 2002:a2e:a548:0:b0:38a:43eb:239e with SMTP id
 38308e7fff4ca-38c73192b65mr8118231fa.13.1774611551145; Fri, 27 Mar 2026
 04:39:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327113006.3135663-1-andre.przywara@arm.com> <20260327113006.3135663-2-andre.przywara@arm.com>
In-Reply-To: <20260327113006.3135663-2-andre.przywara@arm.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 27 Mar 2026 19:38:57 +0800
X-Gmail-Original-Message-ID: <CAGb2v64A0rgiMkTCdvq-pVfzCTqWKqc=nx69B9tD7A8_E7vHUg@mail.gmail.com>
X-Gm-Features: AQROBzAQci5lIKbXtZJOPlGcamgsXHcH9oivEuLtfHtbKKkk-390QUJb7sIoYaA
Message-ID: <CAGb2v64A0rgiMkTCdvq-pVfzCTqWKqc=nx69B9tD7A8_E7vHUg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] pinctrl: sunxi: a523: Remove unneeded IRQ remuxing flag
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,sholland.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-34265-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	HAS_REPLYTO(0.00)[wens@kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 23D1F343AF3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 7:30=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> The Allwinner A10 and H3 SoCs cannot read the state of a GPIO line when
> that line is muxed for IRQ triggering (muxval 6), but only if it's
> explicitly muxed for GPIO input (muxval 0). Other SoCs do not show this
> behaviour, so we added a optional workaround, triggered by a quirk bit,
> which triggers remuxing the pin when it's configured for IRQ, while we
> need to read its value.
>
> For some reasons this quirk flag was copied over to newer SoCs, even
> though they don't show this behaviour, and the GPIO data register
> reflects the true GPIO state even with a pin muxed to IRQ trigger.
>
> Remove the unneeded quirk from the A523 family, where it's definitely
> not needed (confirmed by experiments), and where it actually breaks,
> because the workaround is not compatible with the newer generation
> pinctrl IP used in that chip.
>
> Together with a DT change this fixes GPIO IRQ operation on the A523
> family of SoCs, as for instance used for the SD card detection.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Fixes: b8a51e95b376 ("pinctrl: sunxi: Add support for the secondary A523 =
GPIO ports")

Acked-by: Chen-Yu Tsai <wens@kernel.org>

> ---
>  drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c | 1 -
>  drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c   | 1 -
>  2 files changed, 2 deletions(-)
>
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c b/drivers/pinc=
trl/sunxi/pinctrl-sun55i-a523-r.c
> index 69cd2b4ebd7d..462aa1c4a5fa 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
> @@ -26,7 +26,6 @@ static const u8 a523_r_irq_bank_muxes[SUNXI_PINCTRL_MAX=
_BANKS] =3D
>  static struct sunxi_pinctrl_desc a523_r_pinctrl_data =3D {
>         .irq_banks =3D ARRAY_SIZE(a523_r_irq_bank_map),
>         .irq_bank_map =3D a523_r_irq_bank_map,
> -       .irq_read_needs_mux =3D true,
>         .io_bias_cfg_variant =3D BIAS_VOLTAGE_PIO_POW_MODE_SEL,
>         .pin_base =3D PL_BASE,
>  };
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c b/drivers/pinctr=
l/sunxi/pinctrl-sun55i-a523.c
> index 7d2308c37d29..b6f78f1f30ac 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
> @@ -26,7 +26,6 @@ static const u8 a523_irq_bank_muxes[SUNXI_PINCTRL_MAX_B=
ANKS] =3D
>  static struct sunxi_pinctrl_desc a523_pinctrl_data =3D {
>         .irq_banks =3D ARRAY_SIZE(a523_irq_bank_map),
>         .irq_bank_map =3D a523_irq_bank_map,
> -       .irq_read_needs_mux =3D true,
>         .io_bias_cfg_variant =3D BIAS_VOLTAGE_PIO_POW_MODE_SEL,
>  };
>
> --
> 2.43.0
>

