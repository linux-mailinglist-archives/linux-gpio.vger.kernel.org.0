Return-Path: <linux-gpio+bounces-17682-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F036A65004
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Mar 2025 14:00:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2FF817A5F16
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Mar 2025 12:59:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A16E923BD0E;
	Mon, 17 Mar 2025 13:00:00 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3651A3056;
	Mon, 17 Mar 2025 12:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742216400; cv=none; b=a3qBkS8NfnmyXBhPuDfdxnGFZHbe9QvXY8Cikf8KpVsIr8SH137k+W93X/iXVNSBAKnGmKxFJqaPVskmrRpnFJwa14ktqI//kKOH/3VZCG0hej3N4hFigZZRv6d4lW0VFPWpz+ev2GL9KFkTiw6+agiDZkfzUmAcs+y51aQUViU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742216400; c=relaxed/simple;
	bh=bF8EJP+3Aa5zflm5yFQ29JdF6zwXdZTFL+V6DpaCRmg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GuolRaTFERRyyQuTrPenG8feT95qTk2KFPLxS1fWhm+nLrFRJ61bEDW86KGgWlyZD0GN/MEXTEVPxChgIuC9nIcEH8n6wnOlIIY2Cw2+JGJozNPr8jbUc2mo0Fx6NONBASgafUUeECTJwGYkCzbB+sAfEaScPxGUYG3Erhs2j80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-86d30c329f2so4194697241.0;
        Mon, 17 Mar 2025 05:59:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742216396; x=1742821196;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RKVz0H8Y7Bgxhan9DFR3lBg40nko18FBpH/VH8EUG10=;
        b=cPbCOjSrmGqogmKkoi2g/aRSJWHD6ebubEKaDnrSZIIjoWQxUZ1xW9kZVHbQh+Bilp
         xpIrrIiXvJRWhqNipcZ5qEU+IDXKaijq1WvOWMh69zFzAh54nwnOYlKg2y8ePU+tv4TS
         9hWaiXdrtYHu0Kl6fYgRFO8Zyy22B6w/d7CHaYtPE7m5n5JcizzEcumuGbJZz/yjkuz0
         0W+r7MuDGxdNwo4wnrdNDEy4yFerg0fIJg2rPKHslUfyehJeC5BUwgAbqVYkpoz9PfaH
         MZyNPuYnf+hjDZGzrGhp44/kEoo23BcfRGE9jzogsESMkqfnX8hQxvAfnpU9+hVVsIhB
         DuBw==
X-Forwarded-Encrypted: i=1; AJvYcCU/Zj8TTmEwbYDkSVr9eIStn4980ryAyYuKvHi+nYSfBTx0/g0tGV/fHtV2jjdW4/psUj9KsfAyp5vN@vger.kernel.org, AJvYcCVItr9B+wFeASsBRvQMpydo2I+b5FHY9mk/fThEohXfN7+X3iPmY+mUSIK2X27u6k2NyMx19MpTl/VJuKjX@vger.kernel.org
X-Gm-Message-State: AOJu0YzcfHSFz26ZjqcFxupZ2oFp+E9M8VRH+kwpOWqKE0Fr3AjTwYuZ
	YHdNYkubTWKikohDqdYxZ34sC/Q0sJdF2JBBLrT40BaFLq9wqSPtURALuqE8
X-Gm-Gg: ASbGncsVQCd+vZuI+1ty5OcZ0WhXbPbqhJOOnW+wap25VTxEtS0tpQw5qxf+dSeR6P4
	jH92IuRx3APThVZW59u/10ySYnomzBgaV9wRyLmPmHhbEv0yxDGsw9ZH520I1t4IZB0YRPtCjCf
	tYjzRsLl9ieRcUTq49fdDNycE+Ow3FgCCORXSFVyyIHBbnDm7tjKuI0ZbMJlrI6M/hBOWlh97r1
	TRg21qAHqNOPQEzOX6wc2dUBymsb7d+QKJ6VwnyWEtQPKdaoN62y9RHtWh7uEbiaQBlvF8yY3h4
	MrSJw0ilceZPWCknOD78qGaP+SmIZX2ADJ4exxbso6hj+lNI512KGltbCDZfvB43xPjYtiV0yNh
	8jjP+ibc=
X-Google-Smtp-Source: AGHT+IHu8gSnsyKNWlXuxU5JkVeY72+zparv3prWf02uKLuaa2V2nLNZWbY6YAc7AKMpZdeVupJEMA==
X-Received: by 2002:a05:6102:290c:b0:4c2:ff6c:6043 with SMTP id ada2fe7eead31-4c3719e4252mr12276755137.0.1742216396147;
        Mon, 17 Mar 2025 05:59:56 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-86d90dbc93esm1597822241.16.2025.03.17.05.59.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 05:59:55 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-86d587dbc15so3865872241.1;
        Mon, 17 Mar 2025 05:59:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVA3XMrksodac7NGjttR+o3pfdVkTVwKQ/0Xo1OwgoeBGnupbdQ4PKzTH8iiJOfPyD1MGxFPB8plhIj@vger.kernel.org, AJvYcCVFe9tdyNxO4Cjmc4/WbHHZj4QsumXAuao+QVqPWbsGCsXmKu0AIzKsjP9a6tm2G2S4ke+Evfu2KuHx8bvo@vger.kernel.org
