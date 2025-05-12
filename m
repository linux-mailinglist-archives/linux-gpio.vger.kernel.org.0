Return-Path: <linux-gpio+bounces-19998-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1A2AB4676
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 23:35:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9634616520B
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 21:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC312299AB5;
	Mon, 12 May 2025 21:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="yR+d47Nn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F11B299AA8;
	Mon, 12 May 2025 21:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747085447; cv=none; b=tbJZntQ5EwsB5NwY/OwNLFnIRTgg4f8ofSr3JyX6gG8sFvflnWHOXPdDJII1/+E5j10IcO3hY4hr786d5XUPmGZuoSkdcZ86kRNbOVsoNGSKzWidD/CJhm6hvzK3j/09mczSJOblHitMxxqR9cQNpm0j0RakFX5orDfHEijeQHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747085447; c=relaxed/simple;
	bh=M5f8dvAJrgjPuqS7sBaHfsev3XQ/oSjWKDa6u9gqAQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y3tOdUaLlNQmU0zPqWcZw4g6deiaRKeGyOFOZ+ZuUrJDx87ST0c9jT8fTC5MaxK/C8unJxXCy2l6pK5SXYyzGMcp495AJ8BAwVHLyY0gZiLMCurNhlzz4CAccvQh7ktcau4samJqUaUPKbpdsLE2KzWe4RplGsrlj0XQjkbh96U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=yR+d47Nn; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=5xSxv/R9iGioyUUkxIlSuJoDpDl8AkHbZ/Q9eAtbTQA=; b=yR+d47NnlnHNygsqCUCBHj87uD
	EwmlJDMsrCl+Cv298HtkbrVSc/+ofncualLZwozBxmCwS+dk5r3rk9BZxI4ZF1XO0CTDypQ0lvqrZ
	LF77yoZYGANciGk9JiHRJw7nNgQqqMhKtWSEocYoha7XcGWLH6RfPVsQQJAGZsjS8NjI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uEajR-00CNs5-3n; Mon, 12 May 2025 23:30:41 +0200
Date: Mon, 12 May 2025 23:30:41 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Imre Kaloz <kaloz@openwrt.org>
Subject: Re: [PATCH 3/7] pinctrl: armada-37xx: set GPIO output value before
 setting direction
Message-ID: <95da9408-dab6-4b69-86f2-6681db9be841@lunn.ch>
References: <20250512-pinctrl-a37xx-fixes-v1-0-d470fb1116a5@gmail.com>
 <20250512-pinctrl-a37xx-fixes-v1-3-d470fb1116a5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512-pinctrl-a37xx-fixes-v1-3-d470fb1116a5@gmail.com>

On Mon, May 12, 2025 at 04:22:39PM +0200, Gabor Juhos wrote:
> Changing the direction before updating the output value in the
> OUTPUT_VAL register may result in a glitch on the output line
> if the previous value in the OUTPUT_VAL register is different
> from the one we want to set.
> 
> In order to avoid that, update the output value before changing
> the direction.
> 
> Cc: stable@vger.kernel.org
> Fixes: 6702abb3bf23 ("pinctrl: armada-37xx: Fix direction_output() callback behavior")
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> Signed-off-by: Imre Kaloz <kaloz@openwrt.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

