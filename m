Return-Path: <linux-gpio+bounces-35733-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qI2wGUMP8WmXcQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35733-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 21:49:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D54348B58D
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 21:49:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B9F95306D1C1
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 19:44:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4717838D69B;
	Tue, 28 Apr 2026 19:44:28 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85132379EF5
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 19:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777405468; cv=none; b=GFDewoWy4uiLJ/sUQDrlcOqQ4cM7K+JG/vK9g5WIixg62zHiVjtRE+6Lybd8PeoRjff8iOvGVY+b25FPoypFvU6hSGVEULSho0s5WlZU5NTNbLjxJHOiS4EimltN0shiJA9X/GFDeqoqN9YolqfOJPwxfsUh77LA1Yd4RV1j4tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777405468; c=relaxed/simple;
	bh=3M0C2EFqGsIruEhN/KJ0QQ1LtyNqASZOnreNh2kolHc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qI/TNxM8kmWGSWnx3awyr4uXvXtNJwZPvX5ebBGcOMzTG3SNl9GLgwbhknQeg4nBEGXB6KC4QPJapqaM3zl0mVvGSuMyP4UgzZKkVrUHPjQPflP6SH9hD+ArnlCkUjUfQofifJk4e34BC6RK3rcfa5SBWUkpf+MXUwhdc1wxnvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-570f7bd671bso2766771e0c.3
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 12:44:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777405465; x=1778010265;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cFvXg9lQ5EYIQXKdVlWrW6g+B896hmGJVYb+tieTAAI=;
        b=cD2IauQiSyOT2q6mc3lk7dwvRDrxf76eA8UoYiPdKYm/jjUJJmCOLGhk4yAorax2mt
         6rgpVEd+rO5y6KzAcNc6O1mY+52GhC4dTGTJDj4WGFpdeU7ykUWnX3cjauIx9ldlQmAl
         BvZAc7+mjjn8V/9NFsKrnsVee23+sZS9xRkvdA5EPd4AFChrSLyx1HJSbQPAdInjY/TI
         6Di8RTYLDOJW+lwExOpgG5arA+UrAUhKE4qvFxjLxgB6WT8NIyk/jppuYh7NZ4CipM6A
         eeiC5MOcNqDQ1KsuitmxSn5ZLD9xsG/D01eQZ3fsou5au2ZgyFVQ5/BgNagRMELH+KFK
         HRlA==
X-Forwarded-Encrypted: i=1; AFNElJ/tHnR5FsXKdXOL/+zsjTE7nk76+bS1qt0LvwKOkRrr0YNweFAwto9citN7Ei7869gP1OcwFx1LfJ+8@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+K7X3D+9aEzsb0QT7B2QBCLsXBzUDFd0Suqglga/fYn02iuKg
	lXEr/OrCfVJPBXDXwNPRgQjY3aEDbsykV6nNygGjpjH80expGSM2i/FGtDQXnGVFzyI=
X-Gm-Gg: AeBDievCpuKXEFHm57135LHVTy+kgefYfwapOf+SIJ8zE26lplMhFPJIbDr9NYcktoW
	4h4tqIChjxvH/6EGq3ldg+KUiuQ/slClkSaBPMelFILwVt9/CfGGrhOYpNSz4Pm6H633VMFFjlZ
	a2A59dTqonOcDs1hL64Gxha/wxzBZD4hZIVjWCWnMMVy+Bi1hiSsPfLuQEvSsJtmIlSU6MEC5kf
	xO7td68s5wHVwyuwGU6gA/WVh1uQmoktotVOTtGX38JTa8uugJ33FqFlxZrkQzffQ3o4n3XE1Jx
	jm0lPwqcKsoy6B/qzKv0XtrFQOS3NErY4htDtmyiLYucZAqovG5NvnY+oKA/kLUwmXM3Pxwg0Th
	XA3CVC9DDy0zv8PLxdkpsARHKgsaZa6FrMrAFYFQ92TifylYQUVHAux1nM6EAnahcy4h+QlWuaW
	xWW+HGjj0WdKoB3sL5Ju0yKfcoBHMl0E71FZ7zDDxBApVPe6FVZ81CgfWrk347h+Vz27NV3Wg=
