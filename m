Return-Path: <linux-gpio+bounces-26520-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4946B94DA8
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Sep 2025 09:49:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 05C677B6068
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Sep 2025 07:47:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4A63317703;
	Tue, 23 Sep 2025 07:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Eznf5cwO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0DB3164B7
	for <linux-gpio@vger.kernel.org>; Tue, 23 Sep 2025 07:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758613736; cv=none; b=YYGyhEI7y3b2RPaSYIiM/tRPTjykTIjHE8aebEZALwDNuOeEFLzgNATJspG0/XSBe8gC2/Xb2an/HGgvFvlM97e4eFmXKrRU2EJ4rcS+cmrYYR81s+VK5U5R3n1W7mWUH46IcA5MHnA/1AjqpNvYrcxjko10oRkddE1kiiaGNwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758613736; c=relaxed/simple;
	bh=AJaxzkgGMS2WBlrlop8PHPlSP36j70ySVSvjHs1aEs4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QeXuYnk2aS4idxrlBYLHLyCOAWY/JPNaC/omlKeMl4Ok/sgPeQZOakTzbMz79r2JY8Fy/a3B2Uads98LFv4Wv47s9NQUOWx/Gtp3gIRiQ6np8pD3b26WpOLZncphbrzRiznd2+SuurbrpbQMBEEDkabyyJ5I9Bz5ApR2xZtqLM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Eznf5cwO; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-57bb7ee3142so2132892e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 23 Sep 2025 00:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758613733; x=1759218533; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJaxzkgGMS2WBlrlop8PHPlSP36j70ySVSvjHs1aEs4=;
        b=Eznf5cwOZ88V2MaKv6rCtt4MAxUW5dduUvOhPTHPEjhrlHMPdtFYL4g4qYiFPuFWR6
         yRDDhVGIZ6DAt/SLexaLsJ/KzyndNLZjcqXhu4E2VfIOM+HoLI+eheKVIE1NGXowZAk1
         yA14gM8ifFev7H/ctGl7NvU+O35jBj0uPidDyla1urUOMuP1VUnC4mYP/kDzVshUgnVy
         5HpRSv7cAmu0dNByp8t0STC4EtGaMvBVJ3rzsrwYRC7PgGZmil1bFZeL5Mq8k6NBoj3S
         5/T71ntfl4kZ5JIOnCaaRgMy4+X+mUCOuT9otCord4WGZj3z/5owucBaHuWvnfO7zr90
         r5Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758613733; x=1759218533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AJaxzkgGMS2WBlrlop8PHPlSP36j70ySVSvjHs1aEs4=;
        b=XxPDVDTNabaJN60U1VQ3lmzOnk8X4LNwlcvcsAhzsQoVqd4XGNe5H7LAMMAEyOc2Go
         iPKVa95I1BZ8sggLNvwxeN7KNpCZKAy9unCy1w9xF2WF/6hixZASiWkTQyO7WuVWvuYm
         Vtsihr6fj5Ibn60Lqt4IhybuHwZTtQSSqM7QC1JIgRJlXH+l1KrkDVVEOSwffmTc/4jh
         BNhkXZrH/fyB/3Snc/gW8z0/HDNDJ8frXLtismTcLI1Yb7OTtpRkLhJ4a7P9c2Cp0QRJ
         4cVjN92Nyclk/r1UZhfDkeMxbMXldbWL6qaQrqthBcbspOHz/Lur+OZ81AjfGYKwk8sd
         x8Eg==
X-Forwarded-Encrypted: i=1; AJvYcCVYN+L4+9QBRTszKToa1qa8GHOryCtO5PhTAM3SAJNjmbtecp6ZxNinwlfynPstFnFXenive/cd9OPr@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ+oWe36uIWX6RxxTs9YIq34kNyEELJ7MsbOJL1NwS68xFuwYf
	WjG3P4sLG7qN20oJ++bc8RDdgYOF/9f4VSLpdgKtGYqJnxfxwgs8mL/btSBXh6I2kt2Rv/E6D5t
	Wd0vVXHX4XG5JJ6tEQnZGjvMUMDw4VzEpV18wCZpwbQ==
X-Gm-Gg: ASbGncuARySOBg/qqTI/AHurTLqMJQim9K/LsTmollz1vcaU5LxMipFNT5IIGn5yk7v
	P63dLKXSDH/3VIkipnVg9WgPu5xkunkrSjDYrzxB8uqyaYzGu8mOgKDFKIfjKc4Kn3acHATtAtu
	D+wphCPG47WGngFfxw4M8OAZLVjlglrh6malaNBb1NG153ETfq6P6wuwLKGKIQIVtJJytfweFkd
	aAMnh3CmTIe+KJ40ICIXJ7VhK+nsjR/Y5ZvZu2YUUcLt+Zx
X-Google-Smtp-Source: AGHT+IFXCbUC7OKlJXhiIcyp3/0pEbhIPcVmkwcaoRpLoXztj3Zx0ZDwfLpI5huj43NEMpkp0HP1DS+xrpQFvaRxUT4=
X-Received: by 2002:a05:6512:b19:b0:578:cee7:7aa9 with SMTP id
 2adb3069b0e04-580734f07d9mr498868e87.48.1758613732567; Tue, 23 Sep 2025
 00:48:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250919-rda8810pl-mmc-v1-0-d4f08a05ba4d@mainlining.org>
 <CAMRc=Mc4hO1LDumxAfkB1W6miTJXR1NUVAKBVarkwiF2yGvSLA@mail.gmail.com> <2wwi3ktbcuyp7y7mqplndvawagae5hdhcx3hn375kycoqtows6@xcww2237rxpe>
In-Reply-To: <2wwi3ktbcuyp7y7mqplndvawagae5hdhcx3hn375kycoqtows6@xcww2237rxpe>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 23 Sep 2025 09:48:41 +0200
X-Gm-Features: AS18NWDP_wgtg5ZAo1aJS0Vwp6mqsgj6RBa2BQg1A6VrGdFXcg4GLeRrQ88qOWM
Message-ID: <CAMRc=MdhQMR=-ayz+GfigUMVy+j1QNO3LguMoZYa5_+Es3E5Ow@mail.gmail.com>
Subject: Re: [PATCH 00/10] RDA8810PL SD/MMC support
To: Dang Huynh <dang.huynh@mainlining.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-unisoc@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 23, 2025 at 5:45=E2=80=AFAM Dang Huynh <dang.huynh@mainlining.o=
rg> wrote:
>
> On Mon, Sep 22, 2025 at 04:17:05PM +0200, Bartosz Golaszewski wrote:
> > On Thu, Sep 18, 2025 at 8:49=E2=80=AFPM Dang Huynh via B4 Relay
> > <devnull+dang.huynh.mainlining.org@kernel.org> wrote:
> > >
> > > This patch series aims to add SDMMC driver and various drivers requir=
ed
> > > for SDMMC controller to function.
> > >
> > > This also fixed a bug where all the GPIO switched from INPUT to OUTPU=
T
> > > after the GPIO driver probed or by reading the GPIO debugfs.
> > >
> > > This patch series is a split from [1] to ease the maintainers.
> > >
> >
> > This is still targeting at least 4 subsystems and isn't making the
> > merging any easier. Are there any build-time dependencies here? If
> > not, then split it further into small chunks targeting individual
> > subsystems and the relevant ARM SoC tree.
> The MMC driver depends on both the clock and the DMA driver.
>

But is the dependency a build-time one or does the MMC DT node
reference clocks and the DMA engine by phandle? I assume it's the
latter in which case it's fine for them to go into next separately.

Bart

