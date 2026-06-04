Return-Path: <linux-gpio+bounces-37938-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nbP6KtlLIWr2CgEAu9opvQ
	(envelope-from <linux-gpio+bounces-37938-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 11:56:41 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2319063EBA6
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 11:56:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37938-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37938-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C779B305B20F
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jun 2026 09:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E11F03CCA12;
	Thu,  4 Jun 2026 09:49:00 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296CC3BF696
	for <linux-gpio@vger.kernel.org>; Thu,  4 Jun 2026 09:48:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780566540; cv=none; b=H3RfCN0S6NUWkDycKhSVrUoGGXvELGcfstgOO30S+4FtR3oRnOaXhvh9Bk8r+KiZZslU6efnsnRByV2X9PnqDRM1XRi4Ss5vxm8vL3aCFV8LyyBhcvjuKt/qJXBRB8VGP0/4acBr6WTeHfNsqJoc+dHPZ5BT+S0CanwwAINJPms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780566540; c=relaxed/simple;
	bh=9ccdKlMLp3ktq3NWcjK3eTgouh7Xi9aiQybPD3Ap1o8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EMACrsAm5FlcnGMiTNq+jhTJRTk8ODkG0uP15GJHSmACZCglT+9oLRf2PZ3vZi6uLeckt8yjnGJLUJVBpj+SvqXoORRHzl7+Y65jvP+0QOkIDmQsq4i505q44vIlrzLfFvoE22RwF3TjS1nH3vrBCluE9Wlw52B5VWOSdJIs7oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-963b09d5b91so465896241.0
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jun 2026 02:48:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780566538; x=1781171338;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KPyZKtpWg5qnni2e5fD9GWWB7qem8w+cCv5HCayF8qI=;
        b=f4SbQPxp39itJ/SGyeEtJjztp/DTq3oLcnM8inyHF3s4Xm5FcY30FSZ1sHzVJ7rEqR
         kZ5nlpUkFwQvo8FFzq7unLW3YsQH83Cpb/XuVR7IqTc7xQoo+3hvrrXvubtAVqtZ2XM/
         bHMKp1KIJAhsbudRqT9iLkl2w47fl92ZlCegKJ38inclYYQcwQiUE4Fc5EZ5AoWCI0ob
         PiWAfLmtwg5YT9Klr9+ljSDoPYNHd8MdF35DTtas+94+GuYhTMdOYDc1bqzlYrWvA8jO
         qCbj33BmqxhLmi9/AcH3tU2DklJEWYjhgnab1AfJYBicjot+ErNHaeeDk2xbB9NN3tdR
         sieQ==
X-Forwarded-Encrypted: i=1; AFNElJ8zt9N4YHiiwX6+Rxq8gQ0QHl96nCxg3i8xULPMENcQKsF858m93QJVmi352z1Z2W4TDW+SjF8VVan/@vger.kernel.org
X-Gm-Message-State: AOJu0YzfDOZZ23b0b3wECBaNKB7VdzsMS/cmtzLC9r7rOdTyeGW8wDzf
	t62fdASKplXmTUQX+pjtY0Eb0NOQDV/ERPh29PSaAILN9DYdMBB7DVfel2TIuagq2ds=
X-Gm-Gg: Acq92OF78nQSFmeMpBmICyzabJD7xnCxLaT9tDKWeGp2SO05YobRBFyacFZ/EjHWlj5
	1feaV9ILe+wfP/eN+/ZCGKXZXYyXBUkQGuV8FJwm7/k/NjFLQZTw2k2++bWrfBlhXXhZO1XuQt2
	52rvvvsGwaQ2RD5sBGsehVuUbs9Q2zuT1PG+j6iWyaH++7aKOtm/DnfpPbss9jckTerbiOqD9ZM
	wBnZzb3OOSRqWeTis9ggxMpNAuiEyltB7TmYslVlGBrBV+FhCdqX7HtQPfoR5hjVeT9CU6SYctd
	6g8O5o8KLLIMOrbSOsQoi9caTJn14hm8QK0ylmTAiF7DlM57XC3nT0PqYb6xo/oPl03S2cAfUDF
	zaWudIiUCBX5Bv8pF442BuFhqX+qI4Xsa/wPcxxlEUDDpaSXwDq53Qj40AqG4PPJeNT02ycXVAZ
	wl+DCrmWguaeWyyQTbcioEQNGIWK8r4XiPBnHxSuOoyWdvkO1ttEw5pI5+srhKJKjiudabPzY=
X-Received: by 2002:a67:fdcf:0:b0:6c5:94a0:37cf with SMTP id ada2fe7eead31-6f544240339mr898167137.8.1780566538131;
        Thu, 04 Jun 2026 02:48:58 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96413fcc8fdsm4113566241.7.2026.06.04.02.48.57
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 02:48:57 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-6c6f47198e3so364734137.1
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jun 2026 02:48:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9IzVD+74K9dtd5pn4Uf3FG2V1JXvlDa5UuYK83v4n+QuV0duy48N7Ym3OhxB3QSiNvUMF6Kp510dbz@vger.kernel.org
X-Received: by 2002:a67:f889:0:b0:6cb:b3db:c31c with SMTP id
 ada2fe7eead31-6f52c84f821mr959856137.0.1780566537239; Thu, 04 Jun 2026
 02:48:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603151642.4075678-1-claudiu.beznea@kernel.org> <20260603151642.4075678-2-claudiu.beznea@kernel.org>
In-Reply-To: <20260603151642.4075678-2-claudiu.beznea@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Jun 2026 11:48:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU_T=G7os6KBG6xTnphnhQ9pQtd88BUkg61S7286bZmFw@mail.gmail.com>
X-Gm-Features: AVVi8CdhQoz1FuQPTz5BSOMe5fOJfBS7YW1L8CNma8uYS8HEHOx4e8eahLsemts
Message-ID: <CAMuHMdU_T=G7os6KBG6xTnphnhQ9pQtd88BUkg61S7286bZmFw@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] pinctrl: renesas: rzg2l: Use raw_spinlock_irqsave()
 on power source update
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: geert+renesas@glider.be, linusw@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, biju.das.jz@bp.renesas.com, 
	claudiu.beznea@tuxon.dev, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37938-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:claudiu.beznea@kernel.org,m:geert+renesas@glider.be,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.jz@bp.renesas.com,m:claudiu.beznea@tuxon.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:claudiu.beznea.uj@bp.renesas.com,m:stable@vger.kernel.org,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[glider.be,kernel.org,gmail.com,bp.renesas.com,tuxon.dev,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux-m68k.org:from_mime,linux-m68k.org:email,vger.kernel.org:from_smtp,renesas.com:email,glider.be:email,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2319063EBA6

On Wed, 3 Jun 2026 at 17:17, Claudiu Beznea <claudiu.beznea@kernel.org> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The rest of the driver uses
> raw_spin_lock_irqsave()/raw_spin_unlock_irqrestore() for locking. To
> avoid concurrency issues or deadlocks, use raw_spinlock_irqsave() via
> the scoped_guard() helper for power source updates as well.
>
> Fixes: bbe2277dedbe ("pinctrl: renesas: rzg2l: Add support for selecting power source for {WDT,AWO,ISO}")
> Cc: stable@vger.kernel.org

No need to CC stable, as the bad commit is not yet upstream.

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

