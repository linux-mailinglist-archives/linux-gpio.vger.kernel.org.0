Return-Path: <linux-gpio+bounces-31986-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENRXBTX6mGm6OgMAu9opvQ
	(envelope-from <linux-gpio+bounces-31986-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Feb 2026 01:20:05 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C98216B8BF
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Feb 2026 01:20:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9E74F300B1A3
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Feb 2026 00:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92F1C2836A0;
	Sat, 21 Feb 2026 00:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L7H8+UBC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2EA27934B;
	Sat, 21 Feb 2026 00:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771633199; cv=none; b=C/byboZmmDVxuOhFznHFplOgzzm4DAnw2UOmZWrUAjNbRo099jv9serw1xs4bUNETn/T2YE3b3squcoZj1f/j4pqsUCka3ubMKFv62tutSj1kbFh4YIfDsJidAd61KgnmWnXoSZPpX1VwvWvX92BeC6UaMrAUJp0W+97PP84ELc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771633199; c=relaxed/simple;
	bh=d9WyOog9pFP7KbwHEAalUsd1dQnq5gkB7uH2q6pRLwY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=jjBMo2oq4DoEnfrEKIUtL4IjjF2UUOw3BdbV8Vhz79kJxg9JJNUi39XJZLO4HSMaaPgABL8KFXcFfbxrv2QXtGDBA2p8BBHY71jGF0ucKdCgFJjPRaTqtZZnwUNqYcOycGYlQxnTKleqaKDHhAE427anQR6blqJvRBdjmtFGwH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L7H8+UBC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E015DC116C6;
	Sat, 21 Feb 2026 00:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771633198;
	bh=d9WyOog9pFP7KbwHEAalUsd1dQnq5gkB7uH2q6pRLwY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=L7H8+UBCCpjG3BgN3R37WYPQ45DLmgShwl+mt5qMvvaYfbpPE1cOVlQA3kfrn/zFI
	 hU5+0p582ndgHdw71fRvyKUqSe2gI7YnKKnPO/ZOtFssULP673CKNSvH9GUnZoS5qa
	 sZ4nh+I88ApzJxk0sBwLLMspHVzAXWc/p9RLzSCQ3mhPLwAH3m23FAxL9fptnm/vU1
	 t8votPoW63zOWS39COWZW/bb4Io2VMlr17oSkJmeRxshNfGGMZ/Puarv3D1wFGcRzU
	 gv26HZ8pLtdvcDk1DnkJZ8Tb20x5g6TER9hSxhemoqg6M/XK42AcSdi1e/1KO22zlh
	 AJdwtff/4nDQg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02DAB3808200;
	Sat, 21 Feb 2026 00:20:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] net: phy: qcom: qca807x: normalize return value of
 gpio_get
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177163320679.955402.13362743114221296547.git-patchwork-notify@kernel.org>
Date: Sat, 21 Feb 2026 00:20:06 +0000
References: <aZZeyr2ysqqk2GqA@google.com>
In-Reply-To: <aZZeyr2ysqqk2GqA@google.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, linusw@kernel.org,
 brgl@kernel.org, netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31986-lists,linux-gpio=lfdr.de,netdevbpf];
	FREEMAIL_CC(0.00)[lunn.ch,gmail.com,davemloft.net,google.com,kernel.org,redhat.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6C98216B8BF
X-Rspamd-Action: no action

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 18 Feb 2026 16:56:00 -0800 you wrote:
> The GPIO get callback is expected to return 0 or 1 (or a negative error
> code). Ensure that the value returned by qca807x_gpio_get() is
> normalized to the [0, 1] range.
> 
> Fixes: 86ef402d805d ("gpiolib: sanitize the return value of gpio_chip::get()")
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> [...]

Here is the summary with links:
  - [net,v2] net: phy: qcom: qca807x: normalize return value of gpio_get
    https://git.kernel.org/netdev/net/c/2bb995e6155c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



