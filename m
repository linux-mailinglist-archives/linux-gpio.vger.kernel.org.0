Return-Path: <linux-gpio+bounces-37819-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sAEnDJjSHmr8VQAAu9opvQ
	(envelope-from <linux-gpio+bounces-37819-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 14:54:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C5E62E30B
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 14:54:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37819-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37819-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BBCFF302166B
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 12:54:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1CAC3DD87A;
	Tue,  2 Jun 2026 12:54:25 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F60A3DB306
	for <linux-gpio@vger.kernel.org>; Tue,  2 Jun 2026 12:54:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780404865; cv=none; b=iuhEb8t1MybApCIOMdbL1P11QafRui2wrYP07tTFL4CQHxuVnNLSmUSx684tVi3TDz1kQ5quI/m8VW7mdG/84HIobUDkQIHJOc+OEKBavCUiZ8MDkwGLIPEWxVVV513A0RaEqpZESRWqCPZ7CcaBr/KX57b2VQhgotOaBtrEFJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780404865; c=relaxed/simple;
	bh=Sn677f1avDZkCsXDJK9ax5cLUEJm/EVUXZTw1JXjsYA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NCvgppUM6YMpCcxgnEpZ2hfCK7DM/YEqSkVhBdnT4GXq7jlBTuk4UJrRkO6oayXCZAhpcFnSFrPm0d2tnboKi1LQtGAzlwNcYiBAtZ5lBYNwdg50C1oY+UAbS+AwM/tX9zO5vZDQO9zmYTLtSovC2kT/tk6qRytIac0/cuVtRbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-59be89d310aso2446971e0c.0
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jun 2026 05:54:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780404863; x=1781009663;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wi8lw9em5f2a38ue4BrDD+pK8F7cdkfj8OF9muR3yps=;
        b=CmbaOo4+DpelEPRXIRBjX2zrTl9k3CHnxV8/kdZipAZc/Rzq+zqI7dPZ+zg1ehD1+L
         xzHORDpP4ONJGS5CJYZMQQI9fd8x/HFQldwisgsgWCSLICGLLIkb9VnhxMhckp6kPHrU
         9ldlqgqR6YVgBxn6VAZvmPMCRsCHKhpND7oQwq9X8GD8v4iU3PrhIbgBet7xz1RTg0uq
         8Q5H1CsYhEV0wq9F4W/qXb95i/cCObF2q1S02DTFivM71w96q79wJZYKjCppSVZCqjJ0
         qawG9/NWDa9nkfXFNV5gvrzzXlvhmv0AiuR+RWEeR9iDjko/tfndMIpoC+HtYBRESI4a
         dH7w==
X-Gm-Message-State: AOJu0YxFvbP3dVE5/z1ZttnVtAqsiF7e+G+rg7zTf6CKCp9fKNlsqhaV
	6PoalcTYgxTwe6jo9G8PL1sorCdg8IOs2GXqJttZ20pUnckWNc5wRT3ZjhGq1sKRQ10=
X-Gm-Gg: Acq92OHUXZFjw0U/JiTCj5fO+QakyJbEmJA4WAPnTFKgRhA0wHF9zBihdqoiYAMj6Sa
	LCxzNLfbVJueDy4rl7wSmjt6VBBgACfHoGBiwdftBj/9J3eCE5NbKRTC4X8gBYa9uElVdNSzhw4
	XQoGAwlE5TAyhbUeFCq3qvrx5RuPqPE/GmhNbW5ju758MzOUoR6rghku7BxdynEfETynx0JIN0E
	hIzreR/YvjfaTho1robaBJekSsOPH7/AkanC5+GqmxBzWC02umeRXMtO39PUKlVSr96wSszl4HE
	Nar2A4wrJn45kt+W2QM2cGMlLtdzLXgpLs/cjrqAbnLPYLTHRsKR68U4nklsuhlXyNp2XM1IADf
	dvvjHht5jeq4MV7iw0XmlPaa/w3K5+WFJJCO04iRa1snqsXNPTN24EujgfKwtDBlFzYOIT9WYM7
	NC95A266G4makUSQP/M+Qo7QxdgTXkhW48QUngNg7k6PgDirEKFpxHV3kzbtrxFcCZ5JfzgoM=
X-Received: by 2002:a05:6122:46aa:b0:575:f155:8cd4 with SMTP id 71dfb90a1353d-5a3f5c794aemr1874639e0c.0.1780404863125;
        Tue, 02 Jun 2026 05:54:23 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5a3b68647c7sm3486551e0c.6.2026.06.02.05.54.22
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 05:54:22 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-6c6507549c3so2024565137.0
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jun 2026 05:54:22 -0700 (PDT)
X-Received: by 2002:a05:6102:604a:b0:643:80f1:350f with SMTP id
 ada2fe7eead31-6e1841a6973mr1450406137.21.1780404862675; Tue, 02 Jun 2026
 05:54:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260527202317.5347-1-rosenp@gmail.com>
In-Reply-To: <20260527202317.5347-1-rosenp@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Jun 2026 14:54:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUcqeaPmDPUDa-rWJjxQAsY6jfaQfMTtJJ3bUK-Z_32cQ@mail.gmail.com>
X-Gm-Features: AVHnY4KDMTL0q4heTM07BlcY3ivbV4ExX8CD9RluKc_4RyO9BG5F3XDi0rlWYyw
Message-ID: <CAMuHMdUcqeaPmDPUDa-rWJjxQAsY6jfaQfMTtJJ3bUK-Z_32cQ@mail.gmail.com>
Subject: Re: [PATCHv2] pinctrl: rza2: embed pins in the priv struct
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	"open list:PIN CONTROLLER - RENESAS" <linux-renesas-soc@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be|_ptr)?b" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37819-lists,linux-gpio=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:rosenp@gmail.com,m:linux-gpio@vger.kernel.org,m:linusw@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hardening@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,glider.be:email,mail.gmail.com:mid,linux-m68k.org:from_mime,linux-m68k.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 89C5E62E30B

