Return-Path: <linux-gpio+bounces-28158-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D2AC39CAA
	for <lists+linux-gpio@lfdr.de>; Thu, 06 Nov 2025 10:20:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10AB0188A6E8
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Nov 2025 09:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BFDE304BA2;
	Thu,  6 Nov 2025 09:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LYZNqSR6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB8D25771
	for <linux-gpio@vger.kernel.org>; Thu,  6 Nov 2025 09:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762420835; cv=none; b=Ey5kaMKiF+gJduUaBCreQyM6NhctBzwEho2VR4fJO9LENAKz8armoKMd4DXAuekLk36wFe19YpOogA08XeD8CN2f8bI0fHmp0sO7Nr/TQoDFWkvXWMKMCw2S+rcFOyzFpfT+SUT606HeiqDz47IWl+YcJo9AisSKeAORVpdypq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762420835; c=relaxed/simple;
	bh=oDUtiRUF3S/r3zpiR/v4qLbhCMLT8KdNsALeMFJVd34=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:In-Reply-To:
	 References:Subject; b=jBW0Dj/1laCzu9rqeWqxxgIlU1FI1FvjFN+7CAKiX8p1plU685lYt5QpbsIvgQTlruS/4zALsX6cRB5MDpdGEAS92INnGmKsLYQhVxkTVfmFHzVJOWiMPk9zEpFeoK8HFS/4VJDGcrZLmxDPU2VT1vLbAwGwYXQER3+cyosz7gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LYZNqSR6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 773CAC4CEF7
	for <linux-gpio@vger.kernel.org>; Thu,  6 Nov 2025 09:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762420833;
	bh=oDUtiRUF3S/r3zpiR/v4qLbhCMLT8KdNsALeMFJVd34=;
	h=From:Date:To:In-Reply-To:References:Subject:From;
	b=LYZNqSR62wxiDvDgEcOXncFA5CWAC7ULZPleRG2WRrKjCr0kuQXVWsBoO+JwWjcqJ
	 9XsUhajdamZAOYgJIlo2BE5WGeGUSiN7Ea/Jp400053cVjpVbgKosqMWnSufJdtU/C
	 xnwExd07MrcYW1ZUubLeDtp0j+1JPgWrjpA5HrJlvqdPujhInNK34mlN0tpKOFOp4O
	 RYAkQ/5VAN1rHnhZ3duuB/qPnf6FCEykDURlVGrJXa18iHo2sv25ctrOHQOsgc94o7
	 hJXToA4DGMfNNUmoGmR/JUhlgbljWBx/9F5wYTU+tIftAss2KGoWGe0qRWZuP6DvAw
	 bV9synrfOaMCQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B1BE4380CEE6
	for <linux-gpio@vger.kernel.org>; Thu,  6 Nov 2025 09:20:07 +0000 (UTC)
From: linux4all via Bugspray Bot <bugbot@kernel.org>
Date: Thu, 06 Nov 2025 09:20:06 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: linux-gpio@vger.kernel.org
Message-ID: <20251106-b220733c2-93dfcb2c5934@bugzilla.kernel.org>
In-Reply-To: <20251102-b220733c0-57e8f5019609@bugzilla.kernel.org>
References: <20251102-b220733c0-57e8f5019609@bugzilla.kernel.org>
Subject: Re: amd_gpio AMDI0030:00: failed to lookup the [default,sleep]
 state
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: GPIO/Pin Control
X-Mailer: bugspray 0.1-dev

linux4all writes via Kernel.org Bugzilla:

I was not aware that I enabled some sort of debug mode. Which kernel config word/line belongs to that?
The word "failed" indicates to me that there might be something wrong.

These are the reasons why I reported that issue.

View: https://bugzilla.kernel.org/show_bug.cgi?id=220733#c2
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)


