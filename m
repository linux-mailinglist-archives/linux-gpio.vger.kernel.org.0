Return-Path: <linux-gpio+bounces-19393-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2A5A9ED7B
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 12:04:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20CB63B1BBE
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 10:04:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F307C25F978;
	Mon, 28 Apr 2025 10:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M9qT/K+r"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31FB25E81B
	for <linux-gpio@vger.kernel.org>; Mon, 28 Apr 2025 10:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745834670; cv=none; b=TLNOpo5kvpYigY/KmCWmuTwKG0DHARxHiCEg2gsjaTNl5o2CL8yU8KSp9k8eQKV7mr9wgs/RO0S5Jm864IIk995XkPOcpMXJ8FTiOrW3lWG6RBx+dHKoW9hWk75VJlat09KqWmGjn+xOG7f8112996F0Qh/u/ylRGUjBUuSRZNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745834670; c=relaxed/simple;
	bh=7oLkhlxsJ+3DhJLAy/wi/j1bE5NTA5Mheug9PBSSyQc=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:In-Reply-To:
	 References:Subject; b=HMnvXTKcX22EdoJhsgLtQD0Riut/YZUMh7Us6Qb3dpXTtFegl30qF4DpbwocvTVDwsJ1WEI8l/ys2ZTXXUt1/QI7ME4Ff0H9CQmt5mR3pp9LkIHV6fOzEtS9Q6y7WZjk68I3BKkFZk6Hps3okQXO2ecmpE5PwLLoSVLeCJopqP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M9qT/K+r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36AACC4CEE4
	for <linux-gpio@vger.kernel.org>; Mon, 28 Apr 2025 10:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745834670;
	bh=7oLkhlxsJ+3DhJLAy/wi/j1bE5NTA5Mheug9PBSSyQc=;
	h=From:Date:To:In-Reply-To:References:Subject:From;
	b=M9qT/K+r0AsOFtBlZLDmC2KtjkjlTT+2LvTZzJIfo9BiHMPjQ/YDxNbjF2HxvMFD4
	 aeDWicT41gPEdWrfI+oTxe7ZVWnAA/96c7ipzBHhlaFkwvns/FZ+8EzRyZczWbNgq1
	 mzwpssl4jd7aYciOlL8bo6GQYsbYgDU5jp+nUCwSoj+fbBbdLVAVZR7FDwm/AKSWEQ
	 YSucK/R5IfBXjxMZSx6qv8RyR6GTHmR6lUG1wIfrjEdWG5YceFDmuvZWfkJuw6rSJb
	 TBp2x/NuYh5Qk+sczDYOaWkZAGZms86eY+vnJVDY00Y7MvZ0H96KWnM4EZ7jZf28DF
	 Qvhkbz5sERwfQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 37C8E3806651
	for <linux-gpio@vger.kernel.org>; Mon, 28 Apr 2025 10:05:10 +0000 (UTC)
From: Guido Trentalancia via Bugspray Bot <bugbot@kernel.org>
Date: Mon, 28 Apr 2025 10:05:26 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: linux-gpio@vger.kernel.org
Message-ID: <20250428-b220056c22-53f595229457@bugzilla.kernel.org>
In-Reply-To: <20250425-b220056c0-ca0f4862134d@bugzilla.kernel.org>
References: <20250425-b220056c0-ca0f4862134d@bugzilla.kernel.org>
Subject: Re: PixArt touchpad not detected due to wrong pinctrl
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: GPIO/Pin Control
X-Mailer: bugspray 0.1-dev

Guido Trentalancia writes via Kernel.org Bugzilla:

After further testing I can now confirm that the patch from Ariel does not resolve the issue and that adding CONFIG_PINCTRL_TIGERLAKE is the only possible solution so far.

Should CONFIG_PINCTRL_ALDERLAKE be disabled ?

Thanks for the links Andy, but I am not interested in accessing confidential information and in any case those links require a login which I am not interested in creating.

However, I believe the specifications should be made public, at the end users pay for their hardware.

View: https://bugzilla.kernel.org/show_bug.cgi?id=220056#c22
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)


