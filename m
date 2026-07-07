Return-Path: <linux-gpio+bounces-39555-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7hcRIOOjTGr5nQEAu9opvQ
	(envelope-from <linux-gpio+bounces-39555-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 08:59:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E08C8718364
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 08:59:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39555-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39555-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CDA5730128CD
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2026 06:52:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F251435950;
	Tue,  7 Jul 2026 06:52:49 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CA43AD515
	for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2026 06:52:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783407165; cv=none; b=ov9msCUPuGm5AxbqxoXgNVxEq9a7LO2rja5u93kXlMknZExMMGIxBUpC1peKMBk3JraVM9QALG5vc/fwbkEdiBgy44puMRTXRpBVb8jhHgLV1WtSVWCVHxGBEuKrp3WePTevs4gF70LUCxN1tXCo0L+Hg0lmjfthSM64Kwm345k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783407165; c=relaxed/simple;
	bh=gD/q7SKmBrC0OtQIWUnnzJ0urKpnYBI77eKOVOV42ZU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U1JrTamdImch6EYU/9sIi838bLKLRezAJYoRZElqrd/IJZ+bD3noDY5CvAk694/XBQ8VpcdFFEFIrF6nAIPH+pWb76n/zIh6jUD6xxz56HARO2/IKF1YuO9XDPcNHlv0gPmNRp1yusAuXtKCW3Yop3hPvItXNjJIQW7ydt/cj2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-96950b34a3eso1034401241.0
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2026 23:52:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783407155; x=1784011955;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=H1oWLi+zgA/mmqPta9lQQ7n/K/VL51Ngsb+MHJRTZdo=;
        b=L0/6zHlAhydt0nAsYl+DXP8S4I4vwZdVuKlIuQyXeWFn+TqWuPx3osSBi7CNTtelgi
         xi4/9Dyu253dsqIYSkgo3cKDMj+c96vZ21MKuls9TPJVzLcuE5QQdQ5z/HDQGpI4e/QP
         x6yft4Iqv9FLkIpsdC0OuazqSIcicqNc2q+MBHYonC+xDs3C9+LSnsHUNwsZ9yeNFKKP
         +HFkHURSyqILkPf+HW7h3mdsTs8jug+xpkAaYvs2PRagbZVIJIFrTl6ogO8dpEqyIKCg
         OrkKjps+u+EyPXtpGVYGKD247k4NW51ra2WSRQ4/WHYDfQoxb1fkDPe4JN3uKsFGXu0J
         SuqA==
X-Forwarded-Encrypted: i=1; AHgh+Rq77C8mjLEVuvtRNOwwUJNyKT2abN9uPdWwcPYYGTQUy14KGnBvg1cEI7KatVTIZ0KDQzltTngofkXr@vger.kernel.org
X-Gm-Message-State: AOJu0YytUo6BsNCrMhMyxEg5JUk06PDwBYpRwXUv7wjTvY5ARgnJ2AO+
	kTREIAXJ7Bqc71QHvFZ0J3tEjzXB1E/68Y32KOT/VObqGldo5sZsnr54/c3wWjAg
X-Gm-Gg: AfdE7cnmmut2EHOjAqnfvIUXpBmDXyXFCfr4RHrEHE6391u8S2c2u5e4dA6yhVfhlTz
	K8itgtak09Tk8PLJjpgosFXS4PhlfxeOglmxPqp5if6FLCSevKxoLrC1dBT5VBOhCYhmT/3moH9
	jrgNN7aSixx1goKceMfSWqpUjnA9sU2qsJIZHfVrQBcwHq566N4Bd7iZAO3uPT28m0Kuz4XYCOS
	FQo+SU9+bNjKr8aQ8b74ubi2D93YZ8bc/9ptAdydyvCtBHA9pY5IXNKf+830IzPWhzqk4G8oFQd
	t4wr81zyPmyimEOWwssLjFLpqs/J/1hnHraZTtQYw52We2CEsmAk0EvTOJtN58Fx7u3NcHNMCvr
	Xd9g8U3SIBcZ+ESEVvyGqgrSXDWrFL3vrDvKC1o7+Qnix9XH/6jsIcXbcE6/UKn6NoIqwyxW5Ob
	OqFnZXwwWCwWyfXO0DXlJGWoHGovXckBj9bPDnaZ9MccUII9AMdg==
X-Received: by 2002:a05:6102:914:b0:660:d26b:506e with SMTP id ada2fe7eead31-744b79c1be9mr2250810137.1.1783407155355;
        Mon, 06 Jul 2026 23:52:35 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-73e173b2b2csm6767631137.0.2026.07.06.23.52.34
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 23:52:34 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-73be40e5c4cso1010924137.0
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2026 23:52:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrOpkT2yxuBY/k/3V+iGoLOKCLswGHACKpSlNsmPgSlzBSmI2zwEY8RjW7e5O1QSrUKIahyqTgXayF+@vger.kernel.org
X-Received: by 2002:a05:6102:1606:b0:740:2717:a2d5 with SMTP id
 ada2fe7eead31-744b79c1bddmr1806938137.6.1783407153869; Mon, 06 Jul 2026
 23:52:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260704151521.211335-1-marek.vasut+renesas@mailbox.org>
 <20260704151521.211335-2-marek.vasut+renesas@mailbox.org> <CAMRc=MeyKGv75rTLauZuGxSfgjCPXVE_r=A7uNduRr6kAd43aA@mail.gmail.com>
 <edc7505e-1103-42d7-b88d-013ca10753b3@mailbox.org>
In-Reply-To: <edc7505e-1103-42d7-b88d-013ca10753b3@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Jul 2026 08:52:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXQQWmn612R3y6qSXOZ7YMwZcfrBTrQZ9GzGekhFhtWSw@mail.gmail.com>
X-Gm-Features: AVVi8CefYSfbwNIrN8ylhp-z_YSTf7aaF8Cz88JDJCE3fX10J7HfmxqA13tE8IY
Message-ID: <CAMuHMdXQQWmn612R3y6qSXOZ7YMwZcfrBTrQZ9GzGekhFhtWSw@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: rcar: Add R-Car X5H (R8A78000) support
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39555-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:marek.vasut@mailbox.org,m:brgl@kernel.org,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mailbox.org:email,linux-m68k.org:from_mime,linux-m68k.org:email,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E08C8718364

Hi Marek,

Thanks for your patch!

On Mon, 6 Jul 2026 at 21:44, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 7/6/26 11:19 AM, Bartosz Golaszewski wrote:
> >> +static inline int gpio_rcar_remap_offset(struct gpio_rcar_priv *p, int *offs)
> >> +{
>
> I am hoping to get some input on this remap function.

I haven't looked at your patch in detail yet, but the remap function
was the first thing that struck my eyes.  This might impact performance
of bit-banging and of the sloppy logic analyzer.
Have you looked at the code generated by the compiler?
Perhaps it would be better to use a table, like sci_port_params.regs[]
in the sh-sci driver, and riic_of_data.regs in the riic driver?

> >> +    /* R-Car Gen4 and older do not need any offset remap. */
> >> +    if (!p->info.has_layout_gen5)
> >> +            return 0;
> >> +
> >> +    /*
> >> +     * R-Car Gen5 register layout is slightly different and the offsets
> >> +     * that have to be added to or subtracted from each register offset
> >> +     * can be divided into five groups, listed below.
> >> +     */
> >> +    switch (*offs) {
> >> +    case IOINTSEL...OUTDT:
> >> +            return 0;
> >> +    case INDT:
> >> +            *offs += 0x10;
> >> +            return 0;
> >> +    case INTDT...EDGLEVEL:
> >> +            fallthrough;
> >> +    case BOTHEDGE:
> >> +            *offs += 0x70;
> >> +            return 0;
> >> +    case OUTDTSEL:
> >> +            *offs -= 0x34;
> >> +            return 0;
> >> +    case INEN:
> >> +            *offs -= 0x38;
> >> +            return 0;
> >> +    default:
> >> +            /*
> >> +             * This here must never be reached, if this is reached, that
> >> +             * means there is a catastrophic failure in the driver. Skip
> >> +             * any IO read/write to prevent further damage.
> >> +             */
> >> +            WARN_ON(1);
> >> +            return -EINVAL;
> >> +    }
> >> +}
> >> +

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

