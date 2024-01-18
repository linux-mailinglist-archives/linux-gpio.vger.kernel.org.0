Return-Path: <linux-gpio+bounces-2345-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77557831DFA
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jan 2024 17:58:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 789E51C21C9B
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jan 2024 16:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BAD42C6BE;
	Thu, 18 Jan 2024 16:58:15 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6182C845
	for <linux-gpio@vger.kernel.org>; Thu, 18 Jan 2024 16:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705597095; cv=none; b=SpwDk6FGciR5CW5xwdjqSsxOtJZMJSLNAjMQxamHIabGBCVZjeH11Swe2U1vhbUp8Fm1QmWkcJlqbljO54RoWdUfqx5wCFxZZ1Tiq01upM5jhC6AYWcLiMyD3j+J4jKNJ9uKQoY0eS6QVr3JN74wFcLFktdNtB+LdyiIG4EoRo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705597095; c=relaxed/simple;
	bh=QYRlUkW/XpdCNFGIHDOmI1vkPXM8L2eljOqXfzrzFsQ=;
	h=Received:From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=nXZG2qnVsX+Bxv0ukACK3RKr5kc/KFW9Clm3LJQLXzd0li06oIvnC1OwSQ6EKtvyWSaLrhZ6fhyDR1Gio2D+B8QAPa6lMcnwC6dNMUlSVgsDdJw7/K+3Xm0nNxPC/rwrSrvSmW4PG9sp0ymUyRZw3bKnuG7BUad9SupsZWJVHAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-24-108.elisa-laajakaista.fi [88.113.24.108])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id c2b5c193-b622-11ee-b972-005056bdfda7;
	Thu, 18 Jan 2024 18:58:11 +0200 (EET)
From: andy.shevchenko@gmail.com
Date: Thu, 18 Jan 2024 18:58:10 +0200
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lee@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	linus.walleij@linaro.org, vkoul@kernel.org, lgirdwood@gmail.com,
	yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com,
	pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/6] Add cs42l43 PC focused SoundWire CODEC
Message-ID: <ZalYooJxj7Ba0sYU@surfacebook.localdomain>
References: <20230804104602.395892-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230804104602.395892-1-ckeepax@opensource.cirrus.com>

Fri, Aug 04, 2023 at 11:45:56AM +0100, Charles Keepax kirjoitti:
> This patch chain adds support for the Cirrus Logic cs42l43 PC focused
> SoundWire CODEC. The chain is currently based of Lee's for-mfd-next
> branch.
> 
> This series is mostly just a resend keeping pace with the kernel under
> it, except for a minor fixup in the ASoC stuff.


Sorry for the late review, nevertheless, I was alerted by the pin control code
probe function that does something custom with devlinks. This is a red flag,
please find time to fix that.

The rest of the review (since the code is in upstream) is probably good to have
via follow up cleanups.

-- 
With Best Regards,
Andy Shevchenko



