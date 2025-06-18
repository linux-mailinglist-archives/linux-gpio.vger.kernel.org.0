Return-Path: <linux-gpio+bounces-21825-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF04EADF635
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 20:47:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3FA33B6F3E
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 18:47:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E57B02F547C;
	Wed, 18 Jun 2025 18:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KKg2Hr0W"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A297A3085B3;
	Wed, 18 Jun 2025 18:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750272458; cv=none; b=H/WhPbic7N0ysCm4vBPa5taT5FkkLixw3wTsqGtEcB4YitiDSbH4PDlS/oa4bGiaPcwp0n0X63bZVXqbpprrLNqt+hQ8CYxjEctW6utNwyjDV824ihL7pvziYJrPdIJYQd5OOeBdfy8jICsyeeRpo9+24YHhUyBjnEq5UVAZ5Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750272458; c=relaxed/simple;
	bh=7Y/Qpf9w3u1PPkHzxFMHo66MfQIzJh+2piey4VO4H40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SLOoHXBlL0lYNBCY+KkIEAokYci4GorGT1J1MRDc0af3bYYtnBd8PmxfZxGcE/botYXTkRriaEf0gQ63/lXUhG5r1beDJWaQsWzPE9NsWvWHZ3SOWNELoMclyVbRcn4isfCcU9h666J56LM5Scqi9CZPtFhEcqYpp5RazjYQ4WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KKg2Hr0W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95B1DC4CEEF;
	Wed, 18 Jun 2025 18:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750272458;
	bh=7Y/Qpf9w3u1PPkHzxFMHo66MfQIzJh+2piey4VO4H40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KKg2Hr0W+vO+14dIaOGmVWEiVs2c0SFbR0Tf9aa98ftrntYR2gmk1YXMCqRad5NfP
	 boC4URS8inbk/+ScGxGKJZS+MfBNGKs4TM+V6gMkJF8iWY4vq3l5CNDLKihwArVyBo
	 GoHACeif8FCIMHZ6jLwCjtV9nGukBr86XqYieBFFNX+sgqiKNkGqSRS1C8QH9OntlO
	 uxUUroY8a+FAbpyMwea1AYsbJUT4Ul9d9uErLtAluifmgSJEJ3a6ewnmP/sPRvPhzS
	 wlmIIyxLwThV4ZZ9bcAZfFV6aC22Td6nXyk/6fo0r0R1wJqAH6BtKiElp0RNcmImQo
	 6x7kt1i5RZBPA==
Date: Wed, 18 Jun 2025 20:47:33 +0200
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>, 
	linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Andy Shevchenko <andy@kernel.org>
Subject: Re: [PATCH] platform: cznic: turris-omnia-mcu: Use new GPIO line
 value setter callbacks
Message-ID: <ge4wcqilbvc374fap2z5klrie6c6k5xwuwfbfrt6wbf2nvkt7u@hdskg6eilzcv>
References: <20250618124319.19220-1-kabel@kernel.org>
 <CAMRc=MfdPc0T_6G7uRUW7BAjFaBQYFFs=u2NGKj29eJGSjRVCw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfdPc0T_6G7uRUW7BAjFaBQYFFs=u2NGKj29eJGSjRVCw@mail.gmail.com>

On Wed, Jun 18, 2025 at 03:20:15PM +0200, Bartosz Golaszewski wrote:
> On Wed, Jun 18, 2025 at 2:43 PM Marek Behún <kabel@kernel.org> wrote:
> >
> > struct gpio_chip now has callbacks for setting line values that return
> > an integer, allowing to indicate failures. Convert the driver to using
> > them.
> >
> > Signed-off-by: Marek Behún <kabel@kernel.org>
> > ---
> 
> What's going on with this patch? I sent it a few days ago, now you
> just resent it without changes. Who should pick it up?

I didn't see any patch for this driver, only for gpio-moxtet (for which
I sent R-b). Did I overlook it?

Marek

