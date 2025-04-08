Return-Path: <linux-gpio+bounces-18480-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8785EA803D3
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 14:03:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B1C342481D
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 11:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CEE926A0C8;
	Tue,  8 Apr 2025 11:53:53 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C6E268681;
	Tue,  8 Apr 2025 11:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744113233; cv=none; b=d3eAg1Pk320oJgDNFcaSJ+OsH990XfCnr+6SH03tuqTkSunC1DYz32a4N+2FTB9kRSAjTfqZxl9/VJVd2TRA9TBqZJIycL5x0FY09lWynu5LxOUPWuWn7ffu2gF5pHHrQngRpdVqIZbxaJAYCEcS3sQQ1UGPC8YN/yF1wfm+nYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744113233; c=relaxed/simple;
	bh=Pj1y1wiq6EQ94mnXBYGZ6bdS7QX6U9rKMttG3lb2fjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aUwnScneA0DXCQo2/7Px8mxuz/zDQbM5++0+jc/kqRbNSGOrTSL7j4Wq7L9lEfXocZknw+F+v6bfPHqS49goP1KiTD5c2qRKigiFwGufzvt49RySUFs3JvCNcvy7qE1Iqrcj/KOjdldLWaWYVQwKgaPKVeReXIMBNvtGNY+f6GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 568EA343096;
	Tue, 08 Apr 2025 11:53:49 +0000 (UTC)
Date: Tue, 8 Apr 2025 11:53:38 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alex Elder <elder@riscstar.com>,
	Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v3 2/2] gpiolib: support parsing gpio three-cell
 interrupts scheme
Message-ID: <20250408115338-GYA15656@gentoo>
References: <20250326-04-gpio-irq-threecell-v3-0-aab006ab0e00@gentoo.org>
 <20250326-04-gpio-irq-threecell-v3-2-aab006ab0e00@gentoo.org>
 <CAMRc=McnW0YRMmikwu6qWSdWD5Zu227dBRwd4VeWZcfcEFUMDg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McnW0YRMmikwu6qWSdWD5Zu227dBRwd4VeWZcfcEFUMDg@mail.gmail.com>

Hi Bartosz:

On 11:03 Tue 08 Apr     , Bartosz Golaszewski wrote:
> On Tue, Mar 25, 2025 at 11:08 PM Yixun Lan <dlan@gentoo.org> wrote:
> >
> > gpio irq which using three-cell scheme should always call
> > instance_match() function to find the correct irqdomain.
> >
> > The select() function will be called with !DOMAIN_BUS_ANY,
> > so for specific gpio irq driver, it need to set bus token
> > explicitly, something like:
> >   irq_domain_update_bus_token(girq->domain, DOMAIN_BUS_WIRED);
> >
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> 
> This doesn't apply on top of my gpio/for-next branch. Please rebase
> your patch and resend. Patch 1/2 is already on that branch.
> 
Ok, will do, thanks

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

