Return-Path: <linux-gpio+bounces-26638-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81391BA51F0
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Sep 2025 22:45:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9B834A5196
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Sep 2025 20:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90E2B30CB35;
	Fri, 26 Sep 2025 20:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BPy3yabj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3F028CF5E;
	Fri, 26 Sep 2025 20:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758919471; cv=none; b=T7HmNURuMW5KCy13ehhDuSKSg0z4wXnP3Vk7w8rNKxG6F/flCJs0npq9iKSASErXIPxw5QOt4u1MQxIvaHdVdytrTVT990APZ0bmlZhHmtRk8Ewm+BbzydFcOlGzUrwTB9NAidCT+lZzSPLRoIDX0TIv/OAXpYH5cmnWyBPL5cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758919471; c=relaxed/simple;
	bh=DqrCUOScvurz+ruCyYjjDaSP+g7lWD1kkmSq+3YcbV8=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Vi0o+hkzUFC2Uz1TCbS7aoh5A0us16AkmWR9xSMPeCqP1JIkhyM88l5rgSTEu+aWNNxiIbAk22n1i2EpR9utBmoN8SHo57hEfiDF0KAsrvHJUXwSx19BDSZnIkjafwGywj7hgg4nE1ntom0Fzv56RLSKe+vv4eFkgJUOxy3mqSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BPy3yabj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 325DDC4CEF7;
	Fri, 26 Sep 2025 20:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758919471;
	bh=DqrCUOScvurz+ruCyYjjDaSP+g7lWD1kkmSq+3YcbV8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=BPy3yabjprNr2LRCK+ZzlhjhGDDzYxoE5KWLoUCEy600MW/Ra4ePHgsqi3CcYHXvY
	 dCxjqjeqSg4cWBfXcclaBPwb6cMSn/D7bAz3o9Ed5/gck3lyFxuF5qjIzOTEPT4G9O
	 28VavQtvjE4xfAOTL1f2jXVJ1SDChe0DynQmWJmYlfgCJOi6OaeRzh24YrKDvEREnX
	 Fz226WCNxBdtX8kx0vzUhrWPLKigzWRb1WD4KQSw6W8W0wSuwLCpdVBfYYSUehQyQ/
	 ZPmslvxtAjqswegLpXG96Z7nmyfh018vdHQ+g4a32cCDgv9MHfkuBzbfAAfLFCJcEy
	 8Ehrri9e6ZF+g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADFCA39D0C3F;
	Fri, 26 Sep 2025 20:44:27 +0000 (UTC)
Subject: Re: [GIT PULL] gpio fixes for v6.17
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250926100429.40265-1-brgl@bgdev.pl>
References: <20250926100429.40265-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250926100429.40265-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.17
X-PR-Tracked-Commit-Id: 3bd44edd6c55828fd4e11cb0efce5b7160bfa2de
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: df2837012f7e29fc80ea673268643ec472ee0e61
Message-Id: <175891946634.51956.4008604830984718933.pr-tracker-bot@kernel.org>
Date: Fri, 26 Sep 2025 20:44:26 +0000
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 26 Sep 2025 12:04:29 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.17

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/df2837012f7e29fc80ea673268643ec472ee0e61

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

