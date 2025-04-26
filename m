Return-Path: <linux-gpio+bounces-19336-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDF4A9DD96
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Apr 2025 00:39:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5313F924586
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Apr 2025 22:39:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E7FF1FDE19;
	Sat, 26 Apr 2025 22:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZS59C8LS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C878B1E9B06
	for <linux-gpio@vger.kernel.org>; Sat, 26 Apr 2025 22:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745707169; cv=none; b=TylxiuYggN7zBesR2lzgMKfGb2YEJZwGjVALh/UTRWipnyONMgZHVbS+TFTbYy5VzhjQHlvfBjM9caZh9cvdCdeOl2OO7a4He7BEzev79J168jDPd+ImCSi5vL3M2BQx+dq1nDyn4z7x3LNcnJYX04SF0D3cBQHAWCs4xSK1xb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745707169; c=relaxed/simple;
	bh=sTinceqKRZD+gx9XoWajyD20pk77gYkaP1krPqflgyk=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:In-Reply-To:
	 References:Subject; b=NKo1AluDW280h2VLY3yvpJSSICKb4IDFqVlLHLsX7ETHU3C2TL0d6w1GHf3heJDA/u7sF+cecPqnP4ZdR2xQLqB57lkJtAi24iKKX57vyxiVYyeK3U6uagJZQJV218SNA8W6W+x2SOE2APz+ccKn86HWPlc/pXQnMmmhxEqx7GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZS59C8LS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E650C4CEE2
	for <linux-gpio@vger.kernel.org>; Sat, 26 Apr 2025 22:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745707169;
	bh=sTinceqKRZD+gx9XoWajyD20pk77gYkaP1krPqflgyk=;
	h=From:Date:To:In-Reply-To:References:Subject:From;
	b=ZS59C8LSwsGJgRS5G0YKVKHSVvg4hy8OSr1B7oHEcq9Wcia5tNeKr17TAuG9Yl6Rh
	 66kIi+JzkG7tC/ggaTM3Ya79FHxgS1cyNk54239sAm+pguKgre6eC2BZivg4/Y8zKs
	 Qm7Ja1m4wGPRIML59BlbK5zXDzIaBpGq6+F1AAoJrLgN3ymwFhQRMoyMQ2JyHfsFSI
	 HAS3mBJxH9I5PgPbdmfPAL1iIjgw6IitjQ6kXWHQpcAPVvgZITjYE2hsMIo06Im+/N
	 PDgIC3vHWLFVVLY0NewEAzM94fw5GxT/l+EGmoDf7lwj5ISIxaNjlBQO5sZtGxf3f6
	 WLCrBkPkwFcXA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33F1D38111CC
	for <linux-gpio@vger.kernel.org>; Sat, 26 Apr 2025 22:40:09 +0000 (UTC)
From: Guido Trentalancia via Bugspray Bot <bugbot@kernel.org>
Date: Sat, 26 Apr 2025 22:40:10 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: linux-gpio@vger.kernel.org
Message-ID: <20250426-b220056c7-050ea8316623@bugzilla.kernel.org>
In-Reply-To: <20250425-b220056c0-ca0f4862134d@bugzilla.kernel.org>
References: <20250425-b220056c0-ca0f4862134d@bugzilla.kernel.org>
Subject: Re: PixArt touchpad not detected due to wrong pinctrl
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: GPIO/Pin Control
X-Mailer: bugspray 0.1-dev

Guido Trentalancia writes via Kernel.org Bugzilla:

If you submit the patch as it is, it will probably be rejected even if it resolves the issue.

I don't have the Intel specifications, therefore I am not sure how to proceed. 

But please consider that the pin definitions are grouped in communities.

So, the structures at the bottom of the file also need to be updated...

Please see the latest revised patch on how in principle the bounds of the structure definitions need to be updated.

View: https://bugzilla.kernel.org/show_bug.cgi?id=220056#c7
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)


