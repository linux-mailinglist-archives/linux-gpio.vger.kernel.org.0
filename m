Return-Path: <linux-gpio+bounces-23088-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 579F2B004CB
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 16:12:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7D7597A85A3
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 14:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DA64270ED9;
	Thu, 10 Jul 2025 14:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="rUZsamgD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492672E406;
	Thu, 10 Jul 2025 14:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752156739; cv=none; b=R28ExULTd6zhcvIm0PgAwPiNc+Rs92jkomNUJRCLOLCK0VoaEOqO09kREDtEkvWxLSlyAuiM6SWLWwCyO+3Hw+kWPVCwyfxQM9GjAClr5pmZZz8sAiV1sn5gXgAzhhhf/Nz/EEr6DmU5FP8sOOLYGIZgODzwdADdIqsuQ0zWHCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752156739; c=relaxed/simple;
	bh=ql+qsMblJWq1ttctCLEWzbsNwI0SJ/8/aQFJdS66+V8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dccp5s68Zw/LYvRgWSbarR931+dL0kkvGBRZYqrFRDgnSYoK2dHU1M6G1/mU4MYeno839N2ttBMHTo4+WPU6zR9aVb/9N6V/9ZtHF4kJQi4w4KY3corsjbI3NLQw14DPwLYIaZip017Ctc7kWtJ2+Lf3461uPSsWKGLyahirLOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=rUZsamgD; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=tTDM+ReYbQNANl3aFS/llf4q/ldyHVh7bI7dWXO8+pg=; b=rUZsamgDkOyi5ReaRFUnBeXRwF
	8yLkt0kON+H7Hh2Z22SSUx26F2ZDuW3yWhKQFWW+jy3Qmv1T8UUf7+W6L0KCimIL3gGgyYJAMFSsu
	ghRX7uGj99gWYL5DJMsejdACTllVwBpXNDYxjTLo706jUr5uFQxOBLd45jJmOCCUAKms=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uZs0O-0017oV-Ku; Thu, 10 Jul 2025 16:12:08 +0200
Date: Thu, 10 Jul 2025 16:12:08 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>, Michael Walle <mwalle@kernel.org>,
	Lee Jones <lee@kernel.org>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 5/9] drivers: gpio: add QIXIS FPGA GPIO controller
Message-ID: <af9b69a7-2e8f-4cdd-a3f3-6375ecfe318c@lunn.ch>
References: <20250709112658.1987608-1-ioana.ciornei@nxp.com>
 <20250709112658.1987608-6-ioana.ciornei@nxp.com>
 <898af9ea-9b90-4d1f-8e0d-a8e0686d72a7@lunn.ch>
 <o5v2xdlrtjcgcd6usrfmtq6qffyigudvx3flhhetnd4ufg2mcx@5tem3jrlpxw5>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <o5v2xdlrtjcgcd6usrfmtq6qffyigudvx3flhhetnd4ufg2mcx@5tem3jrlpxw5>

> The FPGA does have an ID register that we could verify and match against
> the board type that we expect.
> 
> On the other hand, I am not 100% on board with the idea to check this
> from the GPIO driver which teoretically should only touch its one
> register. Maybe from the parent's driver we could do that and prevent
> the probing of children if things don't match up. But this does prove to
> be complicated since those drivers are simple-mfd (for LS1046AQDS) and
> simple-mfd-i2c (for LX2160ARDB). And I don't think it would be wise to
> add some specific board logic into of/platform.c.

My experience is, DT authors will mess up and put in the wrong
compatible. And the wrong compatible might be enough for it to mostly
work, so you end up with deployed systems with wrong compatibles. It
then becomes difficult to actually extend the use of the compatible,
without causing regressions.

Also, checking will catch putting the wrong bitstream into the FPGA.

So if you can check it, do check it, and return -ENODEV.

   Andrew

