Return-Path: <linux-gpio+bounces-28973-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C9423C7B7A5
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 20:20:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F2D9B4E02F5
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 19:20:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E4E129BD94;
	Fri, 21 Nov 2025 19:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kDIVNl9R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A172F99BD
	for <linux-gpio@vger.kernel.org>; Fri, 21 Nov 2025 19:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763752814; cv=none; b=CHagUj+QTvIVLpNBiNOK3ESsGIFn1ON6uzs0HsKVDoqNPnMOIlrOcFfZioMFca7t4Lok4PRRiy71I9cg6md4HiTixM0kDZ1W8mf/mzXf1RusW0kDSCo9XSnwxt5AKNJM3B69KRkpka3DzlNJGjg3KU7CIYNOWulS80yG+0Uuvmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763752814; c=relaxed/simple;
	bh=r5RXYPrVffUH4Chxb1WzUGmATJd5+lbp5hQK/W94jKc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Sd9AGSB5yrX4PdvwfZ0tG2UnjF6VV8qdBMIDdlKwgjfuioDR+s2w6UnIKz6REZFrWPZys5B67fIeUxKW/VlGqSpSMvRSraVJvu/hiyrOy2FJubsIZo+LbCyrf5kim3RRxVdU/0Ed+vs2LadYhbXvxdY9iyInWtmUNYconzkzgKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kDIVNl9R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D478BC116C6;
	Fri, 21 Nov 2025 19:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763752813;
	bh=r5RXYPrVffUH4Chxb1WzUGmATJd5+lbp5hQK/W94jKc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=kDIVNl9RwynGRdIq9LsADwQ0JR2HVayNsa5y4pdhc13734H7UzoejU8D8TGc1z3Zp
	 JMlCtHv0JWPKz0GqnTlw4QIQpICrzm1Hr/hmRhH/5dESf2b92MMScmuVYCsuvvKeEk
	 tEbKs6dsyehSy8Mlq6b4iI4ZKh2hSZWgJQS0n2PQgq7byAuwc9CbDPJeHhSPeBCxTZ
	 2TIV/SlWk/InTFcrao0bKVis06DGcKBoFzUB37m8tBlg/yhvPo/Hi6p8hQlcjmBw4I
	 SMi1VUYCIyWkYaydog5eld64zWHCBI8/4wkf3lepRvm1VdT3pDM9pcoj2Gp2D0kJ29
	 AfqlQAov2xZrw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE5C3A78A5F;
	Fri, 21 Nov 2025 19:19:39 +0000 (UTC)
Subject: Re: [GIT PULL] pin control fixes for v6.18
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAD++jLkMzdYPdMpGMx-U5EMm_9EWtg_kext8QHXY1dNsdSSFVw@mail.gmail.com>
References: <CAD++jLkMzdYPdMpGMx-U5EMm_9EWtg_kext8QHXY1dNsdSSFVw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAD++jLkMzdYPdMpGMx-U5EMm_9EWtg_kext8QHXY1dNsdSSFVw@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.18-2
X-PR-Tracked-Commit-Id: 79afd3c5edac93b684393ec84185b2776d0630ef
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 68d804c64a595dd7f885759f3c3bd51ca893deb4
Message-Id: <176375277842.2554018.5088000816782035676.pr-tracker-bot@kernel.org>
Date: Fri, 21 Nov 2025 19:19:38 +0000
To: Linus Walleij <linusw@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-gpio@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 21 Nov 2025 17:29:13 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.18-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/68d804c64a595dd7f885759f3c3bd51ca893deb4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

