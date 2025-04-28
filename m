Return-Path: <linux-gpio+bounces-19394-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDFFA9EE6B
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 12:54:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC6F9189F5DD
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 10:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D82F2356BC;
	Mon, 28 Apr 2025 10:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b6/D8IYY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F173E19047F
	for <linux-gpio@vger.kernel.org>; Mon, 28 Apr 2025 10:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745837669; cv=none; b=Ai/XhCs6SrwfXK+T8HFh/ppBmYx4ePMt4d1OfuhwXQzIhVGfDd2rcE6juMQ0MSIwP5YpmtApuKTVmBuSAWmYGXMdxtQ2OOSUBqjn4UG3jUi9RhkiBEY//UBcwYXP1mK0dUCG1Q9xa1S9xY2hFhESAUHChLtZ3gPrttBCfZ2jDoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745837669; c=relaxed/simple;
	bh=2Y9M97fbaAWkfU01hKNG4olVhPE5kZor091ojzgPs7g=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:In-Reply-To:
	 References:Subject; b=TtchWhyvIWhDiIcNbA9ae4GHrIGgVyU0FQPYU5hkUXYdH9TVxG65+i6QAjftPget4pb4z34iT+8pcBH1lNCMbOeUkqN1MI8M5g0zS4WB7eIwYHevQ9kFLad+YF4P3PdsrTn8HClGvJVtj3+4MorCEjWKVcOCCPYGPKuXyNKAF0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b6/D8IYY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E65CC4CEE4
	for <linux-gpio@vger.kernel.org>; Mon, 28 Apr 2025 10:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745837668;
	bh=2Y9M97fbaAWkfU01hKNG4olVhPE5kZor091ojzgPs7g=;
	h=From:Date:To:In-Reply-To:References:Subject:From;
	b=b6/D8IYY6pxfGn225Bw5m9Ry4By7eAemBEzid3LA+v7+R7DlhGFvJeQIjO7m7AruT
	 9pLkBpc3PqwgIdIsb6pjZtSwo6E6noaKbroeec4Q3SHawhHLPpBlYyQTO5vcx2UDmh
	 hV+cdIenb71q/0kmZoe0iXgDpBqN+BAp0XxX1TYcnjkTWExWQaolvwMXfnziyfeXuM
	 tzEST3xm6FhUGNRVJubHCBt0+eD3MRjBHfCWdcr7QqqrUJhHAgYEPmJ67+d2pkTwUA
	 NrCK62a/yhHlobg4o7NuK3LswwPSJ/iu1JUrPG9zKI2W7hs4EErsKr3cRGhKyHiK4j
	 Yp5b1OpESWksA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7594C3806651
	for <linux-gpio@vger.kernel.org>; Mon, 28 Apr 2025 10:55:08 +0000 (UTC)
From: Andy Shevchenko via Bugspray Bot <bugbot@kernel.org>
Date: Mon, 28 Apr 2025 10:55:26 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: linux-gpio@vger.kernel.org
Message-ID: <20250428-b220056c23-effaf9741ca5@bugzilla.kernel.org>
In-Reply-To: <20250428-b220056c22-53f595229457@bugzilla.kernel.org>
References: <20250428-b220056c22-53f595229457@bugzilla.kernel.org>
Subject: Re: PixArt touchpad not detected due to wrong pinctrl
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: GPIO/Pin Control
X-Mailer: bugspray 0.1-dev

Andy Shevchenko writes via Kernel.org Bugzilla:

(In reply to Guido Trentalancia from comment #22)
> After further testing I can now confirm that the patch from Ariel does not
> resolve the issue and that adding CONFIG_PINCTRL_TIGERLAKE is the only
> possible solution so far.

Thank you for confirming this. I will prepare a documentation patch based on this bug report.

> Should CONFIG_PINCTRL_ALDERLAKE be disabled ?

Up to you. It it's harmless on your platform, but it takes resources passively (as memory footprint) and actively (as each boot is slightly delayed).

> Thanks for the links Andy, but I am not interested in accessing confidential
> information and in any case those links require a login which I am not
> interested in creating.
> 
> However, I believe the specifications should be made public, at the end
> users pay for their hardware.

I'm an engineer, I have no rights or even knowledge in the laywers' area. What I know that EDS is what all Intel customers (read: OEMs/ODMs) get with a chip they bought.

View: https://bugzilla.kernel.org/show_bug.cgi?id=220056#c23
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)


