Return-Path: <linux-gpio+bounces-19331-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCBAA9DD23
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Apr 2025 22:39:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BC9E46588B
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Apr 2025 20:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70E6F1F463C;
	Sat, 26 Apr 2025 20:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EgJmHhze"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F8E1A256E
	for <linux-gpio@vger.kernel.org>; Sat, 26 Apr 2025 20:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745699968; cv=none; b=lOSCLtIXX62iD+X1hElwjh6LxdQiuLHCLzAuJCj9KjnXaTb8mXXELAtPJDfYkI03nu94UK+DnVxnwJ1/wNZNvRp4q7ZHdhlk0ufXw/NSOZBm9jdsSLweVEJL4ZJUU/rU6roMe/fLZyemB5rxFyN3K+baIjO8e7lIBdczCiTChuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745699968; c=relaxed/simple;
	bh=nSgGlMPhi46oLyXyXbCxhqDZfJTb/sC70qZtMdfe84A=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:In-Reply-To:
	 References:Subject; b=DRGkMlb875w6UZ2VOuDHPzN0Y5f/Fw+Iohqdc9jvDrBrfEumNTAHTJruwzLQrKJq75eK8z9UqcvpBFrMGtDNhn6TDhkO/uQ1PajnxYIc0G0Lqhd2Ws/2tYq3vX45Zhkbfy1dbTFJUTfXLEDu4CrFWNpMb5cnq0mBVmnkK6KQumc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EgJmHhze; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 997AEC4CEE9
	for <linux-gpio@vger.kernel.org>; Sat, 26 Apr 2025 20:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745699967;
	bh=nSgGlMPhi46oLyXyXbCxhqDZfJTb/sC70qZtMdfe84A=;
	h=From:Date:To:In-Reply-To:References:Subject:From;
	b=EgJmHhzeX3E04dtYXgov43vPIwUqJbbcTOfqRz981XlUtLtFT6liFaZ/ccVSeBdZ3
	 CrJyQy8zstg2UW6VEo/2X/InThjvwG4LkOnVDafXPFAjormYTzExsbo111qEI1BhJW
	 opnyIm+AUoKUQIw8CawcjS8Qt6QZ+NLzHmwvfxZnnZXAlKO/M52XQmLbIKLdQpbD4W
	 VGBPsEqcch4lnjyvMsdqLZE/FLe2B9xGawVgL8GsF6PHwqonUUogfy0vgAe7INr6Mg
	 YmHcJgAoOqWo6lNJeZ1fNdTo6TbX2QFE8FQLs6EeyuSZsW0StGKLhkvAmT8lGKm4z1
	 N98DEUua0zhmw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 75F7A38111CC
	for <linux-gpio@vger.kernel.org>; Sat, 26 Apr 2025 20:40:07 +0000 (UTC)
From: Guido Trentalancia via Bugspray Bot <bugbot@kernel.org>
Date: Sat, 26 Apr 2025 20:40:05 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: linux-gpio@vger.kernel.org
Message-ID: <20250426-b220056c2-52a44c87a9dd@bugzilla.kernel.org>
In-Reply-To: <20250425-b220056c0-ca0f4862134d@bugzilla.kernel.org>
References: <20250425-b220056c0-ca0f4862134d@bugzilla.kernel.org>
Subject: Re: PixArt touchpad not detected due to wrong pinctrl
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: GPIO/Pin Control
X-Mailer: bugspray 0.1-dev

Guido Trentalancia writes via Kernel.org Bugzilla:

I confirm that the proposed patch resolves the issue. Thanks.

View: https://bugzilla.kernel.org/show_bug.cgi?id=220056#c2
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)


