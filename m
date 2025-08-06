Return-Path: <linux-gpio+bounces-24028-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AF28CB1C666
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Aug 2025 14:53:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DF903B6871
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Aug 2025 12:53:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D60828B516;
	Wed,  6 Aug 2025 12:53:44 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6716533985;
	Wed,  6 Aug 2025 12:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754484824; cv=none; b=guQ4r4x0GffhtJLAJqeLCy3rIpr2NFKBKwuYZw0hJOx+dpot9NbHbsA1Bc9K29gTZdWOStHJDafc67KVHzYYSZR7Q/MlbQE+Y99tO6O9bbrwy/kao3CrzRSxRizf4yJyrb/3hMpvNdnAHO6Xpii8C4bUDh0PjDbYjz0gNJH8m8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754484824; c=relaxed/simple;
	bh=5NI7z6KlrKYh5PXiakVOv42nIU1FlymzAJZ8rGaqGOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ASNKKX2BoVONG0KlfawDQ//jHEmAmDdRltUevn/ZZlB8PU/6XNIMEGSWWgu5pU/YxpiUOsHPz4WwGa8T7NB73B8zRnE3rBaFqStMEj12nU8Sxx3L2IL10v8MEUSr1QLxzPp3a0h9vdnGQWtojt688yLFii4cVpaVM6mPxPYkrlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-88bab6d9216so1423636241.3;
        Wed, 06 Aug 2025 05:53:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754484821; x=1755089621;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yp5RgiG9nm+cgmVAbBkZza0/ZfbLzMzZe5tSaCKNZ2c=;
        b=rUOgyEfYO1ueJwvQo5/wg4mYv/DU2VBQO4AR3cXd8N2uyAkaeFFMvS6b8JVfrJ0Ofj
         hLbGYc0JqdhNUSD6PNq9EZCrZ+y5jF7hEcYcOChlwjHJAcNd/tamV7R8rs1pL24PVYA4
         uqR+EANIF6n7yzFOcfaYrSuXXfHd65i+uiIgmijq/reTT0Xxdew0kPEZi+xh9wUTTIhx
         DesrBvOigz3bsHTejyxxJYlGVC2/qYZ5pWVLm8rJ+ykg7gvYShUDFfwziSvXuHcp2CzF
         5wCuNSbp8WpFMSiV2sfZpki5keR8ztUtZBnf+MgJhb/NN8HI6urrsMD2roi4Tn4hHeFL
         CQ8A==
X-Forwarded-Encrypted: i=1; AJvYcCVhSM3U+iWimPAUr6AoCpPT4BFnbnhQwderfkD7K1cggmUm1QNEqy95DFrfkwIUfsDFTWBTurYv6MrZZiSuPFBH6co=@vger.kernel.org, AJvYcCWLP42uFddUUeXywmVD/oXznQSqhCTYJyKUrPexXg4yjdLKhmJo02gIBzHdIr7CCDlL8Y7aEE4XhGCN@vger.kernel.org, AJvYcCWNT1/kTKDeN1KsmMVO+4pEfzFkLeUQN+ZxSOm02FkFjGkoP9Q6XSLKDxG7x7bwnbD8tEkshEZ2jF7DQuVR@vger.kernel.org
X-Gm-Message-State: AOJu0YyUKUG2wWbkCyduncnWBpmpzYTv+Ijdkn7R6JXRRl854yeLuopy
	6Fp5ToTPySQS+XZ+QzQ/EWlOKkg3mnBJhkqd8x+qF72c9bUfTlNEroYdOF/YL/d9
