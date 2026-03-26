Return-Path: <linux-gpio+bounces-34205-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OO3mJcwZxWnr6QQAu9opvQ
	(envelope-from <linux-gpio+bounces-34205-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 12:34:36 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8097E334962
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 12:34:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DA92E3040D51
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 11:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 681C93E51C9;
	Thu, 26 Mar 2026 11:30:52 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984693DD523
	for <linux-gpio@vger.kernel.org>; Thu, 26 Mar 2026 11:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774524651; cv=none; b=F7LUAVDerkDTJApzQi/Zwpe+Knt7jFFIaGCU3hbYc9kOZ9GloCOALevdvn3SPFKdVCnE3ie/ElKF0GoG1lMnlWd+JkddVcDc6ewkMR/l5B9zEIwvwmPdQA05Zj+JXRnwiL44BS4gRvLpj1rCv2WpNqzXBhkqEd1JWfwR8oe12yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774524651; c=relaxed/simple;
	bh=odmcbAvqK0vOqDQP/nWAmuzHOBKhpU4i+9caAtg5EmA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OXg6zMDtU+hpCJr6a4ssRM+vv8wtkObD4BuVYUsWbH41TTFx8w3B2+ayP3Xy7Rv3KqaZDKvF9ZCYoCx+TkhbvTmb4mV6Et9eixMHsmA66rFoJFTD5KYhrODdNvYn+DmWPQ2l0/TcDDSXtSKk8sgUFxmf+4Xe/t2lMv41nVIYieo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56b8804f37cso422745e0c.3
        for <linux-gpio@vger.kernel.org>; Thu, 26 Mar 2026 04:30:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774524648; x=1775129448;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NPXrf/dFqxXiTE7eESLhISzL+tSi36TOUFQjk/UIol8=;
        b=XJsMWgS0acvoCYMYnfBhjZ5wgdxVvmwRVmxE7VQa8BJqgTv7ULnzEKLE67eqznABlr
         aD0Tf0M54Jz/NfoiCWwYAJ53rwNbzGcbEIcMhP8eMW7vE6g35jryPpXqnM8rsWcPOzg+
         2UsEea5tpjTtAFNLIoH/sLcIBRjLuAZ2No+1GMVnGRQgPvUWfzAANtySJh9zDCFdnoZD
         8um9WqbOvuG1JsP1B2Rrtmf1cKQRpZl1v9W9r9f/rctDEJynz5qvTdlpwP2tLJUJ7Iog
         APfVifPPQTvCkLd5zg4tR9g7/2zl5yaYILUOt9lK0gULobb/fCH+xGNtyf7+t9q3Q0I7
         jYgA==
X-Forwarded-Encrypted: i=1; AJvYcCXn2DAOm9emU49GBViTjYQajDIskSnfmJr7a2lVhGwpU/0MHIvbVBGJdF31eh4U2K55+dFrY3BVts11@vger.kernel.org
X-Gm-Message-State: AOJu0YxyYzqCmZ4dqZsjdDTXGrfH8WV1f6IFDdVYsQHUG80e1WSXQvEV
	jX17I8DnetFtUtQK14cbMb+o9eNn6MulR1MyZdt3QpxZ9O7D58ucc5Lk1bBkfFcPyUM=
X-Gm-Gg: ATEYQzwd3S9RuE0jhJN1rDyVa2Hmx2lmm/cPJimjisi4y59b41qdaon+CzcvyLMBr3p
	F9J9yhBtJXQa41WpgJhQCi2oCmzoWmoJIABteSk1W4+TU22vF/xLnz/5/ck4/PKg8tgE5ArW7e5
	NM7/QIv81lUNVYe/WmiaMh52DcYISWVQfB6iUjsDwWjbxjQTpz1smft2wIBLJPjVQWVzB8YPFag
	ibIf6/xx9x9Z2CcQSZOPMxXbZjm5/OONckENJvqS6XrPAVpqcTMtNLW2/HuP/7vSnxByiJrW0/o
	iE5QGUp7DgiuYCQXO0rIqkdwwH7hogTje8eeK5dZ4FWYsxTPK/lmjbDa8lfhRviqd+gk0qbm7jV
	7wPClrsl4bCbtMWHthfk9fekwyJ4DaesgttloNEM2jP6wY0uBQdcHzdAGsjVNKIjaOIhdmO+8QN
	+ZMdQJDjDQzhdopCtrzQ6kBCMOgaK1C/yhZ8Gkb5NKKDxWokogtilwhQ154Qn9y2gv5yyTufa/T
	rs=
X-Received: by 2002:a05:6122:8289:b0:56c:ca38:ebeb with SMTP id 71dfb90a1353d-56d21f2375dmr3421332e0c.2.1774524648142;
        Thu, 26 Mar 2026 04:30:48 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d31da7eddsm4141020e0c.18.2026.03.26.04.30.46
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 04:30:46 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56b8804f37cso422734e0c.3
        for <linux-gpio@vger.kernel.org>; Thu, 26 Mar 2026 04:30:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVkb5/XlgOamWttfHK1VmV37De/iuFerh4Z/c2yELB8PXCgefgkUxTBEQqphWNJ3kxUlUCwtPb6w0Yd@vger.kernel.org
X-Received: by 2002:a05:6123:4c:b0:56a:f542:78fb with SMTP id
 71dfb90a1353d-56d21f80b13mr3497906e0c.7.1774524646190; Thu, 26 Mar 2026
 04:30:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260325182849.84660-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260325182849.84660-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 12:30:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW5jiR5CqV0xhxio4vtV_bPczO5u1Da86CWJO+=6WU4+Q@mail.gmail.com>
X-Gm-Features: AQROBzCSesQ1Gk9HBRRwU2IRgiI5K96hhm2cR4dgKIMFaNKm8dS0uOXZPcMlwPo
Message-ID: <CAMuHMdW5jiR5CqV0xhxio4vtV_bPczO5u1Da86CWJO+=6WU4+Q@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: renesas: rzg2l: Fix save/restore of
 {IOLH,IEN,PUPD,SMT} registers
To: Biju <biju.das.au@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34205-lists,linux-gpio=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,mail.gmail.com:mid,linux-m68k.org:email]
X-Rspamd-Queue-Id: 8097E334962
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

