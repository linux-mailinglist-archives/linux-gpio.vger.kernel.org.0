Return-Path: <linux-gpio+bounces-2850-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6108C84495D
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 22:05:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E62D2B266B4
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 21:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A39538DDB;
	Wed, 31 Jan 2024 21:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SIexyscO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B918638F97;
	Wed, 31 Jan 2024 21:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706735112; cv=none; b=fSV+CqzpQZeDtrolfwe3ynB3JWlhaXD80G2v8+T0TUPxMaEeSfaMxxnZIhzyt0Xl33eE6pUCeJM552x3d2Lme91fog4ED3zDXDOT7ffzOogLdkHj/E2wNTsQwXGSQVNdwAidzSqO+m27mi8b6pTTLRZ3KuyAiCT4vRvKDtac6bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706735112; c=relaxed/simple;
	bh=uzCf8IMr80v52FCep4tL/rTI0jJoFY8p8kaJTRbWdKs=;
	h=Date:MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject; b=nMGkDFPtU/zHRI9JAnlE1r0D9NU21Caqs+Ok067IQr1AtXl1dJrBG76RHG+7jzjN8aBGUASxUHsR1sAZgoI22X2CYucyB0d717Z4/iRnEWcGV5Ne0gSq71YjiYepntSgREQJsKqgx4gVARxYBBht5da1w3NEmE32EBGmN+bYG/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SIexyscO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4F3BDC433C7;
	Wed, 31 Jan 2024 21:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706735112;
	bh=uzCf8IMr80v52FCep4tL/rTI0jJoFY8p8kaJTRbWdKs=;
	h=Date:From:To:In-Reply-To:References:Subject:From;
	b=SIexyscO+lMYyyAedpSwjX/OlhpMMGVhcYPDkLeFWYvT8ts1C5bVsHG5BFdraloKX
	 jK+/+N754sa6DU3sj9ohfb+e2mjUFYNsWJH37llPGxf0hn3IfooZ0KrzUXLEwATTse
	 zJJgw86kfspzNlIj31vOqTrl8jssrKXPCZwR07kNsOgSOD6kobv0j5r/1nE9CeHPNB
	 sPqx0AMjtGnwq94116VrgTQIgN1KU6q75+tksvrJhL+3rTXUcf18qH9P8iwAUwzrJQ
	 OYIYcMLP7Qa1IzMu9D16N4Q3LZhRrv7L2pJOWRve/WdEdE4yF3zMsvRIbysICHBeXc
	 dhM3+VclvF3wA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 310E6C4166F;
	Wed, 31 Jan 2024 21:05:12 +0000 (UTC)
Date: Wed, 31 Jan 2024 21:05:20 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: linux-gpio@vger.kernel.org, bugs@lists.linux.dev, 
 linus.walleij@linaro.org
Message-ID: <20240131-b217334c12-ebf9106d8ac9@bugzilla.kernel.org>
In-Reply-To: <20230419-b217334c0-3101f9f4b426@bugzilla.kernel.org>
References: <20230419-b217334c0-3101f9f4b426@bugzilla.kernel.org>
Subject: Re: inux ockchip pio2b4 (pio2b5) pio2b7 roken GRF_PIO2BL_IOMUX
 GRF_PIO2BH_IOMUX 2bits 3bits pinctrl rk332_mux_ecalced_data
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: peebz 0.1

antwain.schneider added an attachment on Kernel.org Bugzilla:

Created attachment 305801
here is the page in the trm that describes the registers in question

if you can't read the pdf here is a png

File: 1.png (image/png)
Size: 4.24 MiB
Link: https://bugzilla.kernel.org/attachment.cgi?id=305801
---
here is the page in the trm that describes the registers in question

You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)


