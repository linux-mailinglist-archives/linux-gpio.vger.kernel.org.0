Return-Path: <linux-gpio+bounces-13821-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 751CC9EE92D
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 15:43:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DCBC616152F
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 14:42:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89FED222D68;
	Thu, 12 Dec 2024 14:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="G2Brxfjp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE5D1D31A9;
	Thu, 12 Dec 2024 14:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734014401; cv=none; b=CEt1QTWG5T8Rd7A7et2D9y3uq3FD1wUUpdVGitEoth7yCopz1OlydtsLubqjwNoJof8Y+ijd5lbnky+yspo1cVzQfuhbcnn/4vxXdkyuETC5V8lRJAnvcx0GpwKuzUj7aPwjemhPErXTt0zHmU7nSstTpI6mc5ytIahyYE9wIDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734014401; c=relaxed/simple;
	bh=QqZueLPfTU0wpJXpITFDGRkQSvrbkHrFCfyn9LAYOok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DXHfFpUybaqAqSPgMvUALrvAzzaytLtGR2Ixd7tqaBWcNerNcB6r+ZzIbCZUrZivOVyllqzABVdIwUpkJfXswYPZZOTjXj5YapNaDVHw99fSeFFlv/weDQOjHuRaLRPA5L2jub9v4nKRTCkhhyeHN+IqtSXPY77i2HIbVCkSgf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=G2Brxfjp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA824C4CECE;
	Thu, 12 Dec 2024 14:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1734014400;
	bh=QqZueLPfTU0wpJXpITFDGRkQSvrbkHrFCfyn9LAYOok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G2Brxfjp+F0H/6i8ldoC79A4N+tiR7F7lsfJfW9e/IkXnDRbVbJIFgAbpBtAzRaBO
	 WWKW9fn8jog9KnCI7UJK1A4naF5wLD7DstY4yK2sxizCJIlGJmya4CTWxfQ2r0/eGF
	 YHNCpF9j85P6i6mZuhcLbBnnJQgT7KC4LBmjAHEw=
Date: Thu, 12 Dec 2024 15:39:57 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	mika.westerberg@linux.intel.com, dmitry.torokhov@gmail.com,
	broonie@kernel.org, pierre-louis.bossart@linux.dev,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 0/6] Introduce devm_kmemdup_array() helper
Message-ID: <2024121242-saturday-aqua-9ac6@gregkh>
References: <20241126172240.6044-1-raag.jadav@intel.com>
 <CACRpkdZqdE8gQCre=zR2cN17oKfwBSnWuVwzQsbRO7-ENVnPNg@mail.gmail.com>
 <Z0nNnsmYIil0OZpy@smile.fi.intel.com>
 <Z1Rfuo3jq7rO0cqb@black.fi.intel.com>
 <Z1r0EPC9gumruFKU@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z1r0EPC9gumruFKU@smile.fi.intel.com>

On Thu, Dec 12, 2024 at 04:32:48PM +0200, Andy Shevchenko wrote:
> On Sat, Dec 07, 2024 at 04:46:18PM +0200, Raag Jadav wrote:
> > On Fri, Nov 29, 2024 at 04:20:14PM +0200, Andy Shevchenko wrote:
> > > On Fri, Nov 29, 2024 at 11:17:02AM +0100, Linus Walleij wrote:
> > > > On Tue, Nov 26, 2024 at 6:22 PM Raag Jadav <raag.jadav@intel.com> wrote:
> > > > 
> > > > > This series introduces a more robust and cleaner devm_kmemdup_array()
> > > > > helper and uses it across drivers.
> > > > 
> > > > For the series:
> > > > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > > > 
> > > > It seems like Andy will push it to me which is excellent.
> > > 
> > > Yep, that's the plan after we get all necessary ACKs.
> > 
> > Greg, anything I can do to move this forward?
> 
> Greg, is it possible to give your Ack or comment or guidance of the preferences
> with the first patch?

$ mdfrm -c ~/mail/todo/
2293 messages in /home/gregkh/mail/todo/

Please be patient.


