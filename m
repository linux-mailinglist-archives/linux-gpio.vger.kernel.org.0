Return-Path: <linux-gpio+bounces-19337-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD56A9DDB6
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Apr 2025 00:59:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8807E1B6146C
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Apr 2025 22:59:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D9D41FCF78;
	Sat, 26 Apr 2025 22:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GdvZ9ZcR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6921DDC1A
	for <linux-gpio@vger.kernel.org>; Sat, 26 Apr 2025 22:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745708369; cv=none; b=s4gB3/G3ieUrABx7hKmTgcyXXYCyO9ePdvzoOIn4MbgmHNWWp/DAhID/19GQ2xc6rttWT5e+j8Ly5at9Do4gjwmPnrJpl/8lPmnJhZMFEItOFUF/QMzMGzpjTfPtRArakmULhiT7au4bsH6B+052d9VN/N+V5QMYoKiaA9SyAls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745708369; c=relaxed/simple;
	bh=kgG69kTGqZL+0RMfdKmJOFc+bQJdtcr3JhQSDr1LIpw=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:In-Reply-To:
	 References:Subject; b=hGQyZQCytgKIQEqAIkGyAr/jCHS5vcz3yB6Pcpw/Fm99hY44mMGnGXYjeYE/MRvvGacGSUr4ASx8oMWlmcLc+0kp+me+OAXF12Owt3v/bUNs4bR1P+TPdVibFecSFG+sy0D6+4OJf0xAvfg9dKtomFdHX7AAC1zr/6MiNXHp84E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GdvZ9ZcR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D699C4CEE2
	for <linux-gpio@vger.kernel.org>; Sat, 26 Apr 2025 22:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745708368;
	bh=kgG69kTGqZL+0RMfdKmJOFc+bQJdtcr3JhQSDr1LIpw=;
	h=From:Date:To:In-Reply-To:References:Subject:From;
	b=GdvZ9ZcRB6j/cN8alDmBuGf1n/jV94kGqCGF/0ioP1yLf/J0Uj8hP6JxOiRyhx9lr
	 GRivDGj9EZjl2Dn1qpZQxsbp4nLfsK03j7v6/Ec4s2mns5Za/s+6OPFHplMbe6+ml2
	 jJjyAyl/FqGwKaioFmSZSLLqQA5MlK2c3O8kqjL1ZjZ6BVDvX326Rg9r+piGdqex9D
	 KkDYgrbbMEcoGyDhm7L7t0QyyT624r/Iblx4aIc1rCNCnnTK8PnDJZs4gJYkSCr1LY
	 S1hylsbrPyXx2fLeKdi5XlpAKVRGZ/f67gQGVTl82lcyrwRx+9wlKH7tSJ5Intfbob
	 dZcF2Qhm5rvpA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 75FAA38111CC
	for <linux-gpio@vger.kernel.org>; Sat, 26 Apr 2025 23:00:08 +0000 (UTC)
From: Ariel Simulevski via Bugspray Bot <bugbot@kernel.org>
Date: Sat, 26 Apr 2025 23:00:12 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: linux-gpio@vger.kernel.org
Message-ID: <20250426-b220056c8-4e2ffc4ee4b0@bugzilla.kernel.org>
In-Reply-To: <20250425-b220056c0-ca0f4862134d@bugzilla.kernel.org>
References: <20250425-b220056c0-ca0f4862134d@bugzilla.kernel.org>
Subject: Re: PixArt touchpad not detected due to wrong pinctrl
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: GPIO/Pin Control
X-Mailer: bugspray 0.1-dev

Ariel Simulevski added an attachment on Kernel.org Bugzilla:

Created attachment 308027
Revised v2 patch: add missing I2C2/I2C3/I2C4 pins and update community structures

Hi Guido,

Thanks again for the feedback.

I have uploaded a revised v2 patch that corrects both the pin definitions and the community structures as you suggested.

Would appreciate your review before I send it upstream. Thanks!

File: 0001-pinctrl-alderlake-Add-missing-I2C2-I2C3-I2C4-pin-def-v2.patch (text/plain)
Size: 2.39 KiB
Link: https://bugzilla.kernel.org/attachment.cgi?id=308027
---
Revised v2 patch: add missing I2C2/I2C3/I2C4 pins and update community structures

You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)


