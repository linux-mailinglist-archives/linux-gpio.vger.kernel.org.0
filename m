Return-Path: <linux-gpio+bounces-35703-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFyHKim98Gk9YAEAu9opvQ
	(envelope-from <linux-gpio+bounces-35703-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 15:59:05 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 356F04866EB
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 15:59:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F79230FF7AC
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 13:31:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CF4B3E4C74;
	Tue, 28 Apr 2026 13:20:21 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EDA47887C
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 13:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777382421; cv=none; b=Wa/zwuw9W5PVYRC2BXH3zZgZwatFik8+CFq2RXipZTUmbWXYhxftMPogyqj1+BzHZoJKYp0L83IrDw+Aiwsk20MP+zusZDRSOLMaOsMFshSyLM7qAj5P7li8c1JNUsZCcyUAMMZNfFM1iGq+z2uXO7sPc69uyVB84ScxDbA7oEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777382421; c=relaxed/simple;
	bh=HByK9I/cQLk+DGHkedH+tOE/B56fdAqY26kq7gGGvc4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sUHTxt4T5nSlkBZl8HMUoZC6iZx1XwtEJcCQQcU2sdYS1+5hDMJhsOp0U6z0SLEwwPE64x03f2kiKSOmm3iMIe385wXiHFwgusZxn3hGzPZwMv0nJa/pRN2pPYNlHn/vOow1BGcE1CZHG9ZWWKnOqs/xtbuiQYIFC0X7Ii3+SBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-baa8c78ac7fso1095722766b.0
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 06:20:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777382418; x=1777987218;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HtptQ8Ok+QUe7qY7BUFtd0TlrWN/BKcm1+4rkRiMvqY=;
        b=WS4ivyKUpqs5VCd0WypC5rLjIkDp/9jjYBqa7PCTK4SvyhVeWEOR9S7H9+pIQUt0Uz
         QaQiVXBPPTcvnUxA6warhgTEIIixFgHd8ICjNHgrMKXM7DWqIgLn1uJY3ZB27SoRlkoZ
         nMQ42RAPiRO9ZwcyCliq/O3IQF1+/K5XNj08j/ZCZtzio/ZMsUNfpNQ0voF+cpGL2IDv
         9moXD9V925813dkCrrLYwjWV3ONCT29P8QUrv0gq0svvUPgIlw/9VWkezucnjGHwsa9Z
         sFiq3Q9pmaWmK0ZybLA7hWh7edVCZrGhOFR5KOiI6zaklHnX/KtXdFIUTryj0Jv4Nzb+
         Fw6g==
X-Forwarded-Encrypted: i=1; AFNElJ8yoy3qg/6fzY3A+5vVbWQK+YMcPSR6zLm0fDyxXwAk1QDB3LsIojv9/s0oPrGXx8ev/zR4tYtztjtb@vger.kernel.org
X-Gm-Message-State: AOJu0YwHzWjxcy6/o+6kc0mYxjADEhG3URsic60Pv0c1jnLdUY6VbZwf
	x0uNks5BHJgae5jg7x6ZIDCcuYvI+AAda4Opxj6UtwTDL6A+gQQ6C8fo0Kri5uXAbx8=
X-Gm-Gg: AeBDiesBkc2bVTGrWPAvajhMEXs1U9NWMYETpvtNPcjVq4HkfjUDT+Ct8I2TJFPTzk9
	B9yfo6uJuvAf79O5adnWnhrGc7kswV9ez6NLbiru8q+3u9UxhyDTrzpL9ENaQB3DipOcksiGpxY
	YpS8WhDdKNFEmBo6WZIMA2UJ3i/Hd6mImp2VNegeHtu1EKKYyiX4JuUhn3fli6T3XyFrubqMgx3
	P4/ydoUIuttVICe6dcW30TzZ+2XONQnSFd3PEKRQTIzLT0PcxAQLH4sfgbrTb1hnAh7Heh5mdHs
	NkZ3mVFc99rLajcjTb5ZW74QV1e0yVEJpR2jz7l5YJA55sprSb8ROZUwKn4jpCcEf7Yq6utpmQ+
	GF4pQneLwgzpfdawhvX/my/Syhn9bYBLWQ8mWYhugOwGwXH8WZ+iVGpJzmB9rtnUJSRyAnM89Jj
	forF7yD2/4wtH/KH/uCDXMiPy3xwEBUAmbMq7kJ5wxfhU0mcQn/4FGrqVe8ie7j+RKdR3/scI=
X-Received: by 2002:a17:907:d109:b0:ba5:3e3a:81ee with SMTP id a640c23a62f3a-bb804a2b561mr219136166b.39.1777382417992;
        Tue, 28 Apr 2026 06:20:17 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80b887edcsm101646766b.47.2026.04.28.06.20.16
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 06:20:16 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-671ae79e617so14638419a12.3
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 06:20:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8nUY9KZyEHGZjEE5Y4jviifcWflygla8ZmJ1LPeuGGiO09U5ANx1qrO0H2dAHlhYVGSy3aiUfld2j1@vger.kernel.org
X-Received: by 2002:a05:6402:324e:b0:66e:431a:c72 with SMTP id
 4fb4d7f45d1cf-679bb04acebmr1055930a12.5.1777382415846; Tue, 28 Apr 2026
 06:20:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317101627.174491-1-biju.das.jz@bp.renesas.com> <20260317101627.174491-8-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260317101627.174491-8-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Apr 2026 15:20:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVDCSUdihaO-ciEbemRqG92f+vydC8FnVX40b+LHuuP8w@mail.gmail.com>
X-Gm-Features: AVHnY4LNzhtqD7Hg54dY6b7ja94gT4UdWmWqGBjWo24voRsyGFM5uceybjh7Pr0
Message-ID: <CAMuHMdVDCSUdihaO-ciEbemRqG92f+vydC8FnVX40b+LHuuP8w@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] pinctrl: renesas: rzg2l: Simplify rzg2l_pinctrl_set_mux()
To: Biju <biju.das.au@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 356F04866EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-35703-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.628];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,renesas.com:email,mail.gmail.com:mid,linux-m68k.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Hi Biju,

