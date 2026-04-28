Return-Path: <linux-gpio+bounces-35702-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AB53Fee78GmFXwEAu9opvQ
	(envelope-from <linux-gpio+bounces-35702-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 15:53:43 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BE748650B
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 15:53:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A25331EFED0
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 13:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06B91481A82;
	Tue, 28 Apr 2026 13:20:09 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5D348165A
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 13:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777382408; cv=none; b=IQigB0yBZDYmrc47O1afquiIXKAQoJK6jt0L7LHfQoHUn2FYqRQBvnhL5g6B9TU0JIT6abNoWo1TGiETFGfRKF3PP/BhEd+Fd89cCSq6AQjd7qMQk73o27lHIf0W6HjUp3XCNj4GYgf5i99hAseuInDnmpC6edVA3n+71NbQ7LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777382408; c=relaxed/simple;
	bh=FPAb7eFztQAdAiJh/8k58TDgQsL4LvZ8AVOE+11y1Jk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YJca2YwzC9YEiM2oVbdNIdi/J6HCuuEAw4x+rOzCBueF0fkWs/D4HeUC6TnQR2laAyx2d0QdY6iGnzYISTwxNaxmgLfx/s8d8dNH+NjI857edjpmETJwE+E8eMoRpisOuLFC2Vrc5POqYasb1B6jRYKB7qpjrp9AmrXeFbh1v4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-baebe98afa0so540527766b.3
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 06:20:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777382406; x=1777987206;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DKTOlmD1/yBlktMHm6WBqCZN7HgZX4UxFY9kLSyUAjY=;
        b=Mx4YVYnNBwVBoLiyZhlpPSXbF/p612nqaOmDwt+9S9PnZIBr282bYUUIdAaLViriVe
         paGDyznVjoVCUpJlcJGSd1E64W5xx2DcE45as9BGkZketoyUmTrEJYKxjZe6g2sMoo1P
         T4IHhUrzObsJ21C3fz9OF9BCI/+VqAoHq/Gn1ia+9odJ6IqSwMg62IObpxsOQ8wEQ1ER
         RsWm121COzoOlVK1QtcEW9yPUsTiJ3V0RYN6+cpzD46k6n8GvzOpQKrmOLfSG+03HDlO
         4nNzvJ1l7DD8Goth5QkxtuZzjINTJxm3vmhizdd9teOrcyfpbcUayHkoWgZlowMXl9il
         osOw==
X-Forwarded-Encrypted: i=1; AFNElJ8XFoNCcWI2XCUFTH38+aRhhzkpAqO/xyuFMQd0/YJLhCqpbRXzGnqlw9amQzIhAri6UDgzOYwoEUzK@vger.kernel.org
X-Gm-Message-State: AOJu0YwIRo+vWhFE42n6B/kNIXKPx8gB95DiQCpIH2Cvyec42nIqy2Fw
	5otse6GAa56JhbODOM/d0hrlC2n7pBrx0kPeBQAY8rLbA6JJHLsBRhb+YUoD5r2HOA4=
X-Gm-Gg: AeBDiesC17Kyx24k4T58I3d3MKIRUrtlsvBfCgPnH2NFtCT1xxk4MFXSHpx2yNzbH/2
	1CNDRgsh5kdFQWMW7MfAGCNo/D6oFXhOjPIEQfBVM0iafnDMfvVTYrjRbVXpKBWIQbw4/5GhZwh
	dZCjAFw8aBWNs527J8a8VMm/7mzvZOrIDjsIwGItAplGOZErvrInqQPdLUON5X3rZ4DKoeTXVac
	+vBGzS/stDtt34GU4+LwqGUsQld//adonczvJ6flOSpfkfk/Ow3MMAQN9XiS7FIz1pRj2ktB6m5
	fGitraVpwthqnHREG+TjVyx4d6Ld9yA4BdxanwsTil8Qq6qYR0i27jAt+NRTaGAlwGyPKAw6WJF
	rtqf4+KdVWKVtLysXJwmV9D7VWiVwtx7RIyNc++Lf+VSmVMFVFP5sv+LD2GfDesVBUTvzwyAAHx
	z2bwQE2NF2mKIy0OqPb4bWnS0+LDoEC0MH2u1b+EsU+2vobUCAaek5PA7kKfq5v9/D/nJ+qvE=
X-Received: by 2002:a17:906:6a1e:b0:bad:3277:623 with SMTP id a640c23a62f3a-bb804834ea8mr205540966b.41.1777382405550;
        Tue, 28 Apr 2026 06:20:05 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80c081c35sm105667766b.57.2026.04.28.06.20.02
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 06:20:04 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-676fec7e946so9541468a12.3
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 06:20:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+tO37s1ITdslBC8e6wXJKYZS/FRYn9sLV+usMXaIDO+tyBVFd/KZpMchs1rdB/3NLiYH3qJsfQMfGq@vger.kernel.org
X-Received: by 2002:a05:6402:46d5:b0:679:3604:7152 with SMTP id
 4fb4d7f45d1cf-679bb0614bcmr1319707a12.11.1777382401908; Tue, 28 Apr 2026
 06:20:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317101627.174491-1-biju.das.jz@bp.renesas.com> <20260317101627.174491-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260317101627.174491-6-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Apr 2026 15:19:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUXQNfg9fh9BEr+KYkVjFg7T9hTXEUk6ki7xxZEzDYKBQ@mail.gmail.com>
X-Gm-Features: AVHnY4JZdWFymL3Kj462clduhRgIeDNaRCdbfE_Fk-jr51VVXMeTXi-HgJjqU08
Message-ID: <CAMuHMdUXQNfg9fh9BEr+KYkVjFg7T9hTXEUk6ki7xxZEzDYKBQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/8] pinctrl: renesas: rzg2l: Add OEN support for RZ/G3L
To: Biju <biju.das.au@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: A0BE748650B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35702-lists,linux-gpio=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.970];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,linux-m68k.org:email,mail.gmail.com:mid]

