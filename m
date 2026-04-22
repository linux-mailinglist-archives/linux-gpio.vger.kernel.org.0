Return-Path: <linux-gpio+bounces-35352-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id APQqDmm56GkHPgIAu9opvQ
	(envelope-from <linux-gpio+bounces-35352-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 14:04:57 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C87A445AD2
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 14:04:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BA8B8300F9F7
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 12:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E2C32E6CCD;
	Wed, 22 Apr 2026 12:04:54 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5EF175A6D
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 12:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776859493; cv=none; b=TclIq+rbv7/y/vfenoe/r+nTb/HJ0mAcjLYy/vXFY6OJFgkIbPJ2j4VF18vXVwXoCXINYt/VUPRG0um7H88nJ3Nf7loFTcCuMiXKO5rSIZGWNmdfz7z0pw0C4eppUZMtw0nZAnp2XPO/CiO8w8ZibHbQdbLf5YtpPAm1gjNOros=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776859493; c=relaxed/simple;
	bh=heNJUHm5r9IeudYZX2feX2GOb6GdY81hvbpNQO/lRDI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mqMm2OgPt3m5Bec5BferkDFKGqgf5nUGgOibRy9ErX9bFnQw2febCTzevmx0ZWGh6mKd9nwGK2S+zN2mx+1Ahbq+kHruu38kzjLTnRXpQtQffSDJalFlRmnvAx+NU8WRXMCrMf7G5vcuqhDMbCY2ZY2WIRLViQPW/6TWpAjqDd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ba7a1cc0380so673664166b.2
        for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 05:04:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776859490; x=1777464290;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CSSaNDclY+hoXNdXjyqRLx9mMF7rFOkXAgklHu0Nry8=;
        b=Pmf/eJrCairOmotmHX8XRPKKvh7KvVMOGE8iYCpbmiL8Z0b8nwuBi7U+JTpzO3dnIS
         BMclj/b/nrViyuRddKUqe3xdcgzL9Srm5c06nNMSBwQXaC4dxy0B5rktmdSMuChHfCdV
         AuFUsDM+YOyoNvalf+I0q2E8E8Uu1QrSvquEb1Tbm7uA6NZFkoAYV7bD2uRiDKYkZ3pY
         XuiWzRkJ/wR6/AW5RjRSZ46igRPQIHXC7jZh8K3VVy/hwl//QdML5XDRa3PofK4S8fdR
         l9vhcwc2OVz95F/2FpPOt8W6qrsSbZawJFvgATPTY3NOPLMWV2fEf1PDDqWk0aUGaRLs
         pszA==
X-Forwarded-Encrypted: i=1; AFNElJ/iwfM8lhf/4OqnNpTqd+9qk5oZwmWyNN8T8J+m2tjOO3hYIxGiMXXIyW9G0LrQIrIesK/y1hfADMPt@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0MNRgqULiOa00bFeQjyE7G2abDk/+NXhnsYpbhgUN2aXAEssI
	QbXlc0hzSnBZ5+EnGLvu/a/B1/XeKVCCVj+4jqApHR/5Al+5cJ3bnGazrheSUnAsq2E=
X-Gm-Gg: AeBDieue8zSHlQYRjIqeo6c6GafFYTP8JBDVs+RiHn5lmGKU0c2kltub0Z4yRgI/dvF
	TdHea2opt/pypLk8RjvWW2G72XjcQiFL/j3Zcv2U8VBKSRpZ4HGLAHrPoqLWtWS91cVqMQ6VjNR
	17B6fdC2hgzus4ZgomLC96xzQu87UOGlDqseeWdOsaSH875lk6iYsG/qvSLa1EAfHF+UfDLHV1U
	gYwrosq7Qn8u9jan/2AdSK0YY6bUH95+0NDYw/zT4Fm5YAQYiW/ojHqqkzI5vyaU3RB4cct/p/K
	WmNgGHbTT8Rh2MtLz1uboe2bb2c9fSd46A6a2rRFUwf7ukH/MP6lKhGeze0xMCHik55lkKF75pD
	2Rpj7ZIdj2U2lxEwwmEVWYmNB6klnHUgscJmd6rFUVr7Cav60Nf9aBRh/G+pUdL2rYGiHv6HEPI
	HMxACb1KhdE7peGz8fzgrHRgpUNU6y3YLKsJjzIBp6kelUa31Lhfr/PuLtdiX1E5hbVKXy7IA=
X-Received: by 2002:a17:907:849:b0:b9c:69df:4d7b with SMTP id a640c23a62f3a-ba41aeefa42mr1140352766b.39.1776859490095;
        Wed, 22 Apr 2026 05:04:50 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1bf00sm529473966b.33.2026.04.22.05.04.49
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 05:04:49 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b9c3a9fe80fso752949066b.3
        for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 05:04:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9AtZ6XD2M61uz7Jdp4LawNont/cpMvFOBYgTbpAeoiK18zkc378Wz2+jSNe5vUKSfgIeH9npJYk+02@vger.kernel.org
X-Received: by 2002:a17:907:268b:b0:ba5:1970:2bb6 with SMTP id
 a640c23a62f3a-ba519702c56mr898304966b.34.1776859488923; Wed, 22 Apr 2026
 05:04:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413182456.811543-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260413182456.811543-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260413182456.811543-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Apr 2026 14:04:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWJCyurtvXfUFw8NA7RONgtf9XqqWvrcg0iWjPBCutSEA@mail.gmail.com>
X-Gm-Features: AQROBzDuK88y7skSIsbJm8EH5n7PJ8NFVloT8VUmIGD2wAxUgH48C7LtE8lF00g
Message-ID: <CAMuHMdWJCyurtvXfUFw8NA7RONgtf9XqqWvrcg0iWjPBCutSEA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] pinctrl: renesas: rzg2l: Handle RZ/V2H(P) IOLH
 configuration in PM cache
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35352-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-m68k.org:email]
X-Rspamd-Queue-Id: 8C87A445AD2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Prabhakar,

