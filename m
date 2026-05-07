Return-Path: <linux-gpio+bounces-36411-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNZ2KSns/GnEVQAAu9opvQ
	(envelope-from <linux-gpio+bounces-36411-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 21:46:49 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C18F4EE28E
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 21:46:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D23430179C6
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2026 19:46:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9CFB37C105;
	Thu,  7 May 2026 19:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="csnWnG8p"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3772D837C;
	Thu,  7 May 2026 19:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778183206; cv=none; b=aYn4ndWN7WDaXQ3xI6lxXqZlBQeFnfHNFLlmZr7jiePXM9zFh7Uqt6fiwE1c5KwOAzggVcHTMHmEXHfbI3zHubBnMPEUATiSzZBSe/l7DUyzZsEpTS1hvQxzSLmm+9Y4Ydpp9kiTU+mZOnPJJAMSlacDCIViwI7RTMj9Y2aK2Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778183206; c=relaxed/simple;
	bh=7bB+ATyqHoRJC3wlfnGnpRt/c0lYGvMKmXajhJ5OuWU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mtkF6mh0ddjeBl6PB04pj10BqnG9kGxEY8UP736Mt+2M4olkKAZBLnMmbNT4lZsxS0G5AU+7CPskfAUyYAWY0dQIuOJrpxGWB1sfmjtpA13vAaF7t+22l+e7ZKKNRVpPL89Vaa+5reYANVJ4ohaj+77ifgE7zlTi22TjAXTudDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=csnWnG8p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F57EC2BCB2;
	Thu,  7 May 2026 19:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778183206;
	bh=7bB+ATyqHoRJC3wlfnGnpRt/c0lYGvMKmXajhJ5OuWU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=csnWnG8pgugQ16gwEm5dFJSXF5AenbsoQINTOt9hyMc+kfD51lTdfoB5edOkf+Wff
	 Ey0QL9iD1fBkPAfkLiSddm6hc9XYNZUDGdnQuH9tTq7r0r5a91u/ZtNWEnzLh68ZYr
	 rRhLSjQ4P3Vp1xz5MtSBvPa6Rn6rmUjPaKV/uMsKp9pDaEAT2VvdXgio6X3w5I6KJp
	 r9cQATpudHkm3br+w8aiVBk1ycAykORcefvdXYX+lUZ1ZqZKtIL2NoFEH8S6ro51M8
	 Q+CMcvEGiOhNXu1T4Bwzw46uvMC/SS8cfAv92X+w1U8fIpdbu5MZ+y+p9y3A9a90aW
	 k4VzNV5n8TpMw==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@kernel.org>, 
 "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, patches@opensource.cirrus.com, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260427143437.3059210-1-arnd@kernel.org>
References: <20260427143437.3059210-1-arnd@kernel.org>
Subject: Re: (subset) [PATCH] mfd: wm8994: remove dead legacy-gpio code
Message-Id: <177818320404.2090690.8045287260615108343.b4-ty@b4>
Date: Thu, 07 May 2026 20:46:44 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
X-Rspamd-Queue-Id: 0C18F4EE28E
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
	TAGGED_FROM(0.00)[bounces-36411-lists,linux-gpio=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Mon, 27 Apr 2026 16:34:27 +0200, Arnd Bergmann wrote:
> The old-style gpio handling in wm8994 came from a commit 7c8844481a1c
> ("mfd: wm8994: Emulate level triggered interrupts if required") in
> linux-3.11, but nothing in the kernel ever set the 'irq_gpio' member
> in the wm8994_pdata structure, so this was always dead code.
> 
> Remove it now to reduce the dependency on the legacy gpio interfaces.
> 
> [...]

Applied, thanks!

[1/1] mfd: wm8994: remove dead legacy-gpio code
      commit: b0feaf240c31d48f6b2e74da2a604cfecce6c3c1

--
Lee Jones [李琼斯]


