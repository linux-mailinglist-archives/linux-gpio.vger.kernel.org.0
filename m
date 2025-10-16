Return-Path: <linux-gpio+bounces-27221-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D92C6BE4DEB
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Oct 2025 19:37:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9938B5E025A
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Oct 2025 17:37:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38BC4217648;
	Thu, 16 Oct 2025 17:37:12 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 568E917C21E;
	Thu, 16 Oct 2025 17:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760636232; cv=none; b=gKm7V/3nvUluG7TtT3RYYFsfsSIcHM028ohkioxJzyctSjN99zBej1R4AEKTtvGBNFkm5J6rwPi+vtmH2G5e0MggIiaieeG01tutwUxzU0+Iu+fYhWjQDWciND/pptyYb2c1PXX/sm9BTkNsrPzin1sWVf/g2gy0q2xay4/aArE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760636232; c=relaxed/simple;
	bh=qOiSbtIWgSkWN5+X5Zp/HcrCX9ktoXzUjhHVqIPAuJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oLi+igXkDMV1jS7Zd+byq9CQo49NyvfhnFPexyXtAQtioDzNqvB18faMQuB7F8TlPmxTbl19+UTcWS/UC/LmLeN8Qp/8Jvd3MnjfHDwi4rUSRgZrET/Vkadqyg2/ddPZrmi7GtLIXYKpujv4D7c7oGh/SAb54Jr3NJIn2yBrSrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D355B1596;
	Thu, 16 Oct 2025 10:37:01 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DEFF83F66E;
	Thu, 16 Oct 2025 10:37:08 -0700 (PDT)
Date: Thu, 16 Oct 2025 18:36:54 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: arm-scmi@vger.kernel.org, linux-gpio@vger.kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: pinctrl-scmi: Support for pin-only mode when groups are
 unavailable
Message-ID: <aPEtEnd3kG_pxWPf@pluto>
References: <0c4bc190-7049-4753-b88e-479a3ff584fc@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0c4bc190-7049-4753-b88e-479a3ff584fc@oss.nxp.com>

On Thu, Oct 16, 2025 at 07:05:21PM +0300, Ciprian Marian Costea wrote:
> Hello,
> 

[CC: <linus.walleij@linaro.org>]

Hi Ciprian,

I will have a better look at this in the coming days ...

...but I think, in the meantime, better if we CC also the PINCTRL
Maintainer Linus Walleij that helped us reviewing also this driver from the
PINCTRL subsystem perspective....

> 
> I’m currently exploring a solution to improve the 'pinctrl-scmi' [1] driver
> so it can better support SCMI platforms that only provide individual pin
> control. At the moment, the driver handles only group-based operations,
> which means platforms without pin groups run into limitations.

...ok

> 
> According to the SCMI v4.0 specification (section 3.11.2.8), both
> group-based and per-pin control modes should be supported. However, on
> pin-only platforms, the current implementation cannot enumerate groups,
> configure pinmux, or assign functions per pin. This results in probe
> failures and '-EINVAL' errors when trying to configure non-existent groups.
> 

...indeed

> I haven’t seen any work in this area yet, but if nothing is in progress, I’d
> like to propose an approach that keeps compatibility with the existing Linux
> pinctrl framework while adding per-pin support. The idea is to detect

...nothing planned or requested as of now that I know...so feel free to propose
your improvements...becasue it is easier to discuss in front of a series :P

Cheers,
Cristian

> whether the platform supports groups or pins-only during probe, and when
> groups are missing, create virtual groups from the DT pin specifications.
> This would allow us to reuse the existing group-based logic while enabling
> per-pin muxing.
> 
> For example, a DTS node could look like this:
> 
> uart_pins: uart-pins {
>     pins = <10 11>;      /* SCMI pin IDs */
>     functions = <2 3>;   /* Per-pin function IDs: UART_TX, UART_RX */
> };
> 
> or:
> 
> uart_pins: uart-pins {
>     pins = <10 11>;      /* SCMI pin IDs */
>     function = <2>;      /* Same function for all pins */
> };
> 
> To make this work, the driver would need to:
>   - Detect capabilities during probe (groups vs pins-only). Can be
> implemented via 'pinctrl_ops->count_get()'.
>   - Create virtual groups when groups are unsupported.
>   - Add per-pin mux/config operations by introducing a 'pin_mux_set()'
> callback in the SCMI core, since currently only group-based 'mux_set' is
> implemented.
> 
> I’d really appreciate your thoughts on whether this direction makes sense
> and if there’s anything I should consider before starting.
> Thanks a lot for your time and guidance!
> 
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pinctrl/pinctrl-scmi.c
> 
> Best Regards,
> Ciprian Costea

