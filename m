Return-Path: <linux-gpio+bounces-7172-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8168FCEAC
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 15:14:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF780283FDF
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 13:14:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6ACF195FF7;
	Wed,  5 Jun 2024 12:33:11 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC6019D88B;
	Wed,  5 Jun 2024 12:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717590791; cv=none; b=WNLN5BBWh8zyta+IXLiEh1uV1Hohb00Me5X9zfkjgcv74J62ZwzqEgYfcLaWn6pRvvSV/tRo3deoLBJXVbh8hj9PFpWzM4n4W3S0i52jUWZojpVzq2jRyBytLB3eley8IqowgIKGLF18NPw4nw/z+kufF6S4j2pmY6XVT1fY0Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717590791; c=relaxed/simple;
	bh=hqgiPbTxuUPwd6oAxJ/pEfDW5K2k/hwU5oOJo/VQyCk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F7qEN0n+sfwgoiQzKOovrjIxFMj977sjyug854JSqO7llTEqKyUTV34AHX2hAOR1jQCNXbSO5WtCSrtWcqENeZ1V8k9XFNwrtUNccuc/sTYZx5FTISF9Hi5VhuNRxFahfhx8Fg50YuqlE/3y+o/8snMibWkzT2VIIoQWWg1ij2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-62a08b250a2so23555977b3.3;
        Wed, 05 Jun 2024 05:33:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717590788; x=1718195588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SnslpsTkxq1BUdjKUxyNngzADoWBlrSm/gd/INeh4LA=;
        b=uCy5J5oJJMq6n7QqdFKFza4QNtvC+skXFrfySuWVkS6aHredJGQY+6CK9lpcW8jelF
         fXETK/yl2iMgtDYH1tlLrDNa34oUZ7vuFKFB4TOdAXssHpxGqmt9w+l3wFQAQrqJC3vA
         TA+IZ5fJe7pvqyhNjaK2J+g6e5vtMHAFoRMIUvY18lFLGq50Z18BoJROp77k5HrjYvgz
         iViaJmXbjDajbbDy9mlFmmgaxvXRwAPucDc+SYsSOl3lkHC35UUf+mhc5DcdtPABjDUK
         OM0Hea/1MsMLozasYnusofHgKXjGKKsKbZ0V+TrkMTc8XS+lbDZM/Ynb1YcydxmPxGsk
         xmYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUavLoHyGcCfqbg9zNPIOLw8sslBgBy8iDvpeXIZcNdf5hHpTwjQuxHnkrhqkxu56+Z0w/gVFs74lSNjxVkNZ5Lb0Lp/Vz8s8rvi4E2WPNnt8S0ByKHUE8PKP8sOFFQfd2OMDoTlhazBrNkL7TQaFrwxYd2GbtwFfpSp+Gxfj2e2pd1Rr0wtFmTI2eUlA8S5QPYqrP4LfoSRymzMoUHmm1C0qVMLvp9dw==
X-Gm-Message-State: AOJu0YwWvJJTOA2AZWxlG2wRL2fmfTj45vs2ONtH+lfGZhXzYOlsVb2L
	zN3+UO4Ev1ccnxKeDURWtDk7v5WvZkNy04mS+Pkj0xFltEozUv7/ayHKP/KQ
X-Google-Smtp-Source: AGHT+IFkImrkK7qPRPe6sDGEmdkLVhdG2TDFZ2BctWFrFgh23fK3+mC01TrtKZK66DI710XUBVtGtA==
X-Received: by 2002:a0d:d8d1:0:b0:61a:ae79:816a with SMTP id 00721157ae682-62cbb515ce7mr22331867b3.31.1717590787656;
        Wed, 05 Jun 2024 05:33:07 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62c765b7ec1sm22113827b3.10.2024.06.05.05.33.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jun 2024 05:33:06 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dfa584ea2ffso1811966276.1;
        Wed, 05 Jun 2024 05:33:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX6Bg31JF+Cpt432tgMSchRWDHwhD6xhCUYFm44MU3+U4wCXPti5SOhfPfbT5Um4wvwLYKSQQARbomyFSmK0WBYxwLrraTRd74cW0juEgt/RX0zIoc4HZM0gow0BtMQFa/FGW6jhCjx3jasIjE2lSWj+X74vEcn4oc5xSvSyd2+5iMs4sbCURaNSkIdXlkbuPAYFxdQK4ql27LDJ75hvcqwp/crGqwF9A==
X-Received: by 2002:a25:aa72:0:b0:dfa:5748:124c with SMTP id
 3f1490d57ef6-dfacab1ab0cmr2235065276.10.1717590786252; Wed, 05 Jun 2024
 05:33:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240530173857.164073-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240530173857.164073-15-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240530173857.164073-15-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Jun 2024 14:32:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU5tYSF7m435F=sBS0FjoZ=q7D4RsufRYLbNVzKArUYPQ@mail.gmail.com>
Message-ID: <CAMuHMdU5tYSF7m435F=sBS0FjoZ=q7D4RsufRYLbNVzKArUYPQ@mail.gmail.com>
Subject: Re: [PATCH v3 14/15] pinctrl: renesas: pinctrl-rzg2l: Acquire lock in rzg2l_pinctrl_pm_setup_pfc()
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Paul Barker <paul.barker.ct@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 30, 2024 at 7:42=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> To keep consistency with rzg2l_pinctrl_set_pfc_mode(), acquire the lock
> in rzg2l_pinctrl_pm_setup_pfc() during PFC setup.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3
> - New patch

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -2541,7 +2541,9 @@ static void rzg2l_pinctrl_pm_setup_dedicated_regs(s=
truct rzg2l_pinctrl *pctrl, b
>  static void rzg2l_pinctrl_pm_setup_pfc(struct rzg2l_pinctrl *pctrl)
>  {
>         u32 nports =3D pctrl->data->n_port_pins / RZG2L_PINS_PER_PORT;
> +       unsigned long flags;
>
> +       spin_lock_irqsave(&pctrl->lock, flags);
>         pctrl->data->pwpr_pfc_lock_unlock(pctrl, false);
>
>         /* Restore port registers. */
> @@ -2586,6 +2588,7 @@ static void rzg2l_pinctrl_pm_setup_pfc(struct rzg2l=
_pinctrl *pctrl)
>         }
>
>         pctrl->data->pwpr_pfc_lock_unlock(pctrl, true);
> +       spin_unlock_irqrestore(&pctrl->lock, flags);
>  }
>
>  static int rzg2l_pinctrl_suspend_noirq(struct device *dev)

It's definitely safer to unlock only while holding the lock.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

