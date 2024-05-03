Return-Path: <linux-gpio+bounces-6025-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 625B48BA73B
	for <lists+linux-gpio@lfdr.de>; Fri,  3 May 2024 08:51:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E729B1F2230A
	for <lists+linux-gpio@lfdr.de>; Fri,  3 May 2024 06:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CE0D14658F;
	Fri,  3 May 2024 06:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D2JqoKOi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3576857CA8;
	Fri,  3 May 2024 06:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714719113; cv=none; b=LexDiu0kNeBOI5PmEtrsV9xloBYsHfK7Z8Z+tAO5C8yTAm7KrX1AQtlFEB7iPD3wsNMupDKc4RmWtA7Vlpl51cpSmPWykgRz8JXW4ssNKY2FVYRLH1Oos/NNOG9OxJUa13BWKFZ/c/ggh0abIt5mQO836ay/qYrs1PoJmsu6RNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714719113; c=relaxed/simple;
	bh=wT02tiM4wXh96p/92paNbLUWSCzZQvWt8NNAabXOQNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NMOYuHN4A/tkuuu9XaqTXA4Vcu437VWOEA+n+yYxhq38GyKwFCgohiI5nShqL5ffsX6Oh7bApU3dSk7NoHOggf9pL/xLJrsX51Dk0EsiOh8HNAGA22HqTOsVI8ZkX+I0KYvcgDe236WnzoEN4WBPh6omCMnKZ5wwJKJJ58ChFys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D2JqoKOi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0AB5C116B1;
	Fri,  3 May 2024 06:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714719112;
	bh=wT02tiM4wXh96p/92paNbLUWSCzZQvWt8NNAabXOQNQ=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=D2JqoKOid/E7ElVPPALhAw5Rt+fgl6zYg73kWZfbf5bELCPTjSyrahQaNKBX31fJ0
	 EJIxD878l9/a9F3JtE2e7gyt1k0AmRAL+9V999XLGEPfPRiWZSAc1ytp5FdIXl+eGJ
	 0QEmHGJw/u+2G+XpwUaqWIx2qkfW5U0dDt0nIIzBwyMw3Hr67nqTE6kAFizMrGSkii
	 4sLiWNyoH75e/vD180aXkKq0pcPNmzmD3ZiQvgindgDHn8DbyUVxpRksfYj7PzGyV1
	 pYcTQIU+m0pW/ag3hQCCkoJK4l01lBrwR36/y/VxMF8Z/6fgZM9NXjy4wFVhf+n3ws
	 hxExaDEtLUoag==
Date: Fri, 3 May 2024 08:51:32 +0200
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
Message-ID: <20240503065132.f3tellvhidjly4pf@kandell>
References: <20240430115111.3453-1-kabel@kernel.org>
 <20240430115111.3453-3-kabel@kernel.org>
 <CAHp75VcgfvyZ9rcNev9CpQEN3CkUVozEkv+ycaQggPbE4tx+1Q@mail.gmail.com>
 <20240430160507.45f1f098@dellmb>
 <ZjELmaD3aQEuEa5K@smile.fi.intel.com>
 <20240502184005.fsdbwrbzmv5gshxh@kandell>
 <CAHp75VfktKyGUNBz18TUQknF-5YZDOTgh2WLJhTs-_Ay-wgQoA@mail.gmail.com>
 <20240502191756.ynwmp74yybat57my@kandell>
 <CAHp75VcNDv=it_H8xt2p2J63UEqBpX_9qO3LxvQ3V_ZP0eStug@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VcNDv=it_H8xt2p2J63UEqBpX_9qO3LxvQ3V_ZP0eStug@mail.gmail.com>

On Fri, May 03, 2024 at 06:59:20AM +0300, Andy Shevchenko wrote:
> On Thu, May 2, 2024 at 10:18 PM Marek Behún <kabel@kernel.org> wrote:
> > On Thu, May 02, 2024 at 09:47:25PM +0300, Andy Shevchenko wrote:
> > > On Thu, May 2, 2024 at 9:40 PM Marek Behún <kabel@kernel.org> wrote:
> > > > On Tue, Apr 30, 2024 at 06:17:45PM +0300, Andy Shevchenko wrote:
> > > > > On Tue, Apr 30, 2024 at 04:05:07PM +0200, Marek Behún wrote:
> > > > > > On Tue, 30 Apr 2024 15:53:51 +0300
> > > > > > Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > > > > > On Tue, Apr 30, 2024 at 2:51 PM Marek Behún <kabel@kernel.org> wrote:
> 
> ...
> 
> > > > > > > > +static int omnia_get_version_hash(struct omnia_mcu *mcu, bool bootloader,
> > > > > > > > +                                 u8 version[static OMNIA_FW_VERSION_HEX_LEN])
> > > > > > >
> > > > > > > Interesting format of the last parameter. Does it make any difference
> > > > > > > to the compiler if you use u8 *version?
> > > > > >
> > > > > > The compiler will warn if an array with not enough space is passed as
> > > > > > argument.
> > > > >
> > > > > Really?
> > > >
> > > > Indeed:
> > > >
> > > >   extern void a(char *x);
> > > >
> > > >   static void b(char x[static 10]) {
> > > >       a(x);
> > > >   }
> > > >
> > > >   void c(void) {
> > > >       char x[5] = "abcd";
> > >
> > > >       b(x);
> > >
> > > It's not the example I was talking about. Here should be a(x).
> >
> > Somehow I got lost. Let's return to my function, where I have
> >   int omnia_get_version_hash(..., u8 version[static 40]);
> >
> > and then I use this function:
> >
> >   u8 version[40];
> >   omnia_get_version_hash(..., version);
> >
> > If somehow I made a mistake and declared the version array shorter:
> >   u8 version[20];
> >   omnia_get_version_hash(..., version);
> > I would get a warning.
> 
> Yes. Would you get the same warning if you replace the parameter to a pointer?

If you mean instead of declaring
  u8 version[20];
if I did
  u8 *version;
  omnia_get_version_hash(..., version);
then I will get a different warning:
  version is used uninitialized

And if you mean that instead of the
  char version[static 40]
in the argument list of the function I used
  char *version,
then no, GCC spits no warning.

Marek

