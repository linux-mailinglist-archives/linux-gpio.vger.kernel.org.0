Return-Path: <linux-gpio+bounces-9038-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 396BB95C947
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 11:32:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA18F285B97
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 09:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 701F820DF4;
	Fri, 23 Aug 2024 09:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="NSO0xx32"
X-Original-To: linux-gpio@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D8513A86C;
	Fri, 23 Aug 2024 09:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724405564; cv=none; b=EGd7aE7C6Qm1SN3iBg7ErJxESjrVD5rvZwFqZ+EnVVf4kPuaesiZKvSA6RRYEGiWFJngPo5slWYIj9+KZUiGEoCGEqtNvVpML9GArT3JPOfxlFTS/jc43a0bfGfPqUVWfjIqe1mY+W8LG6o4sPchykFoIAfBTTaQvNFYGxLADDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724405564; c=relaxed/simple;
	bh=oCBdD9OgR5RO/WSh7NmOI2YCt1/qhDEduEuVufj1/Rw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZArRG2e0LgezgA1WgFl9AsP4pud8Ua876qStQu8QrwkXuJxJNHXwK4beR/KUOMyUqYmzjL7E5tNV6F5sFZaDTi2V94rkbl3Jis0OlhJpMcoexSadChOTPAzQEgKidFHcH8K/CPN3aR0duApDXpX3IuTK+0miylqAhiniXKqogxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=NSO0xx32; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=STCtJF6ksMDJc9r4V5RenQAnmshiLEKgWukA/TDxI+Q=; b=NSO0xx32oSKBFoxpyROPEILbee
	9BsJRY93er3AbDRFKuOgbBiBEG5zu+lQXoIgx5hF1PHf12kBfexkkr6gDug9kk8WYKziN9xKLExIL
	SgtnCBcmMg6m7UugasbfcIzu47jfYMCAQsc0V0YRYaXi1tIqHZ+PGvTK4oqloF6B/YPhaMQ7VKomj
	Nz9+tRSGNTmihPo0kSDKmrwwNgDWUQ6jFtVaApDL+9/4ouAsN3PkoHmgoJjvBv3FJXEBuiq+RZChj
	Q1mGKgdP2qeGYyxZ7r6/2ATKWrF1wtw51XCP7nqywh2fiDBEK8akOGvAcwMPsJB6G3eTizbZJMYB9
	DCnTAUIg==;
Received: from i5e861933.versanet.de ([94.134.25.51] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1shQet-0003qS-FC; Fri, 23 Aug 2024 11:32:39 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linus.walleij@linaro.org, brgl@bgdev.pl, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Ye Zhang <ye.zhang@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 mika.westerberg@linux.intel.com, andriy.shevchenko@linux.intel.com,
 tao.huang@rock-chips.com, finley.xiao@rock-chips.com,
 tim.chen@rock-chips.com, elaine.zhang@rock-chips.com,
 Ye Zhang <ye.zhang@rock-chips.com>
Subject: Re: [PATCH v2] gpio: rockchip: Update the GPIO driver
Date: Fri, 23 Aug 2024 11:33:20 +0200
Message-ID: <11200017.BaYr0rKQ5T@diego>
In-Reply-To: <20240823034314.62305-1-ye.zhang@rock-chips.com>
References: <20240823034314.62305-1-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Ye Zhang,

Am Freitag, 23. August 2024, 05:43:03 CEST schrieb Ye Zhang:
> GPIO driver support acpi and new version, set input direction in
> irq_request_resources, fix division error and debounce config error.
> 
> Changes since v1:
> - Split commits with multiple changes into separate commits.
> - Adjust backportable fix to the forefront.
> - Modify messages of some commits. 
> 
> Ye Zhang (11):
>   gpio: rockchip: avoid division by zero
>   gpio: rockchip: release reference to device node
>   gpio: rockchip: resolve overflow issues
>   gpio: rockchip: resolve underflow issue
>   gpio: rockchip: fix debounce calculate
>   gpio: rockchip: Update debounce config function
>   gpio: rockchip: support 'clock-names' from dt nodes
>   gpio: rockchip: support new version gpio
>   gpio: rockchip: Set input direction when request irq
>   gpio: rockchip: support ACPI
>   gpio: rockchip: driver works without pinctrl device

this is a patch series, so in theory 

	git format-patch --11 --cover-letter

should have generated subjects like
	[PATCH v2 00/11] ....
	[PATCH v2 01/11] gpio: rockchip: avoid division by zero
and so on.

As you've seen in the replies people get confused, but also kernel patch-
handling tools get confused :-) .


Heiko



