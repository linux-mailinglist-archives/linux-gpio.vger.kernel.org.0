Return-Path: <linux-gpio+bounces-20002-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E2AAB4680
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 23:36:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1705B7AE817
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 21:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEF4B29ACC5;
	Mon, 12 May 2025 21:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="4FCyK6XY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D6F299AB9;
	Mon, 12 May 2025 21:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747085536; cv=none; b=VQ+M6GAMT/BKCMMMy/u/GX/Ah8foQ0l84TBfelbJuHqgAqdb1H/aCqiEe55QECg0hfkx9FD5BjBHa4YXgcKSeEafpUVMgNRzVHtHzXz7mU68BurqFJl36FkIetq4lxx+f160gaBH1y6oIpJnteWSHLsQpxCSndyHgLC+LTOhd78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747085536; c=relaxed/simple;
	bh=g2DzMktddjyfi6jAbHCSq1OVtmmUdC3QMtq3v2I0DnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PxCyqvfUzGbNangQWGzp4yBQUhHhjachOD/BsqstOatqlK8qM7euVCCkp/mZGGWOpJfImhYCv7vLtXFg5Uvof22yVNiFA7dCXmF3GuOfwkodspqp4Etjoa7ZpnNHoiMRmNciYxbJAX5PR5DAzrezSl44CItlMvyqCoXMY7u1+uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=4FCyK6XY; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=KhSlUCo/MY/IK5ARlS+anjyhtV9qBFHpdoCvCWxFhmY=; b=4FCyK6XYvs5oqYzhabmxefyBXm
	0CcKUDbxaz1dKEPc1U1f5xnd8r59E/y8DCIzHLq7A7TTAx5HRYRTZHy4Thu1vSSlUHi8JcDHl1mF3
	kv16oibHSQOwgPjdRrAAnoarusRLbgIRa1g5PghZfA33ltJpWZhoMXuzEWC+IG9gBDEY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uEakt-00CNuD-V1; Mon, 12 May 2025 23:32:11 +0200
Date: Mon, 12 May 2025 23:32:11 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Imre Kaloz <kaloz@openwrt.org>
Subject: Re: [PATCH 7/7] pinctrl: armada-37xx: propagate error from
 armada_37xx_pmx_set_by_name()
Message-ID: <e8b9f3a0-980d-4045-ae23-f796e852fde6@lunn.ch>
References: <20250512-pinctrl-a37xx-fixes-v1-0-d470fb1116a5@gmail.com>
 <20250512-pinctrl-a37xx-fixes-v1-7-d470fb1116a5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512-pinctrl-a37xx-fixes-v1-7-d470fb1116a5@gmail.com>

On Mon, May 12, 2025 at 04:22:43PM +0200, Gabor Juhos wrote:
> The regmap_update_bits() function can fail, so propagate its error
> up to the stack instead of silently ignoring that.
> 
> Cc: stable@vger.kernel.org
> Fixes: 87466ccd9401 ("pinctrl: armada-37xx: Add pin controller support for Armada 37xx")
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> Signed-off-by: Imre Kaloz <kaloz@openwrt.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

