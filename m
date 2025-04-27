Return-Path: <linux-gpio+bounces-19350-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E966A9E44D
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Apr 2025 21:04:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0361E7A8ECC
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Apr 2025 19:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B6F71C695;
	Sun, 27 Apr 2025 19:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tQbkcwJT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1AAA55
	for <linux-gpio@vger.kernel.org>; Sun, 27 Apr 2025 19:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745780669; cv=none; b=SxWsyAqMcPvb68dsdT9sN9j2CoUvXaRIPjNyBI9vPU+TeK1sGfdJs7/TdmBLVLCW45Wt/IAbP7PDw34sF5RFi0OQODSn9dlsysFvx0b7imt9THLR+zJyDAxjIuv5cjAqpvkU/hpWcm9FHXcmlPwFh2NSgyJ8RxmPzPSWuxCc+SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745780669; c=relaxed/simple;
	bh=x1WmZGVldu8lcdusTLKHtyDVW25Ujh1g9ySeKZGfZvE=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:In-Reply-To:
	 References:Subject; b=Fhn5WSViSMNvyDQL74s7K1JGTj0vUAmCBjMCw3kAKvE4Jp0DiAyGWZ77hXHGQe9zKRIFt+M509DIbo5VNYKaCKNDbnyt0Kp2TsssSnylCHSIPXx8Z/SNoAukllP66yTKur8aHjKzN39SFBp3/VGEIPPw1SxK3/m2KqBeJe9zn/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tQbkcwJT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A0DEC4CEE3
	for <linux-gpio@vger.kernel.org>; Sun, 27 Apr 2025 19:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745780668;
	bh=x1WmZGVldu8lcdusTLKHtyDVW25Ujh1g9ySeKZGfZvE=;
	h=From:Date:To:In-Reply-To:References:Subject:From;
	b=tQbkcwJTtcCnbHNhJwP7bQzQLF++ytu3dg/9ranEatcrJDZoILtGfrp1gTfpYqBom
	 ouvvzj/u6dNpDHXv3b2tZfNe2irY5UYoBH9cIXSQZiusiW1ES4bdrpVCQTqKPuHxlU
	 YOXmbX4j5ZQTOA+62MQEEOnKS1VGXOfNSR40jJxsHC6y6Yew1C72VyWwIyAogcG5Q1
	 V7zCdcGFmV176uy89Ccm1FKsHKcWlCZoh3aYFlWF7pWG0cFSAKx9UM6kmp9XXFmjFq
	 wxWTAwG1JPXR9Wbx/UtEWK+SUjhwcfpTxN9gMaCDPSNwoTm0hRmh2yoM8eXoSIrlMd
	 TKtINzUJJQMQw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 37AE9380664A
	for <linux-gpio@vger.kernel.org>; Sun, 27 Apr 2025 19:05:08 +0000 (UTC)
From: Andy Shevchenko via Bugspray Bot <bugbot@kernel.org>
Date: Sun, 27 Apr 2025 19:05:21 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-gpio@vger.kernel.org
Message-ID: <20250427-b220056c17-9aa54300f731@bugzilla.kernel.org>
In-Reply-To: <20250427-b220056c14-65b296b1b462@bugzilla.kernel.org>
References: <20250427-b220056c14-65b296b1b462@bugzilla.kernel.org>
Subject: Re: PixArt touchpad not detected due to wrong pinctrl
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: GPIO/Pin Control
X-Mailer: bugspray 0.1-dev

Andy Shevchenko writes via Kernel.org Bugzilla:

(In reply to Ariel Simulevski from comment #14)
> Yeah as it stands, this grouping is based on observation, not official
> documentation (I think I even wrote that in a comment in my first patch). As
> I don’t have access to the Intel PCH documentation (and am still getting
> into Kernel Hacking), these were more or less educated guesses.
> 
> Andy if you prefer, I am happy to withdraw the patch and instead suggest
> documenting the need to use CONFIG_PINCTRL_TIGERLAKE for affected systems.
> 
> I do agree with Guido tho that the status quo is sort of confusing.

To understand the issue, I need to hear how you reproduce it and how this patch makes it different. The drivers are bound to the devices based on ID tables (ACPI ID table in this case). Your change doesn't alter that and hence it can't be involved in anything related to this case, it can't *fix* anything.

View: https://bugzilla.kernel.org/show_bug.cgi?id=220056#c17
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)


