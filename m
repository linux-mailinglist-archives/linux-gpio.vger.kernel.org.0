Return-Path: <linux-gpio+bounces-34216-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKh/EhddxWlM9wQAu9opvQ
	(envelope-from <linux-gpio+bounces-34216-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 17:21:43 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7913384BB
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 17:21:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4972F30BB832
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 16:13:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04A1C40B6D7;
	Thu, 26 Mar 2026 16:12:17 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D53402453
	for <linux-gpio@vger.kernel.org>; Thu, 26 Mar 2026 16:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774541536; cv=none; b=E2bEcQrxtOkObXjAXiuic67HIvBl7oWLIZpEofIpElscM82gLw+5HHAx9xA+Q146DDPH0ugky0wMQzAcsbiXKl5Lehsssqn5dQ0ECBM/1beLRSLo76nZbauW55prmISiO91+relux/rPAPPz0SZwEMQxIYtOJ06yd4kbGjh9Afg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774541536; c=relaxed/simple;
	bh=rNsqYs9XZiNIs58rpzMtgeYcYIlt3WXgo1ohw4icZf4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PQjIqkCSvdT2rFzy9SO8Lzm7X9h+4+gVohNtdB6HdLuMILZeJ578nhsUj5ogfLjnGKE9E0aq0tv81bsgyVO+5G6RzSdkgTbmz0ZvYJewy6xRPjfPLx2u9Zk1QgqV4KQzV2I2nO1es50BjLM+tRj+On5PXUy3HK38Y5zy64H180w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-94de88e52e5so692595241.0
        for <linux-gpio@vger.kernel.org>; Thu, 26 Mar 2026 09:12:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774541534; x=1775146334;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uSoOoWFbk127jfYcbLQVHGWRDLpMWSdUjX9Ohf2bfKM=;
        b=GvkTJBXjsFDOyS7XkfAuVur/x94SyhnDa3hfIKt15MR/00wMKeiw0kT8mPQWuPsHGX
         QJP+pMuEU/2/isp7t4/ExrATcOMoIo8JpCKoeeEtCX7R/tU6Xxz5fi56grALw0DDUZHr
         TaysMh9WIK3hmkirAM1MG9X6Judl1hzVqkcYZYBUHb1e5hImKRd/AeH/nWL9Uyr5NbtP
         cbGVcUAw8SPpRShvn9SFkDF97UVajN774v6j8atsk6I/lFbeNWmOZbmil1Z28c9DOBg3
         jQyp7m8/471+RtIlUH3+blqrfdO+wmPtBApJZ/13HSOe6LL6ID602qdXjdmqLMIP46bQ
         rpBw==
X-Forwarded-Encrypted: i=1; AJvYcCWVY25bFuEXZBp93nAmjGYHOkYDk0xL9EaVIHDmh1QB3tkxouKyR1Sxu+navdXHJyITGH0p+tvNTpQl@vger.kernel.org
X-Gm-Message-State: AOJu0YwlrKsYmWgVA85ZChnK8Sv7nVGTB5oqS+2SmyIDJWzE+FH2fGf3
	uZtZmOk+9AnLQa7urpEOIErXUAKAdEGALWAN/ivSNxBE15J8c4i3OAsittnHn67DD40=
X-Gm-Gg: ATEYQzzDMcLeko+madWipY9AMg4JwytwA9bpG763mAQdc6Cn5nu8v6H3cqjK6wY4n10
	/AzSlnE9dYgdKBl416vHCN5O3qRl6BOcoCy00Lh6cF81kHIQ30gM51raULB3lPQNuQTl5BRs98h
	P11NSgV3VqyyFo9jyKkcN1kje7RQchvLXmYM6pOukkpUm10BliFNYyZlNHIe31t62r5nsyON33F
	133Oz9805liwYpzC6db+mW8fm7vFoYD0OHful8tzL76PZ9sCkjRfPsTTQHScah5R4SNhW+ZREJl
	HkvkCcwXKOmjvyPZQl4QsqpvQ8CeM4VN7O75s84WlnHKx4rA6UIySJbnT+rLTzpf26jW4rYM90G
	FJ9iBwb2yf9JUlGjOQi2srkurTLD9f6pTTr+7D1PEMwoeG5ivC5h5K3Qmf7j/oudv2lsmwv4PHm
	jIo+uUzMbtUfAr52w/xq/JnWutyPrhgcKWY3kkU4ecgO6iFGJtViXARatwxrPO
X-Received: by 2002:a05:6102:161e:b0:602:9228:34a3 with SMTP id ada2fe7eead31-6036ce3c8a6mr3709868137.0.1774541534249;
        Thu, 26 Mar 2026 09:12:14 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-951be1063bbsm4098426241.3.2026.03.26.09.12.13
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 09:12:13 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-9537f59572eso177256241.1
        for <linux-gpio@vger.kernel.org>; Thu, 26 Mar 2026 09:12:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCURZr9u5AkUs/zEwAQTC2u4XAJZ/dSJUx1CGzhRve0JOi9rVtG/3TW+bmq3xBT2IxTlT/mf6Eh0AeyV@vger.kernel.org
X-Received: by 2002:a05:6102:6c4:b0:5ff:1cc2:aa8c with SMTP id
 ada2fe7eead31-60387536b11mr3781605137.36.1774541533179; Thu, 26 Mar 2026
 09:12:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319141515.2053556-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260319141515.2053556-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260319141515.2053556-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 17:12:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXzWFHxeyR4Z4fLUc-QhwPK1RnB5VTzQODjzoR6oDwKHg@mail.gmail.com>
X-Gm-Features: AQROBzB4lDDc6Paz2lavGGOEVw_oYmGOkaXAJNxgaMlSXZ2W_dPOAbJR1CHRwrA
Message-ID: <CAMuHMdXzWFHxeyR4Z4fLUc-QhwPK1RnB5VTzQODjzoR6oDwKHg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: renesas: rzt2h: Add pin configuration support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-34216-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MAILSPIKE_FAIL(0.00)[2600:3c04:e001:36c::12fc:5321:query timed out];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux-m68k.org:email,glider.be:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: BC7913384BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Prabhakar,

On Thu, 19 Mar 2026 at 15:15, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add pin configuration support for the Renesas RZ/T2H SoC. The RZ/T2H SoC
> allows configuring several electrical characteristics through the DRCTLm
> (I/O Buffer Function Switching) registers. These registers control bias
> configuration, Schmitt trigger input, output slew rate, and drive
> strength.
>
> Implement pinconf_ops to allow reading and updating these properties
> through the generic pin configuration framework. The implementation
> supports bias-disable, bias-pull-up, bias-pull-down,
> input-schmitt-enable, slew-rate, and drive-strength-microamp.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - Updated commit description
> - Dropped 32 bit reg access for DRCTLm registers
> - Switched using to guard for locking in rzt2h_pinctrl_drctl_rmwq
>   helper function
> - Dropped using RENESAS_RZT2H_PIN_CONFIG_DRIVE_STRENGTH instead
>   switched to using the standard PIN_CONFIG_DRIVE_STRENGTH_UA

Thanks for the update!

> --- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c

> @@ -54,6 +56,16 @@
>  #define PFC_PIN_MASK(pin)      (PFC_MASK << ((pin) * 8))
>  #define PFC_FUNC_INTERRUPT     0
>
> +#define DRCTL_PIN_SHIFT(pin)   ((pin) << 3)

"* 8" sounds more logical to me.

> +#define DRCTL_DRV_PIN_MASK(pin)        (GENMASK_ULL(1, 0) << DRCTL_PIN_SHIFT(pin))
> +#define DRCTL_PUD_PIN_MASK(pin)        (GENMASK_ULL(3, 2) << DRCTL_PIN_SHIFT(pin))
> +#define DRCTL_SMT_PIN_MASK(pin)        (BIT_ULL(4) << DRCTL_PIN_SHIFT(pin))
> +#define DRCTL_SR_PIN_MASK(pin) (BIT_ULL(5) << DRCTL_PIN_SHIFT(pin))

I will drop DRCTL_PIN_SHIFT(), and replace it by "((pin) * 8)" while
applying, for consistency with e.g. PFC_PIN_MASK() above.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

