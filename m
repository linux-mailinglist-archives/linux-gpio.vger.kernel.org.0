Return-Path: <linux-gpio+bounces-18109-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56233A75F2C
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Mar 2025 09:03:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D371167AAE
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Mar 2025 07:03:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5A3D1A5BA4;
	Mon, 31 Mar 2025 07:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="QM09gOPl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5904D3FFD;
	Mon, 31 Mar 2025 07:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743404630; cv=none; b=UHuEd4Z2l2t8w9AYRxiub2GO9uYXzAAY2taewk18UZayRTCrEBSJbJo5GbtXAd8q0bfMCwzvr8EFZUXUYnG9V9k3QN1AOqHCFXX/rLt/sBvQ7I/7FktfKwyx+ssx1ArVy7m+OKT0FStW7UOGNNaEvWKwPWeYAZ44gNnW5mXgj6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743404630; c=relaxed/simple;
	bh=uh0Kdg9+2/RZobH1vJXwPomYg/ddyoVt05GywxqlLco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JU8FGsZ/i7WjToAF9FRD3v0iPHm99p+uqtPHcPrIY43jrTgoCZxI8QdrZRm1LZ2332FhZ8Yiy+7EjKnC6pi+he29S7emk0fP+cYBycOcMTHZuIU8HhCmcd+NtwFGajpDzBmQEtDO1gZ+h5FvtJio7La/GgKNccygimeT6RZGOGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=QM09gOPl; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from francesco-nb (31-10-206-125.static.upc.ch [31.10.206.125])
	by mail11.truemail.it (Postfix) with ESMTPA id D07A01F928;
	Mon, 31 Mar 2025 09:03:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1743404625;
	bh=iUrJsyAGZWwv9LZe9IW16HfAiP9jnMfqvzb8gtrWOMo=; h=From:To:Subject;
	b=QM09gOPlLwwKt8C2yM+uPJN4jB75qFHtYEkY/AHYjhb8JoTm2+0U1Xlsk8JmuFgKW
	 iGUlfFxyWD7qrLG3BZN2UUtrS0cFv3VksFX8kqszWRFvdIFTUP8D9YUWeATb4yW89v
	 hRK9PopZN7uehojCb4smnEvWxpXSoNSnM2YPKSXGJfN6BxOFl7Ks+rTpFNeXi9HQ9M
	 aDn+ZC5yuRLC0xqmoqNPY49GjcFwT/vlixwx562G6mmCeiPgKiApaG3XR7kjXel6Nq
	 1/9nulO01ytSDCdosZ60t5EHVyYPsXXlV+DZJwa2Vf+c2Aa8wjz54UhvaE4wK3ifEx
	 IfctCdx/qcYRw==
Date: Mon, 31 Mar 2025 09:03:40 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v1] dt-bindings: gpio: pca95xx: add Toradex Embedded
 Controller
Message-ID: <20250331070340.GA13824@francesco-nb>
References: <20250328122917.43273-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250328122917.43273-1-francesco@dolcini.it>

Hello,

On Fri, Mar 28, 2025 at 01:29:17PM +0100, Francesco Dolcini wrote:
> From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> 
> The Toradex Embedded Controller IO16 is a 16-bit I2C I/O expander
> implemented using a small MCU.
> Its register interface and behavior are compatible with the PCAL6416.
> 
> Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>

Please ignore this patch, I'll send soon a v2.

The issue with this patch is that the compatible is too long, we are
going to re-use "embedded-controller" prefix for other devices and this
creates clashes with the i2c compatible match fallback function
(i2c_of_match_device_sysfs).

Francesco


