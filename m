Return-Path: <linux-gpio+bounces-35732-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QF5EJ6oE8WnhbwEAu9opvQ
	(envelope-from <linux-gpio+bounces-35732-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 21:04:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC2248AF54
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 21:04:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7942E301F9EC
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 19:04:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32709346FCF;
	Tue, 28 Apr 2026 19:04:08 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431B230CDA2
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 19:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777403048; cv=none; b=STdq4wwc4qiL2NkzkV6iQpDI+IulVgPz4CIGgjLjUyfsiEuxsd8GPOhkmf64xAve5dpUYksZ7lEYtCwnUHl/1xZ4FUl67jz4bYzhEn7aZ3bpIZURAgFcwmpxKv3vRVrqrgb+cTWY3U/rWGkzK4Ew4bvLN7iFJKIvhx6JK9CAxwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777403048; c=relaxed/simple;
	bh=J0CuarzPFG0TpN6nt7FLMyrw37XeJiUf9kmvM0wcMSY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=paKYIXHbH0cm2BTHaI6C/JUjCm43fTq0ffS4MWK7iDu7H1dyBhYtgAQLr/QNoXqfVsZnenjsPtP/Iq8ZObqUQTxZLiRVwVw1TA7jes+iwNfPsI9f6zeLhUZI2bJH5M8sdfPE2ZYukLQV8fVZ6bbevX8cZwQQHBL6mM8wDbch8O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-570f7bd671bso2750674e0c.3
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 12:04:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777403045; x=1778007845;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u+PiOGrtlfrHasMb8ONEfDi5/8WTl/cLX2Kw/y7AM8M=;
        b=nh5ISYfogLCC7/oLgaWUyWFqQIqE/znUz0Y3/WalX1GuqREf1QBRRKif2wyTdtWUzI
         SDbaT1m5u2bqVrk29nf/s7Tbyygv60usS6XJh1I7Mdgt/TwZ9MDHWFBn6y5hW7fKf2hR
         NPPe5Ma8LLz1kkcNhfzDAZwu/NYCEriT1R+euR5lUFfDxNp/dRQbLAONWIoXs26xJ9KH
         TLKXtSQtZHs5ZtNoleNE6/9Vx7GZoAOAJAHn8jGAGUZzQi1mufQ3Al2+GcWNfGpNzBkE
         5raVCq5vapFawGAviQEnjeW5RllsmS/EuUvMjWk3pC5s1hbMfZ8GGGfurFOA7blznfiA
         2OGg==
X-Forwarded-Encrypted: i=1; AFNElJ+LVsuMHYephTfTiBccL03lRya6hTMj5wR+pYhSXbirc9EpoJ+CYNCH2zUb+LJAGLvMi9Zhr4Kjk0gG@vger.kernel.org
X-Gm-Message-State: AOJu0YzD9OavyPZfmgrdLt9k04V3k2aYzvIVplUBGYjSVW9sLBmbhn76
	6ByGizYrRho+Ix31SRsn/w1JLNjBpawvX12/INdwgwCfI4Tpca6pvvrSm887R+OdCvk=
X-Gm-Gg: AeBDiesbqT1Tz7Zzop5yuMLw8yFfQzMel43BAXbzasGZQTHUEaNx8cCg66twWbBtkYc
	DmVtQh1TYCjRz652Gh+RnPLhHNFDkLxcijaoImCSaFscQQ9MeaKqxy2OyDVx01wWCa2TmF20Wcj
	wl+KzvxbIPuOZEQre9tX90kV+7ERezHDXpVU6R0V491s6pwuXz4nmLiJWc2zO3G2cuTyvz/oa3z
	Kq+CBystSGKxRzX6QwlSZYCOAEj0MTI+Kpjlay6sBGJonFBoLcckSXnI6O+vtEsB7JGTZN/g+Zf
	okZNtP5bAXyQgQt4QFblq6ROIcfWQQ/4N70PqvahMwL/gtCjviod4nlEiVhQAlMRijMuWuayNJj
	uUqxsDQQ7SkoczVNIy0hAeQlZkGpqRWhz06O4RqlcqJWP1QCTUPFwP+e83UAnow48gzNIn6IKCA
	AVkQRjbR9Dl+pBx2wlSO8dLC6As25lTnq3wrsqcc6uinhaPCLPedHcdV3cel6MnsWPObUd2KQ=
X-Received: by 2002:a05:6122:1d06:b0:56b:814e:d35a with SMTP id 71dfb90a1353d-573a55fdccbmr2745104e0c.8.1777403045032;
        Tue, 28 Apr 2026 12:04:05 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-573a4337b17sm2150315e0c.1.2026.04.28.12.04.04
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 12:04:04 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-9567aa1a047so3458220241.0
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 12:04:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8fJdGLJ7Rfgsrw4lEt8zyIyVmRVJLpF8iIfDc3RXnVUPzlAggjXIuVsVRh6Up+LspcChhAaoLdXJWX@vger.kernel.org
X-Received: by 2002:a05:6102:2ad3:b0:608:8fb9:9104 with SMTP id
 ada2fe7eead31-6280b3e3ee8mr2068848137.29.1777403044232; Tue, 28 Apr 2026
 12:04:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317101627.174491-1-biju.das.jz@bp.renesas.com> <20260317101627.174491-7-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260317101627.174491-7-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Apr 2026 21:03:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWc_ffY83M8aR91X+=R3_n5go8q9E7-L1Q8YN-5z64grw@mail.gmail.com>
X-Gm-Features: AVHnY4L-xXB553nhUeyCaK_IudMmOEPvxPnSOf8YTHReSNXuNx1vwH3gqM29JKs
Message-ID: <CAMuHMdWc_ffY83M8aR91X+=R3_n5go8q9E7-L1Q8YN-5z64grw@mail.gmail.com>
Subject: Re: [PATCH v3 6/8] pinctrl: renesas: rzg2l: Add support for RZ/G3L SoC
To: Biju <biju.das.au@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: DDC2248AF54
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35732-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,bp.renesas.com,vger.kernel.org];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.642];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-m68k.org:email,renesas.com:email,mail.gmail.com:mid]

