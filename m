Return-Path: <linux-gpio+bounces-37330-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGgEIdwfEGqjTwYAu9opvQ
	(envelope-from <linux-gpio+bounces-37330-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 11:20:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCE15B10B5
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 11:20:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A673C308AA94
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 09:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 719803B8D78;
	Fri, 22 May 2026 09:13:05 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130152D839C
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 09:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779441185; cv=none; b=Rqc5q8xO8kfaY9KFcKEdkGQ5KWYf0P2Qx9kCb76Hb/g11c+vNQ4G1JGz+iolPsSn95iql6dewc0w12hS5MyH2JSFUQGmiN4JVGdL6/Pas74/gknrbmgXRh9pI9eS3VH2yTt//wTW6l40sLuYbqORfHzXnp+MlcZbZ/HYXBVH2Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779441185; c=relaxed/simple;
	bh=7OIaVGego7Bmga9WLfxgUrf716J/7LdK97t1FI1saiI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i2Jtq5C3pcvjLH5l7AUtSUI5Y31W66txaDs8/Zhl3GLGrVjZH0xTxsty8UdR8VekrhqUGTsa8EW2WRvPMqDhwW2DDMsJ7JHsWinrkA/aAbRjZmB2fhd0cA+ueNIlrRsvOGJyh36PXcjourOUF+Bn4Xoys4ykYmO42WZUuttTsKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-63130466364so2571457137.2
        for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 02:13:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779441183; x=1780045983;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d/zgv+5xR1Uk+GFWC7cjZ0OxT05TRQfckCT8Qxj8k2o=;
        b=CBPprQV6yoTpTe76In+tcIP1Al6uWoutFeDsQ8l87OkdZQNjSEjcT+7syToO8z1JWA
         idR7/1/majdBvv6McPnlTpoo52pMcLuk0Pu97g2EAWwpItB976sw+nYmSUa1gWGsj0f7
         dpQIrAqmTMtm7Fk8zvC9VIuUfzN9F+xM+KG8eDdIGV+J9RZpsOxApxKLo2RFbc4pIlq7
         Gx37XS4lh5YWH46KVPQNNUIm+9B23mu1f+1Soul/jUN5qRw1hpVjT2a4kQ2t5XFmGCo4
         BKG7aDQg/N5xvm2VDb5GPiBcFrWCXIuXAQWCnrWxOtX7laM02MrKhiDjY9g6qSpMPhES
         aj/g==
X-Forwarded-Encrypted: i=1; AFNElJ/3l1uaRszsmlzBr0a1sqD3vgyFj4gHHOB+SzWuq0y0EEbu4XDSqqmTbGh3fxjMOempFYFF8sOrlXjg@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6fwEfisp0Es/opsw2duYvCZk0qH+RSSx2kORq0p4fx9JmaJX3
	0z2qf5hmVegxLX9jRW0tJARQoRIejSfwkxmr1kLwH10XihWTCOcXOzbVDnatvlbR
X-Gm-Gg: Acq92OFaO2QRvX2ryO9PZTSDyb4UJaDHuHOA/slsYLcZqZk2GvdSSKe7cHvjXJ5z6H6
	VcOTj2zuLTFokzvQVUtob8SN5Ge+hMRV4m6S3RuRQP7jPdXy7+0GRYEjAUXy8J2+A8wj21nPRvZ
	YI3D8k3pKiwWr5LpD8BKF61u1qeMGJFVXVmG5ogTtQRMESL0gXP9157pCUyvWUzpvhDEx3hAic/
	r3F7dokYz5Gw/8oRE5ZtPhyO6yXnUuqyDRed5SURphGGr3ojS7U8zd3mwLMH1Z7y7eN6OfTe1GV
	AChf6HaJrEfm1hCIX0sZjvGeDWCkR9Wv5zo7FLa33pqzNHNLzl1PLNJwxjhrcKpfCpWLryVXN7R
	BIKLQJ7sUtNHGn7i5VFW7eSQja3ZcOuFWXbvAufNMM5CcDNHQspYuV/JXwfvz2l3D6NdGY2L3N8
	bp+Is9fvLt01DAyCslm11S42avpMq/VY/5yJHjOzxhQoA5OjVx9Of8GrymwhHlTnFu
X-Received: by 2002:a05:6102:32d5:b0:65a:fee5:cf20 with SMTP id ada2fe7eead31-67c77a162ccmr1146504137.11.1779441183064;
        Fri, 22 May 2026 02:13:03 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-961737bbf42sm894813241.2.2026.05.22.02.13.01
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 02:13:02 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-57513a91514so2332702e0c.2
        for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 02:13:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/pWosBPhwoEOxGiX6Q83So1kjcqwiF6DFZMwwDFLc/dwPtjjydgrBCC2wyW+Ogs0EKbNJSq8Nz9qak@vger.kernel.org
X-Received: by 2002:a05:6122:2404:b0:575:e902:bf83 with SMTP id
 71dfb90a1353d-586590103ffmr1411914e0c.0.1779441181704; Fri, 22 May 2026
 02:13:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515124008.2947838-1-claudiu.beznea@kernel.org>
In-Reply-To: <20260515124008.2947838-1-claudiu.beznea@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 11:12:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVFTszJPqJFRWCHZ1jJy_DupU_CAvwBg47qRwoBNDq7-g@mail.gmail.com>
X-Gm-Features: AVHnY4LRkwsnpQYlofnnFlc_xtD9lz2efPBJbAPdjE_1-F4moB3JwvUPUH9JoZk
Message-ID: <CAMuHMdVFTszJPqJFRWCHZ1jJy_DupU_CAvwBg47qRwoBNDq7-g@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] pinctrl: renesas: rzg2l: Populate GPIO set_config
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: geert+renesas@glider.be, linusw@kernel.org, brgl@kernel.org, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, biju.das.jz@bp.renesas.com, 
	claudiu.beznea@tuxon.dev, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37330-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,glider.be:email,linux-m68k.org:email,mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: CCCE15B10B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Claudiu,

On Fri, 15 May 2026 at 14:40, Claudiu Beznea <claudiu.beznea@kernel.org> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Series populates the struct gpio_chip::set_config for the Renesas RZ/G2L
> pinctrl driver.
>
> Thank you,
> Claudiu
>
> Changes in v2:
> - used gpiochip_generic_config()
> - fixed the return code for unsupported operation which helped in using
>   the gpiochip_generic_config()

Thanks, this doesn't regress on RZ/Five, so
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

