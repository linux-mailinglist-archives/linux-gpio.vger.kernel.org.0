Return-Path: <linux-gpio+bounces-19341-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5674EA9E13C
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Apr 2025 10:59:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A676F17129C
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Apr 2025 08:59:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1831F2459C7;
	Sun, 27 Apr 2025 08:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fVmipPCH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8321A8F8A
	for <linux-gpio@vger.kernel.org>; Sun, 27 Apr 2025 08:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745744368; cv=none; b=fWNcoda8pmzX3cuZMpI0lCL9l/IG/agkto+/rAIzlxdg765qBaHnbhtU9EXExyYOLTHyj6lBZw4nrCQ5rwOJdLidZtP31sVYX/QUDem2L+RX09cwl2gUWcLturs7HGoFvPP5u++4n1IyY5X2yDwvDqsXneQTdZI2jMbOlgaxWrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745744368; c=relaxed/simple;
	bh=cVhPhl+EXZxC53TVJRAPQvDEnO/2P2sNgffGKz2tDHA=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:In-Reply-To:
	 References:Subject; b=QRbJTbj3U+YXQeBF32omEfBwFOyl2shEAxyAlDTVbLv26pIuBZl2Iu/6hvhBblRjY9y7maT8xR04suF2l/e9kUArKmcIuigttrobExk6NNAE4qqhRN+kliaCHHUJPI6doVCOO6qSuuxoiPAX9+1t3n6yiME+EfPcIANAIzhycYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fVmipPCH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 550DCC4CEE3
	for <linux-gpio@vger.kernel.org>; Sun, 27 Apr 2025 08:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745744368;
	bh=cVhPhl+EXZxC53TVJRAPQvDEnO/2P2sNgffGKz2tDHA=;
	h=From:Date:To:In-Reply-To:References:Subject:From;
	b=fVmipPCH4eRboZ1AtJFEYPw/VGvfSg/UyPn4ao2on8TSK/lT5UApQaou1JiMWtbJn
	 50k66X7ShR/oMiYmLqzITEHYAMXFuhNRcgYLfM6JrhScCUMlGOUGxHr/axCryrCT3s
	 7oXSbhxrZlsD3PIoZ5dWK/qrksBmfZaDUI7nEMXrvNTp793VZu8ZwTq1a0I4EuQVLe
	 WTJBmPWruwVxMQckfk1sk0TRPGTlKYXYVXVT4ytirQwJqDZr3MUYTkz53df5Ztsm0Z
	 Cel2q5+97dAbY/mz6J4+NSiDniAFW6RLI/2Z1LwL11fwzubcR/V+f+tW03QhhUBWjb
	 aFCaqGr9YQozg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 39050380664A
	for <linux-gpio@vger.kernel.org>; Sun, 27 Apr 2025 09:00:08 +0000 (UTC)
From: Andy Shevchenko via Bugspray Bot <bugbot@kernel.org>
Date: Sun, 27 Apr 2025 09:00:13 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: linux-gpio@vger.kernel.org
Message-ID: <20250427-b220056c9-f8963c50d9b5@bugzilla.kernel.org>
In-Reply-To: <20250425-b220056c0-ca0f4862134d@bugzilla.kernel.org>
References: <20250425-b220056c0-ca0f4862134d@bugzilla.kernel.org>
Subject: Re: PixArt touchpad not detected due to wrong pinctrl
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: GPIO/Pin Control
X-Mailer: bugspray 0.1-dev

Andy Shevchenko writes via Kernel.org Bugzilla:

Folks, I don't know what's going on here, but using the Tiger Lake driver is the correct approach. So, what's the problem?

View: https://bugzilla.kernel.org/show_bug.cgi?id=220056#c9
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)