On Mon, 13 Apr 2026 at 20:25, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Include PIN_CFG_IOLH_RZV2H in the IOLH capability checks when saving
> and restoring pin configuration registers.
>
> On RZ/V2H(P), the IOLH configuration is defined by the
> PIN_CFG_IOLH_RZV2H capability. The previous implementation did not
> account for this, causing the IOLH registers to be skipped during PM
> save/restore.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -3033,7 +3033,8 @@ static void rzg2l_pinctrl_pm_setup_regs(struct rzg2l_pinctrl *pctrl, bool suspen
>                 }
>
>                 caps = FIELD_GET(PIN_CFG_MASK, cfg);
> -               has_iolh = !!(caps & (PIN_CFG_IOLH_A | PIN_CFG_IOLH_B | PIN_CFG_IOLH_C));
> +               has_iolh = !!(caps & (PIN_CFG_IOLH_A | PIN_CFG_IOLH_B |
> +                                     PIN_CFG_IOLH_C | PIN_CFG_IOLH_RZV2H));

Unless I am missing something, PIN_CFG_IOLH_RZV2H is only ever set for
dedicated pins on RZ/V2H and RZ/G3E, so this change does not have any
impact for now?

>                 has_ien = !!(caps & PIN_CFG_IEN);
>                 has_pupd = !!(caps & PIN_CFG_PUPD);
>                 has_smt = !!(caps & PIN_CFG_SMT);
> @@ -3131,7 +3132,8 @@ static void rzg2l_pinctrl_pm_setup_dedicated_regs(struct rzg2l_pinctrl *pctrl, b
>                 }
>
>                 /* And apply them in a single shot. */
> -               has_iolh = !!(caps & (PIN_CFG_IOLH_A | PIN_CFG_IOLH_B | PIN_CFG_IOLH_C));
> +               has_iolh = !!(caps & (PIN_CFG_IOLH_A | PIN_CFG_IOLH_B |
> +                                     PIN_CFG_IOLH_C | PIN_CFG_IOLH_RZV2H));
>                 has_ien = !!(caps & PIN_CFG_IEN);
>                 has_sr = !!(caps & PIN_CFG_SR);
>                 pincnt = hweight8(FIELD_GET(RZG2L_SINGLE_PIN_BITS_MASK, cfg));

This part LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

