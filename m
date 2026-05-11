Return-Path: <linux-gpio+bounces-36594-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPYbGUgJAmqznQEAu9opvQ
	(envelope-from <linux-gpio+bounces-36594-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 18:52:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E9A512B13
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 18:52:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D4A8A30CBB79
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 16:16:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BD7742316C;
	Mon, 11 May 2026 16:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lH7U+xwZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B28735F605;
	Mon, 11 May 2026 16:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778516201; cv=none; b=pA8yUKwVhk2+ohx0vrDdTyZPtrdAIOFLVnTF0Sof88UMSyAvmbx7WrDpCe1pmccFEECZ7hBAo4RzZ3d6mWfVFfEMb5oTgETcRPoemx+BOpn52ipqJ5XmGtmWw5LrUC+fT/9aaOB0PNO5HRbMZzurDdIwEY6hwgRddqHud3WRWy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778516201; c=relaxed/simple;
	bh=MBOI9aAaaQxap7YtP4rFWDvHXH6+TogyxE6drrzlMKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PH3FDqlhEPyNwTgxpnVzSYHjKwiMoIcQgUoGqz/GLnHtsKNlxy0jb0+R9yekt1zY24vL1CwuBtT2bnK5dm4X2hgdOGMYJh+LS93aZqJ/wuXibugwUZpBwI1NPGnDgnK968CSiifQQxqVmvZHgF/SgWt0hNHUOwik8XhWtSil0pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lH7U+xwZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 485C4C2BCB0;
	Mon, 11 May 2026 16:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778516201;
	bh=MBOI9aAaaQxap7YtP4rFWDvHXH6+TogyxE6drrzlMKU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lH7U+xwZxOu2BpLT6iEUyrnFpWS+dHZv8yuPpaptxgwqUQs9FlGEzxT4Lm2WfC70M
	 8CrthR4209aNjTMQAsJpXw5WJE6XILUnZ1bXd5YKsgAg2jjIwq5Hwob0XU+QMqRAYE
	 JWEALSSif3ssy32v6rTxwr1BDqcsba8h7CxVaWniAI6F/ynHvehEFVTYpsZ+eQ/uIu
	 bmMt7DjYlx7RnlwvJQHxbQ6rR58zC5vgFRT40WjapQWfrCKkOPkcAelJl2tKDzeXWI
	 AuV2sI32FExcFEPTkPlvc2YUkD7C7U0I7dbUb7gvJto07iMZMntu9gga/etR8NWpkj
	 eLUx6V4a3u6ow==
Date: Mon, 11 May 2026 21:46:37 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Jisheng Zhang <jszhang@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org, Han Gao <rabenda.cn@gmail.com>,
	Yao Zi <ziyao@disroot.org>
Subject: Re: [PATCH 05/12] phy: add a driver for T-Head TH1520 USB PHY
Message-ID: <agIA5XDzgA_GWvsc@vaman>
References: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
 <20260507081710.4090814-6-zhengxingda@iscas.ac.cn>
 <agA3URhGA1u6R7LD@vaman>
 <244b01b015ffd8e859ff30101d7743ff1c0fd899.camel@icenowy.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <244b01b015ffd8e859ff30101d7743ff1c0fd899.camel@icenowy.me>
X-Rspamd-Queue-Id: B6E9A512B13
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36594-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,baylibre.com,linaro.org,linuxfoundation.org,dabbelt.com,eecs.berkeley.edu,ghiti.fr,pengutronix.de,lists.infradead.org,vger.kernel.org,gmail.com,disroot.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vkoul@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 10-05-26, 17:17, Icenowy Zheng wrote:
> 在 2026-05-10日的 13:14 +0530，Vinod Koul写道：
> > On 07-05-26, 16:17, Icenowy Zheng wrote:


> > Why do need these test registers, they seem unused?
> 
> The register list is copied from the SoC manual, although most of them
> are unused.
> 
> Should I remove all unused registers, as the manual is publicly
> available?

yes please

-- 
~Vinod

