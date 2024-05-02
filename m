Return-Path: <linux-gpio+bounces-6020-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD9A8BA0F7
	for <lists+linux-gpio@lfdr.de>; Thu,  2 May 2024 21:18:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24B781F21A48
	for <lists+linux-gpio@lfdr.de>; Thu,  2 May 2024 19:18:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 208971802DE;
	Thu,  2 May 2024 19:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ls+w7PgV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6EFB1802C4;
	Thu,  2 May 2024 19:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714677490; cv=none; b=dstQCpBVNWjkjAaGW9hxp/4V0qtHswturPsLUfft3OZcICn5SiyoORtmdPecrDKxCQLpVhLZRybuIbqhWO1rZT4mLBXk5SunaYmstGCSOqOYma/upj9URorAcT3pFjpdrfLpwsNTxd+PDjCH10ZdewSQHb629ahQ34m4k80XWB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714677490; c=relaxed/simple;
	bh=Bj+t0AdjBVlyZdsBZs795GEUaaspp2VKMjkniD4EGyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dTr1f+/SJf2mDA5+Hrd5GcUkJAa2eRkpJASAAQ1Ir0bfItXxRc2IbjpXILIgdQT4ffVg1kB2IxKvE9t4Pl+eTz6w5P7j39U13od5wuKDqgnEdZjtGkhXx6vxw1DweQiDa1FQsLIvdNYXr7dliDBwWH25ujQWsegQGvyzoXoqfx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ls+w7PgV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17504C116B1;
	Thu,  2 May 2024 19:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714677489;
	bh=Bj+t0AdjBVlyZdsBZs795GEUaaspp2VKMjkniD4EGyY=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=Ls+w7PgVr94EfVxfGrIBd6HoaNLgL6eC0xhhGpV+3IrddDBjZXUmenNAsk4oazOwf
	 GQ8ym3cmwFi6NYdwSG2WSA+vD0xPBdOly1myGgQjKKMR5AuvXimYZNo0PG1NRRJvG7
	 3SB73CWSFicwPm+9E9en7Mtnt/hFGG6AX2Q032yUpAzDsSf+xhqXwbfIpqMNkNxIBv
	 0Rake2Nk9iZ7QOpZcou03ihzIo8VpKnzUq94G6uSRhK3HGMQ0AVsq/VYiHB/BEkRiW
	 KAQCMVeLML7DYiFk+tuNZJrU9Uy4Ws2sA5FB9vLf1Lm1mlFeD9rM86nHvn1Ew3MGOa
	 kkd6Axq2cZdGw==
Date: Thu, 2 May 2024 21:17:56 +0200
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v8 2/9] platform: cznic: Add preliminary support for
 Turris Omnia MCU
Message-ID: <20240502191756.ynwmp74yybat57my@kandell>
References: <20240430115111.3453-1-kabel@kernel.org>
 <20240430115111.3453-3-kabel@kernel.org>
 <CAHp75VcgfvyZ9rcNev9CpQEN3CkUVozEkv+ycaQggPbE4tx+1Q@mail.gmail.com>
 <20240430160507.45f1f098@dellmb>
 <ZjELmaD3aQEuEa5K@smile.fi.intel.com>
 <20240502184005.fsdbwrbzmv5gshxh@kandell>
 <CAHp75VfktKyGUNBz18TUQknF-5YZDOTgh2WLJhTs-_Ay-wgQoA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VfktKyGUNBz18TUQknF-5YZDOTgh2WLJhTs-_Ay-wgQoA@mail.gmail.com>

On Thu, May 02, 2024 at 09:47:25PM +0300, Andy Shevchenko wrote:
> On Thu, May 2, 2024 at 9:40 PM Marek Behún <kabel@kernel.org> wrote:
> > On Tue, Apr 30, 2024 at 06:17:45PM +0300, Andy Shevchenko wrote:
> > > On Tue, Apr 30, 2024 at 04:05:07PM +0200, Marek Behún wrote:
> > > > On Tue, 30 Apr 2024 15:53:51 +0300
> > > > Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > > > On Tue, Apr 30, 2024 at 2:51 PM Marek Behún <kabel@kernel.org> wrote:
> 
> ...
> 
> > > > > > +static int omnia_get_version_hash(struct omnia_mcu *mcu, bool bootloader,
> > > > > > +                                 u8 version[static OMNIA_FW_VERSION_HEX_LEN])
> > > > >
> > > > > Interesting format of the last parameter. Does it make any difference
> > > > > to the compiler if you use u8 *version?
> > > >
> > > > The compiler will warn if an array with not enough space is passed as
> > > > argument.
> > >
> > > Really?
> >
> > Indeed:
> >
> >   extern void a(char *x);
> >
> >   static void b(char x[static 10]) {
> >       a(x);
> >   }
> >
> >   void c(void) {
> >       char x[5] = "abcd";
> 
> >       b(x);
> 
> It's not the example I was talking about. Here should be a(x).

Somehow I got lost. Let's return to my function, where I have
  int omnia_get_version_hash(..., u8 version[static 40]);

and then I use this function:

  u8 version[40];
  omnia_get_version_hash(..., version);

If somehow I made a mistake and declared the version array shorter:
  u8 version[20];
  omnia_get_version_hash(..., version);
I would get a warning.

So the purpose is to get warned if the compiler can prove that there is
not enough space in the destination buffer.

Marek

