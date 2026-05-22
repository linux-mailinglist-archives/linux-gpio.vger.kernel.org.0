Return-Path: <linux-gpio+bounces-37326-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PJuBEgeEGrqTgYAu9opvQ
	(envelope-from <linux-gpio+bounces-37326-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 11:13:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8715B0F22
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 11:13:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 02CB6301B305
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 09:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18BE93A9D8A;
	Fri, 22 May 2026 09:12:22 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89B33BED61
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 09:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779441140; cv=none; b=EId7UjVAOdvMVrvQySMRiGdPcFv6BDlIMfbdIekzATQk30h0lVsNkJWBOJuuCBLiL9/bD2NLpZI/4z9sVWNMwlgxzyLImnYe8xEvnfuhPFmr3STIRdbGhv6rrrY7RPKbsbHJfc4OmW+aTSMqbgQp7nKk0o85z1FMFjhd3zHy8Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779441140; c=relaxed/simple;
	bh=+UJzkg48lMkoSQyNJu94NJ5U0X3TUzcERqMbRbzsVRM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nhk3n++bmP5y/opkgdjzisNnnRVKtcvcTYSwdkazUPGRNpUUz51JVULb0QiMbMVHRNKkPJ8FFPzw5WZy/InjPjHbdqC5g7rju8wuaeAgyjrrAmFWa1Z4b6Gb4yA6WAvCF8v7sxav+fcMPCOKE5WfZfeEXB15P1QY3UdkcElunlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-57611a6a69eso2090945e0c.3
        for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 02:12:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779441135; x=1780045935;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7lSGt0XkeFIiWkTNBDsqiKTBjOhow5nFx28sgXv7vGk=;
        b=l886lFLu6/ROqfLIDpshpzDjtSylY6JNG/C9kQMUn3eve26IaIxGaHcyzVmwtITMgZ
         bLIjHW4J2A3BZ8L30b97/ZZPxVudaSBYUz9GcE53qPsU5qVm3EC8JPsG3MGmd+AaWk1C
         XZdD3cSe+nYyEV4CzqOOosdoK+Bd0jIFKfx4SNYM1i0ZkrVfcKGaKr2+DhcH/K41o+zR
         C2ZzpGiOiOE1qudWTUi2UD/n7CdMztyCncbuAaQo/xVuto1DFXqh11eqdhe5iYudSKOn
         FEv9f6EoZbkFxlnT+6MGSaRTK0a8U4GYAlUSyR2rnfyCc+OaK1j0rKmtem0wAzaaLNCf
         lbiA==
X-Forwarded-Encrypted: i=1; AFNElJ+oCnu2RVaxp33xTi+1Yp62V6sUs0F20PdLjecnGS5P2q4L/xb+GGK7Vp39aejkVAtVbEtsbpzdPRzx@vger.kernel.org
X-Gm-Message-State: AOJu0YzXuUzptKTtATfe3Fyks1sL4+9EnZ6lORU3/bKWIO2kyRwxLe4T
	NYUFP8yeBKSJjimp5ll/7My8G7Q7WuRFxxC+85WeYwAKzy4brGEsV3qQbojt2ovg
X-Gm-Gg: Acq92OGX6X8+pK/kaskKfoRswUXb/G5HX7XHNgpEly+htgRACxu9QDvjUik1TsTr6TJ
	rqP83Dn6zxCY5/uJxABO6mtTTZ4GmE+6NELgVrOGmFI8WRaCihFdCUOX5xfz7O5OnjNXzf67vge
	bwfbCNxBM9WjlBLJx+KSp12P2Y2ypaBBl3mtWLN4F2mKD2pL7tbe53fBTdxyeB0S6oZCVlueT0p
	3lcq63ssbOSo4XNnYRI5Bal2khn6UgznVW8xBxVstSetMRcTqzlWghb2bsQb63ZKmdIFHOVTa+j
	bAXbDccdIyzWNwul33WNUG6LPsbzZ/YW2JWIeeirTwK9LKw1WQdlv5vXbqcrMmCDCsY8bJdLhT6
	O4HmtAkD/1TRpRTUZ87WCrlAf68z1E1onwgATH817LIAAF+IvytLfZ9rJhYXbf3MGzn9kF4Tyei
	YYRFrpfaE/pLOmbpJZjJneAaTB1zgtLnVsPaRadD1a2k3V9m/o+lCJWpwiMdu2BDW4E1osqA4=
X-Received: by 2002:a05:6122:4fa4:b0:56c:d623:896e with SMTP id 71dfb90a1353d-58663a5c2bdmr1254384e0c.14.1779441134844;
        Fri, 22 May 2026 02:12:14 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-586f889e7e3sm1408065e0c.15.2026.05.22.02.12.14
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 02:12:14 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-6314d2e31d6so2435220137.0
        for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 02:12:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/8xYkyOVt90xYKcoOy4gvBMEx4k6LBM1pksg80pEVDJIT3RyRUTqZPROoC31fYYBT6/2pVsaTFph43@vger.kernel.org
X-Received: by 2002:a05:6102:15a1:b0:622:702c:fd3f with SMTP id
 ada2fe7eead31-67c835b842cmr901643137.21.1779441134377; Fri, 22 May 2026
 02:12:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515124008.2947838-1-claudiu.beznea@kernel.org> <20260515124008.2947838-3-claudiu.beznea@kernel.org>
In-Reply-To: <20260515124008.2947838-3-claudiu.beznea@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 11:12:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUEeo-aCgopHt8CVkdedqd11S98HE6Ckkqk49Bj0LrxuA@mail.gmail.com>
X-Gm-Features: AVHnY4JnKZOmF5oPEGearuYvmvs7T4LU-ClYXmPyGIj8obiKu4rAdqagY3X8Tg4
Message-ID: <CAMuHMdUEeo-aCgopHt8CVkdedqd11S98HE6Ckkqk49Bj0LrxuA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: renesas: rzg2l: Populate struct gpio_chip::set_config
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: linusw@kernel.org, brgl@kernel.org, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, biju.das.jz@bp.renesas.com, 
	claudiu.beznea@tuxon.dev, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37326-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux-m68k.org:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,renesas.com:email,glider.be:email]
X-Rspamd-Queue-Id: 1D8715B0F22
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 15 May 2026 at 14:40, Claudiu Beznea <claudiu.beznea@kernel.org> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Populate struct gpio_chip::set_config to allow various GPIO settings.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v2:
> - used gpiochip_generic_config()

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

