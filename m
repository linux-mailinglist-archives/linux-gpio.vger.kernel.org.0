Return-Path: <linux-gpio+bounces-37570-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MvTLRK7FmqHqQcAu9opvQ
	(envelope-from <linux-gpio+bounces-37570-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 11:36:18 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7745E1DEA
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 11:36:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1D0623004CA9
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 09:36:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 453D73E5EEA;
	Wed, 27 May 2026 09:36:11 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA92C3C13E0
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 09:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779874571; cv=none; b=XVhu9Y0NC4qQhbKmP0xjjM1uzv3KmeyPqoAUh/bEim2m+/dl1NIOAL6P3kA7Y6g7kgkS7xslPRDJFLuTweX1rm06xy4XRcSMT9DCazspmsv6tTXXrDYQj5Oq9Ggl+VzvbWNFzdUsNozMeJQ/C7jV9KAD/0Ksjp85Inch2o3t9z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779874571; c=relaxed/simple;
	bh=zj+g/ezhAtLOdlP5pufwUVnlw/mx7Nw1tJEnvJe2s7s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o1ymFJqUPmP+ihiq7Ii0DPg190oyRzRuEkVFynVH7sKy4jp6Op2vrNvLD2QhoCmy+WF2H/LlkbRrqkHNJEUoFzrWmAflF52LSE8LwGmxqTNMTU6gaSPtVNPgSadFpWi6tDRksZkPtLiMy9D3xEAKnHm4u0VTvIrpAz+GnrMob/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-58d2174a2b4so1487401e0c.3
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 02:36:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779874569; x=1780479369;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GzrbtAIhbhlWL39MAGAjbHYV9tAMPrYxV5QryhtJx1s=;
        b=kYURdLoIKXN6ak/iEfx8EuSIfYKYZjrJU0vo4nGlKJM2jzRs+0MjhuI4ok5bgBghTR
         Hc9AwfRZ9Zd45Fw4psrWjEW8eSMtkNuudyGJ/lffqI9XNTL8Q0CKrBOQ4pwexBQZFh1s
         2aBolGUa6wr7bPuq7H7XGsFJVFteCR4AjNjHravS/jZ0KxkGgMnhfkmXjjslLvO+GVop
         s2pmKAE2P9Q4mxUrnO5/sd+ABDTETTX4h9nFuLk5EURx4jdbFZjumQhafA9UZmlNocu/
         foZUCj425A0JGf3ounj8ugcuzSQgS+mWqjZe9VOgB1wRozZG5MH9j67nxZ0yvjKQpyvy
         LXww==
X-Forwarded-Encrypted: i=1; AFNElJ+XgLP+eY/BJDu34kVFZOKGoVfI1zQXX/4j82muU8Hc9OYFW+unNzC0UxHzKv+ZQZIVaBzVp8RK298A@vger.kernel.org
X-Gm-Message-State: AOJu0Yygon9w5gbIuFcsOuFDRr0WbwBWg42jIEb8xYz7Bx0PeeHhZmFi
	XKkUcX3kEMmToaNWrnDdN9ZK4hr2kev3vflmttD4pwi/ZUSBh6D/BqSzoxxxOH7WYHY=
X-Gm-Gg: Acq92OH6kMo6kFrf0Gp1LRIKyq3jwHGgGhRgq+Wjzfjb/RC01Yk3c88ruR2TJixDEuO
	f1MdaS9CgqRs88JGGqSo56/vyuIU/dsju9mV01SDAm8v2wcVXkCqR8YeJxmBXncrRnMEj5UGLUP
	CXqyHzolJJJ+zHwyhUMBu8fmTaElShQZTWisrTWe5n6G5OyRPHIDzvjdWVAFTmTQEtmCG4ZPXKc
	v4giAZNzoL+ILesJKOCqxs0vHHEuw4e0X0+VzoyCLatlyjy2OPwfdAgth6EYsHn9FgBXIllUre5
	OWskU7x3G+kapdbDuT5VgyGwQP25SOVLVjNdReVlyc68j+vJ2zfbF3ZZ8ziA1m8wV7XxpvaK92c
	AoxXGCjh/TmkqdUe+aNfRWcU1cQBuDF4fjy51ZblMm1YWgAKZ459amtxXIsE+R9++IOjhn6fe0f
	T0+aHEILRlJbeTBlgD8QZbeGenWEH2XU8qS3AUMuuDNKvL4fUmBVitmzj0+bie1YAjOa2hUaAY7
	TWvF4n/8WCURQ==
X-Received: by 2002:a05:6122:168b:b0:575:29ef:7e13 with SMTP id 71dfb90a1353d-5865d70e96dmr10026052e0c.3.1779874568661;
        Wed, 27 May 2026 02:36:08 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-961cc2b70e5sm3435148241.0.2026.05.27.02.36.08
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 02:36:08 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-58d2174a2b4so1487392e0c.3
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 02:36:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/mUJg9JRLRylYk/V1zrSM4bL5oiQKzyvN9LzmrWNE+fhiI6rs54TxCz7Lnjw/ZZxuuJWV7x4dQLlJX@vger.kernel.org
X-Received: by 2002:a05:6122:247:b0:577:501b:a668 with SMTP id
 71dfb90a1353d-586616414f1mr10121604e0c.10.1779874567993; Wed, 27 May 2026
 02:36:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522102251.1723392-1-claudiu.beznea@kernel.org> <20260522102251.1723392-4-claudiu.beznea@kernel.org>
In-Reply-To: <20260522102251.1723392-4-claudiu.beznea@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 11:35:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUdrtRvefgvSZdM-Ek5At6gi-wRsi-9hqefoa4ij6meKQ@mail.gmail.com>
X-Gm-Features: AVHnY4LW6vUstLwsIKPkIzpK5RB63flO6CC_KxPAXPEps2GwX01GBBQiIwPKpZg
Message-ID: <CAMuHMdUdrtRvefgvSZdM-Ek5At6gi-wRsi-9hqefoa4ij6meKQ@mail.gmail.com>
Subject: Re: [PATCH 3/9] pinctrl: renesas: rzg2l: Keep member documentation aligned
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, magnus.damm@gmail.com, wsa+renesas@sang-engineering.com, 
	claudiu.beznea@tuxon.dev, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,sang-engineering.com,tuxon.dev,vger.kernel.org,bp.renesas.com];
	TAGGED_FROM(0.00)[bounces-37570-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.942];
	TAGGED_RCPT(0.00)[linux-gpio,dt,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,renesas.com:email,linux-m68k.org:email,mail.gmail.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: AD7745E1DEA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 22 May 2026 at 12:23, Claudiu Beznea <claudiu.beznea@kernel.org> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Keep the documentation for struct rzg2l_pinctrl_reg_cache members aligned
> with the struct member order.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

