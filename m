Return-Path: <linux-gpio+bounces-37834-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id khFOIh8hH2pAhQAAu9opvQ
	(envelope-from <linux-gpio+bounces-37834-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 20:29:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 617B4631141
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 20:29:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ASG++oE8;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37834-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37834-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 833113003BFF
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 18:29:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4D5F393DE8;
	Tue,  2 Jun 2026 18:29:37 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA640392C56;
	Tue,  2 Jun 2026 18:29:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780424977; cv=none; b=rkItlRUmUNZk6LIFJ/JVgmjE5XLhQqsUXDzJyMPYNM0jGtDGOBUGCB7JiRVeyhrMdlWri6R+X/tM/OXskybnDFmAyBFE6UgD4uZrHxE7bswQTBDl1kEWz7yn6YLTZOuASdAIlKv2KPk8IxYS1O0Nf3Cg+bYmqpjEqXAkRmdHU4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780424977; c=relaxed/simple;
	bh=04qWF9Ae8K/4Xapo/ZPvyROw5z7IFlqOWDEYCmfHkZo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Q/Crfllb0Kd1DaGQwLLQXa7VNc3g+BVqAq0kUEeLMl2BVyrnlaTKFO+7YUiPi1FtxqldwouiW64Aw+DbKVZzu+9LEAVKzaCqsYoUZtpQWKtSzCU7+2pl+4v2lsCv13h6qezQ9H+zydlOzF/c8e793+C6sqe8TyXmy34EnCMV3ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ASG++oE8; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 789FF1F00893;
	Tue,  2 Jun 2026 18:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780424976;
	bh=yfIQa9OoA2vvrqJOO4Ql7GOgQj5OEnL0IMlvo7n9zhg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=ASG++oE8QgoaaG3PBRxRmQniR7xjK7CNwvh6HBSjwtcbzyQkHR9PQFiqnYtrerB2o
	 mZ775iaoHiRQhQhJlwZZX3NQ6btSSYy5M43L6fOsF5FNmNZMjJy4PARSC+PbWPxhrk
	 vV8P76OVY9ZDeq7GTvCtaA35H83Hh+VjzYPVStHLye0y3ELzHuaI9i+Z+Z3XSkMvxu
	 2CYvJ6CQtuF/IyxtUCPw+bLt0PD7Xis2j6hjY20S9xxi9xndEc/cCVhSIkyeSHzixH
	 wFjET+SBd3cjWAr8w07/tVqk6dC8qb3yUWZl4pgREMIo96eiPqO0/Ds+yrCyH/IeNv
	 UKAzzBVFBAP7A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93ABC3811A6C;
	Tue,  2 Jun 2026 18:29:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] [v3] [net-next] net: dsa: b53: hide legacy gpiolib usage
 on
 non-mips
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178042497814.988310.3355358130551344893.git-patchwork-notify@kernel.org>
Date: Tue, 02 Jun 2026 18:29:38 +0000
References: <20260601165716.648230-1-arnd@kernel.org>
In-Reply-To: <20260601165716.648230-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: florian.fainelli@broadcom.com, jonas.gorski@gmail.com, andrew@lunn.ch,
 olteanv@gmail.com, davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, arnd@arndb.de, linusw@kernel.org,
 bartosz.golaszewski@oss.qualcomm.com, brgl@kernel.org, noltari@gmail.com,
 kylehendrydev@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37834-lists,linux-gpio=lfdr.de,netdevbpf];
	FREEMAIL_CC(0.00)[broadcom.com,gmail.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,arndb.de,oss.qualcomm.com,vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:arnd@kernel.org,m:florian.fainelli@broadcom.com,m:jonas.gorski@gmail.com,m:andrew@lunn.ch,m:olteanv@gmail.com,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:arnd@arndb.de,m:linusw@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:brgl@kernel.org,m:noltari@gmail.com,m:kylehendrydev@gmail.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:jonasgorski@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[patchwork-bot@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 617B4631141

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon,  1 Jun 2026 18:56:42 +0200 you wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The MIPS bcm53xx platform still uses the legacy gpiolib interfaces based
> on gpio numbers, but other platforms do not.
> 
> Hide these interfaces inside of the existing #ifdef block and use the
> modern interfaces in the common parts of the driver to allow building
> it when the gpio_set_value() is left out of the kernel.
> 
> [...]

Here is the summary with links:
  - [v3,net-next] net: dsa: b53: hide legacy gpiolib usage on non-mips
    https://git.kernel.org/netdev/net-next/c/c0b3005e32ce

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



