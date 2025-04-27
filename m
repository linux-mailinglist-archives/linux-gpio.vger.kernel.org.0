Return-Path: <linux-gpio+bounces-19352-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A43ABA9E485
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Apr 2025 22:04:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0F901740E6
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Apr 2025 20:04:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DB631DE4DC;
	Sun, 27 Apr 2025 20:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F0O67d4F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD0CBE6C
	for <linux-gpio@vger.kernel.org>; Sun, 27 Apr 2025 20:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745784268; cv=none; b=rKcOl4DFsYx65oLO6KnywWLdm4KYHSMcjP1pmkcLwwZC+dwGxuXXhYPvlM9P6AYWuJU85W305UblEM6CgUq/qsYPra4sc8Ls+N1ORqu862/ubAOkfJLKUtL9XcEDzreS/mHqdw/hFBC37iK2lJzuy8wIOnDx+Gd/Q+R1F3uSh7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745784268; c=relaxed/simple;
	bh=HS8+3cFpD1LNX9zDfggsu9+M1tZgnUk3fZe0bpcWy2k=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:In-Reply-To:
	 References:Subject; b=TzN/QWOLLwx4Pa57VO3jEFsjLQ0wqoWtd9mnJl35//cNMiaHy0nqQC9kZ5fO3yCF+mU8WWItM1klGA6k/IuPUAFZKlJ5f2rB07zPnIQWE3LELbA4AUwWbcFRpfr8Zai3OlcD3dO8RKH/jDa8e2B4cEXCjfGGwt6I+/hLQBg/6aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F0O67d4F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F90EC4CEE3
	for <linux-gpio@vger.kernel.org>; Sun, 27 Apr 2025 20:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745784267;
	bh=HS8+3cFpD1LNX9zDfggsu9+M1tZgnUk3fZe0bpcWy2k=;
	h=From:Date:To:In-Reply-To:References:Subject:From;
	b=F0O67d4FW1AEHiVhyJi79hozmh6rrrFxJmfW2yOeT7sVPZoStk5DjwBXHZRj7HrMl
	 MuEY/wSA/lGnlFZ4K1zdXCgnzdDm2IhO6MyeSvjAY0NLTEEMCDXgv5IkckOIBw+sk5
	 0faBDxvYsvKS17JzyFok6evTkJ1vwP7ZwODVeXg93QknKyu6RAgs35mgLpEvKhL70i
	 B9k7jv4niPg40Ndf4QxnBZ9y3dQWGHNNu25VnkfoXVNPqXziUG8TQ0EbyGBhwdBERj
	 DZNQHR6wvmF9iHOtNsIEgS4I9qhtPN29ETu+8nCq0/8Pl/kx8Z08HjXyUzRS60AXP1
	 BPDiYrKrO3ypA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 74830380664A
	for <linux-gpio@vger.kernel.org>; Sun, 27 Apr 2025 20:05:07 +0000 (UTC)
From: Guido Trentalancia via Bugspray Bot <bugbot@kernel.org>
Date: Sun, 27 Apr 2025 20:05:21 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: linux-gpio@vger.kernel.org
Message-ID: <20250427-b220056c18-04212d3d3a26@bugzilla.kernel.org>
In-Reply-To: <20250425-b220056c0-ca0f4862134d@bugzilla.kernel.org>
References: <20250425-b220056c0-ca0f4862134d@bugzilla.kernel.org>
Subject: Re: PixArt touchpad not detected due to wrong pinctrl
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: GPIO/Pin Control
X-Mailer: bugspray 0.1-dev

Guido Trentalancia writes via Kernel.org Bugzilla:

Andy, the patch that Ariel provided did sort the issue of I2C PIXA touchpad detection, although it's pretty clear that it uses duplicated pin numbering that needs proper grouping and ordering within the existing communities.

So Ariel intuition sounds correct to me, in that the pin definitions for I2C SDA and SCL lines are missing in the Alder Lake pinctrl driver.

From an end-user point of view it's illogical and not intuitive that one has to use a kernel module targeting another chipset in order for I2C device detection to work properly.

Steps to reproduce:

 - grab an Intel Alder Lake based laptop using the PixArt touchpad from the list 
   provided at:
   https://linux-hardware.org/?id=ps/2:3848-3848-pixa3848-00-093a-touchpad

 - build a kernel with the pinctrl-alderlake module using the
   CONFIG_PINCTRL_ALDERLAKE kernel configuration option: this is what a normal
   end user does

 - install the newly built kernel and reboot

 - start an X session and realize that the touchpad is not working or otherwise
   use "dmesg | grep -i input" to realize from the kernel log that the I2C
   touchpad has not been detected

Steps to resolve the issue:

 - apply any of the patches provided in this bug report

 - rebuild the kernel, install it and reboot

 - start an X session or type "dmesg | grep -i input" and realize that the I2C
   PixArt touchpad is not detected, as the Alder Lake pinctrl driver now
   includes the definitions for the I2C SDA and SCL lines that were missing in
   the original version of the kernel Alder Lake pinctrl module

Steps that might possibly lead to the creation of a proper patch:

 - edit the drivers/pinctrl/intel/pinctrl-alderlake.c kernel module source code

 - ask Intel to kindly provide the official documentation for the Alder Lake PCH

 - add the definition for the 4 I2C SDA and SCL lines in the proper group and
   community: for example in the Tiger Lake driver that was group GPP_H and
   community 1

 - modify the bounds in the structures at the bottom of the kernel module source
   code in order to account for the newly added I2C SDA and SCL lines

I believe marking this as RESOLVED INVALID is not the way forward.

View: https://bugzilla.kernel.org/show_bug.cgi?id=220056#c18
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)


