Return-Path: <linux-gpio+bounces-19332-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AADDA9DD58
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Apr 2025 23:49:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7833C464D05
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Apr 2025 21:49:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA9BF1C3BE2;
	Sat, 26 Apr 2025 21:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ua3SG8mh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98507139E
	for <linux-gpio@vger.kernel.org>; Sat, 26 Apr 2025 21:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745704169; cv=none; b=aBbfrte1GsbkIj9eK951X8mYo07GCqbwIWJXzqvfOPHyrxjwDxGonp7jAb7X7jSh3s9fqyXdLRW2i5jjPK42fTi6pN5w2KPyJ5dcNswCTMzFtFkvbsq/0RYHHzhThnETGUdzEBbxZnbsnvkjGGFiTbeOP9HdBUx+rZ13WaJfafE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745704169; c=relaxed/simple;
	bh=idwS3cB0rlNMxaoE3f2k9rFGRQFfwmF9RHQRts+Z6Vk=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:In-Reply-To:
	 References:Subject; b=bHRzcNx4btk7h185TzrvEPS8Z4tzva4eTSd+F+g34LK/phc2WVCZXCjuc/fyQyklyovSX+2s+Zi5Oyf+H+2R6c1qltIMWLSi7sa8Fg4UwVF/ndZ79PmMZYeEZCgE7QoO3DnQC1DL+Bvmo8GyV7odD+vIoblquCDJqMg4ZONmUqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ua3SG8mh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 207C5C4CEE2
	for <linux-gpio@vger.kernel.org>; Sat, 26 Apr 2025 21:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745704169;
	bh=idwS3cB0rlNMxaoE3f2k9rFGRQFfwmF9RHQRts+Z6Vk=;
	h=From:Date:To:In-Reply-To:References:Subject:From;
	b=Ua3SG8mhzLM42kWC394OVFBzGh8aTe7C+mpt0RZlY8L/qPtkF6oP+uPd1PRoDcZ3q
	 4+l6TeweCDGP+CVmmU6YkUv6F9jaB3kJRy9O5B5iQfCJbI7HM7b3V1SnEdIfvyPlwl
	 wif/Up+1ofL1zCeoVEHppiGSbABvbdG9jwoUTNrCBoJUpUO9QLhIVZjznjSd3EeZcv
	 4fsOJG2DV388e0m3xKPnqY5hdFhn/WalWroZv2GLJCAMroCIuqjA5viA4xf/sM/xpY
	 eQXqjEEZN4nB5yHoI6VzM6nzW7I8W/jppw+/jtT3D+EHf52GVyrILyBJkFOUqG0NgN
	 uWE0D4PJejkMA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EFD5C38111CC
	for <linux-gpio@vger.kernel.org>; Sat, 26 Apr 2025 21:50:08 +0000 (UTC)
From: Guido Trentalancia via Bugspray Bot <bugbot@kernel.org>
Date: Sat, 26 Apr 2025 21:50:07 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: linux-gpio@vger.kernel.org
Message-ID: <20250426-b220056c3-b51448982819@bugzilla.kernel.org>
In-Reply-To: <20250425-b220056c0-ca0f4862134d@bugzilla.kernel.org>
References: <20250425-b220056c0-ca0f4862134d@bugzilla.kernel.org>
Subject: Re: PixArt touchpad not detected due to wrong pinctrl
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: GPIO/Pin Control
X-Mailer: bugspray 0.1-dev

Guido Trentalancia added an attachment on Kernel.org Bugzilla:

Created attachment 308025
Proposed patch with correct pin numbering and comment

Revised patch which does at least introduce the new pins with an acceptable numbering

File: linux-add-missing-I2C-pin-defs-left-over-from-tigerlake.patch (text/plain)
Size: 1.69 KiB
Link: https://bugzilla.kernel.org/attachment.cgi?id=308025
---
Proposed patch with correct pin numbering and comment

You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)