Hi Biju,

On Tue, 17 Mar 2026 at 11:16, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add pinctrl driver support for RZ/G3L SoC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c

> @@ -2479,6 +2614,37 @@ static struct rzg2l_dedicated_configs rzg3e_dedicated_pins[] = {
>          (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_PUPD)) },
>  };
>
> +static const struct rzg2l_dedicated_configs rzg3l_dedicated_pins[] = {
> +       { "WDTOVF_N", RZG2L_SINGLE_PIN_PACK(0x5, 0,
> +         (PIN_CFG_IOLH_A | PIN_CFG_WDTOVF_N_POC)) },
> +       { "SCIF_RXD", RZG2L_SINGLE_PIN_PACK(0x6, 0,
> +         (PIN_CFG_IOLH_A | PIN_CFG_PUPD | PIN_CFG_PVDD1833_OTH_AWO_POC)) },
> +       { "SCIF_TXD", RZG2L_SINGLE_PIN_PACK(0x6, 1,
> +         (PIN_CFG_IOLH_A | PIN_CFG_PUPD | PIN_CFG_PVDD1833_OTH_AWO_POC)) },

The main documentation indeed calls these pins "SCIF_RXD" and
"SCIF_TXD", like on RZ/V2H and RZ/G3E.
However, unlike the latter SoCs, RZ/G3L has multiple SCIF interfaces.
As the pin function spreadsheet does call them "SCIF0_RXD" resp.
"SCIF0_TXD", and users will probably use that spreadsheet to find the
right pin control configuration, I think it makes sense to use the
names that include the zero index.

> +       { "SD0_CLK", RZG2L_SINGLE_PIN_PACK(0x9, 0,  PIN_CFG_IOLH_B) },

One space too many before PIN_CFG_IOLH_B.

> +       { "SD0_CMD", RZG2L_SINGLE_PIN_PACK(0x9, 1,
> +         (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
> +       { "SD0_RST#", RZG2L_SINGLE_PIN_PACK(0x9, 2, PIN_CFG_IOLH_B) },
> +       { "SD0_DS", RZG2L_SINGLE_PIN_PACK(0x9, 5,
> +         (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
> +       { "SD0_DATA0", RZG2L_SINGLE_PIN_PACK(0x0a, 0,
> +         (PIN_CFG_IOLH_B |  PIN_CFG_IEN | PIN_CFG_PUPD)) },

One space too many before PIN_CFG_IEN.

> +       { "SD0_DATA1", RZG2L_SINGLE_PIN_PACK(0x0a, 1,
> +         (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
> +       { "SD0_DATA2", RZG2L_SINGLE_PIN_PACK(0x0a, 2,
> +         (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
> +       { "SD0_DATA3", RZG2L_SINGLE_PIN_PACK(0x0a, 3,
> +         (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
> +       { "SD0_DATA4", RZG2L_SINGLE_PIN_PACK(0x0a, 4,
> +         (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
> +       { "SD0_DATA5", RZG2L_SINGLE_PIN_PACK(0x0a, 5,
> +         (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
> +       { "SD0_DATA6", RZG2L_SINGLE_PIN_PACK(0x0a, 6,
> +         (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
> +       { "SD0_DATA7", RZG2L_SINGLE_PIN_PACK(0x0a, 7,
> +         (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },

The SD data pins are called "SD0_D[0-7]" in the main docs, but
"SD0_DAT[0-7]" in the spreadsheet. So please pick one of these ;-)

> +};
> +
>  static int rzg2l_gpio_get_gpioint(unsigned int virq, struct rzg2l_pinctrl *pctrl)
>  {
>         const struct pinctrl_pin_desc *pin_desc = &pctrl->desc.pins[virq];

> @@ -3263,6 +3432,8 @@ static int rzg2l_pinctrl_suspend_noirq(struct device *dev)
>
>         cache->qspi = readb(pctrl->base + QSPI);
>         cache->oen = readb(pctrl->base + pctrl->data->hwcfg->regs.oen);
> +       if (regs->other_poc)
> +               cache->other_poc = readb(pctrl->base + regs->other_poc);
>
>         if (!atomic_read(&pctrl->wakeup_path))
>                 clk_disable_unprepare(pctrl->clk);
> @@ -3288,6 +3459,8 @@ static int rzg2l_pinctrl_resume_noirq(struct device *dev)
>         }
>
>         writeb(cache->qspi, pctrl->base + QSPI);

RZ/G3L does not have the QSPI register.
However, this write is harmless, as it has the SD_CH1_POC at this offset,
which is thus saved/restored twice.

> +       if (regs->other_poc)
> +               writeb(cache->other_poc, pctrl->base + regs->other_poc);
>
>         raw_spin_lock_irqsave(&pctrl->lock, flags);
>         rzg2l_oen_write_with_pwpr(pctrl, cache->oen);

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

