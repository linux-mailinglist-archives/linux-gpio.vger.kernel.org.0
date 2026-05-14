Return-Path: <linux-gpio+bounces-36852-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHPZBXXWBWrxbwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36852-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 16:04:37 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6B0542BC3
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 16:04:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D3E4301E237
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 14:03:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C3633FBEA8;
	Thu, 14 May 2026 14:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rZJXVWDI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F733FAE02;
	Thu, 14 May 2026 14:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778767405; cv=none; b=W6LYLUPcEaIVDHovFljKiEFTFPosAKYh2iTgUaIX6XqU7nBgR5czNXqj6/lfILaOqjWZEfbLf5Om0RWfO2w4gbgZ8h/QLzKgrLBYRGqgBqsbkac1CYV039GkB3la6Icy67N1ZKRuQbvJiBzTp7cPjzMHEPQjcFAcszSfK/jRqK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778767405; c=relaxed/simple;
	bh=2oJcWZHPw0lI8rEBpp4jzYKwcNK8s7gkZ96aSiyXvH0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SVFgHpDUfEW64r2p1xAcdlqaPpDVs+LiTqKry6jJzOwzOuWmzDj9rFF2nu8BpOeOWhAaLDH13ua3WdLf0m933gMbhbnzoj5hjEtbdHfHqSw6TY+VLxB//MFmMsQ4lvRXPTISTffHknMvYiqEs3NVin6aCbg52XBZXVPSdPPg+Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rZJXVWDI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10C28C2BCB8;
	Thu, 14 May 2026 14:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778767404;
	bh=2oJcWZHPw0lI8rEBpp4jzYKwcNK8s7gkZ96aSiyXvH0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rZJXVWDIc7rswC3WQaIxgRIahOf3lXJCFdsRRF8e7oPxXcZzxu4f+J15GWC3zxyZd
	 jVDsTnysbNqbdVd/1SN6Uo5zuQ8kcwJjxEBli+s982GZH5UneO+vW1vZaFNGR08EWo
	 6kFCubb++HWjliQBY4spf4yZHUFgRVebZdVnQV+S7Yl4w42geRvDDOuPaUb0mYQ5rk
	 Z9HXrqHyG89F/qBfaIogFmwKo6Z0Qx6sFmTc3CMWdrQP/lqT0T0E8HMZzHhZg/uZ+V
	 gNLilMfkfB8tMwKFdHUqkEtJxmhiEIZQY8oauizJc9RhXRjZz0Jik34q80Rk1Ioe0c
	 mhUeou+jOQc2Q==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, kernel test robot <lkp@intel.com>, 
 Harald Welte <laforge@gnumonks.org>, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org
In-Reply-To: <20260430162855.2029285-1-arnd@kernel.org>
References: <20260430162855.2029285-1-arnd@kernel.org>
Subject: Re: (subset) [PATCH] mfd: ezx-pcap: remove unused driver
Message-Id: <177876740278.2767759.17557559377002194737.b4-ty@b4>
Date: Thu, 14 May 2026 15:03:22 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
X-Rspamd-Queue-Id: 5F6B0542BC3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36852-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu, 30 Apr 2026 18:28:05 +0200, Arnd Bergmann wrote:
> Support for the Motorola EZX phones based on Intel PXA processors was
> removed in 2022, but this driver remained present in the tree. As far
> as I can tell, the support was never quite functional upstream because
> the board files did not actually instatiate the SPI device for the PCAP.
> 
> There are still also drivers for the various mfd cells: keys, touchscreen,
> regulor and rtc, all of which are obviously orphaned as well but can
> be removed separately as the Kconfig dependency now prevents them from
> being enabled.
> 
> [...]

Applied, thanks!

[1/1] mfd: ezx-pcap: remove unused driver
      commit: b12d1da45f1206a35f95e7eebfc34c0bfacb587d

--
Lee Jones [李琼斯]


