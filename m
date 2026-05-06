Return-Path: <linux-gpio+bounces-36303-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKeGJ6Vh+2kuaQMAu9opvQ
	(envelope-from <linux-gpio+bounces-36303-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 17:43:33 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A2C4DD7CC
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 17:43:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 173DB30A7B5B
	for <lists+linux-gpio@lfdr.de>; Wed,  6 May 2026 15:39:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FD1C4949F6;
	Wed,  6 May 2026 15:38:52 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827E748122F
	for <linux-gpio@vger.kernel.org>; Wed,  6 May 2026 15:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778081932; cv=none; b=qNWHgjYhIbZIHrTCvApCPbotF1faJyJpoYITOg9Lwicxzm+c5DK9mS4tki72i3/IVq4N+Cj7afbptMhZo/mdHFpRSASDs5rZ/Le0hjfovDI/nC33nKhAMxs7pdMuKan4c3uQ8/d0ePiV9GIc2GPTcb9rK1rb/uoWGG4OY1gZWAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778081932; c=relaxed/simple;
	bh=qt46z/pT8ao0DLm63LJMC6q48E1ATkP2yfWfyJjvgvU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h1TagscuvvvNjtvOKT9EoOH0XykXv3rIxeyabqsZkeO+vNNtA9JEzszZK9X/5+RYgzth4zF96Hz86f4P5t4NJ/ed9tvQ0Hs2JmRElpYgGJtH7eX6KS8hRIri7Le2WSWVWOF0S+Em9y+tDer4+3BEifa03MGXbnEG9gBI92BVIN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-94dd01deb53so1819344241.0
        for <linux-gpio@vger.kernel.org>; Wed, 06 May 2026 08:38:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778081929; x=1778686729;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s+CjY/Fb28bFWjqLwLQHlyMRoP8RUF4B+j87OjTAnr0=;
        b=sqD2dAYjM+A44XvZzPdMzmMjHV4KnG2kFT0c2r1V0fJ+0GrInEwnvpj+G4sN8/r6VI
         YD5z9tkQ7hYDDakjKSKItSxY1/FJdTFUOx8lIqVG68HI3tEGJLViuK2n+Yv3XF/YiAk8
         3BM4J/boK54dj9yb0mDRt0O/TDQlZd5aI/cy8yRb9EvdUJBMj7oqVBGXpBP11vvo2cb7
         WJywP48vZugRIKr9SGI2/pCOjyc6T3uCAa9Cygw/9MCQpwxvt4g0vFW3j0FKUWFH7V5l
         9t9qM1sIAMlvT8YgsGov9+pTF+4mUN3aIKK2EMkAGHAc1eiZhyzEP61nHE754gij+jzs
         UtYw==
X-Forwarded-Encrypted: i=1; AFNElJ9LCukzFQzoJ4jiYqs5RUzb2lXOcz9Xj2cBjoqHCWSq7+eKNe6V79A1nL88BhLNuHQg8bPr0FqEoCJm@vger.kernel.org
X-Gm-Message-State: AOJu0YwdGEJLKCBgKUqTESdqPF6kPPueeGqRX0l5WymJ0OB+WH4ogLBa
	c8BqnB1aUjx2Q7eb3fY/U1/8duetFnzPyQOmFPYWVIKs68kjtspxK1JEBBaDA4Ixhak=
X-Gm-Gg: AeBDievAoCa4RWFW1ANyiZx1xXRgkc4tvxRmGBeLeVDqIGRUDPsPI1djkN6cuoU6lob
	49leSlmLOTkyS6vW7vOFpyWY62JBjT1swhv5qz3e4qOd6jALAtE6KXYdW0bPkoCcP91oBRntp7m
	7OiK1zRjyCug5D19YUintB+pHglMcteJb2n3xYTNpqExOiBrpVyCDT+vGLJvhgqXk3Wd011RKyg
	MFstnT0BhZQx0QG23kk5VNyHDOU2+ZXN4QiX+7r7Cy6F8Yz0fDNTg5sYKNmL44G4jeA5wvG+K7Q
	igxXH+1uP3VoLUpDd/yucRsoAZJ4rrZkNntQNRPfj7I6JFiWq+1RFQ2nvodiyq84oIRxILIW/eY
	SFeFXYUQUJZ9uksTT3FeHrUJtvTdfrnBnVu177kQk0Hc0Duuz8s0kn2Cvw7vdWBvBsWylkTXhxh
	Klt94VewigoRbhRoTfp3ltBk1Kzcopgrx0BX2CPS8n/xxTW1wByaFTZjQxI1homUo5MoWUsdM=
X-Received: by 2002:a05:6102:5a95:b0:602:6784:3eef with SMTP id ada2fe7eead31-630f9063f65mr1881168137.28.1778081929038;
        Wed, 06 May 2026 08:38:49 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95d0ac3217dsm6201861241.3.2026.05.06.08.38.47
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 08:38:48 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-62dff2771abso1496382137.2
        for <linux-gpio@vger.kernel.org>; Wed, 06 May 2026 08:38:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+d8tJrUUZ+llH0XuxQV4LiQbeuwfNQt+URNuXI1CLDls43CCJQ12Y9vh+roA7u10AdWaoVUrfZeHkS@vger.kernel.org
X-Received: by 2002:a05:6102:2914:b0:611:d979:a38 with SMTP id
 ada2fe7eead31-630f8e6ad2fmr1911752137.6.1778081927703; Wed, 06 May 2026
 08:38:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430093422.74812-1-biju.das.jz@bp.renesas.com> <20260430093422.74812-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260430093422.74812-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 May 2026 17:38:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUiYg-F83Wq3mHsY+SRvfvFf863PL+ntWECS3Hg97fP=w@mail.gmail.com>
X-Gm-Features: AVHnY4LkzS1oN-DrJ8JobrorWEPCRYsarVoNHuBu0KNSKv_fpIubNCM1zDCjywg
Message-ID: <CAMuHMdUiYg-F83Wq3mHsY+SRvfvFf863PL+ntWECS3Hg97fP=w@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] pinctrl: renesas: rzg2l: Make QSPI register
 handling conditional
To: Biju <biju.das.au@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 10A2C4DD7CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36303-lists,linux-gpio=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,mail.gmail.com:mid,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,glider.be:email]

On Thu, 30 Apr 2026 at 11:34, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> The QSPI register at offset 0x3008 is not present on all SoCs supported by
> the RZ/G2L pinctrl driver. Unconditionally reading and writing this
> register during suspend/resume on hardware that lacks it can cause
> undefined behaviour.
>
> Add a qspi field to rzg2l_register_offsets to allow per-SoC declaration of
> the QSPI register offset, and guard the suspend/resume accesses with a
> check on that field. Populate the offset only for the RZ/{G2L,G2LC,G2UL,
> Five} hardware configuration, which is where the register is known to
> exist.
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