On Wed, 25 Mar 2026 at 19:28, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> The rzg2l_pinctrl_pm_setup_regs() handles save/restore of
> {IOLH,IEN,PUPD,SMT} registers during s2ram, but only for ports where all
> pins share the same pincfg. Extend the code to also support ports with
> variable pincfg per pin, so that {IOLH,IEN,PUPD,SMT} registers are
> correctly saved and restored for all pins.
>
> Fixes: 254203f9a94c ("pinctrl: renesas: rzg2l: Add suspend/resume support")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for the update!

> ---
> v1->v2:
>  * Updated commit description
>  * Improved the logic.

You also fixed the double application of the pin_off index, right?

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -3001,9 +3001,12 @@ static void rzg2l_pinctrl_pm_setup_regs(struct rzg2l_pinctrl *pctrl, bool suspen
>  {
>         u32 nports = pctrl->data->n_port_pins / RZG2L_PINS_PER_PORT;
>         struct rzg2l_pinctrl_reg_cache *cache = pctrl->cache;
> +       u32 pin_off = 0;
>
> -       for (u32 port = 0; port < nports; port++) {
> +       for (u32 port = 0; port < nports; port++, pin_off += RZG2L_PINS_PER_PORT) {
> +               const struct pinctrl_pin_desc *pin_desc = &pctrl->desc.pins[pin_off];

Here you index pctrl->desc.pins[]...

>                 bool has_iolh, has_ien, has_pupd, has_smt;
> +               u64 *pin_data = pin_desc->drv_data;

Here you get pin_data, so below you will actually index
pctrl->desc.pins[pin_off].drv_data[].  That is not only confusing,
but also only works because pctrl->desc.pins[i].drv_data is initialized
in rzg2l_pinctrl_register() like:

    pins[i].drv_data = &pin_data[i];

All these new variables (incl. pin_off) are only used inside the new
if () below, so please confine everything to that block.

>                 u32 off, caps;
>                 u8 pincnt;
>                 u64 cfg;
> @@ -3012,6 +3015,11 @@ static void rzg2l_pinctrl_pm_setup_regs(struct rzg2l_pinctrl *pctrl, bool suspen
>                 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(cfg);
>                 pincnt = hweight8(FIELD_GET(PIN_CFG_PIN_MAP_MASK, cfg));
>
> +               if (cfg & RZG2L_VARIABLE_CFG) {
> +                       for (unsigned int i = 1; i < RZG2L_PINS_PER_PORT; i++)

Shouldn't the loop start at zero? The PIN_CFG_MASK part of a variable
config is always zero.

> +                               cfg |= *pin_data++;

Please use pctrl->desc.pins[pin_off + i].drv_data here.
And pin_off can be replaced by port * RZG2L_PINS_PER_PORT.

> +               }
> +
>                 caps = FIELD_GET(PIN_CFG_MASK, cfg);
>                 has_iolh = !!(caps & (PIN_CFG_IOLH_A | PIN_CFG_IOLH_B | PIN_CFG_IOLH_C));
>                 has_ien = !!(caps & PIN_CFG_IEN);

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

