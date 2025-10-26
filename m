Return-Path: <linux-gpio+bounces-27613-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C858EC0B459
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Oct 2025 22:28:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 472AD189EE74
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Oct 2025 21:29:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C86A2FD1C5;
	Sun, 26 Oct 2025 21:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BQqicsdq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFF72F692C;
	Sun, 26 Oct 2025 21:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761514112; cv=none; b=dRWzHy7rZwuLXO/ZXRuDZBaHvvGGauUUfNaGfNv3VCrTplF5i1QySLPnGwZNAUBSJGZv0QatgLBprP8yQH+2zkUoVo9GxyJCahLw2Q5QO2JAHai1q8fVaItrzZIL4Y8Uv2g03oXaE4Rchct4oRsPiSSgq8/SwYwSiQkPty73bgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761514112; c=relaxed/simple;
	bh=Pf0vEilCwz0hQJHMy4yrqLc4O/fXn0rb5+vzd5EGJ+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=siElya1Z87XTPkEnP1f3reIA9p7S9Rck3iGLiFznkOgsRcx5PwHOsbrCIdA4wRkmsCq3RM9qUCLk4oKtJJ4X1qtRTQiS7ohGTigGwvDOxmPuJeqm9tup8CEoqTiAX14VQ8ekVLOyzO1iAZuG9FDqNEvwAStZTLEnQrB+vJwg7qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BQqicsdq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C623C4CEE7;
	Sun, 26 Oct 2025 21:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761514111;
	bh=Pf0vEilCwz0hQJHMy4yrqLc4O/fXn0rb5+vzd5EGJ+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BQqicsdqGmSXmqR8Tqoi1ce95FEQfIMB8Ki9DRCojbfkjBvJz18dnsH5oeddS6aIn
	 sy0iU6ir1WV7CXrPmrKf1DwycBwmO2hGm0JUFSitBBzYibPnte60bQpuG6xIo1TC5L
	 eSYrSaIY/xO97P0nSZ2+VBTrOXHjtYnt8GXEups7yHIHh0sSVfb1TndXRPtPZB4a/R
	 kx8FLgGTt3kbnAUllgzazz85OrP0MySaKHiFQ+LOr9mj27ojly2qQhkffFwJMyQk46
	 UVutMy+2sUBjFhDg4O3LLxie63bC/o4CIlTBkZ5iJ91zbQ4byKmwX1ZDQJE1g/8DtH
	 ZwqMZ2rs+ewlA==
Date: Sun, 26 Oct 2025 16:28:29 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Saravana Kannan <saravanak@google.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	Phil Edworthy <phil.edworthy@renesas.com>,
	devicetree@vger.kernel.org, Hoan Tran <hoan@os.amperecomputing.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Serge Semin <fancer.lancer@gmail.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pascal Eberhard <pascal.eberhard@se.com>
Subject: Re: [PATCH v5 2/8] of: unittest: Add a test case for
 for_each_of_imap_item iterator
Message-ID: <176151410618.2971665.11190158330337563608.robh@kernel.org>
References: <20251020080648.13452-1-herve.codina@bootlin.com>
 <20251020080648.13452-3-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020080648.13452-3-herve.codina@bootlin.com>


On Mon, 20 Oct 2025 10:06:38 +0200, Herve Codina (Schneider Electric) wrote:
> Recently for_each_of_imap_item iterator has been introduce to help
> drivers in parsing the interrupt-map property.
> 
> Add a test case for this iterator.
> 
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
> ---
>  .../of/unittest-data/tests-interrupts.dtsi    |   9 ++
>  drivers/of/unittest.c                         | 116 ++++++++++++++++++
>  2 files changed, 125 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


