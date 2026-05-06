Return-Path: <linux-gpio+bounces-36306-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKjICEth+2kuaQMAu9opvQ
	(envelope-from <linux-gpio+bounces-36306-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 17:42:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C19B04DD74F
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 17:42:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 51C2F303A904
	for <lists+linux-gpio@lfdr.de>; Wed,  6 May 2026 15:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCDF5492535;
	Wed,  6 May 2026 15:39:49 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AE948AE04
	for <linux-gpio@vger.kernel.org>; Wed,  6 May 2026 15:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778081989; cv=none; b=sPEG4CIORLud8VlKhIytGQJlWBMjMBzqe0yAWFlhfZpwyspJ15nC240BakpyIwc3dMSLdAO+sLcxo83Y2xHldh09FZDpiPwR8IBkxf8LYdwIsGSEuWuNJmt5s4vmmQBwW8Mx3RUn7gcB5qH9EqwSgeUV7cRZNT/nut/9e7Muzrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778081989; c=relaxed/simple;
	bh=LBmIgDAwAQqV4l2LIzPR18nkhRL7wfdwqg45Bs8q/1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NpUjoD69hH6In29nPK56Vv9xaUHEVnr+J4HE9C6UFEC2eNZ3TD2Plztnadg6t95CwUFSLndJL6p/U0R3BWpldTCOVGxLWpk08Tr0Hn0g4TCTcmO+TCz+Mu9LtFFAsLLuZzLLlDuXZD3mF7O5CHZv8SwyVmfdFio48EGS0ih4bdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-62ddb07fbd2so1467237137.2
        for <linux-gpio@vger.kernel.org>; Wed, 06 May 2026 08:39:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778081987; x=1778686787;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0kbrhikwqovxPcm2MY0WIUqDXXvt/c4ldcoQ6G9OQw0=;
        b=nXopg2bVxfgW3vsrJ0IMTLtv+GhH0t489Z4yBIumVq/QxZonDxzywnz2f0iXsChu8u
         pCvtmp1n28iKho+Nxa4DGxC1FzWhhsFliXTX0lrRiD+fx4VBOl1wxdNdgswyoDgmR0Hw
         3183oXr6xj1IYRub/XxoqdxkLvqOg9uhp7yJn6e9zO2lcBgrhqgbx6vgdAkymwImv5wO
         28r7qYUX2WMibp5NSFqUGpdD4q4DHloJfAduVSAQpHwlEyflSE2JhiAJxQwyFL1saikJ
         0l5zAAw5PWNFeoz4lC9i+JhDpgTCX6HRjKrCj1hXNrN80BneqIULrIh/NSEG6Q1E7xms
         bn/A==
X-Forwarded-Encrypted: i=1; AFNElJ9IYROOVA5XaFM4opu3TPzFSakFFTsVAyujLFe/S5fhEbMqGK9Z4G4qdOCEpxsrdCvAulNf7WUYKJhg@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1eQ92sG4qBq+x+2mefN6VuXnCucTBpdZ1Bponoe/Pi26YZGVG
	GTEaMFjqttHy/r9krXKDV3Cy0xpndFTV8rJpG6fvp5Lf0JY5jkNhYoRv8mrOTKnk4ao=
X-Gm-Gg: AeBDies7QEQQx7utGcs7S0XDwe1GjGXgdt81G75L5ycbILCmqflIokWFFOzeIXRvalw
	ndGPyEq4l5Y+MmBndBx9dwu5NKlXpwriXSk/i1aOkGK3nf9IokMN2TUalyPcsUHzLRYTdmk5F7J
	TkUyDQrbSC4KiauGv01QKpnKTsuGrB0CzVGFR/iD22paBvjjzWpJU5l6dmnzq8PWDzXbmcPSFtE
	2Q28cFgeMxYjm1lFONHfFKTFaGzpL7SjZu0fh9Zr2Zl4qLK9dSZQVElqmCOG/x52Q5X0iih+QUy
	uw8u1l2KE0pzxHqT1k+nMEcwHoLqHF65K/VucWvANX7h9URAt6bnCutih07GK0Hk0yZtc5SlSQY
	BcN2Prp+NbSUfury42I+26TWOsC4Ojzsep2z0j/UlJT0FZMsXj7MYy9ZR3UCagzO9kHz0SfhnPV
	aSlvSv7Foh3AmNZMRDmJgMPfM3iDdfxQ+aYgXEyA28pibPr1MwLb3TWZGCdd7qKrDWfAgxofr7m
	BNsn6ISUg==
X-Received: by 2002:a05:6102:4420:b0:608:1b6e:f4dc with SMTP id ada2fe7eead31-630f8ee9c5dmr1800261137.11.1778081986788;
        Wed, 06 May 2026 08:39:46 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-630f858f550sm1669988137.3.2026.05.06.08.39.46
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 08:39:46 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-62e94ae15f7so1451463137.3
        for <linux-gpio@vger.kernel.org>; Wed, 06 May 2026 08:39:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ861iSpLFwubF3/tKi2f+3UZZm1PhXahwWSNmzHOJpW7uO813Pmy4mwz4UeOQ0QQL0564Z6p1Kpog8o@vger.kernel.org
X-Received: by 2002:a05:6102:b15:b0:628:397c:ecea with SMTP id
 ada2fe7eead31-630f8ee791fmr1784531137.10.1778081986328; Wed, 06 May 2026
 08:39:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430093422.74812-1-biju.das.jz@bp.renesas.com> <20260430093422.74812-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260430093422.74812-5-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 May 2026 17:39:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUzfB7d8S7y2YQk-QtgHff+QZeVcXHdmGFeFrT3acTZHw@mail.gmail.com>
X-Gm-Features: AVHnY4LGjtWPKHZA8LMgL9Wu8go-UfXc8etk5Fq9z1BmwattUYtahz5UCfOKg4M
Message-ID: <CAMuHMdUzfB7d8S7y2YQk-QtgHff+QZeVcXHdmGFeFrT3acTZHw@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] pinctrl: renesas: rzg2l: Update OEN pin validation
 to use exact match
To: Biju <biju.das.au@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: C19B04DD74F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36306-lists,linux-gpio=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,glider.be:email,mail.gmail.com:mid,renesas.com:email]

On Thu, 30 Apr 2026 at 11:34, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> The RZ/G2L SoC uses pin 0 from a port for OEN while RZ/G3L uses pin 1. The
> existing greater-than comparison against oen_max_pin in
> rzg2l_pin_to_oen_bit() would incorrectly accept any pin below that value
> rather than enforcing the single valid OEN pin for each SoC. Replace the
> range check with an exact equality test so that only the designated OEN
> pin is accepted.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.2.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

