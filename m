Return-Path: <linux-gpio+bounces-30736-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BC4D3ABAD
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jan 2026 15:23:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C4D37303F367
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jan 2026 14:21:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07BE537A4BA;
	Mon, 19 Jan 2026 14:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="CA3py8ft"
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F1B37418D;
	Mon, 19 Jan 2026 14:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768832465; cv=none; b=mWK5wkzP2onZAn0/pTZGd/W1eiKCbio/+DvATUZ8CZ+YJvQD2omewxOQk/0uJSEhMRzRm4shtLXr39VWEjJmdHQTIeyiceJ+RLOSLxfPQAjc0AQOQIN8tFwgNXJwyDpyzSnXryRRaYQD+LiD7IkdTQKJxdHznTI3j3K6ygLImxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768832465; c=relaxed/simple;
	bh=RjyUtJwmG1G4kZbuXRuMcwRIAzdLOCcrAwI3cXKpba8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pSlL838CcymlzERMls7BqZR1ruuZCUFQ/K/NKLo/4amo21fXsdz/FU6CcMCSsuBmsyengj4xgzo73Y61dJDl8xJSkyGc1psCOepr+6jc0m2NGCKrmKrc7/Rx9euNHPHcO49pq5rDSnpvrXRgg/qbbRAwz7KtbSozn4b+gs4zTvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=CA3py8ft; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=c7Ep0GD4eG911kODoOvUPprYM2xLb7geaPpEU8Rcz+g=; b=CA3py8ftIBYki7YqehhBkcUCAE
	Jq7C+1KCwjIrVDFC+GK3VKxuTunuovVb/OOJLH4mvTDrjY9ZYAsq64o/VUCK+zUCJVX18CKCiZgwJ
	nlEuzXZNNYKP51fFNdGzccFRUqUQ3D7Cv9ycIXAkCOtHHRr9Ap3iqOw2o8Cp1r46+4wU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vhq7T-003VPQ-Ln; Mon, 19 Jan 2026 15:20:39 +0100
Date: Mon, 19 Jan 2026 15:20:39 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Andrew Jeffery <andrew@aj.id.au>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	BMC-SW <BMC-SW@aspeedtech.com>
Subject: Re: [PATCH 3/5] gpio: aspeed-sgpio: Create llops to handle hardware
 access
Message-ID: <bb5bdcf2-6bd3-49c7-b3e5-210b7f332137@lunn.ch>
References: <20260117-upstream_sgpio-v1-0-850ef3ffb680@aspeedtech.com>
 <20260117-upstream_sgpio-v1-3-850ef3ffb680@aspeedtech.com>
 <55fbb766-12b5-441a-b06c-d807097e5476@lunn.ch>
 <OSQPR06MB725219B6ED261DBB4E8BC33D8B88A@OSQPR06MB7252.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSQPR06MB725219B6ED261DBB4E8BC33D8B88A@OSQPR06MB7252.apcprd06.prod.outlook.com>

> We did consider regmap. However, llops is intended to abstract not only
> register
> 
> access but also layout-specific bit mapping, which is difficult to express
> 
> cleanly with a flat regmap interface.

O.K. I was just thinking, if you can swap to regmap, you could maybe
then go one step further and use gpio_regmap_register(). But if you
have extra logic in here, that will not work.

     Andrew

