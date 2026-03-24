Return-Path: <linux-gpio+bounces-34098-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJZILl7gwmmPnAQAu9opvQ
	(envelope-from <linux-gpio+bounces-34098-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 20:05:02 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FA931B2DD
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 20:05:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4791E3009F85
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 19:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E41A2F0C48;
	Tue, 24 Mar 2026 19:02:40 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD902EAB72
	for <linux-gpio@vger.kernel.org>; Tue, 24 Mar 2026 19:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774378960; cv=none; b=gPmnPwU1Dy15JTm/Q/dA100KPoz6f0t925ruv5ZyG+SQcnpio63GILvHarhi/ROasN5zjijW0yLkROXHy866d3GQZOXM08q/EG1hJlr4hfyXHEjkQoQ9XfXNGrRdgnAVrTuHU1IN9JLTmWMwRCcAI4ue9VwIVUe1L/e7q/8xQQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774378960; c=relaxed/simple;
	bh=XtILQYDdYGVla3kuxxj9oHklvJA5Nt5DcfDTiFQGJms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=giAI5ii4BlubNrYk8Kz1YlbXGEgKhZCiojfm4Y7ECpFYld1KDdX72ICFoVojKdn+Goz+UkGzh+WpNl/sXVYCyLhx6dVN5QbiCkGBz66toZmhwMwWPoB5GyWEEVAJTZqnJ4nlbKO31ucRaci7NZztORbhO30sq5TyIwHjDVrStjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-6031949debbso423571137.0
        for <linux-gpio@vger.kernel.org>; Tue, 24 Mar 2026 12:02:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774378957; x=1774983757;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9dbHXfVGTJeEVtwUyV2Kwn2mr9r+3wa8Eh7jq40UVSI=;
        b=r7/nEY/ER9V6UISKjCiUTIbxm0MpNfd0BQqOFOrNzLDV73//qxB9JRiOq0M6ArZ3Ef
         w7ktvgxzQfsajFe8mw/HzXz4ppXvP3H4fezVppQtefUF66Zpz84k2ekILAARNYUPI4zC
         kG3vNHwuP6T++/I+v469RrapiRUfzVd5GcBNvTSS5t/uBZxI4q6gDpnnThF2BNZs8K1/
         NAp/mAgJm0Vzj8rmx30A7oOTWIyfyeoDp7IBar6q7yHfF1+7qDW/K+znjREt8liANa67
         4/Y3QZGORnwxvyoA1Yip+vM+sQXqTTKDmDWU5VYvBqtY4cTTPki3j4LDz6LyA+CQHIv6
         Sq0A==
X-Forwarded-Encrypted: i=1; AJvYcCXVfg8HX3+MCr7q7bmV8C0dLDF4p4VBkXBSfEyoL4WW6jyonR1EWGgKjqc1qof+4bjVHARtRzbGG3TA@vger.kernel.org
X-Gm-Message-State: AOJu0YwsPPRRts4LMCzZiB8fZI2oQnn4IlZnF8e7kCxbhStTu60AZ/fK
	mClu/tgEXxu7gjlvIRKShBB7DXSDNv7RysVwXxwyNjHTkz9vNvHMmTIFztliqi9dwc4=
X-Gm-Gg: ATEYQzzHEUbZxeHVWDPBK5gXo/MRhl0T900n4U8vDb3UbTILVlcBx8wMNmJNCJhHPcn
	VIt6xwDMq21ZrKbv0hq23ps9J3+3o2mNz5eF9qMVdo0jpRdLFhYH4FGrSdK2gcMv1XOMU179Mwp
	Gcr29eFJgZQ2jladyF2yzuKqvCuX6WizfaAuDoon3sL/GssC+R46YEjoZ+B5eHxdzXZP3sSfbs3
	tKlsO/v/SLNopc717XsJ05sd6ByYQkyJZoCAMBPPHO8b5+3wQIBECbdGrXR4nHj272y/sMUmIAF
	AIGXxIKObNPc8ol3FOCk8yyI8RWNHSkaKhUuK8n7/vV0kkKQcLp5kzPYYlEuVLDKR9/GI0Suq++
	beKmd3/grMBQePQS1287wmAT68g3H1GQNfFKbO6zc0+tS+C4QcWuE9iQ7ytmUJJoTiR8BfR/igw
	7vUy216RZRXMX07ooB1hXgWbtNbocmqOQdTgCTd5bMNsG9OWG5Ks+GItV+ji1hK5mb
X-Received: by 2002:a05:6102:370d:b0:5f5:4055:4558 with SMTP id ada2fe7eead31-60378ff856bmr679303137.2.1774378957483;
        Tue, 24 Mar 2026 12:02:37 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-602af8b0ceesm11454267137.5.2026.03.24.12.02.36
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 12:02:36 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-56b8804f37cso2006104e0c.3
        for <linux-gpio@vger.kernel.org>; Tue, 24 Mar 2026 12:02:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXD/jmpCCDhmVddSjJaWTHHMheZrXRZPLmj13KEBH1tE1GJXLm/Nxql+tfN5WbvA71OR2Fz1S8AFg9M@vger.kernel.org
X-Received: by 2002:a05:6122:6611:b0:56b:814e:d35a with SMTP id
 71dfb90a1353d-56d21f7bb81mr678189e0c.8.1774378956312; Tue, 24 Mar 2026
 12:02:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260218151925.1104098-1-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdWv1dQ55NcwMga_X0G8K97RgMRXoDu_FV10fNQv7AadbA@mail.gmail.com>
 <2772d5e1-2127-4808-bd9d-aa40b4ad7104@tuxon.dev> <CAMuHMdUEjMs9TgGR=vMG4Sd_XtnaW+D5Vrb0VBCZdb35TtLXEw@mail.gmail.com>
In-Reply-To: <CAMuHMdUEjMs9TgGR=vMG4Sd_XtnaW+D5Vrb0VBCZdb35TtLXEw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Mar 2026 20:02:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV=xus0aOBM9cCbVL1zV+zuGs_aXTkwcU7bkPKSVAKHxw@mail.gmail.com>
X-Gm-Features: AQROBzAflFR2kLKiheLNO3g3ErEb6Minavn-LOgpXMijxbEeoPeqXnj9bMzdxAI
Message-ID: <CAMuHMdV=xus0aOBM9cCbVL1zV+zuGs_aXTkwcU7bkPKSVAKHxw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rzg2l: Add GPIO set_config
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: linusw@kernel.org, brgl@kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34098-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux-m68k.org:email,tuxon.dev:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 18FA931B2DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 24 Mar 2026 at 18:28, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, 16 Mar 2026 at 11:19, claudiu beznea <claudiu.beznea@tuxon.dev> wrote:
> > On 3/13/26 15:15, Geert Uytterhoeven wrote:
> > > On Wed, 18 Feb 2026 at 16:19, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> > >> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > >>
> > >> Add GPIO set_config to allow setting GPIO specific functionalities.
> > >>
> > >> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > >
> > > Thanks for your patch!
> > >
> > >> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > >> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c

> This change breaks pin control and GPIO on RZ/Five:
>
>     -pinctrl-rzg2l 11030000.pinctrl: pinctrl-rzg2l support registered
>     +gpio gpiochip0: (11030000.pinctrl): setup of own GPIO can0_stb failed
>     +requesting hog GPIO can0_stb (chip 11030000.pinctrl, offset 18) failed, -95
>     +gpiochip_add_data_with_key: GPIOs 512..743 (11030000.pinctrl)
> failed to register, -95
>     +pinctrl-rzg2l 11030000.pinctrl: error -EOPNOTSUPP: failed to add
> GPIO controller
>     +pinctrl-rzg2l 11030000.pinctrl: error -EOPNOTSUPP: failed to add GPIO chip
>     +pinctrl-rzg2l 11030000.pinctrl: probe with driver pinctrl-rzg2l
> failed with error -95

And apart from also breaking mmc0 (probably due to gpio hogs not
working), it causes spurious interrupts on the Ethernet PHY:

     Microchip KSZ9131 Gigabit PHY 11c30000.ethernet-ffffffff:07:
attached PHY driver (mii_bus:phy_addr=11c30000.ethernet-ffffffff:07,
irq=38)
     [...]
    +irq 38: nobody cared (try booting with the "irqpoll" option)
    +CPU: 0 UID: 0 PID: 63 Comm: irq/38-11c30000 Not tainted
7.0.0-rc5-rzfive-07159-g46ccdb62e0e4 #488 PREEMPT
    +Hardware name: Renesas SMARC EVK based on r9a07g043f01 (DT)
    +Call Trace:
    +[<ffffffff80010c84>] dump_backtrace+0x1c/0x24
    +[<ffffffff80001226>] show_stack+0x2a/0x34
    +[<ffffffff8000c338>] dump_stack_lvl+0x32/0x4a
    +[<ffffffff8000c364>] dump_stack+0x14/0x1c
    +[<ffffffff80002588>] __report_bad_irq+0x30/0xc0
    +[<ffffffff80060034>] note_interrupt+0x12c/0x1d2
    +[<ffffffff8005dbf0>] handle_irq_event_percpu+0x30/0x3e
    +[<ffffffff8005dc36>] handle_irq_event+0x38/0x66
    +[<ffffffff80060fac>] handle_fasteoi_irq+0xa0/0xf6
    +[<ffffffff8005d574>] handle_irq_desc+0x2c/0x3a
    +[<ffffffff8005d5d4>] generic_handle_domain_irq+0x12/0x1a
    +[<ffffffff8039c61e>] plic_handle_irq+0x8a/0xb4
    +[<ffffffff8005d574>] handle_irq_desc+0x2c/0x3a
    +[<ffffffff8005d5d4>] generic_handle_domain_irq+0x12/0x1a
    +[<ffffffff80399dfe>] riscv_intc_irq+0x24/0x5c
    +[<ffffffff806bb730>] handle_riscv_irq+0x34/0x4c
    +[<ffffffff806c2bf4>] call_on_irq_stack+0x1c/0x28
    +handlers:
    +[<00000000be751d25>] irq_default_primary_handler threaded
[<000000000ed82730>] phy_interrupt
    +Disabling IRQ #38

NFS root does work.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

