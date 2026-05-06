Return-Path: <linux-gpio+bounces-36309-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLGZGmxk+2kuaQMAu9opvQ
	(envelope-from <linux-gpio+bounces-36309-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 17:55:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5A74DDAE1
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 17:55:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4B5A230AAB64
	for <lists+linux-gpio@lfdr.de>; Wed,  6 May 2026 15:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE274481AAE;
	Wed,  6 May 2026 15:40:36 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24ADF3F7A8F
	for <linux-gpio@vger.kernel.org>; Wed,  6 May 2026 15:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778082033; cv=none; b=i783q9jZnh9z1S5BQJG15v87NxtqOsk+RkeDp46zdjo0lOAN0IIbWcmEEYUlJzrN43kFGeSAj+tUfy/iPpkts95i8c8tY3fRpVNGkLKwc3OR0w3Do03ounA/Ko2baacgIlkfIshsZTeUNkauAhE/OCJl1M2ktogOOuJoi/h7M/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778082033; c=relaxed/simple;
	bh=hnTY1C4YQfuFQnTdHlPMeKkehEjARMiDrJabpHckQn4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lwimQ6YZYZxtXczrdSrFEeYAlbhVNfDQL/QP2h/M1ghan2RaYR9ODYeKDgS3pBqxoaw8/g9eq0hCuGvtPTku+3OXZxZqoJ9mZlhkx0WgX27kdb+LRwNjBixnvPjWvO0bIapDunCNlt6H26VGrx5Hqk2AHXoon7V5a0OyTe8O2rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5752b279662so1128560e0c.2
        for <linux-gpio@vger.kernel.org>; Wed, 06 May 2026 08:40:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778082027; x=1778686827;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XhB1wUc2hdpCHk9AKQGT4q75t8HPfDZeAd/QYRJBqkA=;
        b=mGL0/Hs4k7J6yQdZf8cL5G5+UCdBhsihq7xu4OmnNliB1eBw/spLiudwgzitr22Cuv
         AqgUepSdynIFv99Jtj2VOynR/TCfill19+pio23KEVD5NCjKGcipja+qJxna1rHUhOVf
         pXX2Mt1dNYhUBJO4SEKWay9e/Lg7fjobmbFaRnqtqmlBeLyRRPcgOxS3YCeo074tLuQr
         7jZa7kAMh18A7FvmoPhna2/hgHNpYHcnlC0D/2N7/EV9wX84zzXeZ15K9CGh97ptResa
         gy8ZM9MPKPRYu29BGtghg0EST1gOB5rbrXeIG8Ft0vcI4in6bqsdBTKYYYb1nZ4pt+Si
         KBpA==
X-Forwarded-Encrypted: i=1; AFNElJ9J6GkfAYYRyDbgWoT2cGuweSWynEtld9kwdd+JudnGqnu1OgmDZgwY63rpzzZx0SJzrwS40tgqWMMi@vger.kernel.org
X-Gm-Message-State: AOJu0YxoILAOZQj8FBziOAkhBrP1H76hS62zQ/vXdWHZwvQYw/LHDZXj
	tvmK2z3OOh633XzLWhvcJ9m5TR3Iw7eVmaAU24OLGHIKouvnh+jd32ilPW3ucb2M40k=
X-Gm-Gg: AeBDiev0Rf6+PyBC4eQVd2rJgNe2Qnw75Kr3KFPZfgWFFvUQo8X7T8VSg/JplwhoO7e
	RZKULbtzDG9/ETY56EiW52E8hteb+jjFsn3IpC+6gxlJkhZBFuiK/75e/H7EvGpoQGNnOrQ+Tfm
	YZ97F3hE7+Ugin6Jh8iUR3Yb80Zye9GjujqvpPQ0I6Upvi9vRbedmuKEXMIisjlfIlP1Bo7Vvlr
	6zycA5s0VJm1qtDEQPPPyb7k2+VaKZOAl5hpcJmCRgHfV4PyNRkuQCDKeG8lov9ZuvwcsTniYpW
	KSJPmgK+PtA79KjOHBbv2dtha+TiDRrv8uNlLf9106iBh4PSlGAp+KPd+jP3/eBEHSwxugJKwHT
	cePv1OK9wm9qy9zAc5U/It9roCTdfELFlqKFg3qasv84w51eaphhYFVNHMKVgGcILUij0gvLKN1
	Kn/F1N7V/DvWdtCwlp7lLu0lc30bX66zfR+MSpNrrmy97+qrTJS07Ui1mQ5Lfq14iK3uybDFW8M
	nQ=
X-Received: by 2002:a05:6122:d15:b0:56d:7b2e:89a1 with SMTP id 71dfb90a1353d-57559538111mr1995566e0c.4.1778082026578;
        Wed, 06 May 2026 08:40:26 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-57560c80bafsm1009135e0c.3.2026.05.06.08.40.25
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 08:40:26 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5673804da95so2313724e0c.0
        for <linux-gpio@vger.kernel.org>; Wed, 06 May 2026 08:40:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+MYLR7z4KMMe/gGXBrl5Ts+RQ8nB2whAa4DFg4iP5zyczGc0Vcje1+gVTt7yxbO2eE3i+FhDrTZdWh@vger.kernel.org
X-Received: by 2002:a05:6102:4429:b0:602:8ad9:1f6f with SMTP id
 ada2fe7eead31-630f901b15amr1756658137.5.1778082025698; Wed, 06 May 2026
 08:40:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430093422.74812-1-biju.das.jz@bp.renesas.com> <20260430093422.74812-8-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260430093422.74812-8-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 May 2026 17:40:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVwdKsmV3A8opxi7f1rnqSpVFsRg+Mfb7wQLC84NkL7PQ@mail.gmail.com>
X-Gm-Features: AVHnY4JATluaWsu6W_RJQ4MJF5cAxj9Q7vuMaGT0fiazB3FLnuoB8rjp_3_f3yc
Message-ID: <CAMuHMdVwdKsmV3A8opxi7f1rnqSpVFsRg+Mfb7wQLC84NkL7PQ@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] pinctrl: renesas: rzg2l: Add support for clone
 channel control
To: Biju <biju.das.au@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 5C5A74DDAE1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-36309-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid,glider.be:email,linux-m68k.org:email]

Hi Biju,

On Thu, 30 Apr 2026 at 11:34, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> The RZ/G3L SoC has some IP such as I2C ch{2,3},SCIF ch{3,4,5},
> RSPI ch{1,2} and RSCI ch{1,2,3} need to control the clone channel for
> proper operation. As per the RZ/G3L hardware manual, the clone channel
> setting is to be done before the mux setting.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3->v4:

Thanks for the update!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c

> @@ -623,6 +644,45 @@ static int rzg2l_validate_pin(struct rzg2l_pinctrl *pctrl,
>         return 0;
>  }
>
> +static int rzg2l_pinctrl_set_clone_mode(struct rzg2l_pinctrl *pctrl,
> +                                       u8 port, u8 pin, u8 func)
> +{
> +       unsigned int i;
> +
> +       if (!pctrl->data->clone_channel_data)
> +               return 0;
> +
> +       switch (func) {
> +       case 2:
> +       case 4 ... 7:
> +               break;
> +       default:
> +               return 0;
> +       }
> +
> +       for (i = 0; i < pctrl->data->n_clone_channel_data; i++) {
> +               unsigned int pin_data = pctrl->data->clone_channel_data[i];

u32, to match clone_channel_data[i].  I will fix that while applying, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.2.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

