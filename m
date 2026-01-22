Return-Path: <linux-gpio+bounces-30903-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNeiDhs+cmnpfAAAu9opvQ
	(envelope-from <linux-gpio+bounces-30903-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 16:11:23 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D623D6874D
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 16:11:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F0BBE3013A69
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 15:06:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E10C33A02D;
	Thu, 22 Jan 2026 15:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RUMTE2jl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2122D32BF43;
	Thu, 22 Jan 2026 15:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769094401; cv=none; b=kyDCtSao1m4K4os+O6MXL6xVSOJ/9g8Q3TxUTs0kcVK06Gvfftze9YRM2HDavdsQ6iv1WUfi4D9AYn620Lgddl5xUEnCKLNGA7E3wMoySkl2sDHCi4uUQv1pMqJEqFKc1gVWqb0vUqYi0ALreJ3O2ZXV0dn1gGKfCzNZKHh0gHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769094401; c=relaxed/simple;
	bh=grnlzAExfoV6G9ahrdpKeaFu1Zp25XCBFXmtxypYY1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jbh1skCh/s7E4ULUFkgk+UyHNwO3bm73XK4G96BOB1mW6J4voOm6fh0ybFtRUmAdavJdGrv2tHb/n94Jx8KpvHBRzMTN5J095yKt6RK5k2vqyz2Q8rpe+9lux1PMMf7Tw59gFTwXdx3GEXNTLv9d1+sk6o/o0J6l+p9NUNt52SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RUMTE2jl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15BA2C116C6;
	Thu, 22 Jan 2026 15:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769094401;
	bh=grnlzAExfoV6G9ahrdpKeaFu1Zp25XCBFXmtxypYY1k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RUMTE2jlvNOo76xSxS65vqSRwG4ztLTz5IIzNF6k/k8JshLCqUyf87eG3oVTdIgi5
	 S2aPE0aWCPVaKzRG6jkxJShzFB5LTvTQWXDbs0gIQ6AEwN+IHJyoYq8sQmoxfXJM3G
	 ScYX2nQKbnEAFsjD8HqJCij0WgMQ5WX+LZlH3mkGof7IAZl3fKb6mq+qe41MT+yvPV
	 PNQ/UvAJEDco6i0ZklZfTWubZg3ANkYNfzXKhGytYQE38Ajye128u3ZUzDzqx7uZRj
	 nzY40lUO/cQApEK0VfBMH2JlDA7jWziOlKgdJB64N5IjdeIggAUqQwXS7IYFzFIELs
	 19Jt/A/1AC++w==
Date: Thu, 22 Jan 2026 15:06:34 +0000
From: Lee Jones <lee@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Will McVicker <willmcvicker@google.com>,
	Juan Yescas <jyescas@google.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v6 00/20] Samsung S2MPG10 regulator and S2MPG11 PMIC
 drivers
Message-ID: <20260122150634.GK3831112@google.com>
References: <20260105-s2mpg1x-regulators-v6-0-80f4b6d1bf9d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260105-s2mpg1x-regulators-v6-0-80f4b6d1bf9d@linaro.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30903-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,gmail.com,bgdev.pl,google.com,android.com,vger.kernel.org,oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D623D6874D
X-Rspamd-Action: no action

On Mon, 05 Jan 2026, André Draszik wrote:

> This series extends the existing S2MPG10 PMIC driver to add support for
> the regulators, and adds new S2MPG11 core and regulator drivers.
> 
> --- dependency note ---
> This series must be applied in-order, due to the regulator drivers
> depending on headers & definitions added by the bindings and core
> drivers. I would expect them all to go via the MFD tree.
> 
> The MFD patches in this series also depend on my Samsung MFD patches
> due to patch context:
> https://lore.kernel.org/all/20251217-s5m-alarm-v2-0-b7bff003e94c@linaro.org/
> 
> While these patches compile, regulator probe will only be successful
> with my deferrable regulators patches from
> https://lore.kernel.org/r/20251227-regulators-defer-v1-0-3104b22d84cb@linaro.org
> --- end ---
> 
> The patches are kept together in one series, due to S2MPG11 and its
> regulators being very similar to S2MPG10.
> 
> The Samsung S2MPG11 PMIC is a Power Management IC for mobile
> applications with buck converters, various LDOs, power meters, and
> additional GPIO interfaces. It typically complements an S2MPG10 PMIC in
> a main/sub configuration as the sub-PMIC and both are used on the
> Google Pixel 6 and 6 Pro (oriole / raven).
> 
> A DT update for Oriole / Raven to enable these is required which I will
> send out separately.
> 
> Cheers,
> Andre'
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>

Applying patch(es)
Applying: dt-bindings: mfd: samsung,s2mps11: Split s2mpg10-pmic into separate file
Applying: dt-bindings: mfd: samsung,s2mpg10-pmic: Link to its regulators
Applying: dt-bindings: mfd: Add samsung,s2mpg11-pmic
Applying: mfd: sec: s2mpg10: reorder regulators for better probe performance
Applying: mfd: sec: Add support for S2MPG11 PMIC via ACPM
error: invalid object 100644 11a56154d36d251d40b40e91da514db0faa15ae3 for 'drivers/mfd/sec-irq.c'
error: Repository lacks necessary blobs to fall back on 3-way merge.
Patch failed at 0005 mfd: sec: Add support for S2MPG11 PMIC via ACPM
hint: Use 'git am --show-current-patch=diff' to see the failed patch
hint: When you have resolved this problem, run "git am --continue".
hint: If you prefer to skip this patch, run "git am --skip" instead.
hint: To restore the original branch and stop patching, run "git am --abort".
hint: Disable this message with "git config set advice.mergeConflict false"

Doesn't apply to `for-mfd-next` or `ib-mfd-rtc-v6.20`.

Please rebase.

-- 
Lee Jones [李琼斯]

