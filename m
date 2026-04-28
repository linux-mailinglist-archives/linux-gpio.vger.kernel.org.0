Return-Path: <linux-gpio+bounces-35639-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KF6lEGdP8GlNRgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35639-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 08:10:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B174A47DED2
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 08:10:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 188AB3016293
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 06:10:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9256F3446C3;
	Tue, 28 Apr 2026 06:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mbTi9/Xt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511E3340281;
	Tue, 28 Apr 2026 06:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777356635; cv=none; b=divSXkSbV1MkakG3j2wp+ocTt27JY2DgR2yJ1rTTjQETfBHPBIR4fIYdbZ4XFLpAR4FJLUhJhYcD6iWubli2K0qxf8K2LnEEwR0M0KMUyOdurDsBiqd/FcMievbbiOeX0LUnMH1wWRGSC1cU4Q0ilu8mM/14ZinnjZJIPqZu+FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777356635; c=relaxed/simple;
	bh=DEns1PhTGMCdiGSER2v0308nM0XWg7ICGAyYvDQ4J3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PUvu7g9NiSQeeaspM03SW/hXAhGNMk4CcBj9Rb75St29FuFkQZCdWq1OFczQPtITwe0quys9dNEjCiimmgLj2Q086iEMSIcB/Z6ocnlmaqw8itSTGCVx6cKqZGJx3r/agREnKnENG4c2n2i6+kVJEpVTCDlysiH/v1JNt7EU/fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mbTi9/Xt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63D36C2BCB7;
	Tue, 28 Apr 2026 06:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777356634;
	bh=DEns1PhTGMCdiGSER2v0308nM0XWg7ICGAyYvDQ4J3A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mbTi9/XtjseKnaKl8Tjbs/cReK7KRb1nLGW4LlHFH5iW+rwdRaTds2g1K4PMN0mNE
	 fyWJxRT9ZKX6zoogwfQRNQMLTV2Dn9hwIQx0qaBXy447I4v65dW7l7CpcZdpiRxEer
	 50xNJSqfgG/Ty42al3p4J1YBKy5blgGUEKLqOYEZp/RcCcV6ugDyweCIZgyrHBg6ZN
	 TyS9qQq9mpvfB7sodxlJN5n1vjVbrlvU1MkXOXCYj5dIWRy8MnrQB+++ppXPSTQqjM
	 RUFjw7Ehw3cNZH/N/ocBIlDwZz82FfnuNYi6iofje5eGA6cw0CGA/+0x+tuC9Ninuf
	 1AIOFNeLHxOuA==
Date: Tue, 28 Apr 2026 08:10:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: pshete@nvidia.com
Cc: linusw@kernel.org, thierry.reding@kernel.org, jonathanh@nvidia.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, webgeek1234@gmail.com, 
	rosenp@gmail.com, linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/6] Add Tegra238 and Tegra264 pinctrl support
Message-ID: <20260428-terrestrial-elegant-bittern-cafcfc@quoll>
References: <20260427134231.531222-1-pshete@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260427134231.531222-1-pshete@nvidia.com>
X-Rspamd-Queue-Id: B174A47DED2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35639-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,nvidia.com,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nvidia.com:email]

On Mon, Apr 27, 2026 at 01:42:25PM +0000, pshete@nvidia.com wrote:
> From: Prathamesh Shete <pshete@nvidia.com>
> 
> Add pinctrl driver support for Tegra238 and Tegra264 along with the
> corresponding device tree binding documentation. Additionally, export
> tegra_pinctrl_probe() to allow the drivers to be built as loadable modules.
> 
> Changes in v3:
>   - Wrap commit message to 75 chars per line (v2 was too short).

For the record:

b4 diff 20260427134231.531222-1-pshete@nvidia.com
Looking up https://lore.kernel.org/all/20260427134231.531222-1-pshete@nvidia.com/
Grabbing thread from lore.kernel.org/all/20260427134231.531222-1-pshete@nvidia.com/t.mbox.gz
Checking for older revisions
Grabbing search results from lore.kernel.org
  Added from v2: 6 patches
---
Analyzing 27 messages in the thread
Preparing fake-am for v2: pinctrl: tegra: Export tegra_pinctrl_probe()
ERROR: v2 series incomplete; unable to create a fake-am range
---
Could not create fake-am range for lower series v2

When we ask to use standard process to send patches, we ask for this for
a reason.

Best regards,
Krzysztof


