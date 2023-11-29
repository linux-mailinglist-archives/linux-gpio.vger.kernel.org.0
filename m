Return-Path: <linux-gpio+bounces-649-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 482187FD3E0
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 11:17:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1F3E2832F6
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 10:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BB401A5A8;
	Wed, 29 Nov 2023 10:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="fWn81cRx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22D0F10D3;
	Wed, 29 Nov 2023 02:17:08 -0800 (PST)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 5B9DE603F4;
	Wed, 29 Nov 2023 10:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1701253028;
	bh=oE6jtE7oqWTbaOtDsTUgJOlpNSzODuybOTXGW1q0Bjg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fWn81cRxuDVWr9BFGszsg6po1qA7R1aHSxuehDs1p/KU8diPTJdmvAW5h/tWZD3ui
	 RDmI6YvWHfQjYT1dErR4L96OhDXAJ7z/5uD+e7XCLthnFoD8UCuPzyk7Neh+RxEJFW
	 HpwQw9Zeo2LGJrI7iUgEHy7k2eA8nFmcMWNz5qDvz1mzsjMAiPPnccRhGRrfJdx7n9
	 EhHenmYviEa/kPhyXd4uIr55itrraZAWdCeMAl0KQIthYDNrP1GM7Skl9DluhYEZFq
	 mub3F5p4uU93rOZHBDTkTfaxcmOny2wTtkI7sG+CjPv3thX2/vh6vtUwBXL959wqfu
	 F1IJB7umUSJzg==
Date: Wed, 29 Nov 2023 12:16:29 +0200
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
Subject: Re: [PATCH 2/3] pinctrl: pinctrl-single: add ti,j7200-padconf
 compatible
Message-ID: <20231129101629.GX5169@atomide.com>
References: <20231128-j7200-pinctrl-s2r-v1-0-704e7dc24460@bootlin.com>
 <20231128-j7200-pinctrl-s2r-v1-2-704e7dc24460@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231128-j7200-pinctrl-s2r-v1-2-704e7dc24460@bootlin.com>

* Thomas Richard <thomas.richard@bootlin.com> [231128 15:35]:
> On j7200, during suspend to ram pinctrl contexts are lost. To save and
> restore contexts during suspend/resume, the flag PCS_CONTEXT_LOSS_OFF
> shall be set.

Reviewed-by: Tony Lindgren <tony@atomide.com>

