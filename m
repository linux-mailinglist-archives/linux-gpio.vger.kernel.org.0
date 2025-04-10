Return-Path: <linux-gpio+bounces-18672-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3874EA845E3
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 16:14:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C6289A2167
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 14:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F57728C5B9;
	Thu, 10 Apr 2025 14:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c2jQIWSC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1353728C5A3;
	Thu, 10 Apr 2025 14:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744294160; cv=none; b=DL5w7kLuxOp9QO+CiQJOZ4FzEDWDB51qtA/WcmqVRbwpJM0hxNkQjwbPDmZgtOTzF15t5k84/anUaNoR78qmm2Y28ZHwd0KwP/4XmANpHs44yVyfIIv+9TCNWRx1QuZwseHd0CjTts6X34S4l/p4HJO9IzB07PzaEqB6Luq/rfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744294160; c=relaxed/simple;
	bh=VgL34d8FerKCLRzAjKb8JZJmDSf6u8OvMDoh7DW3wto=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=dgLPVIlx8Sp0gclK0d2xpwmWS0C+4iYcts6H5gCK3/3Hj5SG6kONjGptiJNnlWFZlzg41lFJao3HC+ffA/SsDhmJZ+zn+0Y95xdKBf6w6H20HkI5Y2y1FaRJRdbdrvE/6TMlvDR3xChZKIzJnO5vKBdz+TFIFMbHBgF+rvE6c5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c2jQIWSC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7A70C4CEDD;
	Thu, 10 Apr 2025 14:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744294160;
	bh=VgL34d8FerKCLRzAjKb8JZJmDSf6u8OvMDoh7DW3wto=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=c2jQIWSCaS99fP0eNfRGDi6QB2P7SrWXL83uMtX//zHjXgCaxT9rKCMdl4WMf88ll
	 xx/EL4lkh9KfHVhLo4BKiJuIp3R1C89G02ESsJvJY62GZoWjnMm7M8BNDQQ0GhuuMj
	 umtbUcs5Bd71cPh+32Z+nFPXu8ibmYhoza/xdM61+VFGjPIjSlrh2PtvszENK5UDB8
	 r2cAgFDq1eXbVAtlJlEDEJLzydStdbah4BGtqTR/AN6EUHeewjaD9p36J6OMAFgsk1
	 5sVYGBbZc4pW7ckq0sXTnIJ2nP0y7bP/AYpBk5fonvJaLBxBSUhXVcwn5usGVKlMqL
	 iJc831G9np9Yw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD3D380CEF4;
	Thu, 10 Apr 2025 14:09:58 +0000 (UTC)
Subject: Re: [GIT PULL] gpio fixes for v6.15-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250410094605.38665-1-brgl@bgdev.pl>
References: <20250410094605.38665-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250410094605.38665-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.15-rc2
X-PR-Tracked-Commit-Id: b8c7a1ac884cc267d1031f8de07f1a689a69fbab
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8f43640c9109bd82bcf37def6adfe1b8b09e7b61
Message-Id: <174429419734.3685623.7226943117689045378.pr-tracker-bot@kernel.org>
Date: Thu, 10 Apr 2025 14:09:57 +0000
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 10 Apr 2025 11:46:05 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.15-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8f43640c9109bd82bcf37def6adfe1b8b09e7b61

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