X-Received: by 2002:a05:6122:250:b0:56c:ca38:ebeb with SMTP id 71dfb90a1353d-573a554f4cemr2747394e0c.2.1777405465372;
        Tue, 28 Apr 2026 12:44:25 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-573a4630970sm2176993e0c.16.2026.04.28.12.44.24
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 12:44:25 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-60fee2fa3b8so3660065137.2
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 12:44:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+CNcADDrqheI+abzv0N1/qG0CpTtv3Jjr6KukQ9Y9Iehf8iKNbo+MUC2itNMzaf6SKr0Y3C0SMMJq2@vger.kernel.org
X-Received: by 2002:a05:6102:b0e:b0:5f5:7723:28ee with SMTP id
 ada2fe7eead31-62808e61034mr2483228137.11.1777405464528; Tue, 28 Apr 2026
 12:44:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317101627.174491-1-biju.das.jz@bp.renesas.com> <20260317101627.174491-9-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260317101627.174491-9-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Apr 2026 21:44:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV3pUf_KagxAJEbsk2wQVv1yqGTJm4bc5zpcYJ3DPM+sQ@mail.gmail.com>
X-Gm-Features: AVHnY4Kvdzg_ushlSmR3h5fj5GiiWt8ZcggZh4aAzLRRADW12sF4_R6dYvidLVg
Message-ID: <CAMuHMdV3pUf_KagxAJEbsk2wQVv1yqGTJm4bc5zpcYJ3DPM+sQ@mail.gmail.com>
Subject: Re: [PATCH v3 8/8] pinctrl: renesas: rzg2l: Add support for clone
 channel control
To: Biju <biju.das.au@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 0D54348B58D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-35733-lists,linux-gpio=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.471];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,mail.gmail.com:mid,linux-m68k.org:email]

Hi Biju,

On Tue, 17 Mar 2026 at 11:16, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> The RZ/G3L SoC has some IP such as I2C ch{2,3},SCIF ch{3,4,5},
> RSPI ch{1,2} and RSCI ch{1,2,3} need to control the clone channel for
> proper operation. As per the RZ/G3L hardware manual, the clone channel
> setting is to be done before the mux setting.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c

> @@ -152,6 +154,26 @@
>          FIELD_PREP_CONST(VARIABLE_PIN_CFG_PORT_MASK, (port)) | \
>          FIELD_PREP_CONST(PIN_CFG_MASK, (cfg)))
>
> +#define RZG3L_CLONE_CHANNEL_CFG_PIN_START_MASK GENMASK(31, 29)
> +#define RZG3L_CLONE_CHANNEL_CFG_PIN_END_MASK   GENMASK(28, 26)
> +#define RZG3L_CLONE_CHANNEL_CFG_PORT_MASK      GENMASK(25, 21)
> +#define RZG3L_CLONE_CHANNEL_CFG_DATA_MASK      GENMASK(9, 0)
> +#define RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(port, start_pin, end_pin, cfg) \
> +       (FIELD_PREP_CONST(RZG3L_CLONE_CHANNEL_CFG_PIN_START_MASK, (start_pin)) | \
> +        FIELD_PREP_CONST(RZG3L_CLONE_CHANNEL_CFG_PIN_END_MASK, (end_pin)) | \
> +        FIELD_PREP_CONST(RZG3L_CLONE_CHANNEL_CFG_PORT_MASK, (port)) | \
> +        FIELD_PREP_CONST(RZG3L_CLONE_CHANNEL_CFG_DATA_MASK, (cfg)))

s/cfg/data/, but...

