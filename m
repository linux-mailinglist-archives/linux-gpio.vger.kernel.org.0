Return-Path: <linux-gpio+bounces-27622-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AE1C0BF1C
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 07:24:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CC9A18A13DC
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 06:25:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 254312DC784;
	Mon, 27 Oct 2025 06:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="P+6kl3qB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEA42DC34E;
	Mon, 27 Oct 2025 06:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761546281; cv=none; b=H2Gfz4FmQlhAZqb8Be53tHPcdgo/RSWba5CQM3vEAUKCTP1rDOcCAkVxkX3J5YZVI1RgLH5Ij23ihRrB9owc1l7efZvRmgJZMX+qGwi7d3YvlXEDkcdg4anZE85RglF9rhS8ADJruKoUX06ikN1/zdSy4kL1XHJ9fznjT7+VKT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761546281; c=relaxed/simple;
	bh=Le7lV+2aLJjDa4ndhtGnPRvBaNUlnKPV78Y/kL6rP2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IP3vELqDNKoGxed8SbwU5amgSzCuj791bDXmmaBYNxvEwjnciw4AXg3OVePvnKSBM27AcRm5LVyOLu5o/EQx9DVAD08R9xArv0PwCvTxl+bVO2T5NgCd64/Fm+6whzvEECckYS5Fl7ENi0pXD4w71PJJS4aK+V3YwdHRnHo2jX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=P+6kl3qB; arc=none smtp.client-ip=220.197.32.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=zYi8AtKFubJGhxQrf5AZVDxH9A2Ceq38/SIjZMGH2qU=;
	b=P+6kl3qBgUHUdyf0SAIG/8oUUTG7VmcHKTKMPPiGFwrA0kHreKqRgJ4wYGfLC0
	NDl/CbcluIRbMu7sAYENvFQXOgk3tL/DoRGJFBo9E1Nk8MXXvRYrkwmt8Ww1pO1a
	ZE5mjM22WvjC/cex+ll2evc994KlKBtQLRlhYNPWjCU7g=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3n7P1D_9oxEO6AA--.51802S3;
	Mon, 27 Oct 2025 14:23:51 +0800 (CST)
Date: Mon, 27 Oct 2025 14:23:49 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>, Michael Walle <mwalle@kernel.org>,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v6 2/9] dt-bindings: fsl,fpga-qixis-i2c: add support for
 LX2160ARDB FPGA
Message-ID: <aP8P9bUcVki_wIbG@dragon>
References: <20251014155358.3885805-1-ioana.ciornei@nxp.com>
 <20251014155358.3885805-3-ioana.ciornei@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014155358.3885805-3-ioana.ciornei@nxp.com>
X-CM-TRANSID:M88vCgD3n7P1D_9oxEO6AA--.51802S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7KFWUuryDCF48uw18uF4fAFb_yoW8Gr13pr
	yYka98Zas8tr1UCrZYgry8ZF4rCa1kA3Z8Awn8Ar1xu3s0gFW0grWa9a4rZasrAw48Zayj
	qFWjga1kJrWDA3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UhNVgUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIRcbgGj-D-dpfgAA3V

On Tue, Oct 14, 2025 at 06:53:51PM +0300, Ioana Ciornei wrote:
> Extend the list of supported compatible strings with fsl,lx2160ardb-fpga.
> 
> Since the register map exposed by the LX2160ARDB's FPGA also contains
> two GPIO controllers, accept the necessary GPIO pattern property.
> At the same time, add the #address-cells and #size-cells properties as
> valid ones so that the child nodes of the fsl,lx2160ardb-fpga node are
> addressable.
> 
> This is necessary because when defining child devices such as the GPIO
> controller described in the added example, the child device needs a the
> reg property to properly identify its register location in the parent
> I2C device address space.
> 
> Impose this restriction for the new compatible through an if-statement.
> 
> The feature set exposed by these QIXIS FPGA devices is highly dependent
> on the board type, meaning that even though the FPGA found on the
> LX2160AQDS board (fsl,lx2160aqds-fpga) works in the same way in terms of
> access over I2C as the one found on the LX2160ARDB (fsl,lx2160ardb-fpga
> added here), the register map inside the device space is different since
> there are different on-board devices to be controlled.
> 
> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied, thanks!


