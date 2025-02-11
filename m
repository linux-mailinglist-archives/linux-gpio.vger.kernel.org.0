Return-Path: <linux-gpio+bounces-15764-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5616AA3127F
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 18:13:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E636B7A2E3E
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 17:12:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 864CD262150;
	Tue, 11 Feb 2025 17:13:29 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06F77261397;
	Tue, 11 Feb 2025 17:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739294009; cv=none; b=jCpkVtI4g4rEh34eNOWz5sOy8M+iRGGqdAPJQWYCCDGdBn1NV6CZvRk4Fhj1WtKJMP6pQMjREuMyUZed0iM9da+mk1nvPCv7qD0eukx69j4lg34IBoilnrC1lMNHkMnN9OJn/6AicDG/fUdRh0kHmSgaHdf2zaQ0yybc3Qr53Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739294009; c=relaxed/simple;
	bh=BZ+YpgMYrYtDrJkujzjcM2WQZLt5/UaLnQfYvjtyUvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HZvFOC/MWsokwSLbG7PQxbsev4QoSFkCETu/eUuUtRXtJSsmYork4YH1kN081UVfVtyNc7zM0xA6onzmqX9pjYIaAI+U3rY6wSMULYKTz8JId3bqyGcRJj8rhSGoK17o4QRu4xUyU5v9LyFjGA7d2/mgJEzqJLzPBLIFKCiEh4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A8BF013D5;
	Tue, 11 Feb 2025 09:13:48 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8AD313F5A1;
	Tue, 11 Feb 2025 09:13:24 -0800 (PST)
Date: Tue, 11 Feb 2025 17:13:21 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 1/4] firmware: arm_scmi: bus: Bypass setting fwnode for
 scmi cpufreq
Message-ID: <Z6uFMW94QNpFxQLK@bogus>
References: <20241225-scmi-fwdevlink-v1-0-e9a3a5341362@nxp.com>
 <20241225-scmi-fwdevlink-v1-1-e9a3a5341362@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241225-scmi-fwdevlink-v1-1-e9a3a5341362@nxp.com>

On Wed, Dec 25, 2024 at 04:20:44PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Two drivers scmi_cpufreq.c and scmi_perf_domain.c both use
> SCMI_PROTCOL_PERF protocol, but with different name, so two scmi devices
> will be created. But the fwnode->dev could only point to one device.
> 
> If scmi cpufreq device created earlier, the fwnode->dev will point to
> the scmi cpufreq device. Then the fw_devlink will link performance
> domain user device(consumer) to the scmi cpufreq device(supplier).
> But actually the performance domain user device, such as GPU, should use
> the scmi perf device as supplier. Also if 'cpufreq.off=1' in bootargs,
> the GPU driver will defer probe always, because of the scmi cpufreq
> device not ready.
> 
> Because for cpufreq, no need use fw_devlink. So bypass setting fwnode
> for scmi cpufreq device.
>

Not 100% sure if above is correct. See:

Commit 8410e7f3b31e ("cpufreq: scmi: Fix OPP addition failure with a dummy clock provider")

Am I missing something ?

-- 
Regards,
Sudeep

