Return-Path: <linux-gpio+bounces-28284-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D97C457B2
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 09:59:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7855B3B45A5
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 08:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF3F22FCBF7;
	Mon, 10 Nov 2025 08:59:51 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1DD2FD1CB
	for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 08:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762765191; cv=none; b=dpQBQNws/hWG8UJ7wxaXWetj0aLebxmSv1Bu3tIGw5etmqqYKeWkZXsDS5qKBF/RTRLuRU23O+snTFkSG9fpQlPqbH5Cckx2aS/DBdCbg7XUNUOoUgf0kGlOfaEblI7z2s1E0+Lfg2VqHsjy6c+9evvI5BzAyySHU9NYYTcJkbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762765191; c=relaxed/simple;
	bh=JRmjklDdMnXYPa/YzcCMj4xR0iBgS1Ed7pmHd076aaU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WZqo8u+g/eCHg7J6MWCq9MRRFepjNSA6F3SApem0hTRKct9DhLfKurYPu6l56Xo/sJZO648Omdz1YwIDxT+h9C4+1tV3QbrbnrKqLv6eGZdy7XOVyW/WczyROG/xlr1VgdGCSAiIlXw5GdxXRatwLJy1AcNi8SCo2xR/ELkosuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-557a56aa93fso487275e0c.3
        for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 00:59:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762765189; x=1763369989;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zuaR1c68u39/qbD5w07qCJ9IxeheIz5/8CL8hB/l6OE=;
        b=fqhhAAD5rZYz+KQA+PCxI2nZj0kDYMZqHHB/zAwcyQVFVolmpK6QrgYn9NX/W94jIT
         1g0dFbX1b2o1oAIRc9JHxHJLcktXN6svf+n32OrmoVsIM4If0nwcpxgqyieIhf3WF6Qk
         lGSYGHFckMfaN9OSc2+pJABjsK6TPpfHVebT+N92k6z6l265gAH30u5Cs5Jpso4kDNnW
         qasLnUli6bPx83qlPYLwS6AoTG1CdA1FLl0LY3hJoonRa36ok50imdZqxaHh4H70At8W
         U/Ye/gjDX2cx9ELiTlwjyM/hjFevnHrbbhRa79Dm6IvI9KpeOqT7opnlIB6fRX8YZXIQ
         kjrg==
X-Forwarded-Encrypted: i=1; AJvYcCVmDsOQNpHSKSOHNsWzG7VoTI/dIV0qLy+BOWa9ifgLBLGNhParqiyzNajdM2MnJHeopE6KW8Y4gR5n@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqb3lZ9/QpakQW5ZbICcFTIxgD7KIjPFoDZWqYmxp+dSbKodh8
	dvn683PgrHbl/ZuDITuL/+k7ebEqiyjZ5oOEtrNw/+PW+RfdsOQGChI1TgASaYCZ
X-Gm-Gg: ASbGnctn84t0p6V4GggDtWYk8e4Fn9XwJzeWV2Kfz64BTzqesL1+E9aMBdPzzFGApws
	JRja0OqGJQDH4XsT30tAJUpBwD3Ebo6OXz3+3n/f3HX8Uo4VXmarf+Pxek9c84ot4blmWOAYWI7
	KoknwKCymTKcb6kvDssa9UBYRyZKRJ3z3z0JO3iev8zx1Ao0lL6xuA8lJaPzk2qK8B+0GaNVryg
	q+BlenE/lYFVq+nvp54pSsc5TALIEz6lWjCwSa4XyId/q5VnPxcodsH+usYuh8f7a12t/aJiggd
	bR8Kn+7rfSt1QJSXN9YzbdjWyWtOB20avqijsphmxBUIrQuomWebBmyhJJlEfbUn+9sNaJ5ja7Q
	5GEXRGNE21ZJE9o6eILOalOeeaahOr3WigQ/bcJhGUl5xcasrzsyzyWs56NaKTUlCQL57IEwBBT
	qwikP06Z8RSmsVrN/mA5tpC3OCbWBJdkvS5ztjma3hSA==
