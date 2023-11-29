Return-Path: <linux-gpio+bounces-653-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FAC7FD464
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 11:38:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91DB62834E2
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 10:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 129251B29B;
	Wed, 29 Nov 2023 10:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="dd96a4lx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFF2D1BDD;
	Wed, 29 Nov 2023 02:37:54 -0800 (PST)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 476FD60514;
	Wed, 29 Nov 2023 10:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1701254274;
	bh=PZf6YQTupqFw4W6ycNWkH2Y3oi4tDcDahoqNRd4oPAg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dd96a4lxNRCNkK9yNewLCH1VsdJ9qkKvd2m28A0GABSYsFx85rWBW9zVA4jBs/90M
	 T8KqspvjNIduPFNhMRAHv8FfA3XzhPAwquakjhNCy+bkZgLK23RHa2FSvXPHcboR85
	 E2+EkDYSbwPfWs1zOe5lTjSwWWge8JCHWe0hmArWGdYcR5l29zz/s1HaA5wEK08XM8
	 Myzm3ChW8DnJaCcod0ENMsj74fv9mPSHH3eQhf0vyRKw5uSToOrFGpMYSjBXAl6YXU
	 RRQx+a9F5aW7QwBRRQ8CntGdIkIR8Q8BWgENf261cIC7HDJELWJxffp0Kwea3VL1g8
	 Y5WyLMTdS0pow==
Date: Wed, 29 Nov 2023 12:37:15 +0200
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
Message-ID: <20231129103715.GZ5169@atomide.com>
References: <20231128-j7200-pinctrl-s2r-v1-0-704e7dc24460@bootlin.com>
 <20231128-j7200-pinctrl-s2r-v1-3-704e7dc24460@bootlin.com>
 <20231129101905.GY5169@atomide.com>
 <9806d838-3eb8-406c-8ef9-f75ebe664078@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9806d838-3eb8-406c-8ef9-f75ebe664078@bootlin.com>

* Thomas Richard <thomas.richard@bootlin.com> [231129 10:32]:
> Thanks for the review.
> Yes the mcu registers are lost too, as the SoC is fully powered-off.
> And I did the test to confirm.

OK thanks for confirming it.

Tony

