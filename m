Return-Path: <linux-gpio+bounces-6337-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0355D8C41D1
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2024 15:24:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD42D1F22B7E
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2024 13:24:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CD88152195;
	Mon, 13 May 2024 13:24:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFF751514E5;
	Mon, 13 May 2024 13:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715606686; cv=none; b=Dyn1Z+ZlL8seiVX2A//Q+WaC7hfVfZaHoUOsEtAY+DGX6D6HME257LTqWC6CWMV+9QkbIn7iPEWLtOmsu6YYGglS2IyMQS33mKF1SiwOaJK33P7kqUS+BQ3TnmYpS+qQUfyvEFYTB4/g85sdaylh2r9UIfQiWYbcXCuRkhjFSOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715606686; c=relaxed/simple;
	bh=/0f/9NJPEz9XROE4twEmI/N9FBspLI3sqJzJ1VENxgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WfF5SfQv9bewzbHjBgYgdwBqraYF2s7CL/BLUwfaHonaztBJBOLZ4g2Mj2yaczUZw75Fm375YHpPqLJQHG7gTpmuuPMKLN6RbGa8ASJnJi1KqqfF+Ot/xo1+C/qnQwWAhM1rWivGXV5oXao/kYS2TytIJWAjXg8He74NytfX1Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9FAB91007;
	Mon, 13 May 2024 06:25:09 -0700 (PDT)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B8603F7A6;
	Mon, 13 May 2024 06:24:42 -0700 (PDT)
Date: Mon, 13 May 2024 14:24:39 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
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
Subject: Re: [PATCH v6 0/3] pinctrl: scmi: support i.MX95 OEM extensions
Message-ID: <ZkIUl2SoCICsZy7Z@bogus>
References: <20240513-pinctrl-scmi-oem-v3-v6-0-904975c99cc4@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240513-pinctrl-scmi-oem-v3-v6-0-904975c99cc4@nxp.com>

On Mon, May 13, 2024 at 07:45:23PM +0800, Peng Fan (OSS) wrote:
> Hi Sudeep, Linus
>   Is it possible for you to pick up this patchset earlier if no major
>   comments?
>

FYI, it is the start of the merge window for v6.10. Any new feature
planned to be merged for v6.10 must be already in linux-next and anything
else need to wait for v6.11.

In short, this is not a v6.10 material and please wait until -rc1.

--
Regards,
Sudeep

