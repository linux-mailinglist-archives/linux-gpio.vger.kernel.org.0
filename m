Return-Path: <linux-gpio+bounces-35350-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMciMjGz6GmIOwIAu9opvQ
	(envelope-from <linux-gpio+bounces-35350-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 13:38:25 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 383FC445818
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 13:38:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B6999305C8D7
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 11:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 167C93D16F8;
	Wed, 22 Apr 2026 11:35:54 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27CE35DA48
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 11:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776857753; cv=none; b=mBKSI2hWvMgN7osqwb6VXKixk5yBEpdZ/peYQ4wwmXfQujA11MRZko4z+cN5iaTqd8/Y1rQ3CS+UB3uQMr4HAzpshngVk9ufltDmzL/1froUlq01owYX64L1ykH/IdymTQnozaUPIlZSvkVEja5Jxyu5NbJ72djH0xnaooHst2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776857753; c=relaxed/simple;
	bh=R9JlaNaEei47q8RFqO5ggVnbPEsNSaXaU0nZijnGZ+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ym2T/ui5MT+VzfFmg1annlFxhfTSMDpad+b6J60/e671UgNDUlQ8MziHN7UrSl7GcUpvyX6cj2S6MtvbGT1EY5Y2V/BjLG9LdQK9WZE0givgHpPD7/Xg6DNkbqSGERq0mfJ+Nn563AOhOZAMxI0LXfnAaGIkeaJNos/yvPmynO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-953c5738c03so2935611241.2
        for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 04:35:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776857751; x=1777462551;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ELJxWI9ESJzbGIe+C75G9R94zA1sKEl066/NjIEF+RY=;
        b=P5ud3b2heEY4LiyWeQn6peT+zKAYFG8dN/ZGaZt2dpOS6B+umUazEMjgFJdLBz9Bcb
         XD96j9DZbJEgpFpeiiQo9pf5jTzmZSxbwJYEpVKhRAHB9ZM8L4Mcyiv/621uCoN0Gm5t
         +5OaijArzYZNDwLs8Rwi1Yp7dxXQWb8m3tV3A1YaY39eJ886kArQg8oeIdXH4wAR0Cf2
         AdTAzDPAoufaI6pWxVLX+ZkOFunFjNEq0DxQ56Ile+QLA4jEO9moQN7hKhfCAZaw/JMt
         DV3N9au941apBz1ZA9E3w2C6jRcHangfCu6vZ1D80aNhN/7bfhhB02fpUULRUZuXP3ph
         bIbg==
X-Forwarded-Encrypted: i=1; AFNElJ+9oBzx46OQjv58lhcDE45U2x9+i2QzPqVPFkZX8T6RwjqzveiL6bi1Eru/gmcZaLbI6WwKESSMrJvy@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5qXpR8pJX7Vym4xi1juiArlLjQofstjFnjSWkeRmJZbxz/sL+
	RVUJXASgMnO3hlr8AUfxVRkqKZY7l4mpo1q+og4Q4tz4Rx93jmFtk0yJ49QCMVTA+uc=
X-Gm-Gg: AeBDievTMfEEh3K48GAqkH64wgaq3Dyuspv1Divsg8gX25IFEJTNug6H5+cGjahGz1A
	CxVOcR60UQ1UfDyqR8ffBNR8tBEOmyGpuPvZBs8mG7hL3RMmXoiRk+ozZIX0VqLciaNKJmq94NG
	4zoHLYuHkGgrKBJtqtfFZVUlhGdPXS3wVUFRInnagGhxQAFccpB7OlrjxzqIxE2Sax3Yacs7moX
	L+onFRjIJWsXSOWqeSZlydPPxh+sM4k58FklwIGrNqcw7jRzktWfAUAUIBHgDjzmbSR8gDS8asr
	ToUDMUd6QL+VuLkDZptU4DB2lDqOCDqFbjKg7wcqIUagUqxHhQayX4a1BYdBqJ/0Sa2C4BtP+dy
	zWqEBDAwfJGTzZEl5uO6UuBGmDNQOTYWTZh9FwOnDwGpqlZHIp5UgnuUt3KZy7Nbo8/P61wLom7
	F9Kbr8fRVnr+OMM7TOMkKubQQX/o/2zZeykYqGSeaSdFxfsUq5cgi08E3pGEjltULKu8xVaEc=
X-Received: by 2002:a05:6102:b10:b0:611:82b:a590 with SMTP id ada2fe7eead31-616f73f6ee1mr10803361137.25.1776857751595;
        Wed, 22 Apr 2026 04:35:51 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-61745d93542sm7588502137.6.2026.04.22.04.35.51
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 04:35:51 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-953a2a4761cso2839752241.1
        for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 04:35:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/AUnOJLxDAo+XXzNlxIg1AL92hK4RChD2iitiCAfyG13vRcCDCrFuQuQ6MlEkegmuoVlWEDSVFD1bl@vger.kernel.org
X-Received: by 2002:a05:6102:f14:b0:611:3bcb:aef6 with SMTP id
 ada2fe7eead31-616f16429b5mr10579231137.0.1776857750839; Wed, 22 Apr 2026
 04:35:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413182456.811543-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260413182456.811543-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260413182456.811543-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Apr 2026 13:35:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXew2OoNujZUboymX6ZJcxQQUjH0U1G+neQexz90_hqCA@mail.gmail.com>
X-Gm-Features: AQROBzBlN3WCKio0G3EgdMYhQvWWpP_T7dxVxH_6xJWVnBA5bQ7oLj2FGGENTas
Message-ID: <CAMuHMdXew2OoNujZUboymX6ZJcxQQUjH0U1G+neQexz90_hqCA@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] pinctrl: renesas: rzg2l: Fix SMT register cache handling
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35350-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,mail.gmail.com:mid,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,glider.be:email]
X-Rspamd-Queue-Id: 383FC445818
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 13 Apr 2026 at 20:25, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Store SMT register cache per bank instead of using a single array.
>
> On RZ/V2H(P), the SMT register is split across two 32-bit registers: bits

Also on RZ/V2N, and RZ/G3E.

> 0/8/16/24 control pins 0-3, while pins 4-7 are controlled by the
> corresponding bits in the next register. The previous implementation
> cached only a single SMT register, leading to incomplete save/restore of
> SMT state.
>
> Convert cache->smt to a per-bank array and allocate storage for both
> halves. Update suspend/resume handling to save and restore both SMT
> registers when present.
>
> Fixes: 837afa592c623 ("pinctrl: renesas: rzg2l: Add suspend/resume support for Schmitt control registers")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl-fixes for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

