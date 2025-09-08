Return-Path: <linux-gpio+bounces-25753-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D874B49639
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 18:54:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 639691C21A71
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 16:54:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE1AE30F93D;
	Mon,  8 Sep 2025 16:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="TcR16sDN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F092FF65D;
	Mon,  8 Sep 2025 16:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757350467; cv=none; b=U59c+1Rg5JP+7WVEOMHHpYTGoGNe+DZOLqxiX+Pn7jje8pVBD86Mi9+nhjWgH/Y6aVCFNKXymTdN0zvvTI8UP2ho+Ew2JhHE7ru6PnKkKL0c1fatvigXBNmvYquHCmj6Yon6P+WQ9Va3To+rmTshfo8Olmj3WKRZNeU6Nz0arUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757350467; c=relaxed/simple;
	bh=DNQXSCld9mY4cJNRu1eQQyiufMsZ8482eVKwT909fPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=trT4B6E6Eknt5/9yLwVDRD4M5zScoHEV+7OP26wXAERxgICjwo+2zpT9Zluug7fM+YJ4gp56cByU+Hrbrrz905VUPeSrWpeSOH97t5OzFBioZKfIzH0J30Xn7sZ00rF3+5lucBnZsI4rwhlN3qw6ECT3Ig+QAmLXDbnUJOgkmSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=TcR16sDN; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=GM5YS0VBx8Kphkepw+zbMrc9QOjuaXqI+BI+rLpHDcI=; b=TcR16sDN44Y2x3ALwDirJzBpup
	LUZUCoTu0QcSQuqWsfB/hRKVEVNeXTi+rG3xMFDHMR6plx0dmlZFbhBYhu9QMIQ+Zu3V9BP1xFVFC
	FBmY5sSZzBTN5nVyDTLXrFizPdwJAdy/RchrrnT7+spz7QKJhgv1n7wZeCE5EPQwlFso=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uvf8B-007gtm-Ma; Mon, 08 Sep 2025 18:54:15 +0200
Date: Mon, 8 Sep 2025 18:54:15 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] pinctrl: airoha: fix wrong MDIO function bitmaks
Message-ID: <583981f9-b2ed-45fe-a327-4fd8218dc23e@lunn.ch>
References: <20250908113723.31559-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908113723.31559-1-ansuelsmth@gmail.com>

On Mon, Sep 08, 2025 at 01:37:19PM +0200, Christian Marangi wrote:
> With further testing with an attached Aeonsemi it was discovered that
> the pinctrl MDIO function applied the wrong bitmask. The error was
> probably caused by the confusing documentation related to these bits.
> 
> Inspecting what the bootloader actually configure, the SGMII_MDIO_MODE
> is never actually set but instead it's set force enable to the 2 GPIO
> (gpio 1-2) for MDC and MDIO pin.

Is the MDIO bus implemented using the GPIO bitbanging driver?

	Andrew

