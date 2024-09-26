Return-Path: <linux-gpio+bounces-10471-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D137987A5D
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Sep 2024 23:16:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A098BB24BC1
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Sep 2024 21:16:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D4A1186613;
	Thu, 26 Sep 2024 21:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u1M1gRS4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3376E183CD6;
	Thu, 26 Sep 2024 21:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727385370; cv=none; b=Hp0emmIuUePA0tR9ssrYZkkmcpvyDWIp22K4mMMfr1T3f4wECqjA6SfwVQsUf1gwuFHjONDl/bvdZ9zoy1SdOEKDa4bXn00ef/6NEaspqEkwzCoKsxlVDYxy/jeNX3I20m0lBWlnMaItwXHNs491t2HpbdBZzy9RqHRul6dSpWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727385370; c=relaxed/simple;
	bh=UtnSPoa/rfPJxu9yzCby9GUs+YkJKRJDod5/XoTt8n8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kfcJdzPlipAGp1J7TfLzXQ4HBbZx/sElBqYJKPe0Ll1npo94yHhHtaDWl6gnPs5InPz695vp5HH1inO5j8xNLqVM8x+atxJ6EOmFvhfkOtecjm09ARrkwW7COSujsjidkx4oraDzepCacAtJUcRl/dr0QTomnybWKCQ81jkOVdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u1M1gRS4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A8E4C4CEC5;
	Thu, 26 Sep 2024 21:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727385369;
	bh=UtnSPoa/rfPJxu9yzCby9GUs+YkJKRJDod5/XoTt8n8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u1M1gRS4zEXgjIuvwtzqhdq1GCzP7673b3s0fJ+MYE9D68Nmi063/buFoGEmDDNmH
	 iw0OtLtiTIkjkqAQgxGoDe6Z/BNH9beEPa9352lVbZycYi6lQi7J5r++ynwESJ9AeG
	 gvwJXbXGZU3haGYXK8dTI2PmoGfgHVCE31h9K3dvgQ4/kDvJM8BqG8jL9o1ybhb21L
	 Co0qclaaQgmb46V0pdeD0e5m9Te5Xs9RaFlM+lWGtWBrPNCAWrnXnkx15eS9sWFlfg
	 SyGiIjk34GyQPDFKPtr0ABtlQZaazSsrVoA4ccLi1+150lDV6nWXHysXpiZkZWxxbt
	 H7/Kp6dYHbQVA==
Date: Thu, 26 Sep 2024 16:16:07 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ze Huang <18771902331@163.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-gpio@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: Add support for canaan,k230
 SoC
Message-ID: <172738536551.3022684.2015400552929682489.robh@kernel.org>
References: <20240926-k230-pinctrl-v2-0-a9a36fba4b34@163.com>
 <20240926-k230-pinctrl-v2-1-a9a36fba4b34@163.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926-k230-pinctrl-v2-1-a9a36fba4b34@163.com>


On Thu, 26 Sep 2024 23:57:43 +0800, Ze Huang wrote:
> Add device tree binding details for Canaan K230 pinctrl device.
> 
> Signed-off-by: Ze Huang <18771902331@163.com>
> ---
>  .../bindings/pinctrl/canaan,k230-pinctrl.yaml      | 127 +++++++++++++++++++++
>  1 file changed, 127 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


