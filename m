Return-Path: <linux-gpio+bounces-24995-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 430AEB3720E
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 20:19:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B5431BA80A4
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 18:20:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E7902E1C78;
	Tue, 26 Aug 2025 18:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ydmJeZUw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB0D2F28E3
	for <linux-gpio@vger.kernel.org>; Tue, 26 Aug 2025 18:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756232391; cv=none; b=HXn27Mw57nyRoJPRD08HkFY1mk1nyEMHX01sW73GB8QFkvQ8TAA3EJamJiW6AXRyL928Isgbu27ORb8+WEAlZ87yDpW6dojYaWKrji/JXRnXx3yN8Whq3hp9h2AfMvShcP7A6eIlNzLE3y8JL+3khmVFlmuFVv9xYLRSis4sXCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756232391; c=relaxed/simple;
	bh=XQz/VrYK3cwCtAlJzmwCDIZSeNenI6Rm8ZKZbd4vuEk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GX2AUmGtVrNSUEJWXy7qRQtmPdr/y/7UOrG6aWiz9rYQ20szC88z3+LdKUowXRLWyTEPydIbhvuMwmZJaog7lzEHQ29VDgGQRyE74ZEbC87yYiQ2cicvwhdnsHNDNLQG2aslzRS3dqS4QqocYTjWEeIpZd99Fmh9IjVKqKgvupM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ydmJeZUw; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-55f48d62057so2291894e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 26 Aug 2025 11:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756232388; x=1756837188; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XQz/VrYK3cwCtAlJzmwCDIZSeNenI6Rm8ZKZbd4vuEk=;
        b=ydmJeZUwk65YNZNu/QlcHmZJjyvB7rwhDCI8hO9AxkeyxmXy4LrXAuRaLxz75GF+y2
         +7b6//9ACJiy0CI2AMoXV8k3QgqLL5qA5uzGncNdN6kQMoV8l7oSRBq99YgDUUMGumz0
         7RhwTtN2Wr6CfDOq2FH9ZUF2cxxh2JOwTuT60ddjMgBxtQAAi4QJGYUrPhP+im0IFdLn
         wFhte6LTGGCQbSw1cTM4vKJRS8OgEGZwWUW7cH76qKeioOx0sUbXzsijBsQV5efTmC7p
         wQJo+Lp1oW5heIE7m7jxqGga2PB3xOBumQf+HlFN9E/rDnACXY6nhsKLwCTWq8BuSSeN
         B/cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756232388; x=1756837188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XQz/VrYK3cwCtAlJzmwCDIZSeNenI6Rm8ZKZbd4vuEk=;
        b=xFj2xn3QOViARFU6iGgiRtdGv/6o1GJha3gRdG1AdGVzm7Oq17MWGBpXKEA6wf3DmN
         973Kyuc3c8xB637cZJNS7Jy73dJ7trRdap7XcbuvkmywWavbQs5EWXuaQ0JLoBKsWtHw
         OL6p2OpepxN5b/a/H3IOK/lMoWh55R5H9CpEfqu87aH7u/Xk+lymTZu889tSEdbfmzKJ
         nc6rqYExE1PnUfbKf/eawuL/RaaQ3p4LcUxfyhP2f4AY0wjiwheXjVnwA7kKqh45OEI+
         8Y9kNlc+Aa+HI8UZvZ4gfqFIfPWDh8C1EzTvDjZTVj52vvBAZAvSWlV8lBGKjgDMfG9z
         e5IQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8Kcd+7+fD44V86PpiU/T9hQNCQEpgDN8TBaE4j22dSKJRcmZI2opR3NuWmNsEa6A5YvbzRekApENA@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4GgXBDiuS0ffWZh6rYyQ5cLMPxrVtMJOU5v3tYyHqex0xGc5V
	NLBYBKxF6EaFWZrtizRP26lJirQAg5A+buTl2UmLQr6gYRXA2LFXPTHUEoYNhLOZmzPB9+SnkTo
	RH8FOIvUci5TrqHzgzDc983JAR9dy5AN0/+bFHgavTA==
X-Gm-Gg: ASbGnctQu5NFNnQLv9JYjsSq82vPb1HFpPjLLDOJhJ1tdp6AJFy58jknU9NBsm/zCG/
	bw8xQoYO2ieGfZd4zMx2YuLCUzodUAfKfjL4G32miNQ0FQUFCTEwoLhRrZHKv2WmwysGZFvsaOA
	1/ghLp4qv/wo5RPVHQ5wic4Y4EucXevXo7Sepo871dseORlK4i0D7TPWMX3I+PvevzCjt8fRC5M
	YunygF4rQFBk7iByZqtbXHnSeuNAe4UHxzUXpqnb0pCoaATD3wqh1OzO3k5
X-Google-Smtp-Source: AGHT+IH9/wDD1C5c1pzIo5M6703fhe2Ju79J3Cg57MCbuHB+kMzD9Ry2MpuHtwyxY9EgNTzhw0WfnDm8emGE0JQOveU=
X-Received: by 2002:a05:6512:3d87:b0:55f:3d7c:387b with SMTP id
 2adb3069b0e04-55f3d7c3badmr3365498e87.12.1756232388100; Tue, 26 Aug 2025
 11:19:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
 <CACRpkdaDGmdhaik+1saRv7Ts4myQ+tg1aQqGU3xQyT7ma8dJFw@mail.gmail.com>
 <CAHp75VephepLq61HrVy=PX2oKUQd5NK2qS-vOC5h_NR65td3Uw@mail.gmail.com>
 <CACRpkda4soRCLF5=W=6R4wnwT3pjk743j022XfJxjTTQzuarAA@mail.gmail.com> <534ad082-08fa-42c0-9c24-f0c11af7d5b2@sirena.org.uk>
In-Reply-To: <534ad082-08fa-42c0-9c24-f0c11af7d5b2@sirena.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 26 Aug 2025 20:19:37 +0200
X-Gm-Features: Ac12FXxAYIw0w_2T1YaN-IyY2JYcpKwwddZS_ZNL3wGJGwAsl60-M2w6oLQOL30
Message-ID: <CAMRc=Mdn0_yPXyYq4sbvH4P9-h71vEc4arLPBfSk1PiEFaB7jQ@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] pinctrl: introduce the concept of a GPIO pin
 function category
To: Mark Brown <broonie@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 20, 2025 at 8:41=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Wed, Aug 20, 2025 at 09:12:49AM +0200, Linus Walleij wrote:
>
> > The qualcomm 32bit platforms fail in next anyway so I dropped the patch=
es
> > for now.
>
> FWIW the i.MX8MP also seems to have been broken by this:
>

I can't test it unfortunately - would you mind sharing some info on
what's failing exactly?

Bartosz

