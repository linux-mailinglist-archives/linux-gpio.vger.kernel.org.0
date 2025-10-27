Return-Path: <linux-gpio+bounces-27621-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D0115C0BF13
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 07:24:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA740189F597
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 06:25:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0E3B2DAFAA;
	Mon, 27 Oct 2025 06:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="VejewbX/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9C3D531;
	Mon, 27 Oct 2025 06:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761546277; cv=none; b=Ljao5nxEK8odpsJ1+TAIYcZVQcUyM0RLmDiMzAOREoQ4c4C3hyPOzjBNKuh6IPShSGXN2IP6gsEHdYTu1qMtXe57E0r3fF27izIpBxqL7GvxtrG/b+O5E3rkHYoqExqjTDf6CpNAXTsuzD/Q4TGVNqR1hlkL57ubNO1LsN47Cho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761546277; c=relaxed/simple;
	bh=kgNEbJJvVn1AlFWBdDtJXS6fwchsb4LGKOBkgptp8wo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VXiB+aW7wCbaO0p+53lfEtGPLBtpEH32qKvVxNVVAO6qcS0RigVoQisdZkh1b1j7iHEPclfD7mKqKgveJBRHInhfPb9Vh2YUc910H98t3FuKROnF6VEQ+GgvC1tz2OMyd4VeOdES3XUspA9WVHnZRY+3n/JEXSWU0/9yreK33nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=VejewbX/; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=wf1TmsN5eilPSXSQbedmJYlMu76lTozozzi7xw7Z/rg=;
	b=VejewbX/rqeR9zU1P10tTYeqLCDCcIacScyxh1q0VhOhUAUiYtHwhxculnOBiM
	ljpQ/T2MBaUiNiIK40COzpkJDwgzv9ipbj3Ws3uSq9TBe1jpnGaueBmcwHU1e70G
	rDHHvFojL1jhaBzW0K0MzMzRRdvOsIlbTd0OmbzYW00G4=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDX37QDEP9ot0S6AA--.53558S3;
	Mon, 27 Oct 2025 14:24:05 +0800 (CST)
Date: Mon, 27 Oct 2025 14:24:03 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>, Michael Walle <mwalle@kernel.org>,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v6 3/9] dt-bindings: fsl,fpga-qixis: describe the gpio
 child node found on LS1046AQDS
Message-ID: <aP8QAzicPkRXvf0z@dragon>
References: <20251014155358.3885805-1-ioana.ciornei@nxp.com>
 <20251014155358.3885805-4-ioana.ciornei@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014155358.3885805-4-ioana.ciornei@nxp.com>
X-CM-TRANSID:M88vCgDX37QDEP9ot0S6AA--.53558S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU20edUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEg7zZWj+59SNgwAAsh

On Tue, Oct 14, 2025 at 06:53:52PM +0300, Ioana Ciornei wrote:
> Extend the list of accepted child nodes with the QIXIS FPGA based GPIO
> controller and explicitly list its compatible string
> fsl,ls1046aqds-fpga-gpio-stat-pres2 as the only one accepted.
> 
> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Applied, thanks!


