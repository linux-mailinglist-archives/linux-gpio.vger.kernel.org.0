Return-Path: <linux-gpio+bounces-31011-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANxGCi97c2kfwAAAu9opvQ
	(envelope-from <linux-gpio+bounces-31011-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 14:44:15 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AE2766E0
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 14:44:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E05C8301C8A1
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 13:44:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 153B032695C;
	Fri, 23 Jan 2026 13:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gau9yVXu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68F41D5ABA;
	Fri, 23 Jan 2026 13:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769175850; cv=none; b=Yk70AF/OCHO8Bw/bF3mWvjJQs/pYrH94/DpzbKNqGDfRYP6gFNxwI/xF78sKpw2ZUlroNToNwDNUJWMrPohmN92xI5W0HWMLAe/W8eVXle0krQK7LV8fV51DSTma3kU/GwMBRDJqjr0ucUdOsJZwg3Ckh6Fwvjg7X+6599ZyX/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769175850; c=relaxed/simple;
	bh=rXE/aBYuAX4Ta/Z3d+WN3DtmhafTuRThZ/pBZ6ZyjEA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=PuWGMhlVFk4bRYcQaTqQZf8qH/Lg56/oPnwuiUJEp8PVZ2HD8CtuG9Tvd3QNR+60v6JXIYtzEnKP951iQMP7sLR9DEpWTWjn5AQQ2bJ5Ip1bHUHBIx5pYjoaq2vfPPDFhG8OjxhEqwlpW8RFxXEWHeMp9+qQZUcWi2fFgxyVxuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gau9yVXu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9631BC4CEF1;
	Fri, 23 Jan 2026 13:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769175850;
	bh=rXE/aBYuAX4Ta/Z3d+WN3DtmhafTuRThZ/pBZ6ZyjEA=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=Gau9yVXuwFDUImqj5a2QJ7z+JtFUyD6X7NfiOt99DFJJl0x0ubV1+fw3c+UY0k8IU
	 3iUTUJdPc/YPaXMucggSVbccInyjw0T4WxjdaANHetMEcrVDkl3AWnoU0K292vYerr
	 vMsodfk4EwpHtGH6Shc2m0yIGa7eX5F3+v0QbZi69MBpiLa+Jh8NSqlXJRUFeRQhd6
	 CxgkxBOUuqFuajhblWIz9X8k0CDQrV/yoC/JHElL73vthR0umgKDWpdBD/ZSH7hZqX
	 yxYDXQPn9WfAYaKIfPChOEzGct46UmFq5KJFFPiQn6ULtKfshT5pUn46hcwdsl8wKC
	 f7VJaFaksDPHg==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Jan 2026 14:44:06 +0100
Message-Id: <DFW0HVK6AF0G.TW6R157R8O27@kernel.org>
Subject: Re: [PATCH] gpio: omap: do not register driver in probe()
Cc: <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <linux-omap@vger.kernel.org>, <linux-gpio@vger.kernel.org>, "Danilo
 Krummrich" <dakr@kernel.org>
To: <gregkh@linuxfoundation.org>, <rafael@kernel.org>, <broonie@kernel.org>,
 <will@kernel.org>, <grygorii.strashko@ti.com>, <ssantosh@kernel.org>,
 <khilman@kernel.org>, <linusw@kernel.org>, <brgl@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260123133614.72586-1-dakr@kernel.org>
In-Reply-To: <20260123133614.72586-1-dakr@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31011-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A6AE2766E0
X-Rspamd-Action: no action

On Fri Jan 23, 2026 at 2:31 PM CET, Danilo Krummrich wrote:
> However, for the purpose of avoiding the described potential deadlock in
> combination with commit dc23806a7c47 ("driver core: enforce device_lock f=
or
> driver_match_device()"), this patch only addresses the driver registratio=
n
> issue.

I.e. unless there are any concerns, I'd like to take this one through the
driver-core tree.

