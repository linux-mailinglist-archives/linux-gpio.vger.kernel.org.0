Return-Path: <linux-gpio+bounces-35910-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDoZNrdG82kMzAEAu9opvQ
	(envelope-from <linux-gpio+bounces-35910-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 14:10:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0404A29C0
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 14:10:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EA873300462A
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 12:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 881E53F9F22;
	Thu, 30 Apr 2026 12:08:25 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1013FD129
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 12:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777550905; cv=none; b=HtDZioDhqkY1Psst0oP3Ulqk98lzb6WUTFMUf1335khcudoyMov0TLLDnuX49SxAV9HfVzBhX90YRGWGP6m2n29c8OmLZfshcfMz1d9ydp90H3ASz2LgIKWCAGvLbdIcxKRZu1gCPjCxpqQr3HdMVfw6y+mUqTUef7hAFqCiGBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777550905; c=relaxed/simple;
	bh=EZZ2E4Hk4P3ioWVMaervDcnw6ADW65oM1zGar71sbpY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FPKI6AGFzQryl1CXksUdBCVf8y+8vWPuk7YyRLOJAKBf98At1m2wVSZAQvmNVZfZLln60la/7rQIvOJcPtX4ytvjNkJbgd3Pay+rxCB0cn7PuW2Ac1cNS9YLy7EjsD9AF9KSJ61GuoTjurkFwAFfBsVbA+/7UE1TNMBSqzKaRWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-404254ffe8aso728991fac.0
        for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 05:08:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777550903; x=1778155703;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ksIL4rip+tLI1Yx6QhQXSN6krUTnsd9SRkVzjQXrZjA=;
        b=WrZJ9QTkj2GnfY2+JlgSHMMfKSsGZT3ZVGWeBbdplG/tV3HYDwo1LJ1y79iAZMPJD/
         burwC0TOXwKpJJ7vzEFvTJBe1EGf/EtCwYXnwSvnyImosALiKG100U5Iv1H0M+vmoCJd
         rWIO8ZVseKFugLtCGgnkTbeN5SmjhV7/lw0QPQ1eDFyyjxmhZp8DEXjYoRlZHoFm5BXq
         NN+V3z4uIwQbb2hzOZGr7aBaCIB0aOTBe0l4edNXW2z6NXWC+CtLJ7GN6W5fqPDK2G4c
         g5PjA8g7XN38726c9yWrsBMJ9zYp2NmHkuaYbrWYHupC7ehYWqyKQU5RLOAFPgdUcTba
         JG/g==
X-Forwarded-Encrypted: i=1; AFNElJ8gu+s5vyRtiwZED1PEltFL8A96+G8RLPkPp/QTdWJsSckr3x5fDQaVxiM7Y/773TRUlfAGSkXptAhq@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/nSYfLvnAydG0X/HTKEYqhUyEM0qWcgYHbsXtpkNfEiAmM7ur
	k9gWhFNPsNnsa03QH1deX5T+r9QGEcXZOx13LBmg+rBqQQwHAa3BjdGGK58ZPztlPEw=
X-Gm-Gg: AeBDievdVRP7mlrZks+43kAAvhdeWb45XhGlWjPqWqJoqertx+ubAntCd92oQ/nWVuZ
	PRVtCvdrNAUxSG/JcB4qOpAWhix/ZZypKob8ZGHDC7xdGweQGRWbN5fUZru5GtFBFuE86zQdQEj
	rij+zMOsOuKDQy2zlfr0ez/ci0VQOMdW/IWbA75JLCsu8HrjpmYQovo9y7yjXvKkmyDHbbKjADg
	L02skZ8Sd3SAYpxa8CkbVIqP5i4dKg7BMCkrnnTJ+WR3s+NzaallK/X/dsT1gs1ouf98pGt5Gvg
	CS4wkaaB/7OjGaeZcLMYAt96g96Y/6DotgCWpfav0Mx+dJc6CY3fmLYGFve0yrP7bzdUSnTESS+
	A3+h9Ahn2a+Grob/MdYlEG4R2ojuN3yb/luKxE66nbSq0+AKzT60vpVd1ln+coJd1APdrAXHT6f
	wF06cq6a15XDsm+Iy5yXn2pe6nsHhhMpFMT07vYj0C//1DmjGupuHvLfwvnXwfdyWhYWMKHuc=
X-Received: by 2002:a05:6870:9d95:b0:42c:924:2bf0 with SMTP id 586e51a60fabf-43438c69391mr763279fac.27.1777550902934;
        Thu, 30 Apr 2026 05:08:22 -0700 (PDT)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com. [209.85.160.43])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43436af06f8sm1562228fac.5.2026.04.30.05.08.22
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 05:08:22 -0700 (PDT)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-404254ffe8aso728983fac.0
        for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 05:08:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9vRtRIca6jsEQQQM7Ni9S5TK8TrnSCzuueuVWOvk4ITC1UtRPPTx4/21HdQbCbF2D+P/fwUATBSh9o@vger.kernel.org
