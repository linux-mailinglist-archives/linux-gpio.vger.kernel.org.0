Return-Path: <linux-gpio+bounces-39156-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5tojM4OaQmoK+gkAu9opvQ
	(envelope-from <linux-gpio+bounces-39156-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 18:17:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 215036DD392
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 18:17:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39156-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39156-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 197B130E8A79
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 16:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6971D449EA0;
	Mon, 29 Jun 2026 16:04:37 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C983FD969
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 16:04:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782749076; cv=none; b=EwcetF+PIu6f+ltOjKEtoJUY+nbRuX90tP3oU6E9AajKUMylgWPyH8Qp8oJlP5HVXO2WW1I+tBuRQmsDhxs2x/NpGUUbOR1CNrbmWqVHqX6o4XeeTDaAV1HbJosYhWzPhCBebHM0kAqfVWCocEQxxA48jmcmUSTDPZV0mEQVVx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782749076; c=relaxed/simple;
	bh=LHZ+CtSrs1sFgqxg1SDgUv6SV2Q72AbvoN/75du65As=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bO01ofj6rueH2FFMla9bBjLOC7pOrlmlMZKe5xA7Ncf3dh7YiLZoWqykqJ/93Hv9uUxpuE5lz/jSwqHAy160iiQOfldOJI4rUUWdbFiZvZLKCh4aA5GdpLOAEWPX2JueM6bfjqxv9Q+jROuytyiZzo+bcoAfDQKATGS3CXHNZ3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-96358d0a024so3392525241.3
        for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 09:04:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782749073; x=1783353873;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sEWuyLm9nvyhq9LS7vVK2FWNUi6758jMrQo6mncWdtU=;
        b=MvvxTCZvVgBB7P1I2rMDPTHoB8uPUVEhinAdl5s7ywUuLD28zqB9F1BYHPV7L4/ziB
         KRIZBIl9lj1rgVZMtFyjDiTFnA4Ru/Mkr4J07MvupTRUOWo4QOGsOj9uBcnOG3GrfqCH
         fRFp26Yi2phnJaXNmvUf0roo8mBY+MMjOv18cNPsSleNGuwFUj4XWRvp9pJs+98nyk8d
         +m98yopv1+4lk2tTIw2ziyncCBVwNS4+u9hx4uCdKVdMevTU60QtqDQWl31jm+y6AOgQ
         45Zn25rtxXTAR01RRk4LRF4n59Z8pnhwsNOSXIdNGsqbDLKosiy8Dc3jl3SNTc8qUYG+
         3ZsQ==
X-Gm-Message-State: AOJu0Yz8fDy6aOezQ0XgJcEWcsksZiEr0f6aPX3KrK5ErsmbghxPZF/6
	ShpvjWQMs/5lzRFtxrH5yizQ5phXuj/wu91TfX+FkLpKJXUOBYHpev87F8qi9qTp7kI=
X-Gm-Gg: AfdE7ckQmmcrLjuKGj6l/weLPc3gHLg1fW4UajQ/wgsPT60rmN4ztyqftF3cbo9tPa0
	XXUaBf2wr8Sz3sFmqE8VJY9dL69SLzPUBBtk242KgB/PfThtJ6o8VuBIbz48vTv1Br9CfFjh3n6
	7D1MS25nbzouoojhVtBttXDLGzQQ+di5FvSm/L+wi26xncC3mbMhgfDcJ0r4ghn3Oe+Gqiff7I5
	Pe8yjB9cw+gBotcHObGSOPCq5UcxKMV7v4zb/ytHmyg14ySodiOrNDCjTSQ6TvsrZ2w8QW3Oa1Q
	sHwZGE5RK1G7DaF4298aEugvhCV4ICxZkGUGGtUInbzCoCpPVTyV06iniVCBNrmz+AMjZx2jKpg
	bdR993BXEcKZB6zxZtZIJ0/Qc3KyhZXjZpQ4bQBuYjRTlYsh9CVXk/CFZNwDfCYUDWEoJJemUx1
	E4RO1I3pQGo0loLOff6Z17jS+FLs6e1GY189oAqrn0L65+eN9TTw==
X-Received: by 2002:a05:6102:688b:b0:643:80f1:350a with SMTP id ada2fe7eead31-73a365e2825mr278761137.2.1782749073111;
        Mon, 29 Jun 2026 09:04:33 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-738f72b4cf2sm1502871137.7.2026.06.29.09.04.30
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 09:04:30 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-96358d0a024so3392474241.3
        for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 09:04:30 -0700 (PDT)
X-Received: by 2002:a05:6102:148a:b0:738:ff1b:940 with SMTP id
 ada2fe7eead31-73a365e2846mr277383137.4.1782749070424; Mon, 29 Jun 2026
 09:04:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629130329.1291953-1-arnd@kernel.org> <20260629130329.1291953-7-arnd@kernel.org>
In-Reply-To: <20260629130329.1291953-7-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Jun 2026 18:04:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXjJRCW2v=ocjaG1xv2Bhhn1fcgL1YKsV3+MWbhboFtpw@mail.gmail.com>
X-Gm-Features: AVVi8CeLP4wAatdqRaN_LpUF4e5DDi2Drj76tc85gOykWJhBx1i_jZadj7vLGOk
Message-ID: <CAMuHMdXjJRCW2v=ocjaG1xv2Bhhn1fcgL1YKsV3+MWbhboFtpw@mail.gmail.com>
Subject: Re: [PATCH 6/6] [v5] gpiolib: turn off legacy interface by default
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39156-lists,linux-gpio=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:arnd@kernel.org,m:linux-gpio@vger.kernel.org,m:arnd@arndb.de,m:glaubitz@physik.fu-berlin.de,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:linusw@kernel.org,m:brgl@kernel.org,m:dmitry.torokhov@gmail.com,m:lee@kernel.org,m:pavel@kernel.org,m:linux-sh@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-leds@vger.kernel.org,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[vger.kernel.org,arndb.de,physik.fu-berlin.de,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:from_mime,linux-m68k.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,arndb.de:email,vger.kernel.org:from_smtp,glider.be:email,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 215036DD392

On Mon, 29 Jun 2026 at 15:18, Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> All users of the legacy interface now select CONFIG_GPIOLIB_LEGACY,
> so it can be turned off by default and only get built on platforms
> that still have one unconverted driver.
>
> Allow turning it on manually for compile testing, in order to keep
> the build coverage of the legacy drivers in allmodconfig and
> randconfig.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v5: added patch, now that we are getting closer to completing
>     the series

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

