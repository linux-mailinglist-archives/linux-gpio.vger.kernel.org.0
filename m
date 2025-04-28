Return-Path: <linux-gpio+bounces-19389-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B608A9EA96
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 10:20:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 101E416E53E
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 08:20:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF9C225E46C;
	Mon, 28 Apr 2025 08:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yiI+DqgE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F5125DD15;
	Mon, 28 Apr 2025 08:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745828385; cv=none; b=FKId2rE5DsY1AleJBCUtsGtwYQ4q4WJsCxFpxcv10ZuGgfF/w8sjClpMGb4//gt4CVsAk+THmIyfRvdKzVW0QtDiBqxEglPqqQZw4dUtZIVfUZUuze+5hEdFO4Qg5RHKrXqRfg+cyacjoTWMT9UyvbDCFoCWwOOqJksMto4zIO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745828385; c=relaxed/simple;
	bh=8QkfODvIJOjNNWPTtgvsu1hFRwnn7oWSy32ayB+5V2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V56ZN2Jhasca/7foZdyQHHmPHHnXflbxqC+1jv/FM74l81pVi1M1ayhnn9b4usBAsh6J06wf/W2SwTeAbZfgfwg1mqf9tgNdUIW5sm9Hr1DdjwaXo62pP0vQ7MbVVHnPzQMW9kYhb1yKE9hOuS6/H34AG4cwKHaT4NXWx19s7aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=yiI+DqgE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7113C4CEEC;
	Mon, 28 Apr 2025 08:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745828385;
	bh=8QkfODvIJOjNNWPTtgvsu1hFRwnn7oWSy32ayB+5V2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yiI+DqgE4tgMtK7WasGBdYQu0kzWKmm+GL2cWKKfSoNfrhkPvL9OJSvbYpuxgQK9C
	 76PSn26UcfxAXEu8BTUxGj1IPSpwfGViYxArq6/LcXdeXLdRqkIZwuoIrPgnDklal4
	 0FnIGDexYMihIVesJTWdZh9u1SqwK6CTFJ3vHx6I=
Date: Mon, 28 Apr 2025 10:19:42 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Raag Jadav <raag.jadav@intel.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [GIT PULL] gpio: immutable tag for the driver core for v6.16-rc1
Message-ID: <2025042821-campsite-fidgety-023b@gregkh>
References: <20250428074550.16190-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428074550.16190-1-brgl@bgdev.pl>

On Mon, Apr 28, 2025 at 09:45:50AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Here is the tag containing the driver core dependencies pulled into the
> GPIO tree to enable picking up the final commit from Andy's series[0].
> 
> Bart
> 
> [0] https://lore.kernel.org/all/20250220162238.2738038-4-andriy.shevchenko@linux.intel.com/
> 
> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:
> 
>   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpiod-devm-is-action-added-for-v6.16-rc1

Thanks for this, now pulled into the driver-core tree as well.

greg k-h

