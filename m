Return-Path: <linux-gpio+bounces-35701-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBkFEme88Gk9YAEAu9opvQ
	(envelope-from <linux-gpio+bounces-35701-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 15:55:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DAF4865C4
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 15:55:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CAD2730C5A86
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 13:27:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C4D947DD66;
	Tue, 28 Apr 2026 13:19:29 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C0047DD5C
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 13:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777382369; cv=none; b=Docnb5TPwz9ybRmIJG88LpbcERJ8849ELnhrz1akVf2lFtZuY50RcKMRQrZcmvUUBqCESqMJx5ug1puI5Nop6ra/w4stnTJJ7R1aEXImbRydXrzL7KldgC4+xMilxcOk6AM9KvCrw36m0K7t+mI8bTmlbG6bSlWLWMC3BtTjWiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777382369; c=relaxed/simple;
	bh=/E3XKoT0w+vQTJbgWHyNtXapROKYDf+fSxEynSNAbZY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mWnZLRExPKqxfuskuWOnCDygFlumNmWBGjOfdS6YLfPQSeIMJ5dYicA4CzXnd2EEYmraomvgWVnec5GIuW3Nk7xHcJpfHApJeRvDwyFaN3w5hPk8k6vu9wadFGi9WJl7OmjoZmta5jrLygjMzopnI6e+cE7WP58LWhBnfNrfkU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ba8472c1613so1637204366b.0
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 06:19:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777382366; x=1777987166;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xOrCyBOHZnjD++HpzPH5915Nu0xCIbNF1pbfx1fKwzE=;
        b=ZOFZ4WX7CmQL0gViP9cx+VMFC2u4PlJ0z5izoWuT8N89iFwPK8i1Fzgzngw7ZEik6I
         D2onb9P6qC76ClLOicXaNIZqvXyjF3y0tmTPag4OmiP/tbbUTakOeUGK3uwtwYD9Xoxo
         +5dALk4vFaVGUtuAFZ7TchKftHcUZzv+lwPspvsiyjkriVS2/JTOJtDxBWRyEOgsLqPP
         g5sD7LWGp8lKO/NmEhVJLn4TUpwolNYFAxkNqxsfU1nA4sM/g4Vg34HNpG4TTgyJBd2r
         ktNuHgHUvq399VH5RzfSlHut/znY3piKRjHvefgboq+LW23bUPkoBPkJT3hVq3JmcGJf
         a/LA==
X-Forwarded-Encrypted: i=1; AFNElJ8I6Tk+SMU+0nyKAGDk4bjX/k7uO3HJUElBpgNawqNNDacAAttE8G4rHKBrTRxlFWvx5kuh7lX9v0Om@vger.kernel.org
X-Gm-Message-State: AOJu0YzC8I1ZTwh8CVPOpFOp6uUZVILOtXHU1oBziEOgLwP1/+RcG27G
	OdVfk6y5AOAMZFmiL0JWY55a489M8qr+3xVLZn+erN1szVlJLii3oYzPIupNeM7qtKk=
X-Gm-Gg: AeBDiesGMPxP6U+OOi3ECkT+7nPak4p+jxKaa9eR4/oqfXrq+VEva4nxYZBOAHi2t4l
	EVY2wQ0XKMqysTGisbrhz6ReCtMQABdnFRoyVzVSnjQHrO5FrHeU5/oVnhsLfZV15orQ4KUebVm
	bc4ax749d9HxH5726fvfcf+jqcfyt5nLRQRUhyUUnzY7x6ijUWn/J1wlZWD7KcMga5rAMvX86Kp
	7rGdnN2LFjeTNy+yAnyo02DLemzenXfIp1GFXOR1siajm9D0KSlewaNhcT4xaYkJYQj1uKBQ8V5
	Zv6/ly/Ks7Y0U7gRrUxOsRsRpy0rnc4vSNtgBjGKrFEgKCinq6bjnIzchzxSCCEJosj2B06M7OT
	wQp18Kjp+psl4IEnSP0E93PcMMjoA8MqNp3gBdQvSS+Igg26B+dIoy3uTwJrjB9t585gyx+0vMS
	mRxLnZ0ZJmSNq+/fP16duG/xqshqhpbuKSY/WuUJI9XaYS/FrxwpS9C8eRwioT8a6X1NtilXw=
X-Received: by 2002:a17:907:7295:b0:ba8:ca25:e6ab with SMTP id a640c23a62f3a-bb801ad6b78mr213412366b.11.1777382365430;
        Tue, 28 Apr 2026 06:19:25 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb809023ecesm101842266b.26.2026.04.28.06.19.23
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 06:19:23 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-67785ef88feso9333313a12.1
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 06:19:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+Gu97ZFaQ3rSgqujiXOJqple/MP69MAqYGUiebzHmrTHOiagy9U3UugtNL2QTAtZ3uoL3audXu/uNk@vger.kernel.org
X-Received: by 2002:a05:6402:35c6:b0:670:d548:da79 with SMTP id
 4fb4d7f45d1cf-679bb04e595mr1487937a12.3.1777382363526; Tue, 28 Apr 2026
 06:19:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317101627.174491-1-biju.das.jz@bp.renesas.com> <20260317101627.174491-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260317101627.174491-5-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Apr 2026 15:19:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWs-4N1hYjHQH-g3KdmSw2t3JhhaW42A7a2nnzBqv4qSQ@mail.gmail.com>
X-Gm-Features: AVHnY4K36oRkybc-Wo7oOtFtVEmMALNhAn_-9C3YcdDGdDqwib0z0T-D9L2K0tI
Message-ID: <CAMuHMdWs-4N1hYjHQH-g3KdmSw2t3JhhaW42A7a2nnzBqv4qSQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/8] pinctrl: renesas: rzg2l: Add support for selecting
 power source for {WDT,AWO,ISO}
