Return-Path: <linux-gpio+bounces-18242-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 612C0A7C159
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Apr 2025 18:14:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5F261899F5D
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Apr 2025 16:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25811207DF0;
	Fri,  4 Apr 2025 16:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JJ2T88nE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36EA1FECAA;
	Fri,  4 Apr 2025 16:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743783133; cv=none; b=NyWpHTA6e6bB+prLhefLneOhG2yKUm2pyEx0zsf5KmQutPDBCx6uHFASF8Oa7QmOn9GOcSOT4wAgysrgYJCeGyVtDVQsP5ElTwx+G46deHGr4Z52f5rdeifUVPi3IJ8V3lVbVaZ8RSboc+4VVVLSSksnxv+mPJcEgl9doVVmwoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743783133; c=relaxed/simple;
	bh=fKdvnEi5tKN2kAqSfzeL2P8T16EASbCOVKXOoadOa48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J9O4PzT8yCLs837onQ8av7mUzuyzcUGmn3QM3JEoex1ai+Dq4G0ts6n1JBWoCDAtWuk44DYlPlUBLRqLOnyv0WdunADY4Nw8qacrY3Xmz4Uhtn7f6pJS1EnqUsyD2KYymSvpy9fWKK3RpX1MimisIWwJ6ZHcPlVOicx4Vc4jVZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JJ2T88nE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15AB9C4CEDD;
	Fri,  4 Apr 2025 16:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743783133;
	bh=fKdvnEi5tKN2kAqSfzeL2P8T16EASbCOVKXOoadOa48=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JJ2T88nE+N/4gXh74yoEu//aq/OHl8dvCdl0TPcxIbnWZJM9FRHSSVmaweRJxDDMV
	 T6EXwUrg6hzI3Pr1RhAfohxPtg8v37oME0WFOt0V45crZsI07MMiuGZKvPhHbLUOv/
	 IGpj9aw69Bf3A+FiGYKC4bFCXxdRdGrzZRx8Ghqw4QEAbLePIvZHkj+H0Aw3+TPqqF
	 3lYOzpZVCKoFz+pdWz+R0SXqyZXY+qjpmvR+rUETQckrr7oBxPAQOWaZd31XKBgoOI
	 eILRp22CLBhUUWmK6gZxSZvfOMb3z0O//AoyFub+cNPnioa3Ss6oykbYZYlGg8tdon
	 /1PjQiG1pRjUw==
Date: Fri, 4 Apr 2025 11:12:12 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Mubin Sayyed <mubin.sayyed@amd.com>
Cc: krzk+dt@kernel.org, linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	dlemoal@kernel.org, cassel@kernel.org, p.zabel@pengutronix.de,
	brgl@bgdev.pl, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, conor+dt@kernel.org,
	linus.walleij@linaro.org, radhey.shyam.pandey@amd.com,
	linux-ide@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	michal.simek@amd.com, git@amd.com
Subject: Re: [PATCH] dt-bindings: xilinx: Remove myself from maintainership
Message-ID: <174378313091.1531760.13963641881686821013.robh@kernel.org>
References: <20250403060836.2602361-1-mubin.sayyed@amd.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403060836.2602361-1-mubin.sayyed@amd.com>


On Thu, 03 Apr 2025 11:38:36 +0530, Mubin Sayyed wrote:
> As I am leaving AMD and will no longer be maintaining
> these platform drivers, so removing myself from maintainership.
> 
> Signed-off-by: Mubin Sayyed <mubin.sayyed@amd.com>
> ---
>  Documentation/devicetree/bindings/ata/ceva,ahci-1v84.yaml        | 1 -
>  .../devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml       | 1 -
>  Documentation/devicetree/bindings/reset/xlnx,zynqmp-reset.yaml   | 1 -
>  Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml           | 1 -
>  Documentation/devicetree/bindings/usb/microchip,usb5744.yaml     | 1 -
>  Documentation/devicetree/bindings/usb/xlnx,usb2.yaml             | 1 -
>  6 files changed, 6 deletions(-)
> 

Applied, thanks!