> +
> +#define RZG3L_CLONE_CHANNEL_BIT_MASK           GENMASK(9, 6)
> +#define RZG3L_CLONE_CHANNEL_VAL_MASK           BIT(5)
> +#define RZG3L_CLONE_CHANNEL_SHARED_PIN_MASK    BIT(4)
> +#define RZG3L_CLONE_CHANNEL_PFC_MASK           GENMASK(3, 0)
> +#define RZG3L_CLONE_CHANNEL_PACK(bit, val, shared_pin, pfc) \
> +       (FIELD_PREP_CONST(RZG3L_CLONE_CHANNEL_BIT_MASK, (bit)) | \
> +        FIELD_PREP_CONST(RZG3L_CLONE_CHANNEL_VAL_MASK, (val)) | \
> +        FIELD_PREP_CONST(RZG3L_CLONE_CHANNEL_SHARED_PIN_MASK, (shared_pin)) | \
> +        FIELD_PREP_CONST(RZG3L_CLONE_CHANNEL_PFC_MASK, (pfc)))

... the  macro RZG3L_CLONE_CHANNEL_PACK() does not seem to offer much
(apart from reducing the number of parameters of the
RZG3L_CLONE_CHANNEL_PIN_CFG_PACK() macro), so perhaps you can
just drop it, together with the (now unused) definition of
RZG3L_CLONE_CHANNEL_CFG_DATA_MASK() above?

> +
>  #define P(off)                 (0x0000 + (off))
>  #define PM(off)                        (0x0100 + (off) * 2)
>  #define PMC(off)               (0x0200 + (off))