X-Received: by 2002:a67:e708:0:b0:610:347f:9f3b with SMTP id
 ada2fe7eead31-62afc506100mr613209137.3.1777550404889; Thu, 30 Apr 2026
 05:00:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430110652.558622-1-vladimir.oltean@nxp.com> <20260430110652.558622-18-vladimir.oltean@nxp.com>
In-Reply-To: <20260430110652.558622-18-vladimir.oltean@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Apr 2026 13:59:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWbeeRmLf6Ae0Fr0un=-z7z5ONc_hDdjebP=KVkXHPbhw@mail.gmail.com>
X-Gm-Features: AVHnY4K0yYb6vTu9KdtDciwvAziqboYRX_ITZ386sa6ttixZ1EP_Mzy9gi4Pi0E
Message-ID: <CAMuHMdWbeeRmLf6Ae0Fr0un=-z7z5ONc_hDdjebP=KVkXHPbhw@mail.gmail.com>
Subject: Re: [PATCH v7 phy-next 17/27] phy: introduce phy_get_max_link_rate()
 helper for consumers
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-usb@vger.kernel.org, netdev@vger.kernel.org, spacemit@lists.linux.dev, 
	UNGLinuxDriver@microchip.com, Markus Schneider-Pargmann <msp@baylibre.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andy Yan <andy.yan@rock-chips.com>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Vincent Mailhol <mailhol@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 3B0404A29C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,linaro.org,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,microchip.com,baylibre.com,intel.com,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,rock-chips.com,pengutronix.de,bootlin.com,tuxon.dev,glider.be];
	TAGGED_FROM(0.00)[bounces-35910-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[44];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux-m68k.org:email,nxp.com:email,glider.be:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,baylibre.com:email]

Hi Vladimir,

On Thu, 30 Apr 2026 at 13:07, Vladimir Oltean <vladimir.oltean@nxp.com> wrote:
> Consumer drivers shouldn't dereference struct phy, not even to get to
> its attributes.
>
> We have phy_get_bus_width() as a precedent for getting the bus_width
> attribute, so let's add phy_get_max_link_rate() and use it in DRM and
> CAN drivers.
>
> In CAN drivers, the transceiver is acquired through devm_phy_optional_get()
> and NULL is given by the API as a non-error case, so the PHY API should
> also tolerate NULL coming back to it. This means we can further simplify
> the call sites that test for the NULL quality of the transceiver.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> Acked-by: Markus Schneider-Pargmann <msp@baylibre.com> # m_can

Thanks for your patch!

>  drivers/net/can/rcar/rcar_canfd.c                   | 3 +--

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be> # rcar_canfd

> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
> @@ -57,6 +57,7 @@ int phy_notify_disconnect(struct phy *phy, int port);
>  int phy_notify_state(struct phy *phy, union phy_notify state);
>  int phy_get_bus_width(struct phy *phy);
>  void phy_set_bus_width(struct phy *phy, int bus_width);
> +u32 phy_get_max_link_rate(struct phy *phy);

This (and all the existing getters) should take a "const struct phy *".

>  #else
>  static inline struct phy *phy_get(struct device *dev, const char *string)
>  {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

