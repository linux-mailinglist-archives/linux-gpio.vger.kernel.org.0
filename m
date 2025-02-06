Return-Path: <linux-gpio+bounces-15416-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C00A2A2D8
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 09:02:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C43A37A2818
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 08:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B5F91FF5F4;
	Thu,  6 Feb 2025 08:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UrQqRqrY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DE11AAA1A
	for <linux-gpio@vger.kernel.org>; Thu,  6 Feb 2025 08:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738828931; cv=none; b=tAGK48ARrbWbukMSv1D4ApT/B3YuHh/SudY3dTfg7FuTWSExQqRgOLNCAnlbuFZ+nCDI6odYQsUlyE9PI2rOMzwpLXKBhk1PDjVt+TTNxs/nThy8aG3j3KxqCxzr6nrHRHNNqwj0sHxwmpEBXMnRwvYihUZ5EuaMit2U/INHBrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738828931; c=relaxed/simple;
	bh=Z4nnfybTEaNZ5Db2rmvJ9oxd3OSrK7LFETmYdjxSSAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W3u4yIaOAUWzC8F+a1WcvZRbiRSSVwfIpW203DzBvApNTeuY98Fgb57P80rsew/eeVeqlxG/tmtt6vRjVKO9Hc3KRxJhghC5ErLZfYV4lJCWScjWYj/gmeQYHHCqTu1O7BkYtKZrL6QJcpyHwKntpdouvwT9RTPuPrOhvbrbp/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UrQqRqrY; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43625c4a50dso3439285e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 06 Feb 2025 00:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738828928; x=1739433728; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nPXgxL3/vPlBnnI2Yfl6MiqQiCTLYqV9DTTBZ0YDUTk=;
        b=UrQqRqrYt1Lj/xIs/hRVnIUwVU9zHE8u4V2pgntdTg6uCsI/hvjWdUX78myakrhFNh
         N1Uxv36toURLn35CMNyr7odZabqCEEXB0b4gkJ2U4Jtrt1azM4qYHHPnMrgqcx3GMieG
         GdfSlxEoQAjZRWV0yCsneTOLDH+wlFT5KuzS78mJa0TuaruwQNXC8A1tg+r7t0GQ5O1I
         /MsePEh9xj25Ydz9Afj4beXb7+0I7SJoI/3zBSO7SnZUfoLWzMIYznrtZgticYJiwdwu
         clQDa1PrF9BUs/yCda0dVut6PxPEKZaKcvXAmoA+8F/S8MZL8k/aZla4OmgKj1r6SuIB
         Zfzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738828928; x=1739433728;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nPXgxL3/vPlBnnI2Yfl6MiqQiCTLYqV9DTTBZ0YDUTk=;
        b=QpE2rieBA4R3jEqZYPAMHReYf3e/sL+YUnG5Rl0rqn4aMowgG472rG9icRxZEUmgOL
         aHVLcUGGdudnlmS9dAcUW+K+K2FPuUjfy+FuFwZBj8IC1JJCyIzwny1noLSN9Jh6bYJi
         ECe7cpV8uHpFkXRJWUxn09jTX3ghFKfTZnielmoK3Wdi7IJgFRWMby33AwAXf6iOU25p
         GQBGWhmYiUdcTEzmEcJHKvtNJGAl7rxrXlx66akPI9r52Hd7v8KNkhXxZjoi0/rYnl0G
         pOzOOBuBAsTTVdTcjvVuqHUn83DgJnpu0FDtUchzzfzx9mMFv6AwTb/Rr/jsOSVDKzFd
         QE+A==
X-Forwarded-Encrypted: i=1; AJvYcCWcffBx/IB+5RiOz9M68+JsuG8gZExpG17YaRR7RIav8WOK6D1lE8Ctox0xe6d+wDoL431s9sNox7PN@vger.kernel.org
X-Gm-Message-State: AOJu0YyyKGtXIo3JDLfpVVm9QhcX0l7cvOtH9TXSGdwktIxouipSqAty
	NQle/+71j/rX8BJfjh7hTKPyM7HQIVYMpoLFfIxaAVs5wx5jNZde8Li2wO7G3yY=
