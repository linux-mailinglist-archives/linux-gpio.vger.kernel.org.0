Return-Path: <linux-gpio+bounces-17687-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FD4A652BA
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Mar 2025 15:19:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25EF53B9894
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Mar 2025 14:19:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C5322405F5;
	Mon, 17 Mar 2025 14:19:03 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D46199E8D;
	Mon, 17 Mar 2025 14:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742221143; cv=none; b=sGEqDPlw9JAoZ6xjo+sAXLRjUuuGyxNXa/wjO6do2CsFM+7PJMrQhJJbBJH8dxOKR95XouykIb5251tzKNMWMUegcpml5CVqtEyxnZ6SlE9ln14WEAi/hGVeB3NoxJRL+pnreo5id+rD7aLGcFPJrsVRwsT3eDVEUi1uKNZnvkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742221143; c=relaxed/simple;
	bh=8PM6QbVEn4s657b1vZBMBsMKFGc8AAH22xuLnz8sw7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aqobiFhHIxlsf2wk2l5msDgz+7t46U1IgfdtgV2kjvnWHUcbTZ7vnE6fVnp8B7G4BFxvK8iDaHB3k26RFlefMRZDFwk53dBfHnSmw0mX1G6MSdZNdT/qTFCw+Gv9wc092R0vVS70u0SRW1B0qDFWkorAs67MOkoXv8iyGvElhuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-476b89782c3so51321811cf.1;
        Mon, 17 Mar 2025 07:19:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742221138; x=1742825938;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FQzfQJUTkwGhun6W4CYWdgvhWW8H+wpChsA4H5Uf+0w=;
        b=RMiomOUig6P/dW+aZFTjzklObYVArgfwrXAIqota9L71KRwkJOBRzh4/mtM4aUlSOM
         83ZXbNze27WOTPWxhvdGbHye/z5v6mUhESA+56foDPcsLl4Z1eglbPQgyhjNpDWjklts
         aM5TRNfh+A1UialMEssILk3YeotRRKHc4bCWM4T1uetY8k0jbR60NixjYeivp/loMx/1
         i/sIZr45TUqUvrOAoRHUusxW6V6vs+qq3SSGsdLdx1GodUOuVfhxXcs3nGdJbO40iaAl
         kns1ORsJ3EHjUgEGXz+2V2zlpfXE9fFug01qg6vZAM8DZPrkwb/5fNag7Z43ZYrzSRYz
         jYbw==
X-Forwarded-Encrypted: i=1; AJvYcCWWlvAv5zzbINmCFS9zuFiBCbUUicusHwkAtpnz53/+5RLqEvGRVEK5+gcfysJIBV+XZ86IXiPpC5P8@vger.kernel.org, AJvYcCXpxTl+sDDj7clgVEvrtKID2oNxb//NgUh/ajyZxzQyYt5Yfo0adR0lMKfmDK8wN9ageSDMfSu2E+KNhJpU@vger.kernel.org
X-Gm-Message-State: AOJu0YwmNXcsNvJu8vC7dGaXtOgp1D0fe/4+p6E7Zwp3M/4P+e2OmnR4
	PjEii3Ov4ZkNrsYKOcW2ULY8LevHn4gkKjAPx07dXkzDfoEvUbcdcY2wqbBP
X-Gm-Gg: ASbGncspjmpFCDvqyt3I4V4Rh9fL9f7CQB1cQObpsGamFCbw4Gjfw7mTO6s29g9sBeE
	AdKw0Q9pKAhUMXchQY53vOU5JyPKjO826UYzUCOxCQOlaTFmMaj80j3chKphuFBlel9fMmenE2k
	paYXoR2wnqjqHYdulUTzwZ8TbiJZdSQrAPTY90MhJrKLgtSAf1wADQb+QpK/tLvFpFWUvYLHrYp
	vN8Ygtp2PceC/WT1LyEtjnW/ZDu1GF9F9MPIvIf/7HpHgwIlMAaClWTRdMWvFiAJ08H/rTnFkT0
	+Y4cy+HKfemnIkocIkku8Y+F8tPSaCWbzSiXWEcVr9bmYxkbCFBIWRQGOk/NFuG9m/esBkTMTIN
	gUfjT+Gg=