Hi Rosen,

On Wed, 27 May 2026 at 22:23, Rosen Penev <rosenp@gmail.com> wrote:
> Turn the separately allocated pinctrl_pin_desc array into a flexible
> array member of struct rza2_pinctrl_priv, annotated with
> __counted_by(npins). The pin count is now computed before allocation so
> struct_size() can size the combined object, collapsing two allocations
> into one.
>
> Change npins to unsigned int to avoid potential overflow/underflow
> errors.
>
> Assisted-by: Claude:Opus-4.7
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  v2: use unsigned inr

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rza2.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rza2.c

> @@ -289,21 +289,17 @@ static int rza2_gpio_register(struct rza2_pinctrl_priv *priv)
>
>  static int rza2_pinctrl_register(struct rza2_pinctrl_priv *priv)
>  {
> -       struct pinctrl_pin_desc *pins;
> +       struct pinctrl_pin_desc *pin;

I will drop pin...

>         unsigned int i;
>         int ret;
>
> -       pins = devm_kcalloc(priv->dev, priv->npins, sizeof(*pins), GFP_KERNEL);
> -       if (!pins)
> -               return -ENOMEM;
> -
> -       priv->pins = pins;
> -       priv->desc.pins = pins;
> +       priv->desc.pins = priv->pins;
>         priv->desc.npins = priv->npins;
>
>         for (i = 0; i < priv->npins; i++) {
> -               pins[i].number = i;
> -               pins[i].name = rza2_gpio_names[i];
> +               pin = &priv->pins[i];
> +               pin->number = i;
> +               pin->name = rza2_gpio_names[i];

... and simplify this to

    priv->pins[i].number = i;
    priv->pins[i].name = rza2_gpio_names[i];

while applying.

>         }
>
>         ret = devm_pinctrl_register_and_init(priv->dev, &priv->desc, priv,

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.3, with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

