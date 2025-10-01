Return-Path: <linux-gpio+bounces-26743-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 51464BB2088
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Oct 2025 01:01:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB57F3B40C2
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Oct 2025 23:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DDA225A2A7;
	Wed,  1 Oct 2025 23:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ujvUE6u+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE24FC1D;
	Wed,  1 Oct 2025 23:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759359621; cv=none; b=PI59MfbgzmbvFCGX8pHRvu5umbzMlVXCTbSyR5hvP9yL0VtinUtlI77+yiz6fnwgKBxF2t8Jg9ytoY8tawjTmIcauSOeIXLvLH5fEM9y/N28tkcn/QAqaCUx7xtW+SlxB/0GmL8WxDh3DJFAN7FpoYReN8rYOdWJKoW+B1HqfjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759359621; c=relaxed/simple;
	bh=n9k8mcT3rZH5Tdth6Tkm/7zWUpcfOfZYeXAilqHJOTo=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=H1RGmeJRdSpKiXRPpdmxf/qcKyzQZcAlctsQ7hZhL6fUFq29p0395mAWdoGCf0Kfq0YMESi/5mt2o+gUBGgXYY6ufDRfLGpg2YoP5VF8cVBmSO6B0C+bS9B1NgZThZgM2APIy/nksCfiYNGIUtJFyQuFKUeqM7cQE1YrGfE6y+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ujvUE6u+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D16CAC4CEF1;
	Wed,  1 Oct 2025 23:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759359620;
	bh=n9k8mcT3rZH5Tdth6Tkm/7zWUpcfOfZYeXAilqHJOTo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ujvUE6u+b4BT3zvMIAabP2h1HE/6GVOMyt5Y1XhhhluZInF2VO+05F3tlcTZJaEdK
	 ihKHiIAucq0stoiVwlOBCNOwjAZIIU6SgUkZhOjun7zihx5ZQkoEXRV4+zZDi3aWZs
	 h3JfsS6yxv3pITd4lSunM59C1yUP+Y4QqVixyEXj1BHCleT1vuPUQERASlA+X5zctZ
	 xkUM2XDAwirupD9fJzcwdZfk98doH4mTEPIImnpM9HP3i2+TrFy0nyXDP7rwKEGFFC
	 fsIWF/6nzpyvJpdhcJfkv9SXzkloB092JiqWbpDKuyUFK6Iv7HAIEIq8DWYTeclg2G
	 Dm9SBwBLfK71w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 712BF39EF947;
	Wed,  1 Oct 2025 23:00:14 +0000 (UTC)
Subject: Re: [GIT PULL] pin control bulk changes for v6.18
From: pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkda=9Q0akFMxAK3HeL74jbJ=+poVZq2Xom9jJr-2rOxe+A@mail.gmail.com>
References: <CACRpkda=9Q0akFMxAK3HeL74jbJ=+poVZq2Xom9jJr-2rOxe+A@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkda=9Q0akFMxAK3HeL74jbJ=+poVZq2Xom9jJr-2rOxe+A@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.18-1
X-PR-Tracked-Commit-Id: da3a88e9656c17a34daf49c9acc6d85f73b4d3d9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5fb024931949f3475260c84a0e4b0997af9c5530
Message-Id: <175935961296.2651312.2071907389887219961.pr-tracker-bot@kernel.org>
Date: Wed, 01 Oct 2025 23:00:12 +0000
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 30 Sep 2025 20:48:10 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.18-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5fb024931949f3475260c84a0e4b0997af9c5530

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