X-Google-Smtp-Source: AGHT+IEToVfW+W01NFBwwfdMnq1kW7cP1iloXeUfIAwg9GX0Yl48vteBPz4gtemTEqXweZIbii3V0A==
X-Received: by 2002:a05:622a:438b:b0:476:8f75:b898 with SMTP id d75a77b69052e-476c815c9fcmr156895841cf.25.1742221138312;
        Mon, 17 Mar 2025 07:18:58 -0700 (PDT)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com. [209.85.219.51])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-476bb63ac46sm54632641cf.17.2025.03.17.07.18.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 07:18:57 -0700 (PDT)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6e17d3e92d9so31383236d6.1;
        Mon, 17 Mar 2025 07:18:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCURHY0wS6iMqT6owdWAhrHC+bYW9tcoxvlRrqJSeF944nc6zn3MFcZng7BGYBtU7y63basvs6B+M92T@vger.kernel.org, AJvYcCWfzwqobmnCt0WVTCH0DXv5QF4VUezsubvMusnk15LGz/Y/Snvsu4HTve89C2GCD/OfoUp/Sqa4+zX1wlVZ@vger.kernel.org
X-Received: by 2002:a0c:eb82:0:b0:6e8:feae:929c with SMTP id
 6a1803df08f44-6eaeaa63b4bmr161375046d6.21.1742221137414; Mon, 17 Mar 2025
 07:18:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250218-k1-pinctrl-option-v3-1-36e031e0da1b@gentoo.org>
 <CAMuHMdV4xWLEuCvCC54GBfCdELE=QSHqaOyUPD-ezE0QLYRnVA@mail.gmail.com>
 <20250317124120-GYA1983@gentoo> <CAMuHMdWM5ymPVRe36+Atr0cDAdRGyw39jFJvE+9PWTUUiiMfCg@mail.gmail.com>
 <20250317132955-GYC1983@gentoo>
In-Reply-To: <20250317132955-GYC1983@gentoo>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Mar 2025 15:18:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUWUd-xAzhRvazurD-1t3pFb2OUMXqEpeDyTVVbAUG19g@mail.gmail.com>
X-Gm-Features: AQ5f1JrurBlRutNcrH6Q6idcmvXYK5KPYEnvrshCL60keuYt9BH4Ng3SnCR2u0Y
Message-ID: <CAMuHMdUWUd-xAzhRvazurD-1t3pFb2OUMXqEpeDyTVVbAUG19g@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: spacemit: enable config option
To: Yixun Lan <dlan@gentoo.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alex Elder <elder@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	spacemit@lists.linux.dev, Conor Dooley <conor.dooley@microchip.com>, 
	Alex Elder <elder@riscstar.com>
Content-Type: text/plain; charset="UTF-8"

Hi Yixun,

On Mon, 17 Mar 2025 at 14:30, Yixun Lan <dlan@gentoo.org> wrote:
> On 13:59 Mon 17 Mar     , Geert Uytterhoeven wrote:
> > On Mon, 17 Mar 2025 at 13:41, Yixun Lan <dlan@gentoo.org> wrote:
> > > On 09:18 Mon 17 Mar     , Geert Uytterhoeven wrote:
> > > > Thanks for your patch, which is now commit 7ff4faba63571c51
> > > > ("pinctrl: spacemit: enable config option") in v6.14-rc7.
> > > >
> > > > On Tue, 18 Feb 2025 at 01:32, Yixun Lan <dlan@gentoo.org> wrote:
> > > > > Pinctrl is an essential driver for SpacemiT's SoC,
> > > > > The uart driver requires it, same as sd card driver,
> > > > > so let's enable it by default for this SoC.
> > > > >
> > > > > The CONFIG_PINCTRL_SPACEMIT_K1 isn't enabled when using
> > > > > 'make defconfig' to select kernel configuration options.
> > > > > This result in a broken uart driver where fail at probe()
> > > > > stage due to no pins found.
> > > >
> > > > Perhaps this is an issue with the uart driver?
> > > > I just disabled CONFIG_PINCTRL_RZA2 on RZA2MEVB (which is one of the
> > > > few Renesas platforms where the pin control driver is not enabled by
> > > > default, for saving memory), and the system booted fine into a Debian
> > > > nfsroot.  Probe order of some devices did change, and "Trying to
> > > > probe devices needed for running init" was printed.
> > > >
> > > my problem was CONFIG_PINCTRL_SPACEMIT_K1 isn't enabled, result as
> > > # CONFIG_PINCTRL_SPACEMIT_K1 is not set
> > >
> > > for your case, is CONFIG_PINCTRL_RZA2 built as module?
> > > it should work for uart driver with deferred probe mechanism..
> >
> > No, CONFIG_PINCTRL_RZA2 was disabled in my testing.
> >
> emm, this is interesting, there might be problem that uart driver
> fail to have correct pin settings without pre initialization..
>
> which uart driver is used in RZA2MEVB platform? any pinctrl dts property?
> different hardware may vary..

It indeed depends on both hardware and firmware.
RZA2MEVB uses the sh-sci driver, and its serial console is set up
by the boot loader.

Does your serial console work with "earlycon"?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

