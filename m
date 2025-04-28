Return-Path: <linux-gpio+bounces-19395-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F94A9EE78
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 12:59:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4BA6189F9BD
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 10:59:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8568262FD8;
	Mon, 28 Apr 2025 10:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aEsD737a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787EF38F9C
	for <linux-gpio@vger.kernel.org>; Mon, 28 Apr 2025 10:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745837968; cv=none; b=fibX6S/6HzHkU7Q/x4r67JAa9hYcnH8ZduRo+00xv6EGm5I2pC+VmTif6xlm3pQgFCCF8kUrFniVRp3IS/YK07wBpKcGv7rtI+DABN4cnxI0/AQoOswgdnvtpBnE8FiUovUmrjA4CAp8lgIEkOTe+NdoQPdwQicLwPpSCQ7RiT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745837968; c=relaxed/simple;
	bh=P/n5qfUWZdb3YysThNPT1Zhj1sg3ahGth+mH1kCuym0=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:In-Reply-To:
	 References:Subject; b=NhMLX+QBgQAlaIn4r4qDFeJHlprUJUwbzsesMFHeR3QFp1Ji7KMhvKVkRrecU5jBBkeibzdqSatvFz8VO/PxfIlxYAVSLcZY/rli7tsLPTXxKkagnNTvFWkkNqtHyy+Lqo2pVAUoWp2ZIh81G44dGCx2TKKZTYdJN6iDGLh31JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aEsD737a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAEB3C4CEE4
	for <linux-gpio@vger.kernel.org>; Mon, 28 Apr 2025 10:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745837968;
	bh=P/n5qfUWZdb3YysThNPT1Zhj1sg3ahGth+mH1kCuym0=;
	h=From:Date:To:In-Reply-To:References:Subject:From;
	b=aEsD737alNkG9LX+YlJBuSIo8GfxmaSrwVVtNk0cktWRU0EpSYPKQYPkpEBmNN2uc
	 48hXwccXXzdlfJj7gyldLbIYwwsuwUwy0kOO24zPKDpVdBOEcK7xWq+0n4jbv7AphO
	 sZY6KXKLMwUArxArtv7Rp2Wf+Huni9nxAf74bNSmci16WjMCtRjHd9WUel/Bm33fxp
	 GpohDLujKGF9+XWA5IgLO0h56V6shXX5eOmYm04GaJtbD3+B7WyrAr/tZm4WRB9DuE
	 BWzTND6wT1+Kh0dUYn6cON9qp/O3V4SXscgxvSIKhf/evCWcjH5tETGb4WrDQKLcJ3
	 4+N/utSaWKk3g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F00383806651
	for <linux-gpio@vger.kernel.org>; Mon, 28 Apr 2025 11:00:07 +0000 (UTC)
From: Ariel Simulevski via Bugspray Bot <bugbot@kernel.org>
Date: Mon, 28 Apr 2025 11:00:28 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-gpio@vger.kernel.org
Message-ID: <20250428-b220056c24-2e71448ee1a1@bugzilla.kernel.org>
In-Reply-To: <20250425-b220056c0-ca0f4862134d@bugzilla.kernel.org>
References: <20250425-b220056c0-ca0f4862134d@bugzilla.kernel.org>
Subject: Re: PixArt touchpad not detected due to wrong pinctrl
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: GPIO/Pin Control
X-Mailer: bugspray 0.1-dev

Ariel Simulevski writes via Kernel.org Bugzilla:

Hi Andy,

Would it be okay if I prepare the documentation patch?  
I’d love to use this as a learning opportunity.

Thanks!

View: https://bugzilla.kernel.org/show_bug.cgi?id=220056#c24
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)


