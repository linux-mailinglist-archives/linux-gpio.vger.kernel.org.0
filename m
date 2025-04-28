Return-Path: <linux-gpio+bounces-19375-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 552A0A9E82E
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 08:29:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0A0D1897718
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 06:29:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17BFB1B2186;
	Mon, 28 Apr 2025 06:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ERSoUdmX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86D833CA
	for <linux-gpio@vger.kernel.org>; Mon, 28 Apr 2025 06:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745821767; cv=none; b=Bd+vBl6qD0dmhmfz70gA2c8dYQ0Ccv0ypZWbtNYTHDbD6IWQWpPZWqBq1CxX22wbqXYUND2AllwbZ/NcMBRVNw/hfthcyDcRw8W45HLKjP7AbRL6qY3G7qZWDExI4bD7DSPUcC2HB60ECo9VPlYN5wnw8+kuhPLiuNSGca3m7pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745821767; c=relaxed/simple;
	bh=0kJMU/ZnzxIiXi+AHWGp0cT5xcN8hlb7dOPGaPQC7kI=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:In-Reply-To:
	 References:Subject; b=tUNtlMJKueo3F+08K6RW21N3QPD1099kyI1TOTvDZITYb1GU4QrPn7zIywlL8z/nlQVMkM+grwijYPcoA+wkfDQzOuOxEU2XLnwwreEASUnPGw4i/8zdG/0OYK/SiUq6w+MlI03rgMe05GlnQJjLcIbWK+MNsEyQmY++HXFxtrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ERSoUdmX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43420C4CEE4
	for <linux-gpio@vger.kernel.org>; Mon, 28 Apr 2025 06:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745821767;
	bh=0kJMU/ZnzxIiXi+AHWGp0cT5xcN8hlb7dOPGaPQC7kI=;
	h=From:Date:To:In-Reply-To:References:Subject:From;
	b=ERSoUdmXapKTL2ocS6Ysp/ulOHavu5jYUzrPgYOkHY0MYyW8CA4H76J427PbrNMm6
	 ca/1XOPYJNOKUV+4Q3tDNZNRAsNO7H5PDfVrv8vWxVcLPAMvgoJbwCGRv1pfY0EIJi
	 8BM6YS9weksV4+8B1yLf+7zAXmb1KGF2zZ8wOJLVZPoZ5HsiNU+qjOh/PTKPvT31sK
	 f5CL/6wupC0HFShzYvtcOTyguIEjDe4RREDlqLa6GV+OaJro/RnDSL/oTr42vfpEJD
	 hCwYOhzmfRNdJcRK52c1CBpmREYGKf0KVIPPIUyTKaLJqRodN0w3BYaYfIKQIp9P/U
	 Q7QHAZ0E9zI2g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 383F43806651
	for <linux-gpio@vger.kernel.org>; Mon, 28 Apr 2025 06:30:07 +0000 (UTC)
From: Andy Shevchenko via Bugspray Bot <bugbot@kernel.org>
Date: Mon, 28 Apr 2025 06:30:22 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: linux-gpio@vger.kernel.org
Message-ID: <20250428-b220056c19-cb974beb0bec@bugzilla.kernel.org>
In-Reply-To: <20250427-b220056c18-04212d3d3a26@bugzilla.kernel.org>
References: <20250427-b220056c18-04212d3d3a26@bugzilla.kernel.org>
Subject: Re: PixArt touchpad not detected due to wrong pinctrl
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: GPIO/Pin Control
X-Mailer: bugspray 0.1-dev

Andy Shevchenko writes via Kernel.org Bugzilla:

(In reply to Guido Trentalancia from comment #18)
> Andy, the patch that Ariel provided did sort the issue of I2C PIXA touchpad
> detection, although it's pretty clear that it uses duplicated pin numbering
> that needs proper grouping and ordering within the existing communities.
> 
> So Ariel intuition sounds correct to me, in that the pin definitions for I2C
> SDA and SCL lines are missing in the Alder Lake pinctrl driver.

> From an end-user point of view it's illogical and not intuitive that one has
> to use a kernel module targeting another chipset in order for I2C device
> detection to work properly.

It's how the hardware world works like it or not. Yeah, same code-named hardware can use different IP blocks in different revisions. This is a headache for users, I agree, but I can't do anything about this.

> Steps to reproduce:
> 
>  - grab an Intel Alder Lake based laptop using the PixArt touchpad from the
> list 
>    provided at:
>    https://linux-hardware.org/?id=ps/2:3848-3848-pixa3848-00-093a-touchpad
> 
>  - build a kernel with the pinctrl-alderlake module using the
>    CONFIG_PINCTRL_ALDERLAKE kernel configuration option: this is what a
> normal
>    end user does
> 
>  - install the newly built kernel and reboot
> 
>  - start an X session and realize that the touchpad is not working or
> otherwise
>    use "dmesg | grep -i input" to realize from the kernel log that the I2C
>    touchpad has not been detected

Okay, this part is clear.

> Steps to resolve the issue:
> 
>  - apply any of the patches provided in this bug report

This is totally unclear. The list of pins is defined in the specification, the change like proposed messes things up with that. I suspect there is something else is going on here.

>  - rebuild the kernel, install it and reboot
> 
>  - start an X session or type "dmesg | grep -i input" and realize that the
> I2C
>    PixArt touchpad is not detected, as the Alder Lake pinctrl driver now
>    includes the definitions for the I2C SDA and SCL lines that were missing
> in
>    the original version of the kernel Alder Lake pinctrl module

Please, make this one crystal clear: Does the switch from Alder Lake pin control driver to Tiger Lake driver solve the issue *without* any patches?

> Steps that might possibly lead to the creation of a proper patch:
> 
>  - edit the drivers/pinctrl/intel/pinctrl-alderlake.c kernel module source
> code
> 
>  - ask Intel to kindly provide the official documentation for the Alder Lake
> PCH

The EDS usually is available via Intel official site. I can look for the links later on after I get more information about the HW you are talking about.

>  - add the definition for the 4 I2C SDA and SCL lines in the proper group and
>    community: for example in the Tiger Lake driver that was group GPP_H and
>    community 1

No, this won't happen. The pin control Alder Lake driver is written for Alder Lake-N and Alder Lake-S, you are probably talking about different version of the Alder Lake, or not Alder Lake at all. I will know more after the requested (below) information provided.

>  - modify the bounds in the structures at the bottom of the kernel module
> source
>    code in order to account for the newly added I2C SDA and SCL lines

> I believe marking this as RESOLVED INVALID is not the way forward.

Fair enough.

Okay, let's go long way. Please, attach the followin outputs (all should be run as root):
1) `dmesg` (from the boot to the shell) when kernel command line has 'ignore_loglevel initcall_debug`. Ideally kernel should be build with `CONFIG_DEBUG_PINCTRL=y` and `CONFIG_DEBUG_GPIO=y`. Also make sure you use vanilla kernel without any custom patches.
2) `lspci -nk -vv`
3) `acpidump -o adl-xx-tables.dat` (the mentioned *.dat file)
4) `cat /proc/interrupts`
5) `lscpu`
6) `cat /proc/iomem`
7) `grep -H 15 /sys/bus/acpi/devices/*/status`

I believe with this information I can see more, currently this report is no go (only I may agree on the documentation changes).

View: https://bugzilla.kernel.org/show_bug.cgi?id=220056#c19
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)


