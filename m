Return-Path: <linux-gpio+bounces-16800-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12610A497CD
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 11:52:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE8051895F69
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 10:53:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D0D425E441;
	Fri, 28 Feb 2025 10:52:54 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12771B4250;
	Fri, 28 Feb 2025 10:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740739973; cv=none; b=j2n8dBHcH6sYZrH1deQE6DKCXcourzmA/IfIUfq+WQP+pn2HcUalmdp6CTA7bNRqbb5SZq6lBLz7D932Hylh+s/ktjSubDEp16NgJ0iAOSBO0Q8AKRnnhuLJAiYq7jeXWhAIafOpthwYWi3NUI+gJ/8sMLqVla9eHlLODGnF4YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740739973; c=relaxed/simple;
	bh=/0+86uU2ASMRXpJZLh1YvPRZ699dY/lJcv07yGaA3k4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UG4zBJZPSlrvXpVkTcRPQFsQDRVtytVB1LXfqh0Q03wDxgPOAZ6wXZXWgj9n/lCJwULYAkOxouP8ltmcxRZ1ug4X290xnzvgVLfRpLOR7vZJMfssYREcLA6xKUnFjebs83PlxJee/hbRuRp6zFw8aegnO6HevRB/OPj9UbJiYpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.55.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id A03F834317F;
	Fri, 28 Feb 2025 10:52:51 +0000 (UTC)
Date: Fri, 28 Feb 2025 10:52:47 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alex Elder <elder@riscstar.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Thomas Gleixner <tglx@linutronix.de>,
	Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 1/2] irqdomain: support three-cell scheme interrupts
Message-ID: <20250228105247-GYB52883@gentoo>
References: <20250227-04-gpio-irq-threecell-v1-0-4ae4d91baadc@gentoo.org>
 <20250227-04-gpio-irq-threecell-v1-1-4ae4d91baadc@gentoo.org>
 <8fce8a9c-7946-4e3c-bbf3-25f8b4f4466f@riscstar.com>
 <20250227204155-GYA51171@gentoo>
 <CACRpkdas4TsMQx2Cvu_JR3kTStqWaOt1N+Cmq7nFesMzpGnZ+g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdas4TsMQx2Cvu_JR3kTStqWaOt1N+Cmq7nFesMzpGnZ+g@mail.gmail.com>

Hi Linus Walleij:

On 09:44 Fri 28 Feb     , Linus Walleij wrote:
> On Thu, Feb 27, 2025 at 9:42 PM Yixun Lan <dlan@gentoo.org> wrote:
> 
> > > This function is meant for "twocell".  There is also another function
> > > irq_domain_translate_onecell().  Why don't you just create
> > > irq_domain_translate_threecell" instead?
> > >
> > good question!
> >
> > it's too many changes for adding "threecell" which I thought not worth
> > the effort, or maybe we can rename the function to *twothreecell()?
> >
> > I'm not sure which way to go is the best, ideas from maintainer are
> > welcome
> 
> Yeah just rename it twothreecell, that's fine, we will understand it :)
> 
there will be quite a lot files to touch, which looks a little bit scary
but anyway, I'm fine with either way..

$ git grep irq_domain_translate_twocell | cut -f 1 -d ':' | sort -u | wc -l
11

Thomas Gleixner, do you agree with this direction? then I can work on it

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

