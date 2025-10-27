Return-Path: <linux-gpio+bounces-27624-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CA97DC0BF52
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 07:27:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7BB7C4EE788
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 06:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92E792DC764;
	Mon, 27 Oct 2025 06:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="Fow3CDzp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13842DC32E;
	Mon, 27 Oct 2025 06:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761546460; cv=none; b=mUtP+62WcUZ6buPwZ6YJUnMl84edRr4DflNLQPzt83reCeM75b/60nikj9Fg0mhLU3Klo5RDLI0zhypC4e/Geebjpdh40ck4jK/I2yBocVLvc8qz56GgO8lnRYhEB0urYffcW8Xn8q45gkhkjbWvxoUx5K4cwiMp4f2eno0yKKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761546460; c=relaxed/simple;
	bh=SSDaTiQPrDkiM+7CW2UMAOiyTI6SxBy44JANhbR/RtI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cXqhwwSZXuuXpCNdQxqoQBeseBudzcbVg5ZZpa2cgdNwVP2oE/uBuH52fcSE7K+25tlGjbdDShaN58QbIZM5IVKEgmUmnn/8QZdZpqamryv8ne28d6NRbTOLUZf/JiQFY7kZd7p8kEUbaDMyhNcktahKvsfQVp9DqJnQZ7iLQnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=Fow3CDzp; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=H379qOfzvRU6DOGT716UegcKmDlW9qLmAMMpLp9CC5Y=;
	b=Fow3CDzpWq2XNKTKTMeXyKJHtlyQlBm2g+04DJyz6qqFHWjgvEGsFstWB3sPyX
	ZyiE/BvSUxc2tleS4f6dcK/a+M3+sEmBvt/bC0QJvJofN5Q9whpU5jTXUweglkg2
	eC8AY5539xuH9d2jWE9IWfCSHMV2ao9yN0Kb+A1aUzFf0=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgBn9g+1EP9oxk66AA--.4737S3;
	Mon, 27 Oct 2025 14:27:03 +0800 (CST)
Date: Mon, 27 Oct 2025 14:27:01 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>, Michael Walle <mwalle@kernel.org>,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v6 7/9] arm64: dts: ls1046a-qds: describe the FPGA based
 GPIO controller
Message-ID: <aP8QtSlGQApQSKPV@dragon>
References: <20251014155358.3885805-1-ioana.ciornei@nxp.com>
 <20251014155358.3885805-8-ioana.ciornei@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014155358.3885805-8-ioana.ciornei@nxp.com>
X-CM-TRANSID:M88vCgBn9g+1EP9oxk66AA--.4737S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUO7KIDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNxdLsGj-ELeBqgAA3A

On Tue, Oct 14, 2025 at 06:53:56PM +0300, Ioana Ciornei wrote:
> The QIXIS FPGA node is extended so that it describes the GPIO controller
> responsible for all the status presence lines on both SFP+ cages as well
> as the IO SLOTs present on the board.
> 
> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!


