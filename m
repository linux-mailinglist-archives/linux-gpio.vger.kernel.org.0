Return-Path: <linux-gpio+bounces-19345-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EAAA9E2ED
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Apr 2025 14:14:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A8733BC635
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Apr 2025 12:14:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71CB12512C5;
	Sun, 27 Apr 2025 12:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dd1dhH2r"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2991E00A0
	for <linux-gpio@vger.kernel.org>; Sun, 27 Apr 2025 12:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745756068; cv=none; b=mgzocHjYsPFyvBbB9aXGkD5BLde+tTScL4tXrYGy6tdwc3ds1TtwGBJ3D2ujWBOWoTS3+wMkcfONR//+3/fL1retAAZOW0MYIY4A6y03rrLfLtleOU7CjZtdavA1i5263GElcCeN+CxcCr4ftwd+0SKdI7EVBsWgiQd1I8cHmtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745756068; c=relaxed/simple;
	bh=RB3EmF/3pZCV3k7OZbk1NY5YlbkbImQgr/okDxnuhos=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:In-Reply-To:
	 References:Subject; b=bg2c38XKGykjjAOmB8jyq858/vm7QrCKzePF2roafifgtb0etR+QeFWLxRPDciKoki5oduGP50PONvyM3tSt5U1NA7eHCOqf4YtJIsbLammKg7T48ZZaRDzOkYvQucIan3goerkBpoak11nE7j4qYaoQ9WQHWQJT+tfEXfs8eXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dd1dhH2r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 866E0C4CEE3
	for <linux-gpio@vger.kernel.org>; Sun, 27 Apr 2025 12:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745756067;
	bh=RB3EmF/3pZCV3k7OZbk1NY5YlbkbImQgr/okDxnuhos=;
	h=From:Date:To:In-Reply-To:References:Subject:From;
	b=Dd1dhH2rkWBTRioYxz6I+RAFuqZBFkyioVZITTMWBq9m8294NbMzzY0aWfZz/yFBz
	 9T8tEZvRovGCx3oDdT47l3ihB3YAaozxXCAoJIMvqG9J2QQVQoQcy9I+4xmQKvEo1O
	 8bjSTlzujMaA4OfgL50Jws0lkkAKVa7o/fafNwFvNqIwNGy5XYX9SAcb3Wnm5W1AQN
	 I/PjOebawIrLsjW1eMBI+k3855nBcuzJi85TXe5zKdAPA/5yX0l80RUAGMzqh41zkV
	 giwR6ZdIDNRBCtRrklmxjc4dPOm8JEWgqpS9Q/pyouG1Sf6pCUPGYhpe4/0Nwov45V
	 aPWbMfT/SzMVw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7497A380664A
	for <linux-gpio@vger.kernel.org>; Sun, 27 Apr 2025 12:15:07 +0000 (UTC)
From: Guido Trentalancia via Bugspray Bot <bugbot@kernel.org>
Date: Sun, 27 Apr 2025 12:15:15 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: linux-gpio@vger.kernel.org
Message-ID: <20250427-b220056c12-2f3973cb93c7@bugzilla.kernel.org>
In-Reply-To: <20250425-b220056c0-ca0f4862134d@bugzilla.kernel.org>
References: <20250425-b220056c0-ca0f4862134d@bugzilla.kernel.org>
Subject: Re: PixArt touchpad not detected due to wrong pinctrl
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: GPIO/Pin Control
X-Mailer: bugspray 0.1-dev

Guido Trentalancia writes via Kernel.org Bugzilla:

How can using the pinctrl driver for another chipset be the right approach ?

An user which configures the kernel for a machine based on the Intel Alder Lake chipset cannot figure out that the pinctrl driver for another chipset needs to be used.

I have tried searching for the official Intel PCH specification, but it seems that no specifications are available:

https://www.intel.com/content/www/us/en/products/platforms/details/alder-lake-p/docs.html

I agree that the current patch from Ariel does not respect the proper grouping and ordering of communities (which need to be based on official specifications) and that therefore it is not ready for merging, but the solution in my opinion is to fix the patch so that the Alder Lake pinctrl module correctly defines the I2C pins.

View: https://bugzilla.kernel.org/show_bug.cgi?id=220056#c12
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)


