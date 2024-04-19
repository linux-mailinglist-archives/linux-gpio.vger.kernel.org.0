Return-Path: <linux-gpio+bounces-5679-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC47E8AAAA6
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Apr 2024 10:36:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C2CC1C21FFF
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Apr 2024 08:36:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 760055FBBA;
	Fri, 19 Apr 2024 08:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="FzRyFZFe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17A05EE8D
	for <linux-gpio@vger.kernel.org>; Fri, 19 Apr 2024 08:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713515774; cv=none; b=Ag0zOryy4f0/RsemARIwHAFcBZQJSfgLSlC1+WYREJq/9tmKB6s3JRYjn5efTdQwaIF78gWnjc2xmgnT6zZTy6S/orGl+VSIki7QudBmpdldSD6XI8LUlPNCP6m0l7HJGvQLW2+gqO8vBnrhMi6i2pGEZq/rtYfO2+Jjr9xjB5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713515774; c=relaxed/simple;
	bh=hF0/38INzKLknEA8dxytWSaQqKMw9EKeY4CG3eRywl8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I3hdQVBjrulKCJ1BPZspweyJU8cjtk54BBAe5yvG2ykSRY8zCL4VTKFBp+x5hM9cn6DEbfLpa4gz/ECFUNvjRSZydzBvCbaSJ/nopGU11LCR1Rpvv6CirMFtXcGlXk/OeP2RPJjM2TiHiz55fsdH+Oqo1b0NvHruzEJZkSJZ7wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=FzRyFZFe; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-617d25b2bc4so18062997b3.2
        for <linux-gpio@vger.kernel.org>; Fri, 19 Apr 2024 01:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1713515771; x=1714120571; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qHjnNQ86N++geHQUiCSUMyaqWDgVxDALRY9racYl+Uk=;
        b=FzRyFZFea9qDVYjfh9Dtabd8HjnRNY9xe3QJ8JtBODgxtpcJm2P+2OcisRWNqn12fm
         RhKO1sQwPgGXVbSPshZTxI7r8jAi0cgMs7TuPZBDf34GdvnTW8o2Ea0LS9ybnAXuZjvD
         I+IkFEMWTIA0C08Jpvv+Zu2hi2wnbreJyUuUoAB6azfyLuR2/ssCuBgGPjPFWgUYDB/3
         Q+/nk3wq8YwFZvB+kCYYAFrc7rJjZjmnXpaDcu4iK+jpWTjPkt5ueHTfpC3M9C4ERb+r
         g3XaJ5+11DC7ezI4XPN8gOkc05hfHl+y3C2fsi4EVIWGrBlriCnQOI44I69FAOPStk7h
         g5cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713515771; x=1714120571;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qHjnNQ86N++geHQUiCSUMyaqWDgVxDALRY9racYl+Uk=;
        b=PkrbIoBheDG/GoNzB4t85SxlyNGnxTpmhtFegAQRrfXzTPetrhRuyGcTKIQwfu7y8x
         yLmlvSMheyBSwSlSBFL6grQZldXM5ANmWUc9u8cI0tIbOFqWaV5Xsi+4e9ieVe60918l
         M7CqWrea9/O7uWKMj0pCC+T7yC8eEMV//P/kO3hBfMbwp3ZrNO7Lwm03lGDlCKMr2Nla
         153yB9GIXaKAhCdZw0DdCAe5VaznrO2vegQkDBJN89+WhX0rSf+H/pFGqAwAusBSRh3e
         D4Q6PPdS/V8Bgh6qAFRCqEEXcLbJyZd/A46WpuMOg9WRUU9RjUsfmyMG8owaX+NF2zIb
         +sHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyt39XrGkYTp4U67c8nIshZf0If7O/pSfEdjpsOIDmEnTZ/Kb4saHFhKOBNfZnDgr9BMiFq/RT/+bZaVLtXhNpZlxuezvra8PurQ==
X-Gm-Message-State: AOJu0Yykc1Ae3ZaWZJ5G4OwwJw8KnaAWyehMsQ1sBeuLLICULpEoBBnp
	CluB9fBrnm7nL9CD5dHOz7da2Dd3gT+Y0VylBpHzyNTlCXtDg11auaHQwPtaN50b0YmNeFTvs0m
	lEN3DhLFLo2sslasZcgutJWNP7vpc3gyc0/NnTw==
