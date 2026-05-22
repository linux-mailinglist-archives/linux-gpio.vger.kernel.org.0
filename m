Return-Path: <linux-gpio+bounces-37336-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEGXFJ4mEGpQUQYAu9opvQ
	(envelope-from <linux-gpio+bounces-37336-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 11:49:18 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD225B1738
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 11:49:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 816F9301AF17
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 09:43:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A30F3C196B;
	Fri, 22 May 2026 09:43:27 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF123B83F8
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 09:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779443007; cv=none; b=HMtpmoVOhiU7Fu2kcICvVexQspXIpOHA1t7EZzUcTNFDeHbedPpOE3g+hlrJjLROnNeQl7dGXN0NSIgdEadbfCBTCf2IrSTwMFn191Ny716HrXgKJgGcCDw7DDGSPCL90HL23cNIP0tzLhFM5PFj0sl4rBg5Tv2bwIJ4uQ75LT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779443007; c=relaxed/simple;
	bh=WWEtEaWnPSoUz38J5bhitj1ZvX46/1ATRRXqbHDoPI4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D+YQU8MAP3gLY2tpiWY+srIvMygwLtco744ZDXZSaY4piYIXxIdwjmqkWjh0mR0AED3whOrdUZ7lwIch2krnqAmRKbJsuvp3NONEvKuSFtJP7pthakhfOsW93/v2iK5iGE57NbhPdG1ld0coPuoJt+fRFun8UL1Db4TfKIJ281c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-6313c800372so5445571137.0
        for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 02:43:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779443003; x=1780047803;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I3i0x6Dw91KEnwFgFVvCD8gYOb3EtZMh6gn0DwSlmRI=;
        b=aR28pPwuxylfLCNviDKbcNWIAZKbCRH18KjaMmTC+sZOOSQwscT3pYfHit35zcQ5iZ
         0iFoC9yRAn7gAFOH8q+HSvMqSgc3JV5yiR3yTyyopbg/GnnFfQ/7NBWqWBXxwii/d40t
         M9NIycpVp2ShktJ4P7nbGsTFWOfpAgKalGrBvqe/9OTWLDMGX0f+jOKrEZqRwBTa5oZi
         kfiq1EQuC0VmqQONzTjMQyGSBZ/EbHfvscC9rXZb4rzAf67pUG9RsX3eyReFTf/ciC5S
         pLZJIN1UiFNNDFenMxeSKHrbMWnk16mgmq5I0/o0pWCyf4PZqmaADGlUxvxYH5IxI9oG
         4b/w==
X-Forwarded-Encrypted: i=1; AFNElJ/PU4fPY3vg/W8/wNe/wYLGxqhu5ruaD30LrNN5Rb3p3vWIGwz2ZCvJ1nwcpEn7s/GjqeNcllN5yAyV@vger.kernel.org
X-Gm-Message-State: AOJu0YzXqbMaDzOLXLnmEliRJtzcOE4Ci0N2vZ3IJdYTBG8zSK+2tT0G
	MthpuC87a+3BCnKMFpGCqEuLFQHpiOOMMw3Nz6IdDQ08IJ2RmcvKPx1ehEzw7RmN
X-Gm-Gg: Acq92OFCfdgxBMgfy+j14KAMKUYhKAkM03JFvQdPRQ9sCejYxAf8MPf63p+tMT0QroP
	P0uTcEnL9ZP/UotyPHeBjdMicYKB6OEi9PlJ5MZjl8DQm5YadVfRzEjoHIqqU3Pwludc9zsd4Be
	I/9B+2T/blkwa2pUkVS6+G4NcpTCDzxFh+FkQ5F3X3tYOGbes2FbM4Se/JhZqGlWh83JQLpTNnh
	FoBN77MdL01jsFZdiQAoCXDHXszf0qplDLVNd//i0mPRZ/cHP/JzTj+ZFMmySzxMfQ9GgxcygZ1
	N4ixjGWtNsEuKFSh+J8abwl4dRx6HjpIOUEoqUm4mGFLbzVqciV3fA9YysPlnkDg3jJmzSp71EN
	j7FxcJ9WQtILNWrRADniSg1h1jA4WHtRnreHNtzslEWGYJSnUXKA9l+PGvi+AG/ouavW6gJAN7i
	dDNgLj99b0pusfToEWmUrax5YGtAfhPFtX0p5fhguXwczUW4Igyob7tqBbhSfRRa18TVCj2ug=
X-Received: by 2002:a05:6102:4b08:b0:613:e996:3014 with SMTP id ada2fe7eead31-67c7e6e452bmr1076063137.20.1779443002734;
        Fri, 22 May 2026 02:43:22 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-67ff3e499bbsm700545137.7.2026.05.22.02.43.22
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 02:43:22 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-95cd9bc6398so4785657241.3
        for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 02:43:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/8kWIcJdprwe2e5E+A8ZIrFxFIHJ6Vxfj/LHk+q989XMDexqVOyCItbO88oTaAlGZqRypaOWalkccS@vger.kernel.org
X-Received: by 2002:a05:6102:94d:b0:639:4bb7:c916 with SMTP id
 ada2fe7eead31-67c6f73ecb0mr1205825137.3.1779443001825; Fri, 22 May 2026
 02:43:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513115312.1574367-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260513115312.1574367-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260513115312.1574367-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 11:43:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV9GKwH_n6eDm=K3o8Vv5qHbTsuufja1=QXGR0YTdK4cw@mail.gmail.com>
X-Gm-Features: AVHnY4JgAQJL9FtsqDDEsaZL1JjEWgiq5ZNLCDF1Wk-GYPHDFDyPNeoCEdmNPzI
Message-ID: <CAMuHMdV9GKwH_n6eDm=K3o8Vv5qHbTsuufja1=QXGR0YTdK4cw@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: renesas: rzt2h: Remove unused variable 'j'
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37336-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.550];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,renesas.com:email,linux-m68k.org:email]
X-Rspamd-Queue-Id: 4AD225B1738
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 13 May 2026 at 13:53, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Variable 'j' in rzt2h_pinctrl_register() is incremented during pin
> descriptor initialization but never used afterwards.
>
> Remove the unused variable and the associated dead code.
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

