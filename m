Return-Path: <linux-gpio+bounces-24718-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF81B2F286
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 10:42:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C49AD5E2828
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 08:38:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 444282E92C4;
	Thu, 21 Aug 2025 08:38:37 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C40C2D3ECD;
	Thu, 21 Aug 2025 08:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755765517; cv=none; b=cbXxx6Hw7/WTK6TOf1ABl3eW+s0ha8SiUoxpvjPTU4/0iN7/vbi5hWXdNod2ELcaHUDK7S+cwPVTq9sQlUmbqea9TDqv8Avc0hgAXzTwO88FBPksZ17GwbU4nzCO6yVamz8hoLhKayDKC/Zz+y9CdosmEW/PExVk/WfxR0r/SdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755765517; c=relaxed/simple;
	bh=Eto8zQWiMkJKCjzWWAeZLR/abd4jPsptYolsTYjDnKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S/n1wuvG+ft/tj46yC8E710gvYY3x0LRX8e49MnPXvHuckUR+13vkunv5MnV83xlG1zQANJylaDFQ5qRvhFHnFT13ywrlv/DmyPfDx171X63H/DYIqiqkdjZ03Jifb5B/WeMdnEZv+eOC+xKfifvDkH615VJ/ZT+Zpt3qconcwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F9F2168F;
	Thu, 21 Aug 2025 01:38:26 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B5D673F63F;
	Thu, 21 Aug 2025 01:38:32 -0700 (PDT)
Date: Thu, 21 Aug 2025 09:38:30 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	AKASHI Takahiro <takahiro.akashi@linaro.org>,
	Michal Simek <michal.simek@amd.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v2 4/7] pinctrl-scmi: add PIN_CONFIG_INPUT_VALUE
Message-ID: <aKbbBrFkTNuRArcN@pluto>
References: <cover.1753039612.git.dan.carpenter@linaro.org>
 <6f732f53-7e00-4f0d-82a3-480bc81497bd@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f732f53-7e00-4f0d-82a3-480bc81497bd@sabinyo.mountain>

On Sun, Jul 20, 2025 at 02:38:59PM -0500, Dan Carpenter wrote:
> In SCMI the value of the pin is just another configuration option.  Add
> this as an option in the pin_config_param enum and creating a mapping to
> SCMI_PIN_INPUT_VALUE in pinctrl_scmi_map_pinconf_type()

If this is the case, should not this commit have also a Fixes tag ?

Cheers,
Cristian