X-Google-Smtp-Source: AGHT+IHD8DsNgEG3VcswCSP7Vc00sVnoZ+iA5w2TYOFFymsovAj6wgN84R56QS07sK5VX+KWadlwkeKKG1UDfJ1O114=
X-Received: by 2002:a5b:bcf:0:b0:de0:d32b:52bf with SMTP id
 c15-20020a5b0bcf000000b00de0d32b52bfmr1080482ybr.39.1713515771559; Fri, 19
 Apr 2024 01:36:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMEGJJ3y_A1vtTV1x8836+AMOHs6NnWx_EsLTJMgaR5Fb9fgtQ@mail.gmail.com>
 <4a0c4893-0c34-45f8-aef3-e8a7c2fc88b5@broadcom.com>
In-Reply-To: <4a0c4893-0c34-45f8-aef3-e8a7c2fc88b5@broadcom.com>
From: Phil Elwell <phil@raspberrypi.com>
Date: Fri, 19 Apr 2024 09:36:00 +0100
Message-ID: <CAMEGJJ3yDvyRvNM8y+mZzJyz0Y3+k8YRJim9cPXYaFiAgFb8vA@mail.gmail.com>
Subject: Re: Advice on using gpio-brcmstb with gpio-ranges
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Doug Berger <opendmb@gmail.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

[Redo without the HTML]
On Fri, 19 Apr 2024 at 04:59, Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> On 4/18/2024 4:36 AM, Phil Elwell wrote:
> > Hello,
> >
> > I'm having difficulty using the gpio-brcmstb driver with the
> > gpio-ranges property. gpio-brcmstb allows multiple banks of up to 32
> > GPIO lines to be declared using a single DT node. However, if you do
> > that, any declared gpio-ranges get applied to all banks without any
> > kind of filtering or adjustment. This is because the gpio-brcmstb
> > makes use of gpio-mmio, which requires one gpio_chip per bank. These
> > gpio_chips have the same DT node, hence the same ranges, but are
> > unaware that only a subset applies to them.
> >
> > The GPIO<->pinctrl mapping can be configured in driver code, but this
> > is deprecated (as is forcing global GPIO base numbers to start at
> > zero, but the driver does it anyway).
>
> More like it has not been converted to use a dynamic base, that is on
> our TODO.

Then this may be a helpful starting point:
https://github.com/raspberrypi/linux/commit/2c6ef57c11137c07d5961c3dda2021e0403628ae

> > What is the best way forward? Does one have to say that in
> > gpio-brcmstb, gpio-ranges and multiple banks are mutually
> > incompatible?
>
> Do you have a DT snippet of what you would like to achieve?

Sure, but it's not very elaborate:

    gio: gpio@7d508500 {
        compatible = "brcm,brcmstb-gpio";
        reg = <0x7d508500 0x40>;
        interrupt-parent = <&main_irq>;
        interrupts = <0>;
        gpio-controller;
        #gpio-cells = <2>;
        interrupt-controller;
        #interrupt-cells = <2>;
        brcm,gpio-bank-widths = <32 22>;
        brcm,gpio-direct;
        gpio-ranges = <&pinctrl 0 0 54>;
    };

Phil


On Fri, 19 Apr 2024 at 04:59, Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
>
>
> On 4/18/2024 4:36 AM, Phil Elwell wrote:
> > Hello,
> >
> > I'm having difficulty using the gpio-brcmstb driver with the
> > gpio-ranges property. gpio-brcmstb allows multiple banks of up to 32
> > GPIO lines to be declared using a single DT node. However, if you do
> > that, any declared gpio-ranges get applied to all banks without any
> > kind of filtering or adjustment. This is because the gpio-brcmstb
> > makes use of gpio-mmio, which requires one gpio_chip per bank. These
> > gpio_chips have the same DT node, hence the same ranges, but are
> > unaware that only a subset applies to them.
> >
> > The GPIO<->pinctrl mapping can be configured in driver code, but this
> > is deprecated (as is forcing global GPIO base numbers to start at
> > zero, but the driver does it anyway).
>
> More like it has not been converted to use a dynamic base, that is on
> our TODO.
>
> >
> > What is the best way forward? Does one have to say that in
> > gpio-brcmstb, gpio-ranges and multiple banks are mutually
> > incompatible?
>
> Do you have a DT snippet of what you would like to achieve?
>
> >
> > Thanks,
> >
> > Phil
>
> --
> Florian

