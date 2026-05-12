Return-Path: <linux-gpio+bounces-36670-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKXXIuURA2rD0AEAu9opvQ
	(envelope-from <linux-gpio+bounces-36670-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 13:41:25 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDB851F820
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 13:41:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D51903042C6E
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 11:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F17F2360EDF;
	Tue, 12 May 2026 11:41:11 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20717360EC1
	for <linux-gpio@vger.kernel.org>; Tue, 12 May 2026 11:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778586071; cv=none; b=rmikmnjAYZqoSuQrXM6Lkhyx9JbEU5+nf6fWqh2x7Stdg18DRWxbd4+rleXs9xfyJf5rzzZ/FE6uJKD5mf/UFZsROziZuOFRonTGOdisYMyyQW+B7Sx2lsh+bKy0vFlsbgmlW07LXuX47VLPJOZ1zlWVTycfxAreTpoq7R7azMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778586071; c=relaxed/simple;
	bh=YjQqCu8uucgcElSr2JLMHpZ4AITPXBYrX+Ux64YLw9U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cLb/HEN1tUih8Zfx2P5JHK/aGwIRbVYIUuXZlpZYCj2jZESGdcWYDCLjS5FeE0uzweBa6FbOFVzbNtipDbTh6H367xxO6QFf+fvSDgFBjKhU68W5rfJ43E4b/d71RqsivC0wuen8o/k9PRgADIEFLaiN7IZete7TBg+3agZKCkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-95cc8ac98bfso1189707241.3
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2026 04:41:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778586068; x=1779190868;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wvRgUdio6xvrVV4W0pdPR0w82di4zIMfmVbiZclv9eQ=;
        b=fcaGwZJV1iTgvvgIH+eSFEf9TG60BFhEg9Ie/ngegUjcgA1A/mNRoPFCawZDsEMRB3
         L2lHGHSwuGfmrHgDdlN9JHokmyUPErbaKEcp2i71ONF//B3OkV3CMeZmsiFyjgkScNTh
         6wfTGJwjs5hCekBBoLc+uJ8HZXF4sp9zyjJUA8QFO/0vtPWv387+2yrIAs3/izwVhndP
         wQKY1T6d03B5QuwuWZp6BmGDIqrNJgxs6hXKA8zUE0mB4boihf8YICAxr3zQqEeZzH2A
         gU4RB+gozEFrtbs5GZU6iAZ3gVtN0aO8TYs7hi/DPA8hkr15NLo8MGu3LCXji0/izHKH
         hbEA==
X-Gm-Message-State: AOJu0YwiY2Fz8VYP0TASW8vnrzGobhrjfBeNhdeF+dwNneOPWKvaVOYm
	1U8T9FswKOtXZhQN5JgZv86P6O3b/fCuM/6EnzrFgr1y/pr5/HHkqEms3RGxIRH6
X-Gm-Gg: Acq92OGqdRyqPTtJ6Rw5YR+UrprCeKgJCYfUfeGjgVaXEX6wlYxr0eH1Hnh9bLbXxo8
	KdHr+YJNA78bHTEj3nj96fDv0gQ0tGf+Td3D+JzBl8BL2CcorflAKKAZpJVjnb7DcLvrz2baeMR
	6Mro/PSoGrKgqMTGQmvf73lRvnQ/x4Rgnd/VxSXbtjEEXJ2DxTKrYbMxvas70l9Mgdis7uTvkCq
	pGwYj1DdeXspryqGqBAnKRhffdNRtM+5ZdOv8LnFPaluNXM6H4sGn7jicaK+3pQXM4gUDa2nKHZ
	spkb0a78BssqWKDMqcDsQWjQDIP4RmENnCecA9lwxQWApu1D2ak38Kdyu8q5k09AI9EIvuxIaIu
	TPjqbXhilZCRRmJbn20DB4/6VDyGtDzQiYHnRHgoqw3dfz6Mk8eL/1O6Oi/cF+5TvaCENGguizS
	/j7165AuBoAn7T/vZQIZBY9mLIIfxxT0pMZO9SGiDt2Btru908Gj7zX8kQteEu
X-Received: by 2002:a05:6102:6f05:b0:632:29a5:2b27 with SMTP id ada2fe7eead31-63613ca7848mr914712137.3.1778586067841;
        Tue, 12 May 2026 04:41:07 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6314007acb1sm7842954137.6.2026.05.12.04.41.07
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 04:41:07 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-956849ae1efso1619875241.2
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2026 04:41:07 -0700 (PDT)
X-Received: by 2002:a05:6102:6f05:b0:632:29a5:2b27 with SMTP id
 ada2fe7eead31-63613ca7848mr914702137.3.1778586067186; Tue, 12 May 2026
 04:41:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260425014029.438186-1-rosenp@gmail.com>
In-Reply-To: <20260425014029.438186-1-rosenp@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 12 May 2026 13:40:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX7t7VHTzybjYo3s8SU3XLEH9GKsxmLBbh7p4D1CT3H_Q@mail.gmail.com>
X-Gm-Features: AVHnY4IUrtB7IgdMXjB06rIlBe9LVRqEN2RUTSNb4s_etuIsGbMTpgcHfAfcWi8
Message-ID: <CAMuHMdX7t7VHTzybjYo3s8SU3XLEH9GKsxmLBbh7p4D1CT3H_Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: starfive: jh7110: use struct_size
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-gpio@vger.kernel.org, Emil Renner Berthing <kernel@esmil.dk>, 
	Hal Feng <hal.feng@starfivetech.com>, Linus Walleij <linusw@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 3EDB851F820
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36670-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.949];
	TAGGED_RCPT(0.00)[linux-gpio];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux-m68k.org:email]
X-Rspamd-Action: no action

Hi Rosen,

On Sat, 25 Apr 2026 at 03:40, Rosen Penev <rosenp@gmail.com> wrote:
> Instead of an extra kcalloc, Use a flexible array member to combine
> allocations. Saves a pointer in the struct.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Thanks for your patch, which is now commit 87182ef0bf93c283 ("pinctrl:
starfive: jh7110: use struct_size") in pinctrl/for-next.

> --- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
> +++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
> @@ -857,17 +857,15 @@ int jh7110_pinctrl_probe(struct platform_device *pdev)
>                 return -EINVAL;
>         }
>
> +#if IS_ENABLED(CONFIG_PM_SLEEP)
> +       sfp = devm_kzalloc(dev, struct_size(sfp, saved_regs, info->nsaved_regs),
> +                       GFP_KERNEL);
> +#else
>         sfp = devm_kzalloc(dev, sizeof(*sfp), GFP_KERNEL);
> +#endif

You can avoid the #ifdef and increase compile-coverage using

    unsigned int n = IS_ENABLED(CONFIG_PM_SLEEP) ? info->nsaved_regs : 0;
    ...
    sfp = devm_kzalloc(dev, struct_size(sfp, saved_regs, n, GFP_KERNEL);


>         if (!sfp)
>                 return -ENOMEM;
>
> -#if IS_ENABLED(CONFIG_PM_SLEEP)
> -       sfp->saved_regs = devm_kcalloc(dev, info->nsaved_regs,
> -                                      sizeof(*sfp->saved_regs), GFP_KERNEL);
> -       if (!sfp->saved_regs)
> -               return -ENOMEM;
> -#endif
> -
>         sfp->base = devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(sfp->base))
>                 return PTR_ERR(sfp->base);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

