Return-Path: <linux-gpio+bounces-24776-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCC5B30A8D
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 03:00:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7A4716B9F1
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 01:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5F897E105;
	Fri, 22 Aug 2025 01:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K5n3vX2k"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5778116FF44;
	Fri, 22 Aug 2025 01:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755824409; cv=none; b=Lw6R7uRxYIrtunkZR/n/SGvyBVEQvcqZLr3fkBDf6/0buDOx0WX8hJ4P6QuRo943DDyyjhAq8SQZ+UIwuUryeU7VJXqb23EF6loHwkRdKo1EDP/V9GrRDmJomcCu8Xapx7iQByU/NCqcilVFAt9M/KWhRlFi/5j4NcP5oyO7U1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755824409; c=relaxed/simple;
	bh=4QmFQZAQMP9vjeQfF2ag3DS7K0Vr+TO1FEWXKv49hsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t7mhXk/kVxbhWhWvbS6Gq5Gs9ovybv++75ng1WaR9EG562KV8h+4QArtt1CPdRSZ92/i/sfFCNsDTl6h2kDlFEX8h9gkerU3eQxK7aX1fgP4Y06ERepqkOrgOZUGMfOXpEaPHOc5lSRWdxj7WkqX5xqWCHfdAH3YZuNi0mV6q0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K5n3vX2k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56C94C4CEEB;
	Fri, 22 Aug 2025 01:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755824408;
	bh=4QmFQZAQMP9vjeQfF2ag3DS7K0Vr+TO1FEWXKv49hsg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K5n3vX2kKdXYsM6H4LntwNJBFr3fTqnd/DUqFsHz4vzoqLSJx8ZT2rLZxBG7tfHJV
	 4SgDJx4Xg4bXP34oG2B/yAOJyI2VlyI1sDIwuc5MiwRbqcWyXj7ILfscAL/uD4xc5l
	 Rxoy7sr9klsTvEujwdMusk4vIcbUsXsYgIUwWgAu7caER1kZn9KRXkrvmQfoRvUiE6
	 K5BqeIszZZYvHIYbUdEpkw9y1PoOBxr2eXTNzlVTRkCrFpoX9yEYKlZSdgGwuTD8KT
	 KyG5llxpbxDJCDF07DoaEDjg7wR+W5MS2D8m8SoBx4CFi9lCUQbwusKTuSQ0gpm/vl
	 XBFBSDO/Oq37Q==
Date: Fri, 22 Aug 2025 08:42:51 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Michael =?utf-8?B?QsO8c2No?= <mb@bues.ch>,
	Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Michael Buesch <m@bues.ch>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Andy Shevchenko <andy@kernel.org>, Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kevin Hilman <khilman@kernel.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
	linux@ew.tq-group.com
Subject: Re: [PATCH 01/16] gpio: dwapb: Use modern PM macros
Message-ID: <aKe9C50Q3uHbdI4Y@xhacker>
References: <20250820154037.22228-1-jszhang@kernel.org>
 <20250820154037.22228-2-jszhang@kernel.org>
 <CAHp75VfxSBPzvohrW4tywd4VS0r1_mp8WLvdKcN_yn=zNS49HQ@mail.gmail.com>
 <20250820191039.4f8af41e@barney>
 <CAHp75Vdpgf3DUMQw0mYqhG=9UrYG8KWrobbd387QZapBor_LHg@mail.gmail.com>
 <aKdNBhpNofchexgb@xhacker>
 <CAHp75VfG3mZsBMTeg0nwDJV2PKG=M+UAst4fy05oh+Df4YGL8Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VfG3mZsBMTeg0nwDJV2PKG=M+UAst4fy05oh+Df4YGL8Q@mail.gmail.com>

On Thu, Aug 21, 2025 at 10:32:01PM +0300, Andy Shevchenko wrote:
> On Thu, Aug 21, 2025 at 8:02 PM Jisheng Zhang <jszhang@kernel.org> wrote:
> > On Wed, Aug 20, 2025 at 10:04:39PM +0300, Andy Shevchenko wrote:
> > > On Wed, Aug 20, 2025 at 8:11 PM Michael Büsch <mb@bues.ch> wrote:
> > > > On Wed, 20 Aug 2025 19:54:44 +0300
> > > > Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > >
> > > > > > The dwapb_context structure is always embedded into struct
> > > > > > dwapb_gpio_port to simplify code. Sure this brings a tiny 36 bytes
> > > > > > data overhead for !CONFIG_PM_SLEP.
> > > > >
> > > > > I don't think it's a good approach to add a lot of data for peanuts in
> > > > > case of PM_SLEEP=n.
> > > >
> > > > It wastes 36 bytes in case of PM=n.
> > >
> > > ...per port.
> > >
> > > > The driver currently allocates the struct with kzalloc and stores a pointer to it
> > > > in case of PM=y.
> > > > So this probably has an overhead in the same order of magnitude (pointer +
> > > > malloc overhead/alignment/fragmentation) in case of PM=y now.
> > >
> > > ...per driver.
> >
> > Before the patch, struct dwapb_context *ctx is also per port.
> 
> OK. So the comparison is 4 or 8 bytes per port vs. 36 bytes per port, correct?

yep, I think so
> 
> > > So, I can't say it's equal, but I leave this to maintainers to decide,
> >
> > What in my mind now: this is linux rather than RTOS. After greping the
> > the arm/arm64/riscv dts dir, the max port number is 6, the berlin2q
> > soc families, so this means current we have wasted 216 bytes memory which
> > is trivial compared to the system memory.
> 
> Maybe, but this should be clarified in the commit message. And again,
> I have no strong objection on this part, but it needs to be described
> accurately at bare minimum.

Good idea, will do in v2.

> 
> -- 
> With Best Regards,
> Andy Shevchenko