To: Biju <biju.das.au@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: B8DAF4865C4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35701-lists,linux-gpio=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.890];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-m68k.org:email]

Hi Biju,

On Tue, 17 Mar 2026 at 11:16, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> The RZ/G3L SoC has support for setting power source that are not
> controlled by the following voltage control registers:
>   - SD_CH{0,1,2}_POC, XSPI_POC, ETH{0,1}_POC, I3C_SET.POC
>
> Add support for selecting voltages using OTHER_POC register for
> setting I/O domain voltage for WDT, ISO and AWO.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -63,10 +63,18 @@
>  #define PIN_CFG_SMT                    BIT(16) /* Schmitt-trigger input control */
>  #define PIN_CFG_ELC                    BIT(17)
>  #define PIN_CFG_IOLH_RZV2H             BIT(18)
> +#define PIN_CFG_PVDD1833_OTH_AWO_POC   BIT(19) /* known on RZ/G3L only */
> +#define PIN_CFG_PVDD1833_OTH_ISO_POC   BIT(20) /* known on RZ/G3L only */
> +#define PIN_CFG_WDTOVF_N_POC           BIT(21) /* known on RZ/G3L only */
>
>  #define RZG2L_SINGLE_PIN               BIT_ULL(63)     /* Dedicated pin */
>  #define RZG2L_VARIABLE_CFG             BIT_ULL(62)     /* Variable cfg for port pins */
>
> +#define PIN_CFG_OTHER_POC_MASK \
> +                                       (PIN_CFG_PVDD1833_OTH_AWO_POC | \
> +                                        PIN_CFG_PVDD1833_OTH_ISO_POC | \
> +                                        PIN_CFG_WDTOVF_N_POC)
> +
>  #define RZG2L_MPXED_COMMON_PIN_FUNCS(group) \
>                                         (PIN_CFG_IOLH_##group | \
>                                          PIN_CFG_PUPD | \
> @@ -146,6 +154,7 @@
>  #define SD_CH(off, ch)         ((off) + (ch) * 4)
>  #define ETH_POC(off, ch)       ((off) + (ch) * 4)
>  #define QSPI                   (0x3008)
> +#define OTHER_POC              (0x3028) /* known on RZ/G3L only */
>
>  #define PVDD_2500              2       /* I/O domain voltage 2.5V */
>  #define PVDD_1800              1       /* I/O domain voltage <= 1.8V */
> @@ -906,6 +915,12 @@ static int rzg2l_caps_to_pwr_reg(const struct rzg2l_register_offsets *regs, u32
>                 return ETH_POC(regs->eth_poc, 1);
>         if (caps & PIN_CFG_IO_VMC_QSPI)
>                 return QSPI;
> +       if (caps & PIN_CFG_PVDD1833_OTH_AWO_POC)
> +               return OTHER_POC;
> +       if (caps & PIN_CFG_PVDD1833_OTH_ISO_POC)
> +               return OTHER_POC;
> +       if (caps & PIN_CFG_WDTOVF_N_POC)
> +               return OTHER_POC;

"if (caps & PIN_CFG_OTHER_POC_MASK)" would cover all cases at once.

>
>         return -EINVAL;
>  }
> @@ -925,6 +940,13 @@ static int rzg2l_get_power_source(struct rzg2l_pinctrl *pctrl, u32 pin, u32 caps
>                 return pwr_reg;
>
>         val = readb(pctrl->base + pwr_reg);
> +       if (pwr_reg == OTHER_POC) {
> +               u32 poc = FIELD_GET(PIN_CFG_OTHER_POC_MASK, caps);
> +               u8 offs = ffs(poc) - 1;

Yesterday I thought "Why not store the bit number itself?", but after
a night of sleep, I had my aha-moment...
While clever, it is rather fragile to rely on the three PIN_CFG_*
values to match the order of the bits in the OTHER_POC registers.
So please check which PIN_CFG_* flag is set instead.

Perhaps rzg2l_caps_to_pwr_reg() should return both a register offset and
a bitmask, to be used with field_prep() and field_get()?

> +
> +               val = (val >> offs) & 0x1;
> +       }
> +
>         switch (val) {
>         case PVDD_1800:
>                 return 1800;
> @@ -943,6 +965,7 @@ static int rzg2l_set_power_source(struct rzg2l_pinctrl *pctrl, u32 pin, u32 caps
>         const struct rzg2l_hwcfg *hwcfg = pctrl->data->hwcfg;
>         const struct rzg2l_register_offsets *regs = &hwcfg->regs;
>         int pwr_reg;
> +       u8 poc_val;
>         u8 val;

u8 poc_val, val;

>
>         if (caps & PIN_CFG_SOFT_PS) {

> @@ -970,6 +993,17 @@ static int rzg2l_set_power_source(struct rzg2l_pinctrl *pctrl, u32 pin, u32 caps
>         if (pwr_reg < 0)
>                 return pwr_reg;
>
> +       if (pwr_reg == OTHER_POC) {
> +               u32 poc = FIELD_GET(PIN_CFG_OTHER_POC_MASK, caps);
> +               u8 offs = ffs(poc) - 1;
> +
> +               val = readb(pctrl->base + pwr_reg);

if (poc_val)
    val += BIT(offs);
else
    val &= ~BIT(offs);

> +               val &= ~BIT(offs);
> +               val |= (poc_val << offs);
> +       } else {
> +               val = poc_val;
> +       }
> +
>         writeb(val, pctrl->base + pwr_reg);
>         pctrl->settings[pin].power_source = ps;
>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

