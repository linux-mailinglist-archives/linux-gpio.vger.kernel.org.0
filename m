Return-Path: <linux-gpio+bounces-24721-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B66B2F2F6
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 10:55:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3946D5E22C6
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 08:50:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF3312ECE87;
	Thu, 21 Aug 2025 08:50:52 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FF382EACF9;
	Thu, 21 Aug 2025 08:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755766252; cv=none; b=n6UH+oNmdfnhNRIvUci0LtOcQYxwtE7hepH3xxQVc8GyzVT7j3fIriiRt0QqFzY5zw85E16bOMOrzsSOusty7WiPHXK6LrLsu/TI1gE3cs4+wcpy6a+k7t32zm1bCn7pDnE4zQOK4aH/1q7obtz0RIs8kF/V2x5vAG3H/AFF/lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755766252; c=relaxed/simple;
	bh=kT4d4IVeF7vdxKC3lEeqNlkmFN4f81zYWRkjhthO6Po=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SW94YX0xDYlV3Obu7U9le2zkQmI/RzuVI6B8JnK9wWOSfB+fS2blHY+0JVKgMAyT2s4u8fAMNY/OGPBiwEcvcaX0mL1UBWCdOKQmS084SVt1pkBAqHYBz3Tm8OzAlr3rB7dLeB1t+q+t+u/Sqwhv3knNC75/aS8GXqDC2jcakEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30BDA168F;
	Thu, 21 Aug 2025 01:50:42 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1FE883F63F;
	Thu, 21 Aug 2025 01:50:49 -0700 (PDT)
Date: Thu, 21 Aug 2025 09:50:46 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: AKASHI Takahiro <takahiro.akashi@linaro.org>,
	Michal Simek <michal.simek@amd.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v2 7/7] pinctrl-scmi: remove unused struct member
Message-ID: <aKbd5uiF0ccUU3X3@pluto>
References: <cover.1753039612.git.dan.carpenter@linaro.org>
 <27a80ed0-65a3-4a41-994e-9c2d3bb76b54@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27a80ed0-65a3-4a41-994e-9c2d3bb76b54@sabinyo.mountain>

On Sun, Jul 20, 2025 at 02:39:13PM -0500, Dan Carpenter wrote:
> The ->nr_pins is not used so delete that.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/pinctrl/pinctrl-scmi.c | 1 -
>  1 file changed, 1 deletion(-)
> 

LGTM.
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian

