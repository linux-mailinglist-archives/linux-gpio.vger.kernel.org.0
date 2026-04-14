Return-Path: <linux-gpio+bounces-35129-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KATXH7623WlRiAkAu9opvQ
	(envelope-from <linux-gpio+bounces-35129-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2026 05:38:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D309C3F54B1
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2026 05:38:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE582308E796
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2026 03:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18672239E9A;
	Tue, 14 Apr 2026 03:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T5Hp2Mny"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F296F2F2;
	Tue, 14 Apr 2026 03:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776137762; cv=none; b=PPRPmBlrCI0+aCIcsvM9g/m4iGf43B45uqQa44PmxlBTPwfgkLopM87UtwXh27kYo5VgY1Y5HDxPCIMaVksR9CrdP7hLVMG8pxoT01YY7WaWhl3iKyW5abInfi26qmAnTPbPMcRfNiJ/8no0XHKZEoHWeRBlodWm2Oiba8LYf+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776137762; c=relaxed/simple;
	bh=L9KUogpeM4JcUGd2GVdjISo9k0ve4LGKmhTzsULdboY=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=iM+dDeUFPl+j0N8OUjzl3IXQ09WaDZW2phs6uZMMQtauXhW2hgnQpxjH1DDBBaV/TRUk05Kprg2BwSEfuIi1JctMa5AejandfrmCiDATx6IFquxE/QkgiGp1GJkTjXwZG3WYyyvRUtFaHMzoaKSZgfWVgZvyzuVwLRbRgGJFaBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T5Hp2Mny; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3946C2BCAF;
	Tue, 14 Apr 2026 03:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776137762;
	bh=L9KUogpeM4JcUGd2GVdjISo9k0ve4LGKmhTzsULdboY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=T5Hp2MnyUW8zpZ5VDH2/hQ3fXbeEh7/TpgNX1TubUrRH8FlcgO4aW8OoVwa0+8utg
	 z2EV+Ai70gN65Tl2MhOV0dfRwa2QjFbsYpYUIb52T4/z8Km0pO/bjSQgy+HD6I6vPX
	 Va3c+soFX8nfP4zJHGjuK2MT0WZa80D5eOqPEOmIqlYHH49iALitUbKRwmfTFttPgu
	 cdEbKMON4SzFF8RN0xj57NMD5Z+MH8IwieR3b3hP7D2qsugpHiAqJeThfNlFMnHMJH
	 6LQkEJbpvc007pDPSA/8GtDua3iWffykrRCqulGm+W9yTGkbe5H8QC5zx1nXAqk8fT
	 ckvVPHXydTxcQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02BF93809A0B;
	Tue, 14 Apr 2026 03:35:35 +0000 (UTC)
Subject: Re: [GIT PULL] gpio updates for v7.1-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260410083951.13983-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260410083951.13983-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260410083951.13983-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v7.1-rc1
X-PR-Tracked-Commit-Id: ca13ab654064fee86d6e7c9e87d0af7789561509
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1334d2a3b3235d062e5e1f51aebe7a64ed57cf72
Message-Id: <177613773350.678926.5269979713141135307.pr-tracker-bot@kernel.org>
Date: Tue, 14 Apr 2026 03:35:33 +0000
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35129-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linux-gpio@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D309C3F54B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The pull request you sent on Fri, 10 Apr 2026 10:39:51 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v7.1-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1334d2a3b3235d062e5e1f51aebe7a64ed57cf72

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

