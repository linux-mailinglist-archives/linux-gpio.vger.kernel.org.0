Return-Path: <linux-gpio+bounces-21295-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E18EAAD45B5
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 00:10:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ABA5B189B547
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 22:10:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BF432868B5;
	Tue, 10 Jun 2025 22:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MsZJqPCD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7900A2853FA
	for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 22:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749593423; cv=none; b=FTctGFtacN71bQ6RatMLbOg+akWYztCGoLELGf+7NwzRorXSXutU3X4x33+fCiRWm0RuyQT++FT4Jij1kEhfYQdZ/p54foPiPS+Gd4gHE+tbDCNf2Azzeu/kzypHHH2x0mJAnIyGTAHvRVjwQOnns0svArxa7BuN9Vl9NL7mv5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749593423; c=relaxed/simple;
	bh=4NsuCs21FfORtH1DAcJU346wyrSVbDZYpctIUxODfi0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i7w2IPIeeKH6LlLwd8oCMBImFCn8nrEgNitSZFJ1tWx5ICL8kVZWWTxXk7zMRhshOBN6fP/C9NogSPx7jvTk2O1/IGEjetauYcAvLoHXDO5bCJ7zntTQpTAFlQHxR4gG8x0L/GefYpqjF+adTEyGQTggxnx2tPmXMZwca3etd5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MsZJqPCD; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-32adebb15c5so40510391fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 15:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749593419; x=1750198219; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4NsuCs21FfORtH1DAcJU346wyrSVbDZYpctIUxODfi0=;
        b=MsZJqPCDWHYDtofYtQG6eQy/p+YGQdRbc8TYIsRmXnBooRrU9JXaSDAgs2y/oOznPz
         22DT/qCW9UwOxfpjlGGvHOk8dtAQTAjedtIqyRKd9G5KL8r7wd3WpS9sYwAG7DkY1JBd
         ewzM19b44Dguv4A2BMkJKvB336xz4ajAtc/36gKaBZzpQWDqlsuVfDCWoe55d2BtIHLo
         /vvtcOq4Ix7FWucSTCsFDPXWKaaWa4WAYLNqqLpzPd7f1xSkV7bTFRSDkmoDoxGfkJyZ
         pjqHbbRbCMKZIN9yU4rc/wN7FI5MGkt7BkU3NJqkorpotIwk9guOqdK304/hXEOroGXw
         +fqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749593420; x=1750198220;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4NsuCs21FfORtH1DAcJU346wyrSVbDZYpctIUxODfi0=;
        b=SEtI0MvI0uA6jrBdyljf42Ot0ZC0I3MQW3wQWLYrB+5c7xgK7ZUR/QJOrRb20Adsby
         QuMOhWfjXZHZYETwFsFpEyehx2QkRV2imGE+2T1m8H3Irq+IR0WODG1yWgBzxCxquevg
         40su7z1OyYLXkzWAvtWjeF/0GQlDarkOOHCfbmlwRxyr7tKc2sQ/58HSkwkLyOykc/2g
         R7HS1UB+noZh5QKvC93biumMdBzCUCRGcmDTBG2GEZH4GmD7puSbY527rbfnKz5cuCxs
         A4OohDa3FHomAa8xwNET4krtH7Y6sDRouC9C8d7vjLjjxVL9IJqBFGXFzcAHL7/V0xI9
         V77w==
X-Forwarded-Encrypted: i=1; AJvYcCUJZGO8w6P2BH9uc0NZMS/5IlnmSEZfxGZS6tizgcSQpZlqx4Lym1tFkr48lSRoU1VUAOFP/p5+9HUJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzB9cM2Cb0/39SBkCgxgY90VjZdN2BK0DBCajYqvvbw/8voHRUY
	I8F3uSJ9vJpXRf3EbQ6GPZ5xitD/BljZ8172I77ONU0omrM+tfSaKK8GO6P1waq1M04tH1EVZnf
	1Dec472YqsTeYb5uCsfB3EVZzpy/QoiwzYBflPjLARw==
X-Gm-Gg: ASbGncvDUsv2SlIiG8hRy8F434/6yVoOTwPXbSTwc7TUBvBPaWiGRoA7o+dZnyU31R8
	6PjySFoDPVitFpvWsd9Gg7nWejmQ/lwWZL71OqczLXYUpfjOBY6G5kiDysIksxSaTyD3VMPSugy
	hpxlurLDPzphNs/PrytQ97R7FYwW7cL9AehPm0edr1U7Co5Tf1o9St/g==
X-Google-Smtp-Source: AGHT+IFXxwww3rRneN2BUjxLNPNhg4yAnXFXP/2lKFW4OFSo8Ks3J3g+tSHPB6GX39sicVQXDwM/c1CXLqu6v3dqFFk=
X-Received: by 2002:a05:651c:1501:b0:32a:864a:46eb with SMTP id
 38308e7fff4ca-32b21926dc7mr2464121fa.0.1749593419575; Tue, 10 Jun 2025
 15:10:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609-aaeon-up-board-pinctrl-support-v7-0-1ab73ec0cb98@bootlin.com>
 <CACRpkdZpn5xy+6yb-mQd6wDs05X0QqRCQo7QpL6=aEWtyU-zTg@mail.gmail.com> <ddbaa399-6bad-4c97-8456-b597442e5be6@bootlin.com>
In-Reply-To: <ddbaa399-6bad-4c97-8456-b597442e5be6@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 11 Jun 2025 00:10:07 +0200
X-Gm-Features: AX0GCFv2Yttg6_a--xuQp4PbwFHmH30QcrKQqT9QjOj8bCT3ACO4rWmYyV62F-Q
Message-ID: <CACRpkdY-6UeRai7AVO0uA_3JGtGNips5C4GtSFgw0SHky3ozcw@mail.gmail.com>
Subject: Re: [PATCH v7 00/10] Add pinctrl support for the AAEON UP board FPGA
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 2:48=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:
> On 6/10/25 14:42, Linus Walleij wrote:
> > On Mon, Jun 9, 2025 at 11:51=E2=80=AFAM Thomas Richard
> > <thomas.richard@bootlin.com> wrote:
> >
> >> This is the seventh version of this series. Only few changes, the seri=
es has
> >> been rebased on v6.16-rc1, the pinctrl patches were dropped as they we=
re
> >> already merged and a fix was added in upboard_pinctrl_dbg_show() to ha=
ndle
> >> the case upboard_pinctrl_pin_get_mode() returns an error.
> >>
> >> Best Regards,
> >>
> >> Thomas
> >>
> >> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
> >
> > Looks good to me, some testbot was complaining about something
> > but certainly we can merge the majority?
>
> The export.h header file is missing in gpio-aggregator.
> I can send a new version today. Or I can send a fix later.
> What do you prefer ?

Just send a v8, it's always easiest.

Yours,
Linus Walleij

