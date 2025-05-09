Return-Path: <linux-gpio+bounces-19850-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5776EAB1470
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 15:11:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 242D13B0232
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 13:10:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D5F229186D;
	Fri,  9 May 2025 13:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="x2rBzAvE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6B8291869
	for <linux-gpio@vger.kernel.org>; Fri,  9 May 2025 13:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746796256; cv=none; b=TX8WlIy9JVo+Nr27LJN9PEez5ah6t7BOhYGoC5zOOB4BKLhl3bSVeQTQf2WvuV3Q++bpWVcFJrAHPk1RG5kCC8g4QbZgbRlE9G4LVn4SEp5rZpBZjUG+0cKOH2qFWdYK7u4cfRMYNu+hFXYr7Fd9jxlPDQms90CyZO4Tpcpo6hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746796256; c=relaxed/simple;
	bh=oR8kYbfSYqSZzys3+DWjn8paGvWczu9J0GtPLvrNKv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CaNKwUeG63gQzZaOloQYgLQzKzaJIB4TqdqrWtFI6hMvl4ltmSncitiXzPfWRs4Tg62c2CsseaepZDP4WkSFyUA6/vQR9woviv1YHyCsv9kod5ybN8wAZxPnQQmL2kAE5mSB6UHgI12bcfeMnaoTjd1941EfavwOoFHyHrb2U1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=x2rBzAvE; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Date: Fri, 9 May 2025 09:10:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1746796242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=59e1GCro0WbneHQa42anvap4yh18L8Tn1Jdf7L1xdeo=;
	b=x2rBzAvElnG6TGCgmPuydA6mwOtLGxwMcukr7iwnachfNhT3vVHAJ0UOeHsHo9txStuAk6
	9x7Tev7ubxwG4a4LQxi8lf4OYRYE4xsgu284Zgm0RyRwpNqERvC3o5N3H4GJjHFF/MeJ/G
	gnNuCAYAz686/rzZeYj+MgzlWYuZsnTY5qD7VX2XHJ9wJPmHmzsMOCNjgbHYv3S+//ySMH
	rbS4gVEMLpdDoZzHGanW7eBIAXnVeSs9/vrJdDx85bQIuZVlVoZEyeb7QL30LS4JfXZQ70
	k8N6JJeqEQNDs1hyimaxjF7MmrpYYhTyQIVNoJKE4tRBz+G9hZrpMITpmVt8SA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: sven@svenpeter.dev
Cc: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	Hector Martin <marcan@marcan.st>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Lee Jones <lee@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v4 5/9] gpio: Add new gpio-macsmc driver for Apple Macs
Message-ID: <aB3-yygZvdgiE6L8@blossom>
References: <20250503-smc-6-15-v4-0-500b9b6546fc@svenpeter.dev>
 <20250503-smc-6-15-v4-5-500b9b6546fc@svenpeter.dev>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250503-smc-6-15-v4-5-500b9b6546fc@svenpeter.dev>
X-Migadu-Flow: FLOW_OUT

> +	count = smcgp->smc->key_count;
> +	if (count > MAX_GPIO)
> +		count = MAX_GPIO;

count = min(smcgp->smc->key_count, MAX_GPIO);

