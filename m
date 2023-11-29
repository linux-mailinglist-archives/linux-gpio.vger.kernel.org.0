Return-Path: <linux-gpio+bounces-650-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD287FD3F5
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 11:19:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 61C3E1C2120E
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 10:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F3671A71B;
	Wed, 29 Nov 2023 10:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="DBRmCOu0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E81210C8;
	Wed, 29 Nov 2023 02:19:44 -0800 (PST)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 9FD92603F4;
	Wed, 29 Nov 2023 10:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1701253183;
	bh=vmbye+7xTc5TAprv8bGCBpYs5zBBQ4aAAXZTaK7F9vE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DBRmCOu0DUrEn4TChU4oz1IFOZzm06cbvip6fGUF5tC+rzfjrlz4OXrApxJVGmZZv
	 f5+mWJIjJ1knMo9A1y8fd9oC6dupwm1vbMEdNKMLnqT8q35G4bUOf9jqodxX53ljKP
	 sXFkd5bfzPBqO9HettROaMgTKrRgeYgV/b93M8F300ujW9wXft+E3zDA7kKMwGDdKI
	 03Jbpntz462NEJqXnZibC2puUH71cA0jZ1fG0mRV2xNK5Z5ix3jZCB8e+WGYx1VNji
	 uRWP9JYMmEnjNUKcUYTUML+iT9t263OU63TXn8v9fAsTACflk4TAzQgV4UCIoo/ID1
	 SCKrSZ2KrYQhA==
Date: Wed, 29 Nov 2023 12:19:05 +0200
From: Tony Lindgren <tony@atomide.com>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
	thomas.petazzoni@bootlin.com, gregory.clement@bootlin.com,
	theo.lebrun@bootlin.com, u-kumar1@ti.com
Subject: Re: [PATCH 3/3] arm64: dts: ti: k3-j7200: use ti,j7200-padconf
 compatible
Message-ID: <20231129101905.GY5169@atomide.com>
References: <20231128-j7200-pinctrl-s2r-v1-0-704e7dc24460@bootlin.com>
 <20231128-j7200-pinctrl-s2r-v1-3-704e7dc24460@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231128-j7200-pinctrl-s2r-v1-3-704e7dc24460@bootlin.com>

* Thomas Richard <thomas.richard@bootlin.com> [231128 15:35]:
> For suspend to ram on j7200, use ti,j7200-padconf compatible to save and
> restore pinctrl contexts.

Hmm are the mcu registers lost too? Anyways presumably you looked at it:

Reviewed-by: Tony Lindgren <tony@atomide.com>

