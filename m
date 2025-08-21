Return-Path: <linux-gpio+bounces-24720-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 73165B2F2E4
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 10:53:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00B03A25143
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 08:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 501B32EB863;
	Thu, 21 Aug 2025 08:48:21 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53D1A1E7C18;
	Thu, 21 Aug 2025 08:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755766101; cv=none; b=OTRm01sUmOvOybynKPqEqqO9ieAAUtAyI6Xn1VHpAa4BGoO/WDGPlyNG+Ux7+q47DN6hMLOw2+ZW0eF0NvrWpziNOMBppb4+ttOOjDAFAuHzNDUv22LHoojPGe0VvOxkJWBjt8rjTFf4Ngu4XXIDJ0WvB+GN6Za70nWUeCKzY48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755766101; c=relaxed/simple;
	bh=IMOa8t3nVo4bfGRhvQTHbfKykjUGaIixdKnPegiAYkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CDcIAMdOLL2DYhNa2qdhFAGnNadYE2ybrbIo46JNX5F3nCpxMow8V3JetA6jN8/xyoPYEqiiOV6VKY7qtoU5F/aazOS26fE6YpfUK4NAnBlYOMfNaJSvf6kCyPQ1hchbIopirDiswSI5VqyFwzhV2Z7Cgsa8gPppWTHRWhlIxLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7FD7A168F;
	Thu, 21 Aug 2025 01:48:10 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 523EE3F63F;
	Thu, 21 Aug 2025 01:48:17 -0700 (PDT)
Date: Thu, 21 Aug 2025 09:48:15 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: AKASHI Takahiro <takahiro.akashi@linaro.org>,
	Michal Simek <michal.simek@amd.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, peng.fan@oss.nxp.com
Subject: Re: [PATCH RFC v2 5/7] pinctrl: Delete
 PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS support
Message-ID: <aKbdT3D7YgBvkSc5@pluto>
References: <cover.1753039612.git.dan.carpenter@linaro.org>
 <bbe178af-62d9-4ac1-b089-09a7ab14d36b@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bbe178af-62d9-4ac1-b089-09a7ab14d36b@sabinyo.mountain>

On Sun, Jul 20, 2025 at 02:39:09PM -0500, Dan Carpenter wrote:
> The argument for PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS is supposed to
> be expressed in terms of ohms.  But the pinctrl-scmi driver was
> implementing it the same as PIN_CONFIG_OUTPUT and writing either a
> zero or one to the pin.
> 
> The SCMI protocol doesn't have an support configuration type so just
> delete this code instead of fixing it.

Wouldn't this risk to break any deployed system which already happen to
misuse this ? I am thinking especially of the guys who have actively
developed this driver and the related SCMI server, like EPAM and NXP ?

+CC Peng@NXP

Thanks,
Cristian