X-Gm-Gg: ASbGncs2qmUyVoGcOcbOiw6a/SuXVl2N8B/ZJYMsrk0ouElz/0Mh/n4+NsabqqA+nqY
	v5e/EU44owJh5oYqs7T6BCIVLAaj59beQyZaZn8wJcqs4po0Nwndg7CSiCmflLbqpHjcyXdXM7p
	0PAEDcD9KybdxCbud+aljuej4DPqYP+EYJIpebVHXo24P0hqPHy5Se6/Y6MQ5y/2Ug/TIt2xcBt
	JaXB83uzgAff0m3YeumnkcxJq/OGCeBXgf9jRi5FFb9PVbN1hqtv0PhMr17I6t9+VjoGOibLiZT
	Mc3YGjbwIFKQhtolQMMOvBdUOKkvVMPKC8rGZCaiMWv7DslghEWCbzhFY3wOZY9/BSuAkT7/W+d
	CgYB717klNBs1AmE/zK/BuLe5zyjonAVMtHOG7w4ucnW1kZVUt60d9lxi9Cyg
X-Google-Smtp-Source: AGHT+IFjjcDJcWSEec6iQUsP1EYG73Qi8BXTHpwbGBqdc8ILA4SyCbLJZfrSfC2/RmjlRE7y16dD3Q==
X-Received: by 2002:a05:6102:418d:b0:4e9:92d3:d20 with SMTP id ada2fe7eead31-503710c639cmr956862137.4.1754484820936;
        Wed, 06 Aug 2025 05:53:40 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-88d8f325540sm3477591241.1.2025.08.06.05.53.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 05:53:40 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-88dc394f5e7so1000176241.1;
        Wed, 06 Aug 2025 05:53:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUTNdUr0pxIRL/rf7K2ZBo9+rV9QwPu0ZAsyppsHA5oVdzfXiFpZNAbatkjQ5fcTdPOLytJiHPd3KEIr1o+ElIDB18=@vger.kernel.org, AJvYcCV6F7gkmhWrGT5sUzgn9aWOJxkqRpeDFqqQx6H9ZKIGx8alv+s/Hn28u2Gpsij3eNk0o6bXjzyGhkYq@vger.kernel.org, AJvYcCVmaYxLA38Us5mxmF0LynHTmjvKM8bb9c6EDgeMKrDGxiPYvTQgaWahVVOVJeTUdADbjbISivhNZsORKc9Z@vger.kernel.org
X-Received: by 2002:a05:6102:1624:b0:4dd:b9bc:df71 with SMTP id
 ada2fe7eead31-503715d0dfdmr1053346137.10.1754484819806; Wed, 06 Aug 2025
 05:53:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250709160819.306875-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250709160819.306875-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250709160819.306875-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Aug 2025 14:53:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUGY6tVb-WayHL1c=HUNgnnHA_UHWLr7=oYV9Ah2F2HFA@mail.gmail.com>
X-Gm-Features: Ac12FXzKl1Gb8AmEAqeIDKg1O4e-2rdgt-cJLXAAibxXUnKJQypqQ1SSCKsDBss
Message-ID: <CAMuHMdUGY6tVb-WayHL1c=HUNgnnHA_UHWLr7=oYV9Ah2F2HFA@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] pinctrl: renesas: rzg2l: parameterize OEN register offset
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	John Madieu <john.madieu.xa@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Wed, 9 Jul 2025 at 18:08, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Prepare for supporting SoCs with varying OEN register locations by
> parameterizing the OEN offset in the rzg2l driver. Introduce an `oen`
> field in the rzg2l_register_offsets structure and update rzg2l_read_oen(),
> rzg2l_write_oen(), suspend/resume caching, and SoC hwcfg entries to use
> this offset instead of the hard-coded ETH_MODE value.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c

> @@ -3164,7 +3167,7 @@ static int rzg2l_pinctrl_suspend_noirq(struct device *dev)
>         }
>
>         cache->qspi = readb(pctrl->base + QSPI);
> -       cache->eth_mode = readb(pctrl->base + ETH_MODE);
> +       cache->eth_mode = readb(pctrl->base + pctrl->data->hwcfg->regs.oen);

You still have the eth_mode name in the rzg2l_pinctrl_reg_cache
structure; probably you want to rename that as well.
In addition, it is saved/restored unconditionally, even if regs.oen
is zero, which is the case for RZ/V2H, RZ/V2N, and RZ/G3E until
[PATCH v2 5/7].

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

