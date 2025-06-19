Return-Path: <linux-gpio+bounces-21833-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FB0ADFD9C
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 08:24:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 58A827AC9CB
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 06:22:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB9CD1DDC3F;
	Thu, 19 Jun 2025 06:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iHYb75Ev"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982A42459C9;
	Thu, 19 Jun 2025 06:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750314220; cv=none; b=j9FLBuKzRo2TnDhg8ZgYxhhX8zLAUYw9TQZ/JCxtM3tGTIDrzI7C/44wn0qN+KQLNbuXcFWZNuTGZVBBIdKUZcD5+B7aXtzMh3BLHayqVTNMHJ83g98U3vrdNnqnaUU4gMoIBJpqWfWLgEJXinIvkqDqWSzVXh+ffSnnB8Hr4KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750314220; c=relaxed/simple;
	bh=Nn65hSR9UlIemUIeEDX5mj8rkfTymVHYBcs+i3YyeWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R5lk5ZMHMMrL/+hbnLBCL52rSp2lrNW4q6a9b9KChSWc3ReQITclM8NDuzaMd1X07PZWy2GYU7mIz3JXhxugKCXBS6pcQU/WFTnWP4F5+OHrEfOQx68bQoWjZJeWqIxk232pzmN1++K8wQAZ7DAyVU5zr3IVExRuG8Aq3+0wsfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iHYb75Ev; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFF83C4CEEA;
	Thu, 19 Jun 2025 06:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750314220;
	bh=Nn65hSR9UlIemUIeEDX5mj8rkfTymVHYBcs+i3YyeWo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iHYb75EvamCwaN6j5CePBsXnALV4HkuuduAr8g0HZFpX8YPdR1uoVa0Ygq91hAXxU
	 /gmLxnS73RxoEqm/5Sp7znjQuY2jKGNzZcjVv8vSen+zRBemuUj60XIL68k/TbtK6q
	 lGA1kvUB3s1+1G2Xt+Q0iqoiCY9AkNqdQ0EgThBvY+KJHPQgRfynrjSUHwqjprsml7
	 6FK4YzvGnNRNDlfeSBq/7YNnnF6K5/1tYR9HxLbrXOED3kcmGglT1ChGFCH4eWJblg
	 flWbPvfYpiQdzPdmkU5DTwFx16/CBrn0ZiJt6XW71SrBX/jzgXefdsvPR7o80Z5/U6
	 v3AY/rJDqpj2w==
Date: Thu, 19 Jun 2025 08:23:36 +0200
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH RESEND] platform: cznic: use new GPIO line value setter
 callbacks
Message-ID: <t7hcmduglk3wwtx7rjytlywvxd64m4xu4atud6hk7bklp3uc5s@7bkttrzktx43>
References: <20250610-gpiochip-set-rv-platform-cznic-v1-1-30afd2444756@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250610-gpiochip-set-rv-platform-cznic-v1-1-30afd2444756@linaro.org>

On Tue, Jun 10, 2025 at 11:43:58AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Marek Behún <kabel@kernel.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Acked-by: Marek Behún <kabel@kernel.org>

> Nodoby picked this one up for v6.16, resending for v6.17.

Bart, I think you can pick this up via linux-gpio.

Marek