> @@ -346,6 +370,7 @@ struct rzg2l_pinctrl_pin_settings {
>   * @pupd: PUPD registers cache
>   * @ien: IEN registers cache
>   * @smt: SMT registers cache
> + * @clone: Clone registers cache

register

>   * @sd_ch: SD_CH registers cache
>   * @eth_poc: ET_POC registers cache
>   * @other_poc: OTHER_POC register cache
> @@ -361,6 +386,7 @@ struct rzg2l_pinctrl_reg_cache {
>         u32     *ien[2];
>         u32     *pupd[2];
>         u32     *smt;
> +       u32     *clone;

Ugh, this is a pointer to a single u32, allocated dynamically using
devm_kzalloc()? Better store the actual value here:

    u32 clone;

>         u8      sd_ch[2];
>         u8      eth_poc[2];
>         u8      oen;

> @@ -617,6 +646,54 @@ static int rzg2l_validate_pin(struct rzg2l_pinctrl *pctrl,
>         return 0;
>  }
>
> +static int rzg2l_pinctrl_set_clone_mode(struct rzg2l_pinctrl *pctrl,
> +                                       u8 port, u8 pin, u8 func)
> +{
> +       static const u8 pfc_table_lut[] = { 2, 4, 5, 6, 7 };
> +       u8 start_pin, end_pin;

unsigned int

> +       unsigned int i;
> +
> +       if (!pctrl->data->clone_pin_configs)
> +               return 0;
> +
> +       for (i = 0; i < ARRAY_SIZE(pfc_table_lut); i++)
> +               if (pfc_table_lut[i] == func)
> +                       break;
> +
> +       if (i == ARRAY_SIZE(pfc_table_lut))
> +               return 0;

Just use a switch() statement, and let the compiler optimize it?

> +
> +       for (i = 0; i < pctrl->data->n_clone_pins; i++) {
> +               u32 pin_data = pctrl->data->clone_pin_configs[i];
> +               bool is_shared_pin = FIELD_GET(RZG3L_CLONE_CHANNEL_SHARED_PIN_MASK, pin_data);
> +               u8 pin_func = FIELD_GET(RZG3L_CLONE_CHANNEL_PFC_MASK, pin_data);
> +               unsigned int j, num_pins;
> +
> +               if ((pin_func != func && !(is_shared_pin && (pin_func + 1) == func)) ||

De Morgan:

    if ((pin_func != func && (!is_shared_pin || (pin_func + 1) != func)) || ...

might be easier to read?

However, if you would store an 8-bit function mask instead of
a function index, you could get rid of the shared pin bit, and the
obscure "pin_func + 1" test, and simplify to:

    if (!(pin_func_mask & BIT(func)) || ...)

> +                   FIELD_GET(RZG3L_CLONE_CHANNEL_CFG_PORT_MASK, pin_data) != port)
> +                       continue;
> +
> +               start_pin = FIELD_GET(RZG3L_CLONE_CHANNEL_CFG_PIN_START_MASK, pin_data);
> +               end_pin = FIELD_GET(RZG3L_CLONE_CHANNEL_CFG_PIN_END_MASK, pin_data);
> +               num_pins = end_pin - start_pin + 1;
> +
> +               for (j = 0; j < num_pins; j++) {

I would say:

    for (j = start_pin; j <= end_pin; j++)

> +                       u32 bit, val;
> +
> +                       if ((start_pin + j) != pin)
> +                               continue;

... but you don't reallly need a loop for this?

    if (pin >= start_pin && pin <= end_pin)
            continue;

If you would store an 8-bit pin mask instead of start and end pin
indices:

    if (!(pinmask & BIT(pin)))
            continue;

> +
> +                       bit = FIELD_GET(RZG3L_CLONE_CHANNEL_BIT_MASK, pin_data);
> +                       val = FIELD_GET(RZG3L_CLONE_CHANNEL_VAL_MASK, pin_data);
> +
> +                       return regmap_update_bits(pctrl->syscon, pctrl->clone_offset,
> +                                                 BIT(bit), field_prep(BIT(bit), val));

val is just 0 or 1, and always fits, so perhaps replace field_prep(...)
by "val << bit"?

> +               }
> +       }
> +
> +       return 0;
> +}
> +
>  static void rzg2l_pinctrl_set_pfc_mode(struct rzg2l_pinctrl *pctrl,
>                                        u8 pin, u8 off, u8 func)
>  {

> @@ -2647,6 +2728,110 @@ static const struct rzg2l_dedicated_configs rzg3l_dedicated_pins[] = {
>           (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
>  };
>
> +static const u32 r9a08g046_clone_channel_pin_cfg[] = {
> +       /* I2C ch2 Bit:0 Value:0 PFC:4 */
> +       RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PG, 6, 7, RZG3L_CLONE_CHANNEL_PACK(0, 0, 0, 4)),
> +       RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PH, 2, 3, RZG3L_CLONE_CHANNEL_PACK(0, 0, 0, 4)),
> +       RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PK, 0, 1, RZG3L_CLONE_CHANNEL_PACK(0, 0, 0, 4)),
> +       RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PA, 0, 1, RZG3L_CLONE_CHANNEL_PACK(0, 0, 0, 4)),
> +       RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PA, 4, 5, RZG3L_CLONE_CHANNEL_PACK(0, 0, 0, 4)),

If you would store an 8-bit pin mask instead of start and end pin
indices, you could combine multiple entries with the same port number
and config using ORed values of BIT() and GENMASK(), and thus reduce
table size.  E.g. these two entries would become a single entry:

    RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PA, BIT(5) | BIT(4) | BIT
(1) | BIT(0), ...)

(I used high-to-low order, to match GENMASK(), which is useful for some
 of the entries below).

> +       /* RSCI ch1 Bit:12 Value:0 PFC:{5,6} shared pins based on RSCI mode */
> +       RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PG, 0, 3, RZG3L_CLONE_CHANNEL_PACK(12, 0, 1, 5)),

If you would store an 8-bit function mask instead of a function index,
you could get rid of the shared pin bit, and make it more obvious both
function 5 and 6 are possible:

    RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PG, 0, 3, ... BIT(5) | BIT(6))

