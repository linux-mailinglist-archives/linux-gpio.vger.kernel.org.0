Return-Path: <linux-gpio+bounces-5018-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1354D895A3C
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Apr 2024 18:54:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4470D1C22705
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Apr 2024 16:54:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0258B15A4B6;
	Tue,  2 Apr 2024 16:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nic.cz header.i=@nic.cz header.b="wAajVCPs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.nic.cz (mail.nic.cz [217.31.204.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8CC14B09C;
	Tue,  2 Apr 2024 16:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.31.204.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712076709; cv=none; b=c8/JnonePhUaskJBp9T7+zw0RbGLNzFqmCV4Ga/joWIug4wiUg47qAM3FGlMBTBiM6TLaLjbJk7chfcciO7P5pGOtSPcfaQsoRTs7cXtUxjJFkCaJ5YNJ3EQlx4Jr7U+LWw+6u/I01oRy8NqxxQDfANUJvbWzUVKyFgEY2Ionh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712076709; c=relaxed/simple;
	bh=KsHqIU03sKEpvUMS47A78uuJhzarHCzHfAicczh24Rw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NM75azOXITPamcLUJa+R8HbgqB08Ocy8ZOQnafjDPBWpDx4bf76QxaGZ6e0fkxVoOvw7+pF1u6axsU/RVVIH/E8qAjascSBB+Z0p0AnnGFwYKaKqzYtyfPQITuhZj5w2HMgx+abO6HRn1PYGZLrZcW4KU1yBYoVLGt2483KKGCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nic.cz; spf=pass smtp.mailfrom=nic.cz; dkim=pass (1024-bit key) header.d=nic.cz header.i=@nic.cz header.b=wAajVCPs; arc=none smtp.client-ip=217.31.204.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nic.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nic.cz
Received: from kandell (unknown [172.20.6.80])
	by mail.nic.cz (Postfix) with ESMTPS id AEC1A1C184F;
	Tue,  2 Apr 2024 18:41:59 +0200 (CEST)
Authentication-Results: mail.nic.cz;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
	t=1712076119; bh=KsHqIU03sKEpvUMS47A78uuJhzarHCzHfAicczh24Rw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From:Reply-To:
	 Subject:To:Cc;
	b=wAajVCPskhVE6QjgewseYXgMvfXy+nAr9nqIxZzBmCGOJ1MHz0qbE0w/Gu1bYzNJz
	 kneTVuNk4xUrIOF/IBR4mWDIZnwxbAQ6hQ177SkR37jGIKtvE9tUwGLBvuGs8OhhL8
	 7JqkMAm8d2CkkCGSUooowNcfWay3yzVdhSbpXCv4=
Date: Tue, 2 Apr 2024 18:41:59 +0200
From: Marek =?utf-8?B?QmVow7pu?= <marek.behun@nic.cz>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Gregory CLEMENT <gregory.clement@bootlin.com>, soc@kernel.org,
	arm@kernel.org, Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v5 02/11] platform: cznic: Add preliminary support for
 Turris Omnia MCU
Message-ID: <20240402164159.ylu3gy4pwrbxqoeb@kandell>
References: <20240323164359.21642-1-kabel@kernel.org>
 <20240323164359.21642-3-kabel@kernel.org>
 <ZgAII1B03bLUisWr@surfacebook.localdomain>
 <20240324160408.77c8574e@thinkpad>
 <CAHp75VesxrOdm4H3TYUtfEJx=i3Zpd6a=yzbkUFismnzW=nE-g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VesxrOdm4H3TYUtfEJx=i3Zpd6a=yzbkUFismnzW=nE-g@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.103.10 at mail
X-Virus-Status: Clean
X-Rspamd-Action: no action
X-Rspamd-Pre-Result: action=no action;
	module=multimap;
	Matched map: WHITELISTED_IP
X-Rspamd-Server: mail
X-Spamd-Bar: /
X-Rspamd-Queue-Id: AEC1A1C184F
X-Spamd-Result: default: False [-0.10 / 20.00];
	MIME_GOOD(-0.10)[text/plain];
	WHITELISTED_IP(0.00)[172.20.6.80];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com]

On Sun, Mar 24, 2024 at 05:30:39PM +0200, Andy Shevchenko wrote:
> On Sun, Mar 24, 2024 at 5:04 PM Marek Behún <kabel@kernel.org> wrote:
> >
> > Hi Andy,
> >
> > thank you very much for the review. I have some notes and some
> > questions, see below.
> 
> Btw, I'll look into other patches next week.

Hello Andy,

did you have a chance to look at the other patches?

Marek

