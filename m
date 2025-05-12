Return-Path: <linux-gpio+bounces-20003-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE53AB4690
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 23:38:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E6688C1921
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 21:36:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E95C329A335;
	Mon, 12 May 2025 21:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="ehK2iGAc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D91629A329;
	Mon, 12 May 2025 21:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747085640; cv=none; b=mCIovrx79ofvlpKOs8XL3ilCBqg64WDFP5Ppj6LqfXUBHQOvJGaglXjfdsCS1ixzaXPJ232QBG8XAy07QS7Jft6NgJghkXLENTBlZo9c2RKFekVupHndXF8OxK0k+8byUbWWZ8De4Gou6OSi9AHOdupbDzVQBIqBnI1TIOZilk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747085640; c=relaxed/simple;
	bh=nbp8bTTY/n884ercsSxWxx8OhU+1JG7YDr7R5L6ZKPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hyjF2GkAbIwpVfPzyS0Jpwz/iF/jbOvNCHs8ZLEFf7tUAK/kEbPRmlA3uDug0dKRTnO7BJ7Kd3Sy4a18QT2U/yKrMR4La49suKk6BVsAlV9guvnHlTPTEgR5VdeCApGQqtKr2l+mlUpEIIlEP9XRfWEhPuh6hGJIaj0E8cOsDtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=ehK2iGAc; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=p39rJHQ8AzeK+WJsX2y7EKX2VVM4p/4mCnZmjamECbI=; b=ehK2iGAcS5aPnTGjJTnqU6Q0ia
	/Tg53DNuq7cZrXR5U7SzHUX7OGIz+MHMTrU7+Sgyj1+8qPbu499qwB1/3fTMmllnT7TrJvPzc9hI+
	qEnntpwsYvzv3s31StaJBYfkvvxsIiEcplmapZIeRSlP8ApHKaIBUzUmKFOOQlUPctJ4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uEamZ-00CNux-OT; Mon, 12 May 2025 23:33:55 +0200
Date: Mon, 12 May 2025 23:33:55 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Imre Kaloz <kaloz@openwrt.org>
Subject: Re: [PATCH 0/7] pinctrl: armada-37xx: a couple of small fixes
Message-ID: <60ef3803-4f8b-4d9b-bef8-6cf3708af057@lunn.ch>
References: <20250512-pinctrl-a37xx-fixes-v1-0-d470fb1116a5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512-pinctrl-a37xx-fixes-v1-0-d470fb1116a5@gmail.com>

On Mon, May 12, 2025 at 04:22:36PM +0200, Gabor Juhos wrote:
> The series contains several small patches to fix various
> issues in the pinctrl driver for Armada 3700.

I'm not sure all these should be for stable. Some are clear bugs, but
not propagating the errors has not bothered anybody so far, a
requirement for stable.

	    Andrew