X-Google-Smtp-Source: AGHT+IEp1HbdJGHVmsmXlvm7GghKyeKNLk2HLtR8gBkV28s8nyg53Fh3Wgu94jqzlpiZXwblG+nP+g==
X-Received: by 2002:a05:6122:251d:b0:559:3b8a:70ce with SMTP id 71dfb90a1353d-559b320b83emr1699844e0c.7.1762765188839;
        Mon, 10 Nov 2025 00:59:48 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55995863f11sm7140675e0c.24.2025.11.10.00.59.45
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 00:59:46 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5dbddd71c46so1103819137.2
        for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 00:59:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXLgo/KPmlwbWyHWmzwGhoajmuTxspwILUpTSvOFoPdxA1y+9ly9p07rFS256UsDJnt1Rfysm1fJpck@vger.kernel.org
X-Received: by 2002:a05:6102:950:b0:5db:fb4c:3a89 with SMTP id
 ada2fe7eead31-5ddc471358fmr2304047137.19.1762765185596; Mon, 10 Nov 2025
 00:59:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761588465.git.geert+renesas@glider.be> <97549838f28a1bb7861cfb42ee687f832942b13a.1761588465.git.geert+renesas@glider.be>
 <20251102104326.0f1db96a@jic23-huawei> <CAMuHMdUkm2hxSW1yeKn8kZkSrosr8V-QTrHKSMkY2CPJ8UH_BQ@mail.gmail.com>
 <20251109125956.106c9a1a@jic23-huawei>
In-Reply-To: <20251109125956.106c9a1a@jic23-huawei>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Nov 2025 09:59:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX8c1VkBuPDpJ5mpCcRH+zEX4F1bQKFf_V8N9ZZtCYqxA@mail.gmail.com>
X-Gm-Features: AWmQ_bmD7LCstBufqr7pTwqKUhf3WnheTdaFZy-l1C13xKAmQ3xomq2Nqy5MxZo
Message-ID: <CAMuHMdX8c1VkBuPDpJ5mpCcRH+zEX4F1bQKFf_V8N9ZZtCYqxA@mail.gmail.com>
Subject: Re: [PATCH -next v5 10/23] iio: imu: smi330: #undef
 field_{get,prep}() before definition
To: Jonathan Cameron <jic23@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	David Miller <davem@davemloft.net>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Crt Mori <cmo@melexis.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Jacky Huang <ychuang3@nuvoton.com>, 
	Shan-Chun Hung <schung@nuvoton.com>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Jakub Kicinski <kuba@kernel.org>, Alex Elder <elder@ieee.org>, 
	David Laight <david.laight.linux@gmail.com>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
	Jason Baron <jbaron@akamai.com>, Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Kim Seer Paller <kimseer.paller@analog.com>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Richard Genoud <richard.genoud@bootlin.com>, 
	Cosmin Tanislav <demonsingur@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Jianping Shen <Jianping.Shen@de.bosch.com>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-edac@vger.kernel.org, qat-linux@intel.com, 
	linux-gpio@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-iio@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jonathan,

On Sun, 9 Nov 2025 at 14:01, Jonathan Cameron <jic23@kernel.org> wrote:
> On Mon, 3 Nov 2025 11:09:36 +0100
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Sun, 2 Nov 2025 at 11:43, Jonathan Cameron <jic23@kernel.org> wrote:
> > > On Mon, 27 Oct 2025 19:41:44 +0100
> > > Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> > >
> > > > Prepare for the advent of globally available common field_get() and
> > > > field_prep() macros by undefining the symbols before defining local
> > > > variants.  This prevents redefinition warnings from the C preprocessor
> > > > when introducing the common macros later.
> > > >
> > > > Suggested-by: Yury Norov <yury.norov@gmail.com>
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >
> > > So this is going to make a mess of merging your series given this is
> > > queued up for next merge window.
> > >
> > > I can pick this one up perhaps and we loop back to the replacement of
> > > these in a future patch?  Or perhaps go instead with a rename
> > > of these two which is probably nicer in the intermediate state than
> > > undefs.
> >
> > Renaming would mean a lot of churn.
> > Just picking up the #undef patch should be simple and safe? The
> > removal of the underf and redef can be done in the next cycle.
> > Thanks!
>
> Only 1 call of each of these in the driver, so churn is small either way.
>
> To avoid a bisection problem if your tree merges first I need to modify
> this stuff in the original patch or leave it for Linus to deal with as
> a merge conflict resolution which is mess I'd rather do without.

If you add the #undef, there won't be any bisection problem?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

