Return-Path: <linux-gpio+bounces-15105-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03090A233EB
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jan 2025 19:40:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F03413A385C
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jan 2025 18:40:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A2C01F03D7;
	Thu, 30 Jan 2025 18:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="P2d14isu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E07B1487E1
	for <linux-gpio@vger.kernel.org>; Thu, 30 Jan 2025 18:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738262431; cv=none; b=KCEGLC2nDYhpWnwEZ5D3KYSIMTy1zu+cIba/y0nvYRzjcEGhoOhRgk0VmXKy3XOTS7yPcruxMtCwu8AnAQZD6hGxAyyxEduDRuDovFQQ2J0C99OEBiS/8GLIuNbUxy5MVvnjuxv/lEcDjPF3coC2SvC8xnpaGsAGzuVKGWaG30w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738262431; c=relaxed/simple;
	bh=PZGkakFNco4kbSBjz1opxRPk8R7MLaQEpY8TCV6WYk8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T4HKyLSNKWPwxt08ojo2k+z2ZdAiKMvSPTtCHm6KV+bIbbmO4y0YhMNCs8CyHY1kod2izO95MD8RPiLkZziZvpzjqubkLd26lJDY1v/GMpBuoC/weIVFcgcKyu3xrr4R4wydJYXjFj1+Z4gQiqekFOxHT29AMY4IcvWfxz8UEl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=P2d14isu; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53f22fd6832so1254326e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 30 Jan 2025 10:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738262427; x=1738867227; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PZGkakFNco4kbSBjz1opxRPk8R7MLaQEpY8TCV6WYk8=;
        b=P2d14isuB/UpS1h0JVpov8wUPkxiHqsBn7NOfpqfF6i0ksAR2P1b//+Jz8ug1DTjND
         L8oIsZ/gBOuNcclS0f2e3de2FWsjMd4JlNlRkQ7cPBqoHtM8tGGVUBlfCIy17Fi3Y397
         I9oL9BgPSh72WtpGWEv6oeMmKA5RCzezM+MkvlYXED6yjV4tLV/A5CD1vDvzJ/iqjDvy
         dAetuwoyA28ByAbO6rlmZE4AMsSneSEi3T44GPITaQopDHIaQQarqLbpzFvrJ39KPjzc
         r+3kbr5YzhIHsKvpbhxggswjo9p2y1/9KEm03UCJcfNW5sM9b2kVQzHB7M/wzDWVUF1y
         M6MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738262427; x=1738867227;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PZGkakFNco4kbSBjz1opxRPk8R7MLaQEpY8TCV6WYk8=;
        b=CZz95y4nDWiqI9JKRBoJ4dfuQVGAxZAg8pThWx6ESEEa329yGUDVPkb1Zo3EEHURKl
         1nwH5OGqoBxkcto6rBfyRoU0dxlb9O+w+87lMyFjGvFzdYHaEzUkgCMp0lAtAgbDb2uO
         rjgIHtjO/AHvTqMWL4tn0tII1myBKTwHbDEX+kqr4/mXl74VLetHUhKjRaikrb38OrP0
         qYGDmH2E2W0cNsPHaVAIAQIqzvIw7cRuXQkg53gvJlasSFuRuALXO44j+noeCf6uTtv9
         NUu+jMd1JPwOTPsWkSa3hRCC67eb/jgRhpuCHmaWpiVnzUWvoXGwX2Z1L2UWSSCZnP1t
         CGvA==
X-Gm-Message-State: AOJu0YybF2Jtwi5EOAspZNk4BaIZqBShSz4zLv1SjeBGTE/OF8u6uema
	f4UFTqRPPczjtdP0c8aD1HGueRQsg4rOT0psqfXlFl7MhuIFmcmCyvKFseqe7vft5j2aLrvbwvd
	wjpTSumIXN8nQp6FSP+OyAmVbQDrRif22SfwPhOX8vtmoGZYz
X-Gm-Gg: ASbGnctxBacGJhXtOF4uT9ATgIcbuzG1nvpovOMfWyJNT7bbDUTCMtL0HVYz+xCZKoz
	Fjjo/dOY9vlamxf8bsKBqGtsZC+9tgx+sh9ixKeAXLXcQZeJe731pTEli+fj4j9Z1PJFYKiwje8
	WePgb1nDLNqVsrWe6JBKwoskst65ue
X-Google-Smtp-Source: AGHT+IGTxA9Lst4wTIFbwdnHGpnqqupbNJQuRozQiYPZiFE1ggaSkErWWKv0+xtu4qHAe68MDpH55DgfT9AWtcrExiI=
X-Received: by 2002:ac2:4e45:0:b0:542:2e04:edc5 with SMTP id
 2adb3069b0e04-543e4ba6c02mr2187230e87.0.1738262427290; Thu, 30 Jan 2025
 10:40:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129155525.663780-1-koichiro.den@canonical.com>
 <CAMRc=Mdim2aSBs+JsL8dECfG0Vvrvcq6CHaGHbBoVhNhSZn9Kg@mail.gmail.com> <2kz6mz6nglozgrwudkgziles4wievwfkkl2oo7qyvosirchjuw@y3wfna5dsekv>
In-Reply-To: <2kz6mz6nglozgrwudkgziles4wievwfkkl2oo7qyvosirchjuw@y3wfna5dsekv>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 30 Jan 2025 19:40:16 +0100
X-Gm-Features: AWEUYZnj93d-FrMXvMxOaT44mXfI_4z33u8XVZrqCy6OvCJmKQ4xghRlKCNsUtU
Message-ID: <CAMRc=Mc3qBXaATpYRAXeHne0+mBjErivjvUe4rBEj2ksansatQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] Introduce configfs-based interface for gpio-aggregator
To: Koichiro Den <koichiro.den@canonical.com>
Cc: linux-gpio@vger.kernel.org, geert+renesas@glider.be, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 30, 2025 at 5:04=E2=80=AFPM Koichiro Den <koichiro.den@canonica=
l.com> wrote:
>
> On Thu, Jan 30, 2025 at 11:30:59AM GMT, Bartosz Golaszewski wrote:
> >
> > 3. I don't think the user should need to specify the number of lines
> > to aggregate. That information should be automatically inferred from
> > the number of lineX attributes they created instead. [...]
>
> I agree that it's essentially unnecessary, but considering the current
> state of gpio-sim's configfs, having the user set num_lines doesn't seem
> too unnatural to me. What do you think?
>

No, this is completely different. We cannot figure out how many lines
the user wants gpio-sim to have without explicitly providing that
information over the num_lines attribute. For the aggregator, we know
exactly how many lines the user wants - it's determined by the number
of line groups. We can simply wait for the live attribute to be set to
1 and then count them. While at it: there's no reason to impose a
naming convention of lineX, lineY etc., the names don't matter for the
aggregator setup (unlike gpio-sim where they indicate the offset of
the line they concern).

Bart

