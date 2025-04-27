Return-Path: <linux-gpio+bounces-19342-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E7975A9E13D
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Apr 2025 11:05:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 449E3178FA0
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Apr 2025 09:05:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F290B1C84C0;
	Sun, 27 Apr 2025 09:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E9X6eoCj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B146F19D06A
	for <linux-gpio@vger.kernel.org>; Sun, 27 Apr 2025 09:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745744699; cv=none; b=LaxXtKDholzJhn5oFyrNVOw3cAxSimHq2pMVHufHHMTBbhiiJP0kEoXKR3R2DN2CAz+/ph9QE9f+qfICzuTsmZZr2EOAFKrPP9eJlINAPitj5RuAs/QH/lA4KVlXKHD3Hm7eB5QJCcT6CrnYgArwi4HBYZ+3J7A1Ym+dKE+35E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745744699; c=relaxed/simple;
	bh=psTTNwQzV+pK+lOb5HbbSCvemUrSmPKWjEUZoFnhSL0=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:In-Reply-To:
	 References:Subject; b=c4aVyJ3Za7FqbLTDq4zzae/Mwvw21OCzSN+p80O8uC/u0a0cR5STFGx8jAlwdRiFarfnmsivz1f/IS28znic7FOsq20C4wvAIsjoOQEoUb2y7BF0ZsQbpEcfWAWVkuNCPeP+3LjawmeOdNIdH0Xxt7xUVO6eez8AUNaG7ynMlgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E9X6eoCj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CD72C4CEE3
	for <linux-gpio@vger.kernel.org>; Sun, 27 Apr 2025 09:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745744699;
	bh=psTTNwQzV+pK+lOb5HbbSCvemUrSmPKWjEUZoFnhSL0=;
	h=From:Date:To:In-Reply-To:References:Subject:From;
	b=E9X6eoCjan5JkMZUXwUbgDnzPwaJcVeqqsyJ3BqZrFQ3aZrHPFD8t8hM5NfAU8cgI
	 g6zz4ko6t/DJgHOdf/IErNM8SwiUV7lxVmPdDV4cxLOh2J8pVXQ+BpRC0VIABFSwLv
	 LmtlPq0Ophv8Jp5jglYfc9bm53MW4F6qQ1OXDCTbeJ9lNLbkpBbZ53KTeb4W6qOx+9
	 7uYmkbkEN7sGArBTV6h76Rmlpe5qfKDH+Emf6tKXevyTi3Ppt0YuYsyYGzN3hKVbk9
	 iRdbApoGt7/FCH2rooDZGxUMI77HHsLZzbmVOe8NBTMosoTUQnX9gRDeFNI9O9RcCl
	 cQXOAfC+7BL8w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EE8BE380664A
	for <linux-gpio@vger.kernel.org>; Sun, 27 Apr 2025 09:05:38 +0000 (UTC)
From: Andy Shevchenko via Bugspray Bot <bugbot@kernel.org>
Date: Sun, 27 Apr 2025 09:05:20 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: linux-gpio@vger.kernel.org
Message-ID: <20250427-b219946c1-31217cbb3bf5@bugzilla.kernel.org>
In-Reply-To: <20250328-b219946c0-f69b453deb65@bugzilla.kernel.org>
References: <20250328-b219946c0-f69b453deb65@bugzilla.kernel.org>
Subject: Re: Missing null check in rza2_gpio_register
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: GPIO/Pin Control
X-Mailer: bugspray 0.1-dev

Andy Shevchenko writes via Kernel.org Bugzilla:

Alredy fixed in the https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/pinctrl/renesas/pinctrl-rza2.c?id=f752ee5b5b86b5f88a5687c9eb0ef9b39859b908.

View: https://bugzilla.kernel.org/show_bug.cgi?id=219946#c1
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)


