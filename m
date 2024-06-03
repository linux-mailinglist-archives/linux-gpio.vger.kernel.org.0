Return-Path: <linux-gpio+bounces-7077-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 568628D844C
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 15:46:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 889AB1C21E43
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 13:46:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E34AD12D775;
	Mon,  3 Jun 2024 13:46:43 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DE1A1E4AB;
	Mon,  3 Jun 2024 13:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717422403; cv=none; b=g/p1tut8CTiPq/sExAElTJ79m/iNE0wNSz7BxfyicfhLOptqWjdOySmYdsqs9nEcym0L5J7BVWFWGkhX+RNXGzx9XaMKEITr3W6IKZxLEzG72Ao0dG8k034Tbx+81251l5VhxLFWPMesxfWyvZsJbxs/4dDijH5MYgd1J82r0pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717422403; c=relaxed/simple;
	bh=XRP1xecKexsIISxwWxTr4YF0cg8wVxRNcwh8O3EOjk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rufPsiowxiCpPyEuNssHJfhGuEfXi5ukyFATrbWVqepdyZMUrhI8aNWGMRwmjynhKV3cmjrFCrkAfzXwZHf/aCm2HrLEd6POgqveLeKuOoL3sfcvWe3/1e9PRwa2k2sonlmQjj440CI2X6i6sO/dyZgGHA2InKhapKWGidhEvhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D2E851042;
	Mon,  3 Jun 2024 06:47:05 -0700 (PDT)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F09023F64C;
	Mon,  3 Jun 2024 06:46:38 -0700 (PDT)
Date: Mon, 3 Jun 2024 14:46:36 +0100
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
Subject: Re: [PATCH 2/3] pinctrl: scmi: add blocklist
Message-ID: <Zl3JPF1rF2JOal8I@bogus>
References: <20240521-pinctrl-scmi-imx95-v1-0-9a1175d735fd@nxp.com>
 <20240521-pinctrl-scmi-imx95-v1-2-9a1175d735fd@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-pinctrl-scmi-imx95-v1-2-9a1175d735fd@nxp.com>

On Tue, May 21, 2024 at 02:25:58PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> i.MX95 will have its own pinctrl scmi driver, so need block
> pinctrl-scmi driver for i.MX95, otherwise there will be two pinctrl
> devices for a single scmi protocol@19.
>

I am not happy with NXP's we will use SCMI but in our own custom way.
So take one last change to crib about it and hence reluctantly,

Acked-by: Sudeep Holla <sudeep.holla@arm.com>

--
Regards,
Sudeep