> +       RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PA, 0, 3, RZG3L_CLONE_CHANNEL_PACK(12, 0, 1, 5)),
> +       RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PB, 6, 7, RZG3L_CLONE_CHANNEL_PACK(12, 0, 1, 5)),
> +       RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PC, 0, 1, RZG3L_CLONE_CHANNEL_PACK(12, 0, 1, 5)),
> +       RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PD, 4, 7, RZG3L_CLONE_CHANNEL_PACK(12, 0, 1, 5)),
> +       /* RSCI ch1 Bit:12 Value:1 PFC:{5,6} shared pins based on RSCI mode */
> +       RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_P5, 0, 3, RZG3L_CLONE_CHANNEL_PACK(12, 1, 1, 5)),
> +       /* RSCI ch2 Bit:13 Value:0 PFC:{5,6} shared pins based on RSCI mode */
> +       RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PH, 0, 3, RZG3L_CLONE_CHANNEL_PACK(13, 0, 1, 5)),
> +       RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PK, 0, 3, RZG3L_CLONE_CHANNEL_PACK(13, 0, 1, 5)),
> +       RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PA, 4, 7, RZG3L_CLONE_CHANNEL_PACK(13, 0, 1, 5)),
> +       RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PD, 0, 3, RZG3L_CLONE_CHANNEL_PACK(13, 0, 1, 5)),
> +       RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PE, 0, 3, RZG3L_CLONE_CHANNEL_PACK(13, 0, 1, 5)),
> +       /* RSCI ch2 Bit:13 Value:1 PFC:{5,6} shared pins based on RSCI mode */
> +       RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_P5, 4, 6, RZG3L_CLONE_CHANNEL_PACK(13, 1, 1, 5)),
> +       RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_P6, 0, 0, RZG3L_CLONE_CHANNEL_PACK(13, 1, 1, 5)),
> +       RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_P6, 5, 6, RZG3L_CLONE_CHANNEL_PACK(13, 1, 1, 5)),
> +       RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_P7, 0, 1, RZG3L_CLONE_CHANNEL_PACK(13, 1, 1, 5)),
> +       RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_P7, 6, 7, RZG3L_CLONE_CHANNEL_PACK(13, 1, 1, 5)),
> +       RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_P8, 0, 1, RZG3L_CLONE_CHANNEL_PACK(13, 1, 1, 5)),
> +       /* RSCI ch3 Bit:14 Value:0 PFC:{5,6} shared pins based on RSCI mode */
> +       RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PE, 6, 7, RZG3L_CLONE_CHANNEL_PACK(14, 0, 1, 5)),
> +       RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_PF, 0, 1, RZG3L_CLONE_CHANNEL_PACK(14, 0, 1, 5)),
> +       /* RSCI ch3 Bit:14 Value:1 PFC:{5,6} shared pins based on RSCI mode */
> +       RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_P6, 1, 4, RZG3L_CLONE_CHANNEL_PACK(14, 1, 1, 5)),
> +       RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_P7, 2, 5, RZG3L_CLONE_CHANNEL_PACK(14, 1, 1, 5)),
> +       RZG3L_CLONE_CHANNEL_PIN_CFG_PACK(RZG3L_P8, 2, 5, RZG3L_CLONE_CHANNEL_PACK(14, 1, 1, 5)),
> +};
> +
>  static int rzg2l_gpio_get_gpioint(unsigned int virq, struct rzg2l_pinctrl *pctrl)
>  {
>         const struct pinctrl_pin_desc *pin_desc = &pctrl->desc.pins[virq];

> @@ -3204,6 +3393,19 @@ static int rzg2l_pinctrl_probe(struct platform_device *pdev)
>                                      "failed to enable GPIO clk\n");
>         }
>
> +       if (pctrl->data->clone_pin_configs) {
> +               struct device_node *np = pctrl->dev->of_node;
> +               u32 offset;

No need for the temporary...

> +
> +               pctrl->syscon = syscon_regmap_lookup_by_phandle_args(np, "renesas,clonech",
> +                                                                    1, &offset);

... just pass &pctrl->clone_offset.

> +               if (IS_ERR(pctrl->syscon))
> +                       return dev_err_probe(pctrl->dev, PTR_ERR(pctrl->syscon),
> +                                            "Failed to parse renesas,clonech\n");
> +
> +               pctrl->clone_offset = offset;
> +       }
> +
>         raw_spin_lock_init(&pctrl->lock);
>         spin_lock_init(&pctrl->bitmap_lock);
>         mutex_init(&pctrl->mutex);

The rest LGTM

... Except that I still don't understand what this clone channel
functionality is really doing ;-) The documentation doesn't help much...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

