Return-Path: <linux-gpio+bounces-19348-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E33A9E43B
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Apr 2025 20:59:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EBAE71896706
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Apr 2025 18:59:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F01221ADC83;
	Sun, 27 Apr 2025 18:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NIDqDUue"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9B4288D6
	for <linux-gpio@vger.kernel.org>; Sun, 27 Apr 2025 18:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745780368; cv=none; b=rRJpGgw4TtXbYX3Utt3jpYdKBc1u27oOwxGD39RAIDGagw4K3VXxVxahL0DylncEwuJncVuXBDaB2hbK0ixnv8Q2zb0+ApRUIDczL8ySO6IlHBF7hH6JWR4jDGK4TUZVQCsti/cjbFRuyGzeEp/fyO/x16Pm+MUB2bslktrY5t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745780368; c=relaxed/simple;
	bh=WzsfSRE6rhlz8JnRxzbxtufx46n6wSPfW5Ia3jU0LxE=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:In-Reply-To:
	 References:Subject; b=YVvlMTIhLoIgXV8cdBVuXYCtQhJMgSoE62BPx/R+oINgmRwc0XGYznIGcfQlXkqHSFCARmf0K4GBZPAJUhmHgO+/FJKznkMaHnYIuPDSaRQWnptFR/wLD+gswuENQNNMkckpafnlZMFgIZwT6vd1SppnejTnhdv+bIzwbbG61MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NIDqDUue; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A5B5C4CEE3
	for <linux-gpio@vger.kernel.org>; Sun, 27 Apr 2025 18:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745780368;
	bh=WzsfSRE6rhlz8JnRxzbxtufx46n6wSPfW5Ia3jU0LxE=;
	h=From:Date:To:In-Reply-To:References:Subject:From;
	b=NIDqDUueRIarNG6Wti5f06rtxDWUIJMB+o9i3Docy/SIv39h/+1G6pSg4GnbyJu3R
	 wuRIr4fuCMfMKCUe/wufXu03SsgBldcJ6MwaKVcVTDBUANofgcSsJ36wb42I7ALGsH
	 41BNw6XH9c2GGxnydMsoRimfUZpXBhBlxG/xmfi44ersA8cP0FoKS84uDnA3AkJ03Z
	 cEF4Rb8U5zIuj0OhEtARFr8NuoxkWpiiurjZ/XKLMiJ+jYf3i7O3i0F5U6VdituYxa
	 e39FI9oZbMB2qHllt+5TjUonONtcHq9nZWPMdJm+GeTUM7Y3ZykweMiYuQOutDVSZS
	 b0G3qzIouJmQA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F00DB380664A
	for <linux-gpio@vger.kernel.org>; Sun, 27 Apr 2025 19:00:07 +0000 (UTC)
From: Andy Shevchenko via Bugspray Bot <bugbot@kernel.org>
Date: Sun, 27 Apr 2025 19:00:19 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: linux-gpio@vger.kernel.org
Message-ID: <20250427-b220056c15-b371bf1036c5@bugzilla.kernel.org>
In-Reply-To: <20250427-b220056c12-2f3973cb93c7@bugzilla.kernel.org>
References: <20250427-b220056c12-2f3973cb93c7@bugzilla.kernel.org>
Subject: Re: PixArt touchpad not detected due to wrong pinctrl
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: GPIO/Pin Control
X-Mailer: bugspray 0.1-dev

Andy Shevchenko writes via Kernel.org Bugzilla:

(In reply to Guido Trentalancia from comment #12)

TL;DR: Yes, we probably need to amend the help texts for the kernel configuration options, no code seem need to be fixed.

> How can using the pinctrl driver for another chipset be the right approach ?

This is the big misunderstanding here. Linux is NOT a Windows in a sense of the device driver model and what the approach is used for the supported platforms. Besides that the granularity of the platform is not a *chipset*, it's *an IP*. And this makes a lot of differences here. The whatever chipset or hardware in a sense may use and re-use the same IP blocks over and over. That's why one driver can span over several generations of the hardware. This approach applies to many vendors and much more hardware IPs than just this case. I suggest you to study this more (in case you want to go deep with it).

View: https://bugzilla.kernel.org/show_bug.cgi?id=220056#c15
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)


