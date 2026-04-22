Return-Path: <linux-gpio+bounces-35349-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKdHL3St6Gn6OgIAu9opvQ
	(envelope-from <linux-gpio+bounces-35349-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 13:13:56 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 248EE445262
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 13:13:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9443E3029241
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 11:13:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18FCA3CEB81;
	Wed, 22 Apr 2026 11:13:42 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00463CE49D
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 11:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776856421; cv=none; b=FVK27JDJ9pH11Qv7ZFC0Cj00o2dMpJEDlr81aXa36/OZWCMxJu15VR3d5UTrxAihS2k2hYwHMSYmxkP+KPNe+ha8QRTNd2hcRGM4WYsX7BNtupILvYgALMJ8wT3I0rHruL+NfvF3QMh6CWIZGIbP+glTl4f04IiZIDTye/PD+Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776856421; c=relaxed/simple;
	bh=cBjhdCwW7hgdwmZ1DkVjCPmyFRahOur6Pa10yN5MASQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qNSn41g2Gw7q8ATme85RHlbp4G47mXDg/8Ex6aoDvhwNUt1YQx89gE70jhWc0mymFOTrZvUockKxZjjxVsuHSAWKhZiaG3CZgi0OQ4EyXxZScUlakb72kAcqk8TlpMXTHv8pWDGmvn1A4Op67aGa0A7/iUuJbyoahJqvgbD/sgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-60fa5eb3ee1so1685677137.2
        for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 04:13:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776856419; x=1777461219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1s+zgG1aC1QktYkJ+rJATA7ko8k/pNI81E1TOGy7G8Y=;
        b=O+DQdDaVK/3aNtgqh0SezaGVeHdoR1h8GeKD9nBnQAYOGyYQWCCtphzjmXQFxrTlSR
         x5h/LNqfR3xEPHrh7dwrBowNgsVP0Np5ngVHLjlAY1OF0diZ/FiJAH+Kdymju1Fzn5oi
         X3kh01iXwWA2Qvfk2akQIjOibO1937F9iFQwxOH8Z39dbLuXwr0UT4KV14IZkwSyLqG8
         hNcjAYdKseUH9xsfVqJJFJ37rat4JORGBEGL+WmyGUPXVJ1cskxtS8AIXWWiLj0N4/b+
         6hmAf2aJKo0FXfMV4v06YvYyCWCVBOPgbhCtz+7kvU0DkfNyRZ0JhMzHTSMnCMxiPpbG
         YtRg==
X-Forwarded-Encrypted: i=1; AFNElJ/ivScdmC/DWM94y/Xs2rjM4fOd4aoelFZvWi/heoV0uFMgfAaFLeip2rD8YwqoMn4HAfAZRS/+jfAc@vger.kernel.org
X-Gm-Message-State: AOJu0Ywpn6eSIs1zPVzy6dDfxnPcg52+KjHkSu+mhZHj2YnV+Ncu8aOe
	rGcKlMi8QDQVYoSAGhX96uOzx/fqQNeJdTQZAI8Sf4ql7afl0O1BJ4FWksqAZ9NgqhA=
X-Gm-Gg: AeBDieuzRrKwY1wGWO/OWL/FQz0h23wExFBuPtVyw008f8XySIMYd7moroHF8ZxTuOb
	u8vCa/Bmrd/Mlh71UTbTC4JnuGL0MhYYNKXwSCaBw+/L5zidKnagR5tchuzgIU4u4ptC0ITbKsf
	L23R1Ag3dTROIbBFJ3a99PZ4cK5F3ZAQp0ATHbD4w9JjBlQPTbWLDQOZZogZ+J1J7M2hjOWjv13
	TZqoDEy442GTOy4M2YllquKxrHqlZpuVBtFOqeasML7d6e5DS89a9i8w38FJkVaHLrYlMd2Dyfl
	2SPyhnKHYMIrsQvvxARYtn/cyFZK1tFK6h74QoMXy02gTt7z3AM5NeTelX2x+M/zlTe72dZlmxS
	YcbXgdNvee1Y0k0jokYRTAuiGzoMMVLTz/uZ13HrVwEUA01IJ/iyKZUo2J9vHGpeokMXgQFJKj2
	zkDCe35jHNhAgIyKHbDAb3XQmjX0/G9OeTlF7lvh8m5MLItZCvV7Of1FIDODhB6aPZTBPz7iymV
	8Y=
X-Received: by 2002:a05:6102:1591:b0:607:9443:b2ee with SMTP id ada2fe7eead31-616f73ff3e9mr8795037137.15.1776856419487;
        Wed, 22 Apr 2026 04:13:39 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-61745c9e53esm7836656137.5.2026.04.22.04.13.37
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 04:13:38 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5673804da95so1628973e0c.0
        for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 04:13:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+MAqjbXq2r08vPPQO75VRlgTmSVs9qkJGdTAzS+sgxta9kweQHjNL3B/Ba+ebDvAMvqMMJ4NJlwHm0@vger.kernel.org
X-Received: by 2002:a05:6102:8095:b0:611:183c:e7d with SMTP id
 ada2fe7eead31-616f59ac05cmr9378138137.10.1776856417366; Wed, 22 Apr 2026
 04:13:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260328090548.84124-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260328090548.84124-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Apr 2026 13:13:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVoL1aRz5zoiGqPYdS6dvThAYBAN20Dy2=4B9pDv+gSVQ@mail.gmail.com>
X-Gm-Features: AQROBzC0TXcMAHai-Jk9wksyFb2WZNepvBEXCR1h1vtfe4dycIPBLaHTb1ULuaY
Message-ID: <CAMuHMdVoL1aRz5zoiGqPYdS6dvThAYBAN20Dy2=4B9pDv+gSVQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rzg2l: Fix incorrect PUPD register
 offset for high pins during suspend/resume
To: Biju <biju.das.au@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35349-lists,linux-gpio=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,mail.gmail.com:mid,glider.be:email,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 248EE445262
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 28 Mar 2026 at 10:05, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> When saving/restoring pull-up/down register state during suspend/resume,
> the second PUPD register access was incorrectly using the same base offse=
t
> as the first, effectively reading/writing the same register twice instead
> of the adjacent one.
>
> Add the correct + 4 byte offset to the second RZG2L_PCTRL_REG_ACCESS32
> call so that pupd[1][port] is properly saved and restored from the next
> 32-bit register in the PUPD register pair, covering pins 4=E2=80=937 of p=
orts
> with 4 or more pins.
>
> Fixes: b2bd65fbb617 ("pinctrl: renesas: rzg2l: Add suspend/resume support=
 for pull up/down")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl-fixes for v7.1.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

