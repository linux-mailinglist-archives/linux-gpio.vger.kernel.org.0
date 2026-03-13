Return-Path: <linux-gpio+bounces-33352-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAdQJnEOtGlvfwAAu9opvQ
	(envelope-from <linux-gpio+bounces-33352-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 14:17:37 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AC7283956
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 14:17:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 72C0A304A8BA
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 13:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F23C913DBA0;
	Fri, 13 Mar 2026 13:15:31 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24CD1990A7
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 13:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773407731; cv=none; b=JOoGsKxGZUWmTzo0dOuWnAchyFh97vgt23Zjh+gbu9w/3fI2y7GyyAsMCA8UNWbXu1MuvG7Z09T9MmoETPlhRXS1LHTun8UyjzAmSi5OQ/4+lj3mu6dX1lmsa8XKwfkk1afwbYRP2z9VCqHSKdKDVMJj/fHVYEkpXrFz+HproG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773407731; c=relaxed/simple;
	bh=FD5ekiLOOBJChecwQG0dJl1knwV67wRC3yOiIGyhM2o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CGu2eU5N4vKWMDW7iu8shyksZ/bBqSAUjLMHEsTknUc6lAnmRqzPdGs1QD10oOBs65NhjLWTXn7poLT3GlsfGkopHL2XfBtsqXPvQ04A1f6XBnsEA5TD/4AtrKtRMDEJLV+Vc5ECoFFTcF1sD6Rto63xZI0GPV8cOOnuhQml8I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5fff52ab292so619303137.1
        for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 06:15:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773407729; x=1774012529;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5IMCEYZjdyKVwdjBQt6YE34M1pH2EvbKGqyAdLQ6lqA=;
        b=N+WoYp4YrdWl44R0KheGIiCxd2IoA/L/kty5fJRgAO9zBMbwNuDRCtnSo3ep/Qo/um
         J1SmIVVL6dbIkleAQmVWDa996DDZeVvAMNv/QG/gk7Ld5g0sGI6Gv/o3I+XSzY4NRx6c
         N85teLZawdfU2NiSv748s4H8uaFiIp94TMwIVOXlv0BqhKqlZfg30Ib+DvntYwMxA/46
         hLHfUG83chQDNVQxs91HGoj/HcwtyhGbu4kptV7QXK5U74Mk+RjfTmPYD63BFP2wsare
         wKLiXx4cApYsRuqJJXJBcvcCJNyqDQKHJfEM/wTbH0qXrsyyC93WzC65eiwa/PeTcvow
         0WTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDoRkT5XGsuf7tb1ej2Jq/DAPdQrTJmmmtZGV1GR/ziQsqXlg0hdAWnLHMZdtKl4/GP41P+zzgCiUa@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1jKBfvl6UtMGA6x4ubXuK4PW9yEQpdqlWk1re25t9m8Q3Sat/
	PQzQVjcb0h5LHIEntcsCvATyhLCw/tQl6e9APjZ/cah5o1vhGqe4Hx3SrexYhCoukA0=
X-Gm-Gg: ATEYQzypsIY9gETB63VDUW8RQSnb9D7zSKUfKCeqqU16xWtTiOakd+qyBf//hZf1q08
	CdUx7czAoi1y1Wu0cWVoaVorpk20RXnFVYa/D+5oTYBb+vuv+vgV/MSLQCaGA14b8hL4cDJOI6a
	L5LHChnUQT3kY1ZrehtpIis1zhHQ6xyNbdAeJ9NgBi0yByRPKNh/mYSleZNzOP8evcYpNMy17BG
	+Pnuju58SEngvPLtW+HPMwuG+fVGYXhNlUqha/408vvfghnxRq16LQqkNLnvKONHvLD67t0AcPU
	u/i5BW3J3fBXpS0hzBo3ptEgS7VyzWzHLmNEAiFh9TJjTuGE4Prbxs2HAyYU7rv9tMnosgjgsTM
	tYFnERy+nazJoTWBiAod87XpwNNyJJAISZG81bURiGTXzrs0sOOnh+Qs/jQc1BCrdSHG3iHffH5
	2iGIzaMFJt+QE8E2dZG6O+H0wY4SwuWx5/Xf9gIqXEUtvKXyY1//sCkGswD4Z1sDZ+
X-Received: by 2002:a05:6102:dd2:b0:5ff:219b:497a with SMTP id ada2fe7eead31-6020e1aa7e9mr1237933137.3.1773407729388;
        Fri, 13 Mar 2026 06:15:29 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-601de74a9a5sm3158417137.5.2026.03.13.06.15.28
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 06:15:29 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-56b17c0223bso857980e0c.1
        for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 06:15:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUNnZGlPpz4b+w1li5Az6AaZfVRpIeX/vklFnhTPj07yrpR5M3rZ0x4hE9FlnZjAIRSQRZRHHV5V8KH@vger.kernel.org
X-Received: by 2002:a05:6102:304d:b0:5df:8f4:61e6 with SMTP id
 ada2fe7eead31-6020e59d4f6mr1216341137.32.1773407728697; Fri, 13 Mar 2026
 06:15:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260218151925.1104098-1-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20260218151925.1104098-1-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Mar 2026 14:15:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWv1dQ55NcwMga_X0G8K97RgMRXoDu_FV10fNQv7AadbA@mail.gmail.com>
X-Gm-Features: AaiRm53MA-SJ4NIehTNXTLcQgD9txV-qYKgCrRyK2DnKPdvwRUSvj6k_ZDhmScM
Message-ID: <CAMuHMdWv1dQ55NcwMga_X0G8K97RgMRXoDu_FV10fNQv7AadbA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rzg2l: Add GPIO set_config
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: linusw@kernel.org, brgl@kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33352-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,linux-m68k.org:email,tuxon.dev:email,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 17AC7283956
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Claudiu,

On Wed, 18 Feb 2026 at 16:19, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Add GPIO set_config to allow setting GPIO specific functionalities.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -1848,6 +1848,25 @@ static void rzg2l_gpio_free(struct gpio_chip *chip, unsigned int offset)
>         rzg2l_gpio_direction_input(chip, offset);
>  }
>
> +static int rzg2l_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
> +                                unsigned long config)
> +{
> +       switch (pinconf_to_config_param(config)) {
> +       case PIN_CONFIG_BIAS_DISABLE:
> +       case PIN_CONFIG_BIAS_PULL_UP:
> +       case PIN_CONFIG_BIAS_PULL_DOWN:
> +       case PIN_CONFIG_DRIVE_OPEN_DRAIN:
> +       case PIN_CONFIG_DRIVE_PUSH_PULL:
> +       case PIN_CONFIG_SLEW_RATE:
> +       case PIN_CONFIG_DRIVE_STRENGTH:
> +       case PIN_CONFIG_DRIVE_STRENGTH_UA:
> +       case PIN_CONFIG_POWER_SOURCE:

Shouldn't you handle all types that are supported by
rzg2l_pinctrl_pinconf_[gs]et()?

The following are missing:
PIN_CONFIG_INPUT_ENABLE
PIN_CONFIG_OUTPUT_ENABLE
PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS
PIN_CONFIG_INPUT_SCHMITT_ENABLE
RENESAS_RZV2H_PIN_CONFIG_OUTPUT_IMPEDANCE

> +               return pinctrl_gpio_set_config(chip, offset, config);
> +       default:
> +               return -EOPNOTSUPP;
> +       }
> +}
> +
>  static const char * const rzg2l_gpio_names[] = {
>         "P0_0", "P0_1", "P0_2", "P0_3", "P0_4", "P0_5", "P0_6", "P0_7",
>         "P1_0", "P1_1", "P1_2", "P1_3", "P1_4", "P1_5", "P1_6", "P1_7",

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

