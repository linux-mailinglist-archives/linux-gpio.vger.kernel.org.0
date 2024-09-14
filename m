Return-Path: <linux-gpio+bounces-10111-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F809791BE
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Sep 2024 17:12:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B6D71F224F7
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Sep 2024 15:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ECB41D0154;
	Sat, 14 Sep 2024 15:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ebb4dEbv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083D61E487;
	Sat, 14 Sep 2024 15:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726326730; cv=none; b=ZgU21XPpIR/6V1xcaPPvNVReLseKYhOEx4WV1qPqRXLWGxDAeiifZOMPOgpRzflFidcWA5Dg8TbITORKQSLbpnsri+iZqWQY4/nv9FeG0YzyQu78uxvnADmHAJgZK/rSwYxwG9t3k2Dl3hUJp60J8O8LXDqFSzNs2NYoM85OOv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726326730; c=relaxed/simple;
	bh=G3hb60X1/jd6Bruk2iqzjz54ifxPLNdvvFLIH5YLINs=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=L2BhZhe6OfRaZ7Uyx0Hab1S/MbzBqzepLNvn9XoeczcrzhEoM+4sYeAYTAPnO2n04zifrDbQ6oKjf/cWmaumgMfh07JL8IRwRlazrFuwo+kGOyWuA6/hYxdgfGsMlqxVvKy38KMzN3NGoOZX8VlcWVjWek5JnRJNtK7qMtXFwaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ebb4dEbv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 893E2C4CEC0;
	Sat, 14 Sep 2024 15:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726326729;
	bh=G3hb60X1/jd6Bruk2iqzjz54ifxPLNdvvFLIH5YLINs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Ebb4dEbvsBM7KbvqO10mqTVceczuZ7aYOxJBbhGSZyXGAq+mImctqoutxM8TgkGH4
	 g/4nEfbvCVZLJ1NNSg/VGESLQbuIfyv48qDjizgqebOII6s0WHw+ZNbNfnf9ENtBS7
	 zfAzZ6Wl72Nwi33E3ilasO+LxXFtO5oCWuiv+VQuVwWexlwkETk/CGldsrWPCbtumJ
	 yIPPLkqAo+ia2rtdRn7coMnFzestxZix1KtFTwZUZI7z85wvZe2rq3vulda8q8BeOL
	 QkGmdX9vNurwl/st+0wcUZIedVAj3tpx+tD9inXG8h0Xep85ngcnMFIjDcCx1ksa32
	 REsvjmF5MlvHw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 002703806655;
	Sat, 14 Sep 2024 15:12:11 +0000 (UTC)
Subject: Re: [GIT PULL] late pin control fixes for v6.11
From: pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdZDSTDC8xThy5jRXtrYqaOTLPcc2fuoiGSMQaQ1B6FSaw@mail.gmail.com>
References: <CACRpkdZDSTDC8xThy5jRXtrYqaOTLPcc2fuoiGSMQaQ1B6FSaw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdZDSTDC8xThy5jRXtrYqaOTLPcc2fuoiGSMQaQ1B6FSaw@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.11-4
X-PR-Tracked-Commit-Id: 71e4001a0455ec2b6218715c81f374f1ab8b1b12
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0babf683783ddca06551537c6781e413cfe8d27b
Message-Id: <172632672988.2574982.9445305594681259237.pr-tracker-bot@kernel.org>
Date: Sat, 14 Sep 2024 15:12:09 +0000
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Patrick Rudolph <patrick.rudolph@9elements.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 14 Sep 2024 14:18:20 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.11-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0babf683783ddca06551537c6781e413cfe8d27b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

