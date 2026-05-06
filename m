Return-Path: <linux-gpio+bounces-36308-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eL09Moti+2kuaQMAu9opvQ
	(envelope-from <linux-gpio+bounces-36308-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 17:47:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E30F4DD8B6
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 17:47:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7BD3930A2438
	for <lists+linux-gpio@lfdr.de>; Wed,  6 May 2026 15:40:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB2FF49550B;
	Wed,  6 May 2026 15:40:24 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D1948C3E4
	for <linux-gpio@vger.kernel.org>; Wed,  6 May 2026 15:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778082021; cv=none; b=DVCdEUmCmeuh96XvBLNGSpb/XKN3RTpuMYwh0UB6Ww+mxAPPufmsONn1kDkbqIWMyLKFtWhA59ufkfAjz/W+dgdN2F4Zp9+nhLftwLpyjBMDBsKfG7audxPseL0FktD5A7TvU2WH2QoBMHxZRAeloxhCAQ45KL496rn/p/EMFeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778082021; c=relaxed/simple;
	bh=dI+QbPiTrV0nI7jHaByfemiDLHOOCvJiT5285V2M4nE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bg57MpQGg/74w5EmDWer6uEj1DcVpBmbwzi8Asy6uj5lFP2wcypYfP+lg1laRWVHdXC2mKXjJKYOVuincyCtkJXHbiShuxOcCMl6goBAdh/htgx6bri1Y/oZCk5V8ocYzi/fZAEkPVaaiS3u6j7B0vw5sTYbk4sPuolAkVa82Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-62dfe7edd84so1341111137.0
        for <linux-gpio@vger.kernel.org>; Wed, 06 May 2026 08:40:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778082015; x=1778686815;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j3mUtVH4kNPrD9j0yhDaqQ3GCH+69t3pr5LYgrqB7eY=;
        b=ANx6Ljag2KnNL2mObwwNUDi5voETW/hyGIg2bLZAhxYBW2DpgiRYCFs0BB3fS5neL4
         0AubsXPDPByIXla6NbkxmIgIOCrEkSDAyT4O5Au41zUmWeQvLonFTJIV0RHKEVqE0DGA
         Oq2i+OCpd3k74SANtmgURevBnfcXNKsMIGt8QiEyqFgJSwr4YPbs3eEI9agV/g/V+hp5
         7KzCLY8MNHeVxNsn9YfpH4mL8odEySLBK9jbABmzVEBponQ6UX8q7ZofIv6pTwy3HF+r
         xqa9H79T6ss73TsTFaOUZ5nGw+iFLjuXzWhBiHjavdbl1cpMT/NhG9nEu5bj5p2Hfo5Y
         a/Dg==
X-Forwarded-Encrypted: i=1; AFNElJ/5DKEyKx8s92tyMPM2CN/uH7o61yrTbhsfNNTatu9GacJWKYszYKahnmxF9s/Wc5Ea3HMlTtxsDUze@vger.kernel.org
X-Gm-Message-State: AOJu0YwDEpYA9P2hEZZWPP3F/s975qd25tnJNw5Sd/9IdtbstY/d6Y5B
	vD+ohXKKh6mJNF4fVFvmbfGGCaYNMetoauSRCzohqVSlFlP/qdIJAjv/tG2xbRTUtDY=
X-Gm-Gg: AeBDievmIwN5rpX+GTdzyndLle7jjCL3pe61QBPr8STonl0aD01G9lnNTuJxSMruzCy
	bQkZXNA9bwKiDOaDEMGPL4hOV0/aNBAEebkPPNTARgpV81GqCvZZ/ZM6+znem+vBeDNnj6G8E3X
	tGahTMg2jyVY5ZtbJ86yL2p8BaHpo2c2T+Bz9zzWBh9xeq4gZKEE0WnXU1a0G9i9NIzdSe17H7R
	JxF7eRe071i9hzYfKT8WX8Q/6nDtEhydiHJj9IDFuCMXHE/w5ctgzlNJyKArZA/FoljKbPbomvX
	AYTE9cofaYM7c3m5u2u40cX57+1RFUg3oHLYpy8xGdhvtPXZgBiIOXMaGRSscuk5qs1q/dWb4bH
	Zfsb5UyJ7MlPSQxtHumv7tzUQG8LvyopJp7Kcju1VDMZ39tpX8/44ZFRLtN+6ca62FQqVMYWM9G
	bGd1hZCFior7AUOF+5UR7Z8DIsKcnmc8eZRGPtMKB/oT/jU3RMUioQnA8ClWoL9fjs1GKTSsgdn
	8L7LpsYJQ==
X-Received: by 2002:a05:6102:cce:b0:62f:357a:3297 with SMTP id ada2fe7eead31-630f8e7723fmr1798371137.5.1778082015384;
        Wed, 06 May 2026 08:40:15 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95ce0894dc8sm9110396241.2.2026.05.06.08.40.14
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 08:40:14 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-62e94ae15f7so1451757137.3
        for <linux-gpio@vger.kernel.org>; Wed, 06 May 2026 08:40:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9XKgbilZ+ajFBGabq3IJYV2tDuNKWJlwkG5RAGy09DdknX5wcTLyrgB70VLAG4yspgxw4iNQDtZcYQ@vger.kernel.org
X-Received: by 2002:a05:6102:418a:b0:62f:39a9:ae67 with SMTP id
 ada2fe7eead31-630f8fd2321mr1675840137.17.1778082014035; Wed, 06 May 2026
 08:40:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430093422.74812-1-biju.das.jz@bp.renesas.com> <20260430093422.74812-7-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260430093422.74812-7-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 May 2026 17:40:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVhSUErK35V=3xH8GULG-PAwx9Q+g7wKU_N8LiK8QR0cQ@mail.gmail.com>
X-Gm-Features: AVHnY4LPLTrUreAXhyRM17hCvjJwDRZ_joxZLc8vOxQ5vxOG3C1P0LUHhcJtdA8
Message-ID: <CAMuHMdVhSUErK35V=3xH8GULG-PAwx9Q+g7wKU_N8LiK8QR0cQ@mail.gmail.com>
Subject: Re: [PATCH v4 6/7] pinctrl: renesas: rzg2l: Simplify rzg2l_pinctrl_set_mux()
To: Biju <biju.das.au@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 3E30F4DD8B6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-36308-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,glider.be:email,linux-m68k.org:email,renesas.com:email,mail.gmail.com:mid]

On Thu, 30 Apr 2026 at 11:34, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> The port and function selectors are evaluated multiple times
> in rzg2l_pinctrl_set_mux(). Simplify the function by dropping
> dupicate evaluation storing them in local variables.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3->v4:
>  * Updated the data type of func varaible from u8 to unsigned int.
>  * Collected the tag.

Thanks, will queue in renesas-pinctrl for v7.2.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

