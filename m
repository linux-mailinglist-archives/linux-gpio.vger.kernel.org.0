Return-Path: <linux-gpio+bounces-19330-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AD3A9DCFE
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Apr 2025 21:59:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E1651BA1FF8
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Apr 2025 19:59:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A17881EB9EB;
	Sat, 26 Apr 2025 19:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RT+xFZuR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD8B6AD3
	for <linux-gpio@vger.kernel.org>; Sat, 26 Apr 2025 19:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745697569; cv=none; b=uURxvl8Oi1QZ9hXRazX+F3Q2okLwKiEIoCIgKSqvVL4PV05KuNcr/VNLKuO7gBUbEvB2imzpMDOw5hPJC/mHGEULllIOz9Y2BKRgQaTWF0E1kLo3ku7r+cLqtaaBs1uKxOXVedi6xyTYIrbqLKGWp8DFuvCHoL4UoXe4R4bp+EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745697569; c=relaxed/simple;
	bh=BbzOj9UXEf95NT2/k02xgIwuNM+mdLIFztybBfXsYR0=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:In-Reply-To:
	 References:Subject; b=ZB3K7WxHxn0k/BzscOQIH/pi/QCB9XMpAIpTDNUvGFe/fRzrATAPcZ1waLiktz5CXftfDvpYEPR8m82epJhdntC844Y/cV6MDeN6s8PcaZWrqWs74SZxqsIqB1kvUVryw3lYhjRUZQPKdu+WbA5TwR60HYUmWYr31IPWDMi5hIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RT+xFZuR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD6DEC4CEE2
	for <linux-gpio@vger.kernel.org>; Sat, 26 Apr 2025 19:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745697568;
	bh=BbzOj9UXEf95NT2/k02xgIwuNM+mdLIFztybBfXsYR0=;
	h=From:Date:To:In-Reply-To:References:Subject:From;
	b=RT+xFZuR7fYLDG3N0ZcFroU2PG/zOMKuL6N4PWNJnZGZ8D9VEAbfO6Qlhowee9RqQ
	 9WTKYQ0CmyNgtkg+HC3FvHRrR9n+45otJoapV0c/eXDR9sdQyfOL13xCPSe+PIpNuz
	 SA5A6rFchuXv2F2xzbIU4XP4+urGU551GZJdwpahZvhIYMMWHvRF4IYg/V32L4YGht
	 mht3qKRnRvDQlkvFHQpOUtc0Ww5LqFmUdlEBNQn8+UE9owq9V2zxYqXnhX0Pbq88Ah
	 s/3U1Cuog7mSNXcUyoZgCTg1kn3Ii2cJw562TnGA3/R2wlSggzgSCam+EAI7nT8Ul2
	 myuLWiLGhEmpw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 75C9D38111CC
	for <linux-gpio@vger.kernel.org>; Sat, 26 Apr 2025 20:00:08 +0000 (UTC)
From: Ariel Simulevski via Bugspray Bot <bugbot@kernel.org>
Date: Sat, 26 Apr 2025 20:00:05 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: linux-gpio@vger.kernel.org
Message-ID: <20250426-b220056c1-a6c51d63e87c@bugzilla.kernel.org>
In-Reply-To: <20250425-b220056c0-ca0f4862134d@bugzilla.kernel.org>
References: <20250425-b220056c0-ca0f4862134d@bugzilla.kernel.org>
Subject: Re: PixArt touchpad not detected due to wrong pinctrl
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: GPIO/Pin Control
X-Mailer: bugspray 0.1-dev

Ariel Simulevski added an attachment on Kernel.org Bugzilla:

Created attachment 308024
Attached a patch that adds missing I2C pin definitions for Alder Lake. Needs testing on real hardware.

Hey! I tried fixing this as my first attempt at kernel hacking.
I added missing I2C2/I2C3/I2C4 pin definitions based on the Tiger Lake mappings.
This should definitely be tested on real hardware to verify if it resolves the touchpad detection issue.

File: 0001-pinctrl-alderlake-Add-missing-I2C2-I2C3-I2C4-pin-def.patch (application/mbox)
Size: 1.62 KiB
Link: https://bugzilla.kernel.org/attachment.cgi?id=308024
---
Attached a patch that adds missing I2C pin definitions for Alder Lake. Needs testing on real hardware.

You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)