Hi Biju,

On Tue, 17 Mar 2026 at 11:16, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add support for configuring the ETH_MODE register on the RZ/G3L SoC to
> enable output-enable control for specific pins. On this SoC, certain
> pins such as P{B,E}1_ISO need to support switching between input and
> output modes depending on the PHY interface mode (e.g., RMII vs RGMII).
> This functionality maps to the 'output-enable' property in the device
> tree and requires explicit control via the ETH_MODE register.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -1198,6 +1198,23 @@ static int rzg2l_write_oen(struct rzg2l_pinctrl *pctrl, unsigned int _pin, u8 oe
>         return 0;
>  }
>
> +static int rzg3l_pin_to_oen_bit(struct rzg2l_pinctrl *pctrl, unsigned int _pin)
> +{
> +       u64 *pin_data = pctrl->desc.pins[_pin].drv_data;
> +       u8 port, pin;
> +
> +       if (*pin_data & RZG2L_SINGLE_PIN)
> +               return -EINVAL;
> +
> +       pin = RZG2L_PIN_ID_TO_PIN(_pin);
> +       if (pin != pctrl->data->hwcfg->oen_max_pin)
> +               return -EINVAL;
> +
> +       port = RZG2L_PIN_ID_TO_PORT(_pin);
> +
> +       return (port == pctrl->data->hwcfg->oen_max_port) ? 1 : 0;

IMHO these oen_max_* comparisons are very obscure. For the casual
reader, it is far from obvious there are only two valid combinations.

Why not use the same logic as on RZ/G2L?

        /*
         * We can determine which Ethernet interface we're dealing with from
         * the caps.
         */
        if (caps & PIN_CFG_IO_VMC_ETH0)
                return 0;
        if (caps & PIN_CFG_IO_VMC_ETH1)
                return 1;

        return -EINVAL;

I think you can even reuse rzg2l_pin_to_oen_bit()?

> +}
> +
>  static int rzg3s_pin_to_oen_bit(struct rzg2l_pinctrl *pctrl, unsigned int _pin)
>  {
>         u64 *pin_data = pctrl->desc.pins[_pin].drv_data;

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

