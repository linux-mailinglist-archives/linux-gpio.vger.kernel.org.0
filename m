Return-Path: <linux-gpio+bounces-39591-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /YUxK6MGTWoKtwEAu9opvQ
	(envelope-from <linux-gpio+bounces-39591-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 16:01:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D8371C464
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 16:01:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39591-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39591-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0FB6330FD7F8
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2026 13:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E42042252D;
	Tue,  7 Jul 2026 13:53:54 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5394C175A77
	for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2026 13:53:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783432434; cv=none; b=hlU54Zre9E3gk4DvGHEBh3XLIjFkylU0LLHAA3hg4ZGxQxef3NH/J0mjdlAJdxuEIn9sB2Xqip++h+XYZ8h2hicg3Q2BjJwKxIpxjUfCY+ZasJtOTOHtXBR443JZXfIADwc6qzrbv6ai6gTeTvIMmqM5Do0BFI2U7Rwlq7sPT0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783432434; c=relaxed/simple;
	bh=udmceW3RUM6Z4NairZqEwML5hnOEjadjcWJnUNeYGNM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s9ynKIh3ORbkOU4Tjgj+24LInI+aeHLZHrRJIfDIyAi/jPCSKFd+QDBD1NSVIv2Py4aZRnssnVhQEAE5Rx+Bds0p4Zgqk/w57U+wjMNWk4NAkrpCRbrTF7DX9nxE2Y922e4Ojw/hkCEn9/Pmesrbtfn7Zh/lNm7LoRVhZJZZH3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-59ebde7d704so1188414e0c.2
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jul 2026 06:53:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783432431; x=1784037231;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1iENYh9jXtsnzxDKPGUvdWRKZFRIqtHgeYcjURDhBgQ=;
        b=N0m3pNpCacEvmvjPaWC7B4kj51SREwxACZb8BXwyAnPHKzImnZCiP7e6ES7mqf4AY0
         0naLyTWqYVW5mxgf+r/6g3nPInu8BNkrbE6JdIBL2/7v0fP/3ZSQe8If99SpeUhxclNW
         OwZhFOxOJIjmJR4LlOnvKmRrGpyulSAmQZ9X+HJ6cEVp87RIBbk561LIaso4ynpw8t0N
         SzuGyBEWTqMJmFwlqa7IxaKjM57l9lwyWVfn5ArDxED5Kb8ia6EO/9KUiDE1NplqQxXa
         qounBznQnfyiJ/qtB/d08+K2TVjuZQlr4RBK4K5SRfBU44BXhD+BK/iyT7mxzEU1l9aB
         8ZwA==
X-Forwarded-Encrypted: i=1; AHgh+RrWRtDZGgTf5wFqjHYtMf1AZu7huLwebHXaw6rhYZACYklDDXlMw+vQsFcxaHTgPnZNFSQVfjAeOEuD@vger.kernel.org
X-Gm-Message-State: AOJu0Yw54KfVqPx3w8Wmd6r5zPs2XZDJt50igODuFGV3Hhx9vpbadv9R
	pE9JnqMYHGnkqMiJVC9wTfPoS+P50zfOuUs+aKFBM9pfP8VRL8KxbwlZsrjDovcS
X-Gm-Gg: AfdE7cnfRClQUafYiClYXj2nrAwZRQ71/OitjXxg1/4NCs1gYohvPOeXF2ELglnTjyI
	SuxKEkr6KV/1WDz6JwR+oz+GovniRYTr1Fy0rIRawRbZRidEuduEqdo0PJH+KnYSshS032+EGZN
	OCGX49SGRsp8JLGU9Av/o8KXkrksDgerhdDjK5jdT+u5Mw2yZMv5rhkmU5sBdqHnS5F82L6sFJr
	Wgl3e0/E8suN0oB31mRiwXPVBKmg2SYO9bWhYHQcCMjtrDgUeSB1LtKR8aXCrCDwvBDxjnJiUCe
	GJiuDbpQUjTsi6kusuihFlYDAWib+ojcKVF6T+9RePvjD5g/nUqRSGPMCnghyeHSu8rVGl+wHYl
	fmzgHrD/ojguGjAmEXgP73NqhgKGjqBWIsT60RBN1Zita5hbcMORL+OCkeJqso4Sxu28+mVhLH+
	2z1P6t1UAbHHik+UP/PVXvh729xThPakPj4x5BuADKme4BVaq4SQ==
X-Received: by 2002:a05:6123:4b:b0:5bd:b2d2:a1bc with SMTP id 71dfb90a1353d-5be908cc8b0mr2547744e0c.12.1783432431070;
        Tue, 07 Jul 2026 06:53:51 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5be027004c3sm7457847e0c.0.2026.07.07.06.53.50
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 06:53:50 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-7387ac7d28cso1064613137.1
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jul 2026 06:53:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rqn9dzdcJqpbouZgU1IxK0uwiJPL4H3LYVtKaEok/ISsU9QAlVxGr589ISIFcndUxOT17Mfgrvup2Xe@vger.kernel.org
X-Received: by 2002:a05:6102:5127:b0:633:2389:3a82 with SMTP id
 ada2fe7eead31-744b7e691b5mr2984877137.28.1783432430667; Tue, 07 Jul 2026
 06:53:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260704151521.211335-1-marek.vasut+renesas@mailbox.org>
 <20260704151521.211335-2-marek.vasut+renesas@mailbox.org> <CAMRc=MeyKGv75rTLauZuGxSfgjCPXVE_r=A7uNduRr6kAd43aA@mail.gmail.com>
 <edc7505e-1103-42d7-b88d-013ca10753b3@mailbox.org> <CAMRc=MegYyuqMVkG4_E_TF4hzoy1PVx=omXgZUPvnARd-Eh+7Q@mail.gmail.com>
In-Reply-To: <CAMRc=MegYyuqMVkG4_E_TF4hzoy1PVx=omXgZUPvnARd-Eh+7Q@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Jul 2026 15:53:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWnTatYWWxXS9p=_fQVSEH0fH4KzYMKKiNCN+ocSTmoww@mail.gmail.com>
X-Gm-Features: AVVi8CfRhBid3_aQOmlg9c3jWMm5fQMFfkLhy-yd2xfIq0EhzoNaQKJfylI-H7k
Message-ID: <CAMuHMdWnTatYWWxXS9p=_fQVSEH0fH4KzYMKKiNCN+ocSTmoww@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: rcar: Add R-Car X5H (R8A78000) support
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Marek Vasut <marek.vasut@mailbox.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39591-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:marek.vasut@mailbox.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RSPAMD_EMAILBL_FAIL(0.00)[geert.linux-m68k.org:query timed out];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mailbox.org:email,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 66D8371C464

Hi Bartosz,

On Tue, 7 Jul 2026 at 15:48, Bartosz Golaszewski <brgl@kernel.org> wrote:
> On Mon, 6 Jul 2026 15:06:01 +0200, Marek Vasut <marek.vasut@mailbox.org> said:
> > On 7/6/26 11:19 AM, Bartosz Golaszewski wrote:
> >>> +static inline int gpio_rcar_remap_offset(struct gpio_rcar_priv *p, int *offs)
> >>> +{
> >
> > I am hoping to get some input on this remap function.
>
> You mean its potential impact on performance or the implementation? In any
> case, as Geert said: a table of function pointers could help to improve it.
> I don't mind it in its current form if it works for you.

A table of register offsets.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

