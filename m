Return-Path: <linux-gpio+bounces-6227-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD828BF964
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2024 11:13:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7708B2844A2
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2024 09:13:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5F6E74404;
	Wed,  8 May 2024 09:13:04 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36F9776413;
	Wed,  8 May 2024 09:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715159584; cv=none; b=Apj57qTPXv2UpWeDBqkfJiZPAQyb1N6bZTk7fiazMUImnYbL6TIKphS6eX1ddsLLtYBFiFE1un2XGgelP/ogq2AtOMnlsGbsf6NapNcctcvGedXvFPJUbKXhpp4gSB9wbzbWdNVTPpSuw/F9p85ZzfyFdka5Jd6kOewygn1QxGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715159584; c=relaxed/simple;
	bh=PXvNtWgUJVGNNbR9nSHGVSAnGezzc9dFwcc+yLckltQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WEXaYihzK8abNkp6RMuqsocyVPRmXeHNW7cTvCt3a2D0uMVc5nBjGhqn8OXflGZBxW7CSTykR8lmzaF3QsMMMmqDRDAy7vwqVjAfKpQxlffDq+Xoge09WPG73ylh1IAO5FnQ3OfXGL7Gn0Ue5vbgqOWmMGgU0klHUWjnrm+CLsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43E4B1063;
	Wed,  8 May 2024 02:13:28 -0700 (PDT)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7AF043F6A8;
	Wed,  8 May 2024 02:13:00 -0700 (PDT)
Date: Wed, 8 May 2024 10:12:57 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v5 0/3] pinctrl: scmi: support i.MX95 OEM extensions
Message-ID: <ZjtCGXgwgtZ4X49v@bogus>
References: <20240508-pinctrl-scmi-oem-v3-v5-0-6f2b167f71bc@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240508-pinctrl-scmi-oem-v3-v5-0-6f2b167f71bc@nxp.com>

On Wed, May 08, 2024 at 11:32:01AM +0800, Peng Fan (OSS) wrote:
> ARM SCMI v3.2 Table 24 Pin Configuration Type and Enumerations:
> '192 -255 OEM specific units'.
>
> i.MX95 System Manager FW supports SCMI PINCTRL protocol, but it has zero
> functions, groups. So pinctrl-scmi.c could not be reused for i.MX95.
> Because nxp,pin-func, nxp,pin-conf properties are rejected by dt
> maintainers, so use generic property 'pinmux' which requires a new driver
> pinctrl-imx-scmi.c
>

Not a review in particular, but if we decide to merge this deviation, it
must be under the condition that it can be deleted anytime in the future
if this becomes annoyance(like other vendors using this as a way to deviate
from the specification). If we can't agree with that, then we better not
merge this at all.

--
Regards,
Sudeep

