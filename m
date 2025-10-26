Return-Path: <linux-gpio+bounces-27612-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D73E6C0B447
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Oct 2025 22:26:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 816D13487E3
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Oct 2025 21:26:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8723288C26;
	Sun, 26 Oct 2025 21:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lZcVV1Ky"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783AE13B280;
	Sun, 26 Oct 2025 21:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761513984; cv=none; b=OI5GhRfkb0pZcW4NyhsDaWpJDo8UOwh/7CFejNRtq+ScnaTFcPxtdIxw1H3ZVzRwsvP+/5ZILk0jAhjLHLQLpwM+CxShMf266Jyhr8OjQ4I72QNAFoA8kN2E7+HeUAfUi95TXGQOAN9iULb7uDI5e0jwtxVJznQhuZfhqOdMCnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761513984; c=relaxed/simple;
	bh=WJZiOBKU4l1O78y3i5/vDm2e/3CarU3bwHVvI5zMrbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AqRNfV5WOodiKVrsjC0VnJdlGRdwlyb8efBGOhVx95qoyaYop3n2zTCwCa+W89whLM6a9CT0xldjg62UsEC2hLuGfq6a60krSpQVlJRF4W+ETKVw7a4i65Xym98GNor8A3fM6VC4o1zlHPIHD/bv5iuBorbRs0NOxxwOH7nubIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lZcVV1Ky; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B527C4CEE7;
	Sun, 26 Oct 2025 21:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761513984;
	bh=WJZiOBKU4l1O78y3i5/vDm2e/3CarU3bwHVvI5zMrbw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lZcVV1KyjW8YrM5lgwP2o6M4amFS/Xy+B28Xb9sXgypyqWoCym5hJppnEdAB3wgky
	 zlY7eMJlhJadXnAf4oX125loW1H6/toDqTx/eTpQPVa6m/Tb7qN9HM4e7Lv61wvG5I
	 m0OKaMd3NhTChSv97hZBJyiAbDXPiaELGOCXgeHlXvBisHvCPt7JFImV9vMPyCauWG
	 UL0ic+t/BY7E8atCuSp5pTkKRJDzhfXsoYp5WTwmgaupfl6hKR9GGxa1dqL7rt1/ne
	 WdpvNJ3aX3gP3nc4vdwscddoYFNpnbWA1+jBHp27RkfDCd5bB0PWxSOQn5O3hhn98b
	 tkIEiPNmssjPg==
Date: Sun, 26 Oct 2025 16:26:22 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Serge Semin <fancer.lancer@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Pascal Eberhard <pascal.eberhard@se.com>,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Saravana Kannan <saravanak@google.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	devicetree@vger.kernel.org,
	Phil Edworthy <phil.edworthy@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v5 1/8] of/irq: Introduce for_each_of_imap_item
Message-ID: <176151397945.2969286.6303302888155473201.robh@kernel.org>
References: <20251020080648.13452-1-herve.codina@bootlin.com>
 <20251020080648.13452-2-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020080648.13452-2-herve.codina@bootlin.com>


On Mon, 20 Oct 2025 10:06:37 +0200, Herve Codina (Schneider Electric) wrote:
> for_each_of_imap_item is an iterator designed to help a driver to parse
> an interrupt-map property.
> 
> Indeed some drivers need to know details about the interrupt mapping
> described in the device-tree in order to set internal registers
> accordingly.
> 
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/of/irq.c       | 70 ++++++++++++++++++++++++++++++++++++++++++
>  include/linux/of_irq.h | 41 ++++++++++++++++++++++++-
>  2 files changed, 110 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


