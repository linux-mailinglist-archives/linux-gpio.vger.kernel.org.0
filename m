Return-Path: <linux-gpio+bounces-19347-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CB5A9E3F5
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Apr 2025 18:29:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0788418944F7
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Apr 2025 16:29:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25E1D1B0F33;
	Sun, 27 Apr 2025 16:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LAd05eQR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9E315747C
	for <linux-gpio@vger.kernel.org>; Sun, 27 Apr 2025 16:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745771367; cv=none; b=IRRbErQNbLzhKqUy6FH+H23Fst8QtykeRs9Fn/hJjn6PBSxuwT3oxI/avn1douN+iWo8TWEWn9Mc5C89NjIoZDOOxBqMr8oVELWnM/pH4R9+9ZiQVB+ufPTx2/FPpNbx7IRhiQD+pLeGPSf4VKKSqJrXBAD9c+Y03K5w/o4F/EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745771367; c=relaxed/simple;
	bh=6T13l4wkeQxaqPT1Z+pBsVa4rOHVdct3E0KebRIEL8E=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:In-Reply-To:
	 References:Subject; b=Iiyw1Ev0NqsvaghkeH16/4hSkjOCTOyKLhUmouDxeky4IohffWrTE84EDHbW9X0rABJz/AMcRvCqGyxVFZ+fM7bHKdQ2AuY81Y1zRGrB+7NiLONEIp2C9x3jUDQp/iZ2/YIvHrx0GHwKKSSaOAesK79BGa+017Rpq7GG02k3oQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LAd05eQR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53CECC4CEE3
	for <linux-gpio@vger.kernel.org>; Sun, 27 Apr 2025 16:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745771367;
	bh=6T13l4wkeQxaqPT1Z+pBsVa4rOHVdct3E0KebRIEL8E=;
	h=From:Date:To:In-Reply-To:References:Subject:From;
	b=LAd05eQROjMJ5wI2lN1DE3mIkt97hOu5qzglJ19M+BnQ5ELeBKqgRHsP3uWMLa/Eb
	 ubRcabO/7scPkRAPXpqze41VRXXtoHTRRMWkHqJ2O+8RhbvhqsQTZq722E7GLDsh64
	 YQpV58Nv3hftJM813hVw7TcAW8LCPVnl9knLP4LYz8NbznCS7B4ur/7xie+Qz+9lWP
	 7jwF8qxjsWFnh7fFxfzbLi+rlw4VKdK7Y1akoyNAPKECV4AD3tOHUiwcgtLs86He4r
	 mWLRNoEwfd8su5gbMYzTyI5h0rYTXkmVo6H0rm/Z/z7yXyyxIqQ3aefMDG97irtjVn
	 kLIWK1A/Yn/yw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 38201380664A
	for <linux-gpio@vger.kernel.org>; Sun, 27 Apr 2025 16:30:07 +0000 (UTC)
From: Ariel Simulevski via Bugspray Bot <bugbot@kernel.org>
Date: Sun, 27 Apr 2025 16:30:17 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-gpio@vger.kernel.org
Message-ID: <20250427-b220056c14-65b296b1b462@bugzilla.kernel.org>
In-Reply-To: <20250425-b220056c0-ca0f4862134d@bugzilla.kernel.org>
References: <20250425-b220056c0-ca0f4862134d@bugzilla.kernel.org>
Subject: Re: PixArt touchpad not detected due to wrong pinctrl
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: GPIO/Pin Control
X-Mailer: bugspray 0.1-dev

Ariel Simulevski writes via Kernel.org Bugzilla:

Yeah as it stands, this grouping is based on observation, not official documentation (I think I even wrote that in a comment in my first patch). As I don’t have access to the Intel PCH documentation (and am still getting into Kernel Hacking), these were more or less educated guesses.

Andy if you prefer, I am happy to withdraw the patch and instead suggest documenting the need to use CONFIG_PINCTRL_TIGERLAKE for affected systems.

I do agree with Guido tho that the status quo is sort of confusing.

View: https://bugzilla.kernel.org/show_bug.cgi?id=220056#c14
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)


