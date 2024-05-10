Return-Path: <linux-gpio+bounces-6313-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D1F8C2BFD
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2024 23:39:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B83C1F2199A
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2024 21:39:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 969B613C91A;
	Fri, 10 May 2024 21:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q0jfJtlh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EFC13C8F7;
	Fri, 10 May 2024 21:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715377154; cv=none; b=CucOcaMxJGPtIfQHGDkxhqQrNh1I7cXIoxuu0RCMQI1YYYHWLRqY+kvjzELw8aZnqiziNfPc00DHfiefXR2WGuAKpfcm5Txdw76R/UdyQlX65AQuZcZluOo96OGml/opbzXvmXMlh7kfbHlkvKrHkB7abdXLBHSk6YutTjY3rwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715377154; c=relaxed/simple;
	bh=rZ9QLavP+85/69mir4EHwdbn91bcewFyRd+JIzhxmVA=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=jzG6yF4QbvxtKFZfQQ2NU5vBxIrfriw7dMaQnZzhZb02It4T+QV40T+U0v/xAu+H9zoX3tJyU1Ijn+Vl5lwXLg5kK43zozIBN1867ItNX6NCjmzvwhzzbqyvjuuV9AV+fCS8oPsNZsMMNX/uF2ZH5SkQ6fRANHDF0zIqJjgptnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q0jfJtlh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 36442C32781;
	Fri, 10 May 2024 21:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715377154;
	bh=rZ9QLavP+85/69mir4EHwdbn91bcewFyRd+JIzhxmVA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=q0jfJtlhdrjh5L8paB5xLNycxF4G2zNxEX2bwKZDmMsKd90bVSTqXNy1Vrsz0NDz6
	 QQ5CPHytkSkv5UI9QYBQBa9DlYcIQiiOmza6basXjp0Kk4R/YKMVrjQKUrzNCNw7cq
	 2PJsuA7Ptz0XBzsuqwmjbPhy6erFeWPgA2nEhIW3OX/F9y1L02ASAzF3DeEmFVmKzI
	 bNIblkWcjsN/ZuMKu99tXBBn7PjHHm1csvrmPR54FIlcpycGTDfdxS40ykk6P9b9vo
	 /GvOQ5RR01cACUa7ex71Vcd6r19sTP0NwRonnM1oJYUdl+NypJVBJSpCJvfsOKDGHj
	 ulHW0Z78WtCPg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 29D27E7C114;
	Fri, 10 May 2024 21:39:14 +0000 (UTC)
Subject: Re: [GIT PULL] gpio: fixes for v6.9
From: pr-tracker-bot@kernel.org
In-Reply-To: <20240510182640.44486-1-brgl@bgdev.pl>
References: <20240510182640.44486-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20240510182640.44486-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.9
X-PR-Tracked-Commit-Id: ee0166b637a5e376118e9659e5b4148080f1d27e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cfb4be1a61200fbbd29f2699b11899789855bbe4
Message-Id: <171537715415.8717.1758876426578615061.pr-tracker-bot@kernel.org>
Date: Fri, 10 May 2024 21:39:14 +0000
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 10 May 2024 20:26:40 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.9

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cfb4be1a61200fbbd29f2699b11899789855bbe4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

