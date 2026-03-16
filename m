Return-Path: <linux-gpio+bounces-33458-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iML8IVfHt2kRVQEAu9opvQ
	(envelope-from <linux-gpio+bounces-33458-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:03:19 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C942969C8
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:03:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 36D89303A8CA
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 08:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CF9138237E;
	Mon, 16 Mar 2026 08:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fc5XQgJB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F940382362
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 08:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773651595; cv=none; b=WC+Bce65psre747SRsu9WiOSUDmyorMUsluXSrn+8dyOvdT8bhH4By3pCd1QWElF5rFDI2e5LqguB9nwmCrYOL4WRxsp2bV/lVqvnZLNIS0bM3M+1CMO+QTqxnTQAiNdDbJE4cXmSRmmH2UyJeQem0OMu8T+HKm3cri0+vP6a3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773651595; c=relaxed/simple;
	bh=XGYPbAKoOAYk8j1GmSPwvsVkBF2sd4JzgK3hjvlcvfk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RtNY60WQlORSXtlktEs5qxtstNwCVRGjKYDAm5wBBQLEmwk6qt9V0Y6oFpjXVoFKzpDZDrag9IWFRFXlFg58Vxvh+TIRrAjvnbrN4kGeu76hT18jq5o2ZHmSVyPFCo8VVtpTUGIYmZFVWbNWfsvwNt64Tut2gH1D6Zece5/M8pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fc5XQgJB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8CB2C4AF09
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 08:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773651594;
	bh=XGYPbAKoOAYk8j1GmSPwvsVkBF2sd4JzgK3hjvlcvfk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Fc5XQgJBT+a69JFbjmBZwFWModrymKlT281DpVYTSLWmus2ZpSMhIFfGQBqAd29aA
	 83HDxYS9hPo1RepcCmIK0oWTlhQyNfky1evUcvBsNu21tBCtSvOEB9IyuaudxZ4qZL
	 658aErTMbUZFaADvaM0RnKscpeqM/xw3XM6xw7GIG8Sq6svxHN7eHhAUxL1zUboD/2
	 tfRjRcMi4XByBdaVZly0tEKEjhePc4DygmjvrYGXpYHfb2OjlZzpYb7MjIo17PHjwt
	 8Xa9syAhmMdP0L5fmOwhUTjngIFPSckxzyzrvzHtWygXEg28nwNMpYc4Mvt5KgPLGe
	 Jv8CMAnLG6rew==
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7927261a3acso33778777b3.0
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 01:59:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUrRwmS6E4LkCqZDBuOpy7nFx05dsPHwE6Uur+19cTnMzGA+4nRByyjjMuLviWIJcz/HqdYGyhhmlS+@vger.kernel.org
X-Gm-Message-State: AOJu0YwFa+TaUEbQwQUN8aDuRxCt4a+lQwjatxd69CcpVdx6PFKTWW83
	JxB5RvDro+NLCAoe6yC0+0Eo1Kkvk3T8k7ZSyE3Oeu5JLru3Go3p2xhnsmJAWG992tvl37n4Ujv
	GLNClbRfKoqpGLZULf4wV/aAYyqxjKpM=
X-Received: by 2002:a05:690c:c50d:b0:79a:56bc:245e with SMTP id
 00721157ae682-79a56bc2985mr8612647b3.47.1773651594351; Mon, 16 Mar 2026
 01:59:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313000652.11470-1-andre.przywara@arm.com>
In-Reply-To: <20260313000652.11470-1-andre.przywara@arm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 16 Mar 2026 09:59:43 +0100
X-Gmail-Original-Message-ID: <CAD++jLn4ajnpayksmACb4FnVk3w0wWjAM9v1-38t=u7CO_635g@mail.gmail.com>
X-Gm-Features: AaiRm53PU0xHt5zB-ZEU9Kf0xC08hXJHn1dpSbPL24Ikh8j0snhsU4LhqVRGjAY
Message-ID: <CAD++jLn4ajnpayksmACb4FnVk3w0wWjAM9v1-38t=u7CO_635g@mail.gmail.com>
Subject: Re: [RFC PATCH] pinctrl: sunxi: convert to GPIO_GENERIC
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,sholland.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-33458-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arm.com:email]
X-Rspamd-Queue-Id: 11C942969C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 1:08=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:

> Allwinner SoCs combine pinmuxing and GPIO control in one device/MMIO
> register frame. So far we were instantiating one GPIO chip per pinctrl
> device, which covers multiple banks of up to 32 GPIO pins per bank. The
> GPIO numbers were set to match the absolute pin numbers, even across the
> typically two instances of the pinctrl device.
>
> Convert the GPIO part of the sunxi pinctrl over to use the gpio_generic
> framework. This alone allows to remove some sunxi specific code, which
> is replaced with the existing generic code. This will become even more
> useful with the upcoming A733 support, which adds set and clear
> registers for the output.
> As a side effect this also changes the GPIO device and number
> allocation: Each bank is now represented by its own gpio_chip, with only
> as many pins as there are actually implemented. The numbering is left up
> to the kernel (.base =3D -1).
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

You could add that this makes the driver benefit of the
.get/set_multiple() accelerated implementations of the generic
GPIO MMIO driver as well.

> +static int sunxi_gpio_add_bank(struct sunxi_pinctrl *pctl, int index)
> +{
> +       char bank_name =3D 'A' + index + pctl->desc->pin_base / PINS_PER_=
BANK;
> +       struct sunxi_gpio_bank *bank =3D &pctl->banks[index];
> +       struct gpio_generic_chip_config config;
> +       struct gpio_chip *gc =3D &bank->chip.gc;
> +       int ngpio, ret;
> +
> +       ngpio =3D sunxi_num_pins_of_bank(pctl, index);
> +       bank->pctl =3D pctl;
> +       bank->base =3D pctl->membase + index * pctl->bank_mem_size;
> +       if (!ngpio) {
> +               gc->owner =3D THIS_MODULE;
> +               gc->ngpio =3D 0;
> +               gc->base =3D -1;
> +               gc->of_gpio_n_cells =3D 3;
> +
> +               return 0;
> +       }

Add some comment about what is going on here, I suspect you
are flagging the gpio_chip as unused, you could just not assign
anything I think?

> +       config =3D (struct gpio_generic_chip_config) {
> +               .dev =3D pctl->dev,
> +               .sz =3D 4,
> +               .dat =3D bank->base + DATA_REGS_OFFSET,
> +               .set =3D bank->base + DATA_REGS_OFFSET,
> +               .clr =3D NULL,
> +               .flags =3D GPIO_GENERIC_READ_OUTPUT_REG_SET |
> +                        GPIO_GENERIC_PINCTRL_BACKEND,
> +       };
> +
> +       ret =3D gpio_generic_chip_init(&bank->chip, &config);
> +       if (ret)
> +               return dev_err_probe(pctl->dev, ret,
> +                                    "failed to init generic gpio chip\n"=
);
> +
> +       gc->owner               =3D THIS_MODULE;
> +       gc->label               =3D devm_kasprintf(pctl->dev, GFP_KERNEL,
> +                                                "%s-P%c", gc->label,
> +                                                bank_name);
> +       gc->ngpio               =3D ngpio;
> +       gc->base                =3D -1;
> +       gc->of_gpio_n_cells     =3D 3;

Nice use of the three-cell GPIO OF parser!

Overall this is a nice change and makes the kernel a
better place. I would apply a non-RFC version as soon
as we can agree on the path forward.

Yours,
Linus Walleij