X-Gm-Gg: ASbGnct29Lsq8me40L5KyA/K0HEuL/3AfyTv44MOTbua4n+hv1ZWz3Yiw0LqwThHtwN
	JxpcoNVqcFJBQB22nDFKll71hApcgSWw7olDMC51CHpceD7+ewgXpC/N6YzXorIAtTvwhD0misj
	4eRjLlCuXbcrJ7BsRvz/AtXiDd0oOLXQaLjThSucQMjQAzdWRf3IYnOEqp7nuG1WZYpv5geynvw
	3KViCsLjnhLlTHPdb/rmxKj2cFBeK9JCzXDVR/MFdjHv6jyNjQtfP0mKVOqveqw4QPsVq4Y+QMd
	3+UN3TUn/EHnCPSqGaQP
X-Google-Smtp-Source: AGHT+IEWof4zjE60RbTVNnoMwQe4mseAM8axdA44ewFLN78LsrMf1OHW5JZiuHAT9VHpIyLKYwWl9g==
X-Received: by 2002:a05:6000:1a8b:b0:38c:5b9e:ab83 with SMTP id ffacd0b85a97d-38db48caa3bmr5083926f8f.40.1738828928370;
        Thu, 06 Feb 2025 00:02:08 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4391dfd7d7asm10502945e9.36.2025.02.06.00.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 00:02:07 -0800 (PST)
Date: Thu, 6 Feb 2025 11:02:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
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
Subject: Re: [PATCH v2 2/4] firmware: arm_scmi: Add machine_allowlist and
 machine_blocklist
Message-ID: <230612a4-92ee-4acc-85bf-f1c47dc3c35b@stanley.mountain>
References: <20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com>
 <20250120-scmi-fwdevlink-v2-2-3af2fa37dbac@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120-scmi-fwdevlink-v2-2-3af2fa37dbac@nxp.com>

On Mon, Jan 20, 2025 at 03:13:30PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> There are two cases:
> pinctrl-scmi.c and pinctrl-imx-scmi.c, both use SCMI_PROTOCOL_PINCTRL.
> If both drivers are built in, and the scmi device with name "pinctrl-imx"
> is created earlier, and the fwnode device points to the scmi device,
> non-i.MX platforms will never have the pinctrl supplier ready.
> 
> Vendor A use 0x80 for feature X, Vendor B use 0x80 for feature Y.
> With both drivers built in, two scmi devices will be created, and both
> drivers will be probed. On A's patform, feature Y probe may fail, vice
> verus.
> 
> Introduce machine_allowlist and machine_blocklist to allow or block
> the creation of scmi devices to address above issues.
> 
> machine_blocklist is non-vendor protocols, but vendor has its own
> implementation. Saying need to block pinctrl-scmi.c on i.MX95.
> machine_allowlist is for vendor protocols. Saying vendor A drivers only
> allow vendor A machine, vendor B machines only allow vendor B machine.
> 

I think patches 2-4 should be combined into one patch.  This commit
message is a bit confusing.  I don't really understand how the
"fwnode device points to the scmi device".  I understand vaguely
what that means but in terms of code, I couldn't point to it.

> Vendor A use 0x80 for feature X, Vendor B use 0x80 for feature Y.
> With both drivers built in, two scmi devices will be created, and both
> drivers will be probed. On A's patform, feature Y probe may fail, vice
> verus.

You're describing the code before.  Is it a problem that only one driver
is probed successfully?  I thought that would be fine.  What's the
problem?

It should have a Fixes tag.
Fixes: b755521fd6eb ("pinctrl: imx: support SCMI pinctrl protocol for i.MX95")

Here is my suggestion for a commit message:

  We have two drivers, pinctrl-scmi.c which is generic and
  pinctrl-imx-scmi.c which is for IMX hardware.  They do the same
  thing.  Both provide support for the SCMI_PROTOCOL_PINCTRL protocol.

  If you have a kernel with both modules built in then they way it
  was designed to work is that the probe() functions would only
  allow the appropriate driver to probe.  Unfortunately, what happens
  is that <vague>there is an issue earlier in the process so the
  fwnode device points to the wrong driver.</vague>  This means that
  even though the correct driver is probed it still wants to use
  whichever driver was loaded first so if the driver you want came
  second then it won't work.

  To fix this, move the checking for which driver to use into the
  scmi_protocol_device_request() function.

  Now both drivers will be probed but only one will be used?

regards,
dan carpenter


