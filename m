Return-Path: <linux-gpio+bounces-21832-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE1CADFC36
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 06:05:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC5B73B44ED
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 04:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E32F823BCF2;
	Thu, 19 Jun 2025 04:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="c8r1P5P4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C4121B9CD;
	Thu, 19 Jun 2025 04:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750305937; cv=none; b=oAMOrKzp5NvVwUycS2zlZTgzBXoZm4sm+2P34ZmtzXMZ0A1n5SfFlYSpu1wP2ABo56ojP/F4A8mkWwMoUXLRBpJsPeqwIAOp5xclTOnybpAExesZt9JeX6oQcskb7/U12rbe2EOkLxvgXSQU/YgmyfgSVQW/VZFuzj8GJ//gsks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750305937; c=relaxed/simple;
	bh=AAYnKV+Ib6IADL7L7vo20VmbTbhdkeLrlyQxqalj2Qo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BaZuEeOmYY8wb9WMRRb8VI1eB4D5Ob4G0pg1nU/ZASOiRVC8bhqIYv5ZdHK0TgWY/r/RocPvuejwSV9G3K+vyFOmqP8pww0Mutg+4GV8C4zq7Q8MG1Bb7yR2eNaGYi+MDXP6rPw/aP4iKd/m9UfbsRPXxvwsyd/TxSA0mUaME2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=c8r1P5P4; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=LU7QhYjxOqOH4zbvw6oM0dtf5fFvFxSixl3GW1jJGTw=;
	b=c8r1P5P4xE0Kb3/i+H2dW91s0RkOZn33p8n76h5J7WpdAfONeFvuQYZ1B7936F
	EK/EPsIEAzrXOu1pQ6ERZKymZQV3Z8VQhybSR9Z/6MCo4yb3obETCifpFGzJoF0B
	TC/HLpaHvgH+aE3WKx1JA/OCruq+eSOsSYCQsB7CtBsUQ=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDHZsPUiVNoFnv8AA--.41662S3;
	Thu, 19 Jun 2025 11:53:58 +0800 (CST)
Date: Thu, 19 Jun 2025 11:53:56 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	peng.fan@nxp.com, wahrenst@gmx.net, conor@kernel.org,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 3/3] ARM64: dts: add ngpios for vf610 compatible gpio
 controllers
Message-ID: <aFOJ1OXvpEP8gaxL@dragon>
References: <20250520-gpio-dts-v3-0-04771c6cf325@nxp.com>
 <20250520-gpio-dts-v3-3-04771c6cf325@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520-gpio-dts-v3-3-04771c6cf325@nxp.com>
X-CM-TRANSID:Ms8vCgDHZsPUiVNoFnv8AA--.41662S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7JFW5Kr4fXw4UWr1kKFWfZrb_yoWfArc_CF
	W0qw4UZws5uFWxKw47Kr4Ivr18Ca4fZw13Wry7Gr93Ja4YqrnrtFs3JrW3JayUWFs8KasI
	kry5tr48Aw4agjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbUKsUUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIReG62hTideU6wAA3B

On Tue, May 20, 2025 at 11:46:14AM +0800, Haibo Chen wrote:
> After commit da5dd31efd24 ("gpio: vf610: Switch to gpio-mmio"),
> the vf610 GPIO driver no longer uses the static number 32 for
> gc->ngpio. This allows users to configure the number of GPIOs
> per port.
> 
> And some gpio controllers did have less pads. So add 'ngpios' here,
> this can save some memory when request bitmap, and also show user
> more accurate information when use gpio tools.
> 
> Besides, some gpio controllers have hole in the gpio ranges, so use
> 'gpio-reserved-ranges' to cover that, then the gpioinfo tool show the
> correct result.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

Historically we use "ARM: dts: ..." prefix for arch/arm/boot/dts changes,
but use "arm64: dts: ..." for arch/arm64/boot/dts ones.

Fixed the prefix up and applied, thanks!

Shawn


