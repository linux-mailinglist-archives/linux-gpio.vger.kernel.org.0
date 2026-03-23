Return-Path: <linux-gpio+bounces-34046-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MS6Egx+wWknTgQAu9opvQ
	(envelope-from <linux-gpio+bounces-34046-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 18:53:16 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AAC2FA8CC
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 18:53:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 048C3302D765
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 17:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A18173CFF6F;
	Mon, 23 Mar 2026 17:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hDSLPzY0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572193CFF40
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 17:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774287681; cv=none; b=sJIouCdUE0pG7OyVoIvVkSX26nuqqHL6OwQxagqziXuKaTNpTb/bWq5gGYg3FJrHXEMM+stBK/URHnH0kJMLvxiArZes7NCq0rSsCjYAiiTtEuKfwqLoh64NoB+6ZSgJylayJbm6g/Z3gRUtGRCphCkeutg42TsXZ/7xEkxjSWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774287681; c=relaxed/simple;
	bh=US9GCCid6v4HyHFoqm7MLXZb7skaUYoLT9/2dzLkQRo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hOLxlO9LnizbYtScAn1EiOZmdhK9QCROyt7Rel0eNwHLBzn/6WY1AmLdJg00jwjgjc8ftN0NWJ2s7v+UiadbHoJZegsvQcS2+6YWolsmmQsSXPsnzCZOvV0KvtxnnZl4/R9xQt9IkUZTH2QjFRrkbgDdhgsOp1dwtgRMre4qjTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hDSLPzY0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 101E6C2BCB5
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 17:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774287681;
	bh=US9GCCid6v4HyHFoqm7MLXZb7skaUYoLT9/2dzLkQRo=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=hDSLPzY0DC6l8WFdmVCPTHtrEhKtxUPN1Rv5keg02z/JXG7r0c2G70yu+iYPUh81m
	 mKOh4NV9eFxKPnIzEsUeYkVydCVE+2bCThQYBes8JGxjnHbB++XZkMuTJIgNP9qP5c
	 mQZ/JajVtmK/U2+6ZCfm5+MeOJ9EZFp6HoUA9wvsgJker/Cogl7DXLT8UvaIh86SkO
	 uIel90J8nsTld2Y4Pvv1tb3IH2bN2Ug5r/c3G3kGseFaMFG4HnPOQjdHO41Cd4dXEe
	 SxC+S6BSQL827BnuUl8uaFMUzCMFg0kIf8NyA1VxXf0XojNs8G1QYq7URqy8Sp3t3o
	 OKd7KWUr6XSFA==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38bcda08c76so28607321fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 10:41:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU9rMPzTNThcJEkuFDcKR4gsAiCzgbtSahMUgzY+wuvrSUpruvltZJmswhBNCMA5Vh+TC+MRpEatEG9@vger.kernel.org
X-Gm-Message-State: AOJu0YyRawmjQDLc9VGrJIw4EvMumEgywSfN7D6rbGNpm+zPDCZhem2G
	mBBwTh9OJ4kRgAYHD5LfUqmpjyMbvSL5+m0Wcw779lbY7TjZOUxORFUYZz2amU/DngOu6MbZsFu
	imS+9rKNCoHiSWCygylCdFVjB4Jv/j1A=
X-Received: by 2002:a2e:8a96:0:b0:37c:cf34:536c with SMTP id
 38308e7fff4ca-38bf95e8ad2mr42901711fa.3.1774287679365; Mon, 23 Mar 2026
 10:41:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323110151.2352832-1-andre.przywara@arm.com> <20260323110151.2352832-6-andre.przywara@arm.com>
In-Reply-To: <20260323110151.2352832-6-andre.przywara@arm.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 24 Mar 2026 01:41:06 +0800
X-Gmail-Original-Message-ID: <CAGb2v648WLXK9KjXcCRKy_mQGMkn8mhxKHSukh-WC4i=sXZGbg@mail.gmail.com>
X-Gm-Features: AQROBzCqD4rc3G7BUhX053yGDoWgA9I1BieDaebJcNf25nsrRp_pPWGt7aUxUjc
Message-ID: <CAGb2v648WLXK9KjXcCRKy_mQGMkn8mhxKHSukh-WC4i=sXZGbg@mail.gmail.com>
Subject: Re: [PATCH 5/5] pinctrl: sunxi: a523: add missing IRQ bank (plus old
 DT workaround)
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michal Piekos <michal.piekos@mmpsystems.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34046-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,sholland.org,mmpsystems.pl,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,linux-gpio@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	HAS_REPLYTO(0.00)[wens@kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,arm.com:email]
X-Rspamd-Queue-Id: E4AAC2FA8CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 7:02=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> The Allwinner A532 SoC implements 10 GPIO banks, each of which is
> interrupt capable. However the first bank (PortA) is skipped, so the
> indicies of those banks range from 1 to 10, not 0 to 9.
> We described the skipped bank correctly, but missed that for the IRQ
> banks, where we rely on the IRQ bank index to be aligned with the MMIO
> register offset, starting at 0x200.
>
> Correct that by increasing the number of IRQ banks to 11, to cover both
> the first skipped one, but also the last one (PortK). This fixes a bug
> where the interrupt numbers would be off-by-one, due to that
> mis-enumeration.
> The big caveat is that now old DTs break the kernel, since they only
> provide 10 interrupts, and the driver bails out entirely due to the last
> missing one. So add a workaround for this particular case, where we
> detect the requirement for 11 banks, but only 10 interrupts provided,
> and continue with 10 IRQs, albeit emitting a warning about a DT update.
> This would still be broken in terms of interrupt assignment, but it was
> broken the whole time before, so it's not a regression.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c |  2 +-
>  drivers/pinctrl/sunxi/pinctrl-sunxi.c       | 22 +++++++++++++--------
>  2 files changed, 15 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c b/drivers/pinctr=
l/sunxi/pinctrl-sun55i-a523.c
> index b6f78f1f30ac..a1d157de53d2 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
> @@ -17,7 +17,7 @@ static const u8 a523_nr_bank_pins[SUNXI_PINCTRL_MAX_BAN=
KS] =3D
>  /*       PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
>         {  0, 15, 17, 24, 16,  7, 15, 20, 17, 28, 24 };
>
> -static const unsigned int a523_irq_bank_map[] =3D { 0, 1, 2, 3, 4, 5, 6,=
 7, 8, 9 };
> +static const unsigned int a523_irq_bank_map[] =3D { 0, 1, 2, 3, 4, 5, 6,=
 7, 8, 9, 10 };

Actually you don't even need this, since this is a linear mapping.

From sunxi_irq_hw_bank_num():

    if (!desc->irq_bank_map)
            return bank;
    else
            return desc->irq_bank_map[bank];

>  static const u8 a523_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =3D
>  /*       PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunx=
i/pinctrl-sunxi.c
> index 6a86b7989b25..ffee79397590 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -19,6 +19,7 @@
>  #include <linux/irqdomain.h>
>  #include <linux/of.h>
>  #include <linux/of_clk.h>
> +#include <linux/of_irq.h>
>  #include <linux/platform_device.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/slab.h>
> @@ -1582,6 +1583,7 @@ int sunxi_pinctrl_init_with_flags(struct platform_d=
evice *pdev,
>         struct sunxi_pinctrl *pctl;
>         struct pinmux_ops *pmxops;
>         int i, ret, last_pin, pin_idx;
> +       int num_irq_banks;
>         struct clk *clk;
>
>         pctl =3D devm_kzalloc(&pdev->dev, sizeof(*pctl), GFP_KERNEL);
> @@ -1715,16 +1717,20 @@ int sunxi_pinctrl_init_with_flags(struct platform=
_device *pdev,
>                 goto gpiochip_error;
>         }
>
> -       pctl->irq =3D devm_kcalloc(&pdev->dev,
> -                                pctl->desc->irq_banks,
> -                                sizeof(*pctl->irq),
> -                                GFP_KERNEL);
> +       num_irq_banks =3D pctl->desc->irq_banks;
> +       /* Workaround for old A523 DT, exposing one less interrupt. */
> +       if (num_irq_banks =3D=3D 11 && of_irq_count(node) < 11) {
> +               num_irq_banks =3D 10;
> +               pr_warn("Not enough PIO interrupts, please update your DT=
!\n");
> +       }

I would probably make the check universal, and also use dev_warn().

    num_irq_banks =3D of_irq_count(node);
    if (num_irq_banks !=3D pctrl->desc->irq_banks) {
        dev_warn(&pdev->dev, "Incorrect number of PIO interrupts,
please update your DT!\n");
        num_irq_banks =3D min(num_irq_banks, pctrl->desc->irq_banks);
    }

Otherwise,

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>


> +       pctl->irq =3D devm_kcalloc(&pdev->dev, num_irq_banks,
> +                                sizeof(*pctl->irq), GFP_KERNEL);
>         if (!pctl->irq) {
>                 ret =3D -ENOMEM;
>                 goto gpiochip_error;
>         }
>
> -       for (i =3D 0; i < pctl->desc->irq_banks; i++) {
> +       for (i =3D 0; i < num_irq_banks; i++) {
>                 pctl->irq[i] =3D platform_get_irq(pdev, i);
>                 if (pctl->irq[i] < 0) {
>                         ret =3D pctl->irq[i];
> @@ -1733,7 +1739,7 @@ int sunxi_pinctrl_init_with_flags(struct platform_d=
evice *pdev,
>         }
>
>         pctl->domain =3D irq_domain_create_linear(dev_fwnode(&pdev->dev),
> -                                               pctl->desc->irq_banks * I=
RQ_PER_BANK,
> +                                               num_irq_banks * IRQ_PER_B=
ANK,
>                                                 &sunxi_pinctrl_irq_domain=
_ops, pctl);
>         if (!pctl->domain) {
>                 dev_err(&pdev->dev, "Couldn't register IRQ domain\n");
> @@ -1741,7 +1747,7 @@ int sunxi_pinctrl_init_with_flags(struct platform_d=
evice *pdev,
>                 goto gpiochip_error;
>         }
>
> -       for (i =3D 0; i < (pctl->desc->irq_banks * IRQ_PER_BANK); i++) {
> +       for (i =3D 0; i < (num_irq_banks * IRQ_PER_BANK); i++) {
>                 int irqno =3D irq_create_mapping(pctl->domain, i);
>
>                 irq_set_lockdep_class(irqno, &sunxi_pinctrl_irq_lock_clas=
s,
> @@ -1751,7 +1757,7 @@ int sunxi_pinctrl_init_with_flags(struct platform_d=
evice *pdev,
>                 irq_set_chip_data(irqno, pctl);
>         }
>
> -       for (i =3D 0; i < pctl->desc->irq_banks; i++) {
> +       for (i =3D 0; i < num_irq_banks; i++) {
>                 /* Mask and clear all IRQs before registering a handler *=
/
>                 writel(0, pctl->membase +
>                           sunxi_irq_ctrl_reg_from_bank(pctl->desc, i));
> --
> 2.43.0
>
>