On Tue, 17 Mar 2026 at 11:16, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> The port and function selectors are evaluated multiple times
> in rzg2l_pinctrl_set_mux(). Simplify the function by dropping
> dupicate evaluation storing them in local variables.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -681,16 +681,18 @@ static int rzg2l_pinctrl_set_mux(struct pinctrl_dev *pctldev,
>         for (i = 0; i < group->grp.npins; i++) {
>                 u64 *pin_data = pctrl->desc.pins[pins[i]].drv_data;
>                 u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
> +               u32 port = RZG2L_PIN_ID_TO_PORT(pins[i]);
>                 u32 pin = RZG2L_PIN_ID_TO_PIN(pins[i]);
> +               u8 func;

unsigned int

>
> -               ret = rzg2l_validate_pin(pctrl, *pin_data, RZG2L_PIN_ID_TO_PORT(pins[i]), pin);
> +               ret = rzg2l_validate_pin(pctrl, *pin_data, port, pin);
>                 if (ret)
>                         return ret;
>
> -               dev_dbg(pctrl->dev, "port:%u pin: %u off:%x PSEL:%u\n",
> -                       RZG2L_PIN_ID_TO_PORT(pins[i]), pin, off, psel_val[i] - hwcfg->func_base);
> +               func = psel_val[i] - hwcfg->func_base;
> +               dev_dbg(pctrl->dev, "port:%u pin: %u off:%x PSEL:%u\n", port, pin, off, func);
>
> -               rzg2l_pinctrl_set_pfc_mode(pctrl, pin, off, psel_val[i] - hwcfg->func_base);
> +               rzg2l_pinctrl_set_pfc_mode(pctrl, pin, off, func);
>         }
>
>         return 0;

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