X-Received: by 2002:a67:f057:0:b0:4c3:9af:9134 with SMTP id
 ada2fe7eead31-4c371bc669bmr9558320137.4.1742216395284; Mon, 17 Mar 2025
 05:59:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250218-k1-pinctrl-option-v3-1-36e031e0da1b@gentoo.org>
 <CAMuHMdV4xWLEuCvCC54GBfCdELE=QSHqaOyUPD-ezE0QLYRnVA@mail.gmail.com> <20250317124120-GYA1983@gentoo>
In-Reply-To: <20250317124120-GYA1983@gentoo>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Mar 2025 13:59:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWM5ymPVRe36+Atr0cDAdRGyw39jFJvE+9PWTUUiiMfCg@mail.gmail.com>
X-Gm-Features: AQ5f1JroT5lBrXCjHhRfNdJVSpXUexSZ0r_yj1ykAz2lnhY9dJFD1lX9QxdNGDY
Message-ID: <CAMuHMdWM5ymPVRe36+Atr0cDAdRGyw39jFJvE+9PWTUUiiMfCg@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: spacemit: enable config option
To: Yixun Lan <dlan@gentoo.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alex Elder <elder@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	spacemit@lists.linux.dev, Conor Dooley <conor.dooley@microchip.com>, 
	Alex Elder <elder@riscstar.com>
Content-Type: text/plain; charset="UTF-8"

Hi Yixun,

On Mon, 17 Mar 2025 at 13:41, Yixun Lan <dlan@gentoo.org> wrote:
> On 09:18 Mon 17 Mar     , Geert Uytterhoeven wrote:
> > Thanks for your patch, which is now commit 7ff4faba63571c51
> > ("pinctrl: spacemit: enable config option") in v6.14-rc7.
> >
> > On Tue, 18 Feb 2025 at 01:32, Yixun Lan <dlan@gentoo.org> wrote:
> > > Pinctrl is an essential driver for SpacemiT's SoC,
> > > The uart driver requires it, same as sd card driver,
> > > so let's enable it by default for this SoC.
> > >
> > > The CONFIG_PINCTRL_SPACEMIT_K1 isn't enabled when using
> > > 'make defconfig' to select kernel configuration options.
> > > This result in a broken uart driver where fail at probe()
> > > stage due to no pins found.
> >
> > Perhaps this is an issue with the uart driver?
> > I just disabled CONFIG_PINCTRL_RZA2 on RZA2MEVB (which is one of the
> > few Renesas platforms where the pin control driver is not enabled by
> > default, for saving memory), and the system booted fine into a Debian
> > nfsroot.  Probe order of some devices did change, and "Trying to
> > probe devices needed for running init" was printed.
> >
> my problem was CONFIG_PINCTRL_SPACEMIT_K1 isn't enabled, result as
> # CONFIG_PINCTRL_SPACEMIT_K1 is not set
>
> for your case, is CONFIG_PINCTRL_RZA2 built as module?
> it should work for uart driver with deferred probe mechanism..

No, CONFIG_PINCTRL_RZA2 was disabled in my testing.

> > > --- a/drivers/pinctrl/spacemit/Kconfig
> > > +++ b/drivers/pinctrl/spacemit/Kconfig
> > > @@ -4,9 +4,10 @@
> > >  #
> > >
> > >  config PINCTRL_SPACEMIT_K1
> > > -       tristate "SpacemiT K1 SoC Pinctrl driver"
> > > +       bool "SpacemiT K1 SoC Pinctrl driver"
> > >         depends on ARCH_SPACEMIT || COMPILE_TEST
> > >         depends on OF
> > > +       default y
> >
> > Ouch, fix sent...
> > "[PATCH] pinctrl: spacemit: PINCTRL_SPACEMIT_K1 should not default to
> > y unconditionally"
> > https://lore.kernel.org/6881b8d1ad74ac780af8a974e604b5ef3f5d4aad.1742198691.git.geert+renesas@glider.be
> >
> I got suggestion in v1
> https://lore.kernel.org/all/20250211-nature-kilt-9882e53e5a3f@spud/

Yeah, I read that, but only after I noticed the issue in v6.14-rc7.

> so for COMPILE_TEST case, ARCH_SPACEMIT config won't be enabled? then neither PINCTRL_SPACEMIT_K1
> anyway, I'm fine with either way, thanks
>
> > >         select GENERIC_PINCTRL_GROUPS
> > >         select GENERIC_PINMUX_FUNCTIONS
> > >         select GENERIC_PINCONF

It depends. ARCH_SPACEMIT can be enabled only when building for
RISC-V, while COMPILE_TEST can be enabled everywhere.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

