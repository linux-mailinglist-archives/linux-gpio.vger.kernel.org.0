Return-Path: <linux-gpio+bounces-26926-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B752BC85C4
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Oct 2025 11:49:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E96563B4C12
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Oct 2025 09:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA3BA2D321A;
	Thu,  9 Oct 2025 09:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HdOsIVZo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6425E155C88;
	Thu,  9 Oct 2025 09:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760003355; cv=none; b=sbK+lTAwHG994TDJrtqYKrb3spWBCOrHXVpiZynwRtM0kocKv6D2762BiykjgcAX5FsDaudt0hkXEa4yp/tH32dMCwxFk6n5/+zwhVWRyd03Pe6ZDC88afvtGqY37we11zIRqx984owZ7YrysGRRiam56Yqm4ic4fQp4XOxCrLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760003355; c=relaxed/simple;
	bh=qWz+XzUlBtbzZaeMsG7iTfJpGKTGcvhMLsxOvEOnQiM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FiAveyGDstlmB2Z6r+Ej2b8mLjKDv6qmyJZz01jbBHTXpEaIJHjydZw7vN60ZAGgoDe+ZJDXndnvLBlTCdzzgsKEJT3dXCC9QgA7BZzfRGfiVTthN3TuJiizNV5kJ0rq1xYHfPbhl6YVHCe2rDV1TtiPjb+KUuAT7iKXOvh92iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HdOsIVZo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93A06C4CEE7;
	Thu,  9 Oct 2025 09:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760003353;
	bh=qWz+XzUlBtbzZaeMsG7iTfJpGKTGcvhMLsxOvEOnQiM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HdOsIVZomY/ZJeK5vQptAXTWAfsc7xZAbkE4jBhroRXloCj+xpAIZNDHG9WEZopLN
	 MYMIczFMzn3Yn85zN3ZADtFlCu4ynMNK6grKTOAh/n/RTPcIhcCKuVUyNpayWdRslE
	 dzPAXdaqnyqDoxbJx0qyW0PTO5lJKLY2ONRM+6CdeeLd/e030sW+8Xc8QzPhsIJfWo
	 lS4TnSteBGhE2EkBLnOhWjCeBTmcHqzIqmUBlzI++7axKBVJZC6MFAXTQSkOj9OtKH
	 6lqOXOTq3/HZ8QUoM2DL9t1HXg1ac7u6/9KSVyfie/aonZ9lQsaWufrumR0ET4IxZY
	 4SyBS1IYd3mLw==
From: William Breathitt Gray <wbg@kernel.org>
To: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Cc: William Breathitt Gray <wbg@kernel.org>,
	mwalle@kernel.org,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	andriy.shevchenko@linux.intel.com,
	broonie@kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: gpio: gpio-pci-idio-16 regression after LTS upgrade
Date: Thu,  9 Oct 2025 18:49:03 +0900
Message-ID: <20251009094905.223456-1-wbg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <df4857cb-daae-4428-bd93-5878564624c5@nutanix.com>
References: 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2173; i=wbg@kernel.org; h=from:subject; bh=qWz+XzUlBtbzZaeMsG7iTfJpGKTGcvhMLsxOvEOnQiM=; b=owGbwMvMwCW21SPs1D4hZW3G02pJDBnPW343dpm/2u33NeDjzBAT/jzhCrUDijpPU/hM+F+Zf /5RGT61o5SFQYyLQVZMkaXX/OzdB5dUNX68mL8NZg4rE8gQBi5OAZiItxrDb7bHuVM0uDX9V59Y 0FS6ucZu8poCzpRUf4UqzYnZ1yIWZjH8U0ja/+tigDL/D5/3Ca1/pI6fO+LJHcsqKnXxq9m3pDl FLAA=
X-Developer-Key: i=wbg@kernel.org; a=openpgp; fpr=8D37CDDDE0D22528F8E89FB6B54856CABE12232B
Content-Transfer-Encoding: 8bit

On Thu, Oct 09, 2025 at 10:05:58AM +0100, Mark Cave-Ayland wrote:
> On 07/10/2025 09:16, William Breathitt Gray wrote:
> > So the intention I had with gpio-idio-16 was to provide reg_dat_base and
> > reg_set_base to define the input and output bases, and then
> > reg_mask_xlate would do the translation between input and outputs. I
> > think this design is allowed by gpio-regmap, is it not Michael?
> >
> > In theory, gpio_regmap_get_direction should call gpio->reg_mask_xlate()
> > which is mapped to idio_16_reg_mask_xlate(), and thus set reg and mask
> > which then is evaluated at the end of gpio_regmap_get_direction() to
> > determine which direction to return.
> >
> > Is it possible idio_16_reg_mask_xlate() is returning the wrong values
> > for reg and mask?
> >
> > William Breathitt Gray
> 
> The only logic around .reg_dat_base and .reg_set_base in
> gpio_regmap_get_direction() is this:
> 
> 	if (gpio->reg_dat_base && !gpio->reg_set_base)
> 		return GPIO_LINE_DIRECTION_IN;
> 	if (gpio->reg_set_base && !gpio->reg_dat_base)
> 		return GPIO_LINE_DIRECTION_OUT;
> 
> Otherwise it attempts to use .reg_dir_out_base and .reg_dir_in_base
> which are not set for gpio-idio-16 because the GPIO directions are fixed
> and not controlled via a data-direction register. And as these are not
> set, gpio_regmap_get_direction() returns -ENOTSUPP.
> 
> Were you thinking that gpio_regmap_get_direction() should have some
> additional direction logic if both .reg_dat_base and .reg_set_base are
> set, based upon their comparative values?

Ah you're right, I misunderstood the logic in gpio_regmap_get_direction.
So essentially the problem is that gpio-idio-16 has no way of indicating
the direction of its I/O because it's mixed.

The IDIO-16 series lacks a direction setting register, so I think the
proper solution is as you suggest: add support for a get_direction
callback to struct gpio_regmap_config in the same vein as the existing
reg_mask_xlate callback. Then in gpio_regmap_register you can set
gpio->get_direction = config->get_direction in the same way
config->reg_mask_xlate is handled.

William Breathitt Gray

