Return-Path: <linux-gpio+bounces-15822-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C458DA31FF1
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 08:26:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C9F8163B9B
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 07:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5650204593;
	Wed, 12 Feb 2025 07:25:58 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218C72040A4;
	Wed, 12 Feb 2025 07:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739345158; cv=none; b=quv62g3tcTVQsheCA+uBwTP8Ol8WKEAE+TYjn2c2KH/ZlB6+0T4j4Olx0THAS+W/gNZoRam6q0Sqa6Y45J5LikUXCleKSI174Wrtjrg7DQmsDWwmbgMziqQU/7bIkZNhU+GgVV51eogxgIPXqtnlhYVU6NuMP5NpE+e7+UmC43s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739345158; c=relaxed/simple;
	bh=hE/lRA+vKo3tohwgY7RJ2axtqZHoYLC4u6gkjkRP7AI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BFGaoVcD2yFeN7QHvXWohe/t2SUuI9gJqLMLIKZ4jjluqGKIkk/SXlavzxAhunQF6nyu4jw/3J2oDaco4AxT/AUQM/9YLII6WZATGKlJhVdJPXcrIwkcp2jDkQEBGFl6nRRn5RgJ+faDJ9rXEfcTQ3mBD8zKD9J9V2eVHwa6luQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [180.172.76.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id EFDCC3430A6;
	Wed, 12 Feb 2025 07:25:55 +0000 (UTC)
Date: Wed, 12 Feb 2025 07:25:44 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Conor Dooley <conor@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Alex Elder <elder@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, spacemit@lists.linux.dev
Subject: Re: [PATCH] pinctrl: spacemit: enable config option
Message-ID: <20250212072544-GYA17416@gentoo>
References: <20250207-k1-pinctrl-option-v1-1-e8a7e4d8404f@gentoo.org>
 <20250207-promenade-hazily-d7900cbc127e@spud>
 <20250207223705-GYA7567@gentoo>
 <20250211-nature-kilt-9882e53e5a3f@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211-nature-kilt-9882e53e5a3f@spud>

On 16:03 Tue 11 Feb     , Conor Dooley wrote:
> On Fri, Feb 07, 2025 at 10:37:05PM +0000, Yixun Lan wrote:
> > On 16:49 Fri 07 Feb     , Conor Dooley wrote:
> > > On Fri, Feb 07, 2025 at 08:11:42PM +0800, Yixun Lan wrote:
> > > > diff --git a/drivers/pinctrl/spacemit/Kconfig b/drivers/pinctrl/spacemit/Kconfig
> > > > index 168f8a5ffbb952cbeae3e3401c11149558e0a84b..aa3dea535def87ed75d86bc555b2b90643adbdea 100644
> > > > --- a/drivers/pinctrl/spacemit/Kconfig
> > > > +++ b/drivers/pinctrl/spacemit/Kconfig
> > > > @@ -7,6 +7,7 @@ config PINCTRL_SPACEMIT_K1
> > > >  	tristate "SpacemiT K1 SoC Pinctrl driver"
> > > >  	depends on ARCH_SPACEMIT || COMPILE_TEST
> > > >  	depends on OF
> > > > +	default ARCH_SPACEMIT
> > > 
> > > This is effectively just "default y", since ARCH_SPACEMIT is a
> > > dependency.
> > > 
> > right, this is the plan, it make sense to bundle this config to ARCH_SPACEMIT
> 
> I don't think I was clear, I was trying to say that you should do
> s/ARCH_SPACEMIT/y/ on this line.

make sense, since we already have "depends on ARCH_SPACEMIT" here,
it's kind of redundant to say ARCH_SPACEMIT again, will fix in v2

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

