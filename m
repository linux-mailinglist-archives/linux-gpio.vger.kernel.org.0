Return-Path: <linux-gpio+bounces-37325-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBE9G+EdEGrqTgYAu9opvQ
	(envelope-from <linux-gpio+bounces-37325-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 11:12:01 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 158545B0EAF
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 11:12:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9334F3011EAA
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 09:11:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8D103B8D78;
	Fri, 22 May 2026 09:11:52 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F332D3BAD96
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 09:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779441110; cv=none; b=nIvdyKzGLlL9ABerw3kE2tVPiD8pvJJtPzgaFZdoowuVZoncRS54dxfQX3StvblmvdpbuCyi8QH2r7Of/QOa7lnIMSZ2WhshZyAE6liGXvHUqXSmQf+604c1sAYNFnB8OW/rQVPXhGWv8geQO1HLVucwJ8pyoQxngew+VDvufKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779441110; c=relaxed/simple;
	bh=tAi5UeQ8Wn/ZsGeuB5ybx0KShfl8F3H/Z/vQg1bKe9M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j8ZRgy2194HBTTMNfqNCJ7Pu0iHEztQY7l9+ie6dKm7cD5TfImSDezGDenbX2eFVqSnhP+JgUEaW/0Foc/kWYcoEe5Tsjtos+GTC+INnE32c+YP5JYwdJw2GGphjpub0SJ8Y+jMZSErQs7hTExLPA8QOK0yPiGNtoyREHW0MLR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-57747a2bf20so2140890e0c.0
        for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 02:11:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779441101; x=1780045901;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=euPMq2UyJF5E3NPJ82QmWExcUbi1ANEh3LXTW7bdXbw=;
        b=hNNU3cea/o0u7t9+W1xrAFK/jP5kgIIaIAwKzzTDZvp+dazsGnlL4gT0gcq9FxkDCp
         KTO8dPCfU2qJWIELyb6xCZtO+CqBxaiXpWWyMxx/WRwUQLbCpYAOPJT/4LiwipP0+Tmu
         Gr/lr6KrHczXgDh330k8JMjl74QtawAzd5sNCwFE92J1oW5zuFxwenvaPlXFcey5VbUd
         ARqR86B+IQGVUQQ2P14PRWg/SI/KEu8eDWJd/UWZe/HAun48HlAFdQ59XygukEKUqLqh
         J8+rbo/O5lGUmE/r+4kZZMetkANA5LJOoNPVcTLJMT5GxVw7EDoI9xtLdceaXEADWFZ4
         9NQQ==
X-Forwarded-Encrypted: i=1; AFNElJ8hujFko8Rws/g61XkrGlf8A0UoIavg+aeS5+iBkgzx/CHaSwM4/Axls3CQI8f4xIiLV2/3nunpcWOV@vger.kernel.org
X-Gm-Message-State: AOJu0YxBpTZKu/W6NqFvK9ptPzlMXxco5hzR8S8NespKeJei5y5RsW6N
	LWGe+zyU/HFgPDm9QS3qefX+9t/EaYTGZ1RMOXrUrph7D6aLU2BSnJGVg1fq/3Ir
X-Gm-Gg: Acq92OH16qOhZoMAHlJ+iaiXdPAhxfuMyPbE1LJnCWvQKm7/f0XRAk8CqDt8cGpXsfy
	GzNefpS3b5UChc6RDmYBRYGUDiFFda/2ZbF/ai6u9FOEXE2JIF/aWEURfNIGqeWHG/WTwTsnFWq
	IR/mJtNuKFKEzXFpSWTY1Ac2EgCGac5Wayx0TMRTTJfBGEbGZnLqo6swgUmsRdc+qoSHXqT8u5j
	wvtifnVu126bV0xr9ASSOW1emdI+cvrrLKDa3uH8T2vk038tDLn2w2JdQxN5JwS4iZ1C7Vg1DLK
	u5K/JzQyLJsptBBmseOjrlxsLb9qZhT12dXgkCRahVznp1WJX4n1xLCYEa99z41vDdwNw3VfH+V
	0Kyu+DmXhb280tZjg0kyIa73mF1J1Vhfqdr1gGx6cwDh4u9M2wq/C3DL1HCGCsRP5ErTxnoUP19
	wduhaI6haLuDOODd7vBpztQIvcwvz41Ga10VlUf3Tuge/UPzIWp7kBPjV5xgbK
X-Received: by 2002:a05:6102:4b0b:b0:650:a9f6:4e3a with SMTP id ada2fe7eead31-67c7e11f6e9mr1051965137.1.1779441100969;
        Fri, 22 May 2026 02:11:40 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96173afb1ecsm892404241.9.2026.05.22.02.11.40
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 02:11:40 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-95699e8e26aso2337427241.0
        for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 02:11:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8vnH9BATnAxYRDjIwQHQTQfOKVEUVg/25BKCq1FYwVbMXF1bTEu0KGR9MKL5Ne44C/6trQMe9AIAag@vger.kernel.org
X-Received: by 2002:a05:6102:f93:b0:660:e01d:d684 with SMTP id
 ada2fe7eead31-67c7e1209e2mr1145939137.3.1779441100124; Fri, 22 May 2026
 02:11:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515124008.2947838-1-claudiu.beznea@kernel.org> <20260515124008.2947838-2-claudiu.beznea@kernel.org>
In-Reply-To: <20260515124008.2947838-2-claudiu.beznea@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 11:11:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVK7Wu=Lv1Qhu0+CMCQSXv6Lj6BoTdzVoW1K5Z=kgecag@mail.gmail.com>
X-Gm-Features: AVHnY4Iw_vr8Guqtk2YAOmBMghsTC9zOxmpEROEYDnyaYtfvfPRQWvVAvaAm2po
Message-ID: <CAMuHMdVK7Wu=Lv1Qhu0+CMCQSXv6Lj6BoTdzVoW1K5Z=kgecag@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] pinctrl: renesas: rzg2l: Use -ENOTSUPP instead of -EOPNOTSUPP
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: linusw@kernel.org, brgl@kernel.org, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, biju.das.jz@bp.renesas.com, 
	claudiu.beznea@tuxon.dev, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37325-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,renesas.com:email,glider.be:email]
X-Rspamd-Queue-Id: 158545B0EAF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Claudiu,

On Fri, 15 May 2026 at 14:40, Claudiu Beznea <claudiu.beznea@kernel.org> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The pinctrl and GPIO core code make exceptions for the -ENOTSUPP error
> code. One such example is gpio_set_config_with_argument_optional(), which
> returns success when gpio_set_config_with_argument() returns -ENOTSUPP, but
> reports failure for all other error codes.
>
> Returning -EOPNOTSUPP from the pinctrl driver on the unsupported pinctrl
> operation may lead to boot failures when pinctrl drivers implements
> struct gpio_chip::set_config, the system uses GPIO hogs, and the
> struct gpio_chip::set_config implementation returns -EOPNOTSUPP for the
> unsupported operations.
>
> Return -ENOTSUPP for the unsupported pinctrl operation.
>
> Fixes: 560c633d378a ("pinctrl: renesas: rzg2l: Drop oen_read and oen_write callbacks")
> Fixes: c4c4637eb57f ("pinctrl: renesas: Add RZ/G2L pin and gpio controller driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.2.

I guess drivers/pinctrl/renesas/pinctrl-rzv2m.c needs a similar patch?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

