Return-Path: <linux-gpio+bounces-15760-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D05BA31019
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 16:46:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28884164359
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 15:46:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C68B9253B50;
	Tue, 11 Feb 2025 15:46:44 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2145B253B52;
	Tue, 11 Feb 2025 15:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739288804; cv=none; b=Z+Chqv6VMFcbnohFU9JtlV6gnvFPENWHxuY3HPdYPiCyKltuQFpOQnwt70IcaXLilZ1PryR6qwU+OkV+Pccdk23oeFQxnslYFgHwC8M9HgbjDzvYRyIzMqdAPB7S4KtWOzKyiscIRZmq69LoL6ebDldgcM0+4io486bTW31ua44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739288804; c=relaxed/simple;
	bh=A3C3yEPn57VgNhxf4oOl9XY80884wiJMvHRdZr8mLns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MZXryoGOf5VUmj+IPUGDufVycS9jJzkaRwOqC6zJJXHX8X+q5ulESBqhkuzNy7yC6Mw8CcfKid3MuN94WLEBmBk7YtSr9MI0WTEa+2sUs2SIHNaKkElJ0X6b9jPWWEIyOagXLrpsnvSLBeJiM5WZxnfpP0x6FpUGeLWMwfujfj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C80B013D5;
	Tue, 11 Feb 2025 07:47:03 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A34153F5A1;
	Tue, 11 Feb 2025 07:46:39 -0800 (PST)
Date: Tue, 11 Feb 2025 15:46:36 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Saravana Kannan <saravanak@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	"Aisheng Dong" <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [PATCH v2 2/4] firmware: arm_scmi: Add machine_allowlist and
 machine_blocklist
Message-ID: <Z6tw3HjhI8to4c-E@bogus>
References: <20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com>
 <20250120-scmi-fwdevlink-v2-2-3af2fa37dbac@nxp.com>
 <Z6Slq4KjS_RJ3ItB@pluto>
 <PAXPR04MB8459A3750512708D2972687388F22@PAXPR04MB8459.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8459A3750512708D2972687388F22@PAXPR04MB8459.eurprd04.prod.outlook.com>

On Mon, Feb 10, 2025 at 01:19:14PM +0000, Peng Fan wrote:
> 
> I just have a prototype and tested on i.MX95.

You didn't answer me @[1]. How can we disable it for perf/cpufreq if there
are users already. I will look at the code once I am convince we can do that.
For now, I am not. I am worried we may break some platform.

-- 
Regards,
Sudeep

[1] https://lore.kernel.org/all/20241227151306.jh2oabc64xd54dms@bogus

