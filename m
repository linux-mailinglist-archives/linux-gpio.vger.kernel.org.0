Return-Path: <linux-gpio+bounces-19390-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 65696A9EAF4
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 10:39:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0FC57189A383
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 08:39:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F013E25E828;
	Mon, 28 Apr 2025 08:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NDtMuxV/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14A825E466
	for <linux-gpio@vger.kernel.org>; Mon, 28 Apr 2025 08:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745829568; cv=none; b=F8WmNKX3rWZKA3XkxFI5aui0AV6k7k9jVQjSiudInuLcjJv/hZSsClQu74s21MbNUYjjMyZF7cstFeg9/win4OldtFSv48QHndIAhNZupb+gt+c6uUacsURqwl/5rQqthNL6bXs8SMP1ncXjPy0+WdadivCm2zGQsaDd+QuFOcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745829568; c=relaxed/simple;
	bh=NCn28yrdkQBhMCV61YMQToPX2f1AbMlHftzdgl16OLw=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:In-Reply-To:
	 References:Subject; b=I15G8l509ZGMIvSt+B7dqyLo+56DV8qbCAQRvLEuF2et9zx22Dmp9T/Peqbq8s9o0Mmyt9ev8ATsXX00ospuD18qqMm2ZD5Zqpq0V2q4O3PMz9svcGLnCTLbNyU0fHlM4YNfbxT10bu2fuNaDpRaq/EVpdF9s+v/luMGOdQTlfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NDtMuxV/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AC02C4CEE4
	for <linux-gpio@vger.kernel.org>; Mon, 28 Apr 2025 08:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745829568;
	bh=NCn28yrdkQBhMCV61YMQToPX2f1AbMlHftzdgl16OLw=;
	h=From:Date:To:In-Reply-To:References:Subject:From;
	b=NDtMuxV/BLFq8G+bcP/EBSF2NockNccY6YPXtDi1j1zJrQDR4PX2p+3R7dc/bt79h
	 Be0uGa4/gWWdt8osOqPoFuaoJYTYsBW6czF0Ti96ObitFbaUIVbp4J2pLKi3ZgrnyN
	 X37Q16j91iL7QNbsp1jpyUdNk+8fxFcC2I5+xHRd1yffR2msgrcR1UBf+viNqEVIC1
	 7r665UBjzNb+iBHG4OaKPEEMZKws2AVCr/DXRijtjKaEJlR2zLJNI+C+N47mEB78HM
	 PLF8Ok8j+WCv/0hEsYwEp9+hd7MNJROGlxBABtENcAuGB/HT/oHnHmFQ8QsPjkk9gB
	 kyQjylSYQvoEQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3862E3806651
	for <linux-gpio@vger.kernel.org>; Mon, 28 Apr 2025 08:40:08 +0000 (UTC)
From: Andy Shevchenko via Bugspray Bot <bugbot@kernel.org>
Date: Mon, 28 Apr 2025 08:40:24 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: linux-gpio@vger.kernel.org
Message-ID: <20250428-b220056c21-580bd60717c9@bugzilla.kernel.org>
In-Reply-To: <20250428-b220056c20-9d8165f52ab2@bugzilla.kernel.org>
References: <20250428-b220056c20-9d8165f52ab2@bugzilla.kernel.org>
Subject: Re: PixArt touchpad not detected due to wrong pinctrl
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: GPIO/Pin Control
X-Mailer: bugspray 0.1-dev

Andy Shevchenko writes via Kernel.org Bugzilla:

(In reply to Guido Trentalancia from comment #20)
> The chipset is Alderlake-P as already said in
> https://bugzilla.kernel.org/show_bug.cgi?id=220056#c12
> 
> The issue is resolved by applying the patch from Ariel or by using the
> Tigerlake pinctrl kernel module, although I believe the latter approach is
> the wrong solution.

No, that is the right solution. And I have no idea how the patch can solve it. You are really driving me crazy. I already explained to you how device is enumerated, the patch CAN NOT FIX ANYTHING.

> Some relevant system information follows. Please provide the link to the
> relevant official Intel PCH I2C specifications.

You have Alder Lake-P that re-uses Tiger Lake pin control IP. So, what's the problem (except documentation)? The resolution of this bug is correct, i.e. RESOLVED INVALID.

It seems that official specifications are confidential, but in any case, search for these documents.

https://www.intel.com/content/www/us/en/secure/content-details/626817/intel-600-series-chipset-family-and-intel-700-series-chipset-family-on-package-platform-controller-hub-pch-external-design-specification-volume-1-of-2.html?DocID=626817

https://www.intel.com/content/www/us/en/secure/content-details/630094/intel-600-series-and-intel-700-series-chipset-family-on-package-platform-controller-hub-pch-external-design-specification-volume-2-of-2.html?wapkw=630094&DocID=630094

...

> [cat /proc/interrupts] ** with patch applied **

I don't believe that patch solves anything. Check the `lsmod` output and other things, but it's impossible that this patch solves the problem. And again, it makes really wrong, there are no such pins in Alder Lake-N/S supported platforms.

View: https://bugzilla.kernel.org/show_bug.cgi?id=220056#c21
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)


