Return-Path: <linux-gpio+bounces-32423-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cG4YBFrqpmnjZgAAu9opvQ
	(envelope-from <linux-gpio+bounces-32423-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Mar 2026 15:04:10 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4611F0FFE
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Mar 2026 15:04:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 49C723068FE0
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Mar 2026 13:54:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6355E36607C;
	Tue,  3 Mar 2026 13:53:21 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199B336493E
	for <linux-gpio@vger.kernel.org>; Tue,  3 Mar 2026 13:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772546001; cv=none; b=S55i7cMhLL1WyNRYmIWjo+prZUvcrXVMcjKm9SSpjydJiCrqCiZEHNRG6knhAuDuVXIbQrw+oo+xnH25pAJjgZAdyr41QgXwhOko34Rlsd7IfCXQIkgJHOz8fSnIjaxcAine52n7TycBtGe5sQMtHGJK5OoI+iTYbbMiGQbh2rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772546001; c=relaxed/simple;
	bh=CLpy3oVfBpno5pNtd654a0t44zAg8ABNYi8W5CRKakE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gvs+qj7KIgmd8RU0+LgVbgQGzZ1opDL0INwoI9vwUxstbaM50FRrWn945yv6kYv77aRE7dDGPeQ7AaFl55MJ2bWT7K33ilIP93TTiF8mzMwfADRD9bZDV2zu9rAzaOL/YhVG12tw3mt0kLaYEqYcPpmuSvapj9trYIpCeYYUjxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5ff9ef0a426so27954137.0
        for <linux-gpio@vger.kernel.org>; Tue, 03 Mar 2026 05:53:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772545999; x=1773150799;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ftlyiDWQ8XObPCVS8E03AqNdtSao1cmOMFUjNen6Yhc=;
        b=sYjjbRAdmfGFXRk8soOXgjVvIOPNoCVijv6lr2JMIlaKLAycKjaAQDItD/R2TgCGNL
         ItxqI5YZHDKZ90kPro9Q4Xwkj/yW+WovJn3aexXVA3qMEdRM0nXj9CML3dP1NOBNzJ1R
         Zy+hH978z6vn2EDYzes2SHHXwYyQRtx3wakqapmqQSBk0Sxk7iwyNR5jKZcv6LpQUeHP
         kd5YNTquL14l/yBkPp8H68DynFqJSsT8lqKMbRt2lkyd39ZK7RWPDbFUtmRiOZk8jtYA
         4CnyH5hl2Ejn/4JtV0uSULHPVJmwMWER84zOMdwcX1Yu1tmhch9ACNVmMtwZVE2FPmr9
         JWfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDQ0RtFqwy/Sg8kOncRwSHLulFZjwCxgdVy9yAPmRfmM7w8rK8uyYfv9FmIA+UbTdaG+Z59gmGisVV@vger.kernel.org
X-Gm-Message-State: AOJu0YyK8PZQla9FSE/gQYWi8d+yQ9QABR+w+Sbf4Yz5MlOp+uGbRhuo
	q8dSiNAwq7kmXLVmGkhkb/WuLT/DXCVbwwHlq5dNaCn7ekqK/mfa6wLZGn/L8m2Q
X-Gm-Gg: ATEYQzzWQjmbliCLZeArKsPTp2qTs/DcZ/mplgq6qqgRCltKwOFwW4BrpQVg9Lp9KO0
	jmUiuiKTye6Cw3ofg7E6Azy+Ajt0lbva5Oqu4xpMC9kf/Pa8Q2l1JSnZN68nU4aBGlHILcgTLk7
	c7iPJOo87fLNvikuKZatfIvs5HYohdwKVAwTM5Z/LP6tu/76BzHupn1nSdrffrDrnb8mV2ulAIK
	QjUfU05EztxBOtaW+z5qUHHGx7fgYsKMgzPoGA19AYR7v8akPnZqMfcZx/1TQ9iL0IDHZInbfKf
	uZToaRAIBvf5COL1b4GWZy/Jz0o/ymzlsuoqwplkQxNSe/irW8Dp7X4l2txWddtQtvKWwpHsM/m
	f3+cBerWITy2238CoqVOoGRgSggcnpZAQPOob5IoB0uRNsci7HOU1KmgsGx5nqMyyfFT0owIT/w
	2+XRZBGAn0JVlO1purwJL0NxhsKpn7OakubygfxcUogB9VugTi3MhfVeAjw5DgG41P
X-Received: by 2002:a05:6102:418d:b0:5f5:4eac:cd2e with SMTP id ada2fe7eead31-5ff3252f16dmr6102171137.32.1772545999097;
        Tue, 03 Mar 2026 05:53:19 -0800 (PST)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94df6417a98sm15583541241.4.2026.03.03.05.53.16
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 05:53:17 -0800 (PST)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-56753dc51baso2422288e0c.1
        for <linux-gpio@vger.kernel.org>; Tue, 03 Mar 2026 05:53:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVhVsKqMnI8OT1JgR06FKbbkHqFmI7GPpcEbjW59SVgkFdz76fdRbcGQ4cGY8382TBRzBHlFJ69f3QX@vger.kernel.org
X-Received: by 2002:a05:6122:7ca:b0:56a:9401:11eb with SMTP id
 71dfb90a1353d-56aa09f0b38mr6440166e0c.2.1772545995814; Tue, 03 Mar 2026
 05:53:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014191121.368475-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251014191121.368475-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251014191121.368475-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 3 Mar 2026 14:53:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWQeOa5L9QAMDMy-KSH=HiZeOpLnq+VewSTVbvWHosygw@mail.gmail.com>
X-Gm-Features: AaiRm503CgavmHGHdjX0Ja6Qo22cAvLU4FN50HhU_yNMMdgGQ2R4xUYUTQ3hqfw
Message-ID: <CAMuHMdWQeOa5L9QAMDMy-KSH=HiZeOpLnq+VewSTVbvWHosygw@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: renesas: rzt2h: Add pin configuration support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: AA4611F0FFE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32423-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	DMARC_NA(0.00)[linux-m68k.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	NEURAL_SPAM(0.00)[0.124];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,mail.gmail.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linux-m68k.org:email]
X-Rspamd-Action: no action

Hi Prabhakar,

On Tue, 14 Oct 2025 at 21:11, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add pin configuration support for the Renesas RZ/T2H SoC. The RZ/T2H allows
> configuring pin properties through the DRCTLm (I/O Buffer Function
> Switching) registers, including:
> - Drive strength (low/middle/high/ultra high)
> - Pull-up/pull-down/no-bias configuration (3 options: no pull, pull-up,
>   pull-down)
> - Schmitt trigger control (enable/disable)
> - Slew rate control (2 options: slow/fast)
>
> The drive strength configuration uses four discrete levels (low, middle,
> high, ultra high) rather than the standard milliamp values. To properly
> represent this hardware behavior, implement a custom device-tree binding
> parameter "renesas,drive-strength" that accepts values 0-3 corresponding
> to these discrete levels.
>
> The DRCTLm registers are accessed in 32-bit mode, with each port split
> into two halves (bits 0-3 and bits 4-7) requiring separate register
> offsets.
>
> Implement pinconf_ops to support:
> - Getting/setting individual pin configurations
> - Getting/setting pin group configurations
> - Standard properties: bias-disable, bias-pull-up, bias-pull-down,
>   input-schmitt-enable, slew-rate
> - Custom property: renesas,drive-strength
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Just a minor drive-by comment for a patch that is still WIP...

> --- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c

> +static void rzt2h_drctl_rmw(struct rzt2h_pinctrl *pctrl, unsigned int pin,
> +                           u32 mask, u32 val)
> +{
> +       u32 port = RZT2H_PIN_ID_TO_PORT(pin);
> +       u8 bit = RZT2H_PIN_ID_TO_PIN(pin);
> +       u32 offset = DRCTL(port);
> +       unsigned long flags;
> +       u32 drctl;
> +
> +       /* Access DRCTLm register in 32-bit mode */
> +       if (bit >= 4)
> +               offset += 4;
> +
> +       spin_lock_irqsave(&pctrl->lock, flags);

Please use "guard(spinlock_irqsave)(&pctrl->lock);" instead, to match
the style of the rest of the file.

Note that that will become "raw_spinlock_irqsave" soon, due to
"[PATCH v2] pinctrl: renesas: rzt2h: fix invalid wait context".

> +       drctl = rzt2h_pinctrl_readl(pctrl, port, offset) & ~mask;
> +       rzt2h_pinctrl_writel(pctrl, port, drctl | val, offset);
> +       spin_unlock_irqrestore(&pctrl->lock, flags);
> +}

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

