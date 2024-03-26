Return-Path: <linux-gpio+bounces-4658-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25ABD88D012
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Mar 2024 22:30:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57CDE1C675D4
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Mar 2024 21:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5211313D880;
	Tue, 26 Mar 2024 21:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GwSJ65LM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3CD13D61C;
	Tue, 26 Mar 2024 21:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711488656; cv=none; b=TqkNpF3kDYb7EvrwI68jgcA4laFko/It6x/EiaAEX1rdwXves9XrdMe1t+Q8RaJwRDupbhbaT2ESOPtLSqeftU7SGjiBQf7QkUOQuM45jouzs8VDXPRHpBnL0C+kKMVZRRFsOFW42N1eRUxhZoRSMSvnScWcLLEVxpyB0e/d1zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711488656; c=relaxed/simple;
	bh=t4eVO8xDzDU1Y35LKgvIqWUq1Xt8ynqtLWNZOdQr6Xg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a+J5ssBF8VlbgSSOwQ1PV77IN6TixrFyFkex8i0vsBzRODQ2KnmKOLfe7zK7sw38MmAH7oAw/DUabTfTbZ0Anvf38+XLmZmTMJUWOlc3sgcv9zLm9/UjRGtqV6Aqa2xSYaxaKwdkxCsyQmyHJzCUob/HPSzwwO1mGibPXwTHRbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GwSJ65LM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 522EBC433C7;
	Tue, 26 Mar 2024 21:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711488655;
	bh=t4eVO8xDzDU1Y35LKgvIqWUq1Xt8ynqtLWNZOdQr6Xg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GwSJ65LMOtWa1CJvrvfTXZP594whXeCAnZp/Drs1ECQMoMmoNSwm563U5wzHthtmQ
	 2bJJCbHLDEipof+KwOUlSRAhnfvEfaOeevF7TNOliq6covJ3rmKbsbfcYp+66zLCZg
	 Jhf9eZq12gYx/us8d0ausMk+zXmqvftyFlDcurj8x4CNy+sCt7bYedUFArLGb4xSNv
	 HgEaOR56CfE2Pxuh1Zb3hA20P66yBw11YlFZUWOgpshvuMFRvNwGPkQ3j6LfDeEvkM
	 KdDCY6ZdDHZx5EqNdQgcbj42z5OQ1Mv3S2VuZv7cGi+l9+DK85jfBFaF+vAuKfQy6S
	 6U0h7n+2cZ/Tw==
Date: Tue, 26 Mar 2024 16:30:53 -0500
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Eric Anholt <eric@anholt.net>,
	Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH 1/2] dt-bindings: arm: bcm: raspberrypi,bcm2835-firmware:
 Add missing properties
Message-ID: <20240326213053.GA3562515-robh@kernel.org>
References: <20240326004902.17054-1-laurent.pinchart@ideasonboard.com>
 <20240326004902.17054-2-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240326004902.17054-2-laurent.pinchart@ideasonboard.com>

On Tue, Mar 26, 2024 at 02:49:01AM +0200, Laurent Pinchart wrote:
> The raspberrypi,bcm2835-firmware devices requires a dma-ranges property,
> and, as a result, also needs to specify #address-cells and #size-cells.
> Those properties have been added to thebcm2835-rpi.dtsi in commits
> be08d278eb09 ("ARM: dts: bcm283x: Add cells encoding format to firmware
> bus") and 55c7c0621078 ("ARM: dts: bcm283x: Fix vc4's firmware bus DMA
> limitations"), but the DT bindings haven't been updated, resulting in
> validation errors:

I don't understand. We treat no dma-ranges the same as empty dma-ranges 
(dma-ranges;). If we didn't, *every* DT would be broken.

We should never have dma-ranges without ranges either. 

Rob

