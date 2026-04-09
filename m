Return-Path: <linux-gpio+bounces-34947-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qK1RIXOr12lKRQgAu9opvQ
	(envelope-from <linux-gpio+bounces-34947-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 15:36:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6150A3CB55A
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 15:36:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D1ABC31021B8
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2026 13:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96A543BD62E;
	Thu,  9 Apr 2026 13:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NxfxnTgj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555CB13957E;
	Thu,  9 Apr 2026 13:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775740723; cv=none; b=rO3/nQgPt4i+I+PE+1exrl3pu0kfQuK7AnXQFC9V7/BR3bigkNDQW34xiBixWfF9I6Aqr4PL/sYyWMw4/hCw6Y9qqmJVnAYKZ+F30iUhlV9QtHXnvkZil4PeQxdiGAZgj5V6sP3PNddxEyJnJZquyLLZNWWy5ksOEkZwrv5sTYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775740723; c=relaxed/simple;
	bh=fxJAjAMelidncPrR2YL+RDoSFzeongBOmGD03YdaRgQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CR+ZaZrN1g7kC2v7S/tBxQ3xItO922NbcRm0GRnk9OM4+1PVvTux7BoHfUIZYLt9B2lTyksEEa3TdRpN9hmChl+751aFEXexv8Ri+s2Yy+AX0CnkpOboDWI3wI0pj2EkJ6Z4T7DwoflplSGQDj6ajQxte8S9sT6LoWQVVcCyEu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NxfxnTgj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58639C4CEF7;
	Thu,  9 Apr 2026 13:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775740722;
	bh=fxJAjAMelidncPrR2YL+RDoSFzeongBOmGD03YdaRgQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NxfxnTgjU2fXpHschacupmMZaqPp6diGS/wTk5INCcMDYtxBgx2qf/rhSuBYWkMj/
	 Ma1owJwdM4NQEryOQH4XrQMg/QSMFWTJN1YabgLwPCx4bl7Vj7ZXBnW4139L/feuOa
	 7BK5Jf56+AmHXGdfQwibpZVg8D5UY5KFq7sSvLdnuYg3mujPduLVNm67SKX2JoExBO
	 155S9Mh1jInR8MGf7VILqwSudqzNaMdKsUouE7k37s2IiOQ23p79dcLPVvH/wxuP+s
	 7YupYGNkF4JEXBppJrZ/p1zdH4CXKCxXVFkKDWmQtPR1DwqtxV6js1JJ80SidnfwDI
	 eSjHH/VsPPnDg==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
In-Reply-To: <20260327-gpio-timberdale-swnode-v3-1-9a1bc1b2b124@oss.qualcomm.com>
References: <20260327-gpio-timberdale-swnode-v3-1-9a1bc1b2b124@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 1/4] mfd: timberdale: move GPIO_NR_PINS
 into the driver
Message-Id: <177574072110.3341478.15028296329332074230.b4-ty@b4>
Date: Thu, 09 Apr 2026 14:18:41 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34947-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6150A3CB55A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 27 Mar 2026 11:49:07 +0100, Bartosz Golaszewski wrote:
> This symbol is only used inside the timberdale MFD driver. Move into
> the .c file as there's no need for it to be exposed in a header.

Applied, thanks!

[1/4] mfd: timberdale: move GPIO_NR_PINS into the driver
      commit: 13f5997f2bbaee976e1a4a6873d6bd40df9b2637

--
Lee Jones [李琼斯]


