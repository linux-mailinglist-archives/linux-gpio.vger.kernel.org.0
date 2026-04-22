Return-Path: <linux-gpio+bounces-35355-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MED5EzS76GkHPgIAu9opvQ
	(envelope-from <linux-gpio+bounces-35355-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 14:12:36 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 41ACA445BE3
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 14:12:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 56656300AD41
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 12:12:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 605233D1CAA;
	Wed, 22 Apr 2026 12:12:31 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC8534DCE4
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 12:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776859951; cv=none; b=qRCxnVOgUve0Cg8za90aOMxal6tZsqtNOCjZTvZl19LoP1xrJlxn7BN96buYwVeaBhjTMmQG+dnOF0q8MHpf0gscgO6S506Haa6Uk62WvPzRE0rOkJsce0yQmJRMsED9D4YCrK3HLReKDrHCa9Hgu2p55uvG9A8ck9AJW5D6YUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776859951; c=relaxed/simple;
	bh=8PqFZBia2ZivjvvpkYELmP6SfKnY0ajZy53S2M9zNlM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MzBRTVlsugUSE9d0QrPwLvT2lCbvrPXF2QqGS7n6K0pcfN+qmXk5mVD2DZF7NUjpYiIEeXYBzTWUH5XvJukItx99mMmr0ZldCUCOopAT7dsLJZRoMS9t6YYtv1IRVlFkvdxHQy7MYW0KY7xaPUXst53i19gGu8QWEGMJ4/AJUlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-94aaa5d3bfcso3120482241.3
        for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 05:12:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776859949; x=1777464749;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MiyXdSSlACEmeBaCPp973Ky0zZSmXstCPqpCLLSPPJs=;
        b=J2YMsjW+LPLM5RWZWdGF9JxxZZgh84sUvvm08K9xRLpBj7XsOGyx+DC7rGgqukz0Ox
         VLRwGujv8UcKwbgE1zNC3Wi4t4ZtDKO/LAPwbEi5s6+zC4pxxi/rmbSKorLl33FDhuaG
         cs/DVDRH3JYJ/PMRLNOo9BcObVc4FitkY1b9Q9l1eqSlpMPAr80MPPILc60HGsulmkSq
         7XXnrim+U6FTObq4nzmzP8qrTWKPYIPbZI/J1dpc0Qal5Xqj/R6Ss38rSeJKcVnxTqoD
         bZgOB9n7IKabhLU92J7eOLBdnpyHiWFXdMereLKonCHhMC3eaMgS7iOvxNVRn7k6K0i5
         5iRw==
X-Forwarded-Encrypted: i=1; AFNElJ/nfUdOTS9NBfdbkIMFA87hElEKH2RN5DSsntbvUrADRwMRcibLfDreqASQjhwJrdd1KQVicdxTDMQm@vger.kernel.org
X-Gm-Message-State: AOJu0YxLuWFj3fZ0DaQAGBMCTVHthd6CQhyLvu6s4MwUIsXKjTa4h1vh
	so7yTx41JGTdISD+NERxV0euDN/A52RSygupw/gO1eD045/yhuO/LzYn/3L4/j39qu8=
X-Gm-Gg: AeBDiesv3Q+GFd2e4XmVHw5jJgAYGjayDD3smITWe5Nc55Og5xKav7aFG3S8BJtWMNh
	vjehVJIbWpMVT0VzVoOgzIkQUIVcSqlZrQ2NW0YA/EKC+5s2w3PpYG/PhXz1tCy94vHEt0K2rCg
	qL5VgsjNA2raAxTm9EUxAiGI5NEXYsLR01oRinqvbBwY1lPCfvVGcRMSuLj+G2RfxH5MDJxaJhQ
	uDA+rzrcMUQLZesLVQQTHS75nEURK6P+DLQCigjq9aJY5SSEsPWpXKHxXoIjV30tQJN+oMF9tM+
	nOk65gDDbEO+rsWxjwNnUSwFss/5XqIGu4LvtyoXs8GUztkGcXUKCGgJYPgp4l5hbahOYukR5Wr
	NVR3y/h44cODvvMMooH9qPdC6EP3CU4p4kUEYhLdhhLIkhuCPhihMzyK2CpvlW0gB2AoFCm/+3A
	DdFIGPvnm2IAuQGzMHySkP7drz7zoChhudthGYZOASP6KJzJsmXKPePSwBwBXXSAzuvGBNrSNJF
	7Q=
X-Received: by 2002:a67:e70b:0:b0:611:5313:5460 with SMTP id ada2fe7eead31-616f4f7c616mr12247991137.10.1776859949008;
        Wed, 22 Apr 2026 05:12:29 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-61745c9e53esm7898461137.5.2026.04.22.05.12.28
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 05:12:28 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-56db1b3626bso3498595e0c.1
        for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 05:12:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ85wi2jqY4K/2z6/EiHK2rnDmVMO9CqYgU6gYg0eVCCtYnDyR/1PjXsdkpcCx64GCeR4czX/OMSGGiv@vger.kernel.org
X-Received: by 2002:a05:6122:225:b0:56d:8bdb:fa50 with SMTP id
 71dfb90a1353d-56fa5a4281dmr11876524e0c.13.1776859948160; Wed, 22 Apr 2026
 05:12:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413182456.811543-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260413182456.811543-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260413182456.811543-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Apr 2026 14:12:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXwRCYrD509kvvE0ELi_SgDsk6=LAnWgmm0S98AeX0bZw@mail.gmail.com>
X-Gm-Features: AQROBzDDxJei3oI9Q6xisBco42VyXJLrw3MeYqs0ZnjxL9rp3R9BYj_6htdars4
Message-ID: <CAMuHMdXwRCYrD509kvvE0ELi_SgDsk6=LAnWgmm0S98AeX0bZw@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] pinctrl: renesas: rzg2l: Add NOD register cache
 for PM suspend/resume
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35355-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,glider.be:email,renesas.com:email,linux-m68k.org:email]
X-Rspamd-Queue-Id: 41ACA445BE3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 13 Apr 2026 at 20:25, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Include the NOD (N-ch Open Drain) register in the PM suspend/resume
> register cache.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.2.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

