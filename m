Return-Path: <linux-gpio+bounces-19343-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2E4A9E219
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Apr 2025 11:32:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15B94189549A
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Apr 2025 09:29:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2C2024E016;
	Sun, 27 Apr 2025 09:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TIvTlM69"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11382459D2
	for <linux-gpio@vger.kernel.org>; Sun, 27 Apr 2025 09:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745745868; cv=none; b=rlyoVzpe9eov7KNcvx/HcSNU0ivOEONnqSgc/wGcfopRJVlNFb8Zr1OC2Ukch74h/NlQkc2N8ONytos6XbBXrA/JvsVkm73nuNLF+Ka1Tg3CZ6MLWCIt6h2nSbsj4bjb+KcAuSEOO0zKNSjmCTecKbwATdZXYgpoaSYP7mCkdbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745745868; c=relaxed/simple;
	bh=kv6vAHxp+c5RkmgmksQ5a/b72Bb9Sy1UsrLMre+AgU8=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:In-Reply-To:
	 References:Subject; b=RcvEqtuzbipdl1uVHWk5fimJA4b/kWrF+bWkltp0yhGDM00BYETUQKFFx5pDsAhdRn/88A7aRUuIkC5DOsjpT2H7ab0RXrOQ9yjOh2YuCP5dRkcnKJxcCVoo5ABAqQBSNFB5yGkmSJADzJPHs6nQcUhMCbw1mavmQcWazfOMv8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TIvTlM69; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14F69C4CEE3
	for <linux-gpio@vger.kernel.org>; Sun, 27 Apr 2025 09:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745745868;
	bh=kv6vAHxp+c5RkmgmksQ5a/b72Bb9Sy1UsrLMre+AgU8=;
	h=From:Date:To:In-Reply-To:References:Subject:From;
	b=TIvTlM69SNlGwnsfl24nZEpNdGtUMmY794QoH8lQWXMqld0JnL0Ih4psOcnHmrwla
	 +2SNyphDeGMXbU4CTG9zkFWNRKvP+J7VOrlWSD7SpXvg9Ljl+4cY2QWp8Dtz0duZVa
	 ST1DTTnJpLyirB2CO+bj5ObwpRo7VN12yyvbzz+qcxuUdZDXulmXux/u92jkQH5SAX
	 Go6Y4WtgFjUI1uFYanj8msO2eBqaIpLq4n6/AcKx84J2c0ESHfdSFztvYKOyvyvAWY
	 DUqugQUA8ZhaJiM71Z5vCVFecoTZAjgyrdEFgRLwiu/oZN6PHkIXETHpXBRXJVvxdO
	 kzLoYi/lvMlTw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EE9DD380664A
	for <linux-gpio@vger.kernel.org>; Sun, 27 Apr 2025 09:25:07 +0000 (UTC)
From: Andy Shevchenko via Bugspray Bot <bugbot@kernel.org>
Date: Sun, 27 Apr 2025 09:25:13 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: linux-gpio@vger.kernel.org
Message-ID: <20250427-b220056c10-c3ab425b95ee@bugzilla.kernel.org>
In-Reply-To: <20250425-b220056c0-ca0f4862134d@bugzilla.kernel.org>
References: <20250425-b220056c0-ca0f4862134d@bugzilla.kernel.org>
Subject: Re: PixArt touchpad not detected due to wrong pinctrl
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: GPIO/Pin Control
X-Mailer: bugspray 0.1-dev

Andy Shevchenko writes via Kernel.org Bugzilla:

Note, the patch without shuffling the ACPI IDs does basically nothing, it adds random pins to random driver. I'm utterly confused on how it may solve anything, but adding problems.

View: https://bugzilla.kernel.org/show_bug.cgi?id=220056#c10
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)


