Return-Path: <linux-gpio+bounces-37349-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFbCCVgxEGoaUwYAu9opvQ
	(envelope-from <linux-gpio+bounces-37349-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 12:35:04 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB6F5B2365
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 12:35:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F34ED302F240
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 10:28:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9F5E3FBED1;
	Fri, 22 May 2026 10:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UXsGOZL8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED1A3CD8A4;
	Fri, 22 May 2026 10:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445424; cv=none; b=eCGX+QJ4GHn7ByRESbvYsHlMyO1diXAdimxa6TaOyN1k6sSlszKxvmwDxKWUI9t0nDlgx7d7qKyS7wD4ecok9nIUUXTCJn/dGnx1wKc0BTqSHhR4H+sbqHvNu9rvI7EIDkryWaeoz2ebTvlVMFrQIM1eFZAR4oy6S+PkQINH16k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445424; c=relaxed/simple;
	bh=eUs6YVU2iFtFB2JHUiISX/6iwqnt7Bq1OFgZKZQ0uKg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AhQvajy98ZXKsPjpDVXFKTePEugevZ9SaM4EAdRSXxns2bwXDiS10UN9NvJba1YUeOpdZdmVd6okAPuYKDhZBlxcPjY3XVuJ3ULig46/S+dAI5XieSgf8rt4oNIz/WajY0OK3hlb0K3dubdt0zS3XYNhlONqtzCXgHkjdxLzxBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UXsGOZL8; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34F3F1F00A3D;
	Fri, 22 May 2026 10:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445423;
	bh=xq2WMGxYrdq7+VpHGko1wAXp02qIJZ5EaLRL0m99YUo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=UXsGOZL8biEqFcm+yDxKBRmmTG7wr1b9UH9iU9EuR6OB5xaigS/PK7iSDw/Vm4W4N
	 MC2XACcVHcPGTvcWYO6pDoxWAR1GJUvyG+VRTdn4Ow5feS300wzQMk+L2k+6ZxYkkE
	 nk0Ca2W0d17+0UyKihAUDvBW0QirdOPzWKKWy+jfAddiTYyrRv5dwFgsPT7mQRGu8F
	 ztEfRFh8KZ6oE4CFg968OvZmhGDY46xnF5TnqX27zGgdcnM/xZ2WyMSSFTuLD0R24Q
	 JHhnDyOAAAicbO9T3PEfEf4UlW9m4ei9MWEpN7/AeAAzj3OgnIZc+XITt09RJw8N7D
	 EUnVO+Pny6gKA==
From: Mark Brown <broonie@kernel.org>
To: Hoan Tran <hoan@os.amperecomputing.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Thomas Lin <thomas_lin@lecomputing.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-acpi@vger.kernel.org, linux-spi@vger.kernel.org, 
 braden_zhang@lecomputing.com, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
In-Reply-To: <20260521-lecarc-acpi-ids-v1-0-ae0ae90b2817@lecomputing.com>
References: <20260521-lecarc-acpi-ids-v1-0-ae0ae90b2817@lecomputing.com>
Subject: Re: (subset) [PATCH 0/2] Subject: [PATCH v5 0/2] arm64: Add LECARC
 ACPI IDs for DesignWare GPIO, SPI
Message-Id: <177935811877.58022.6763569850673857398.b4-ty@b4>
Date: Thu, 21 May 2026 11:08:38 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1320; i=broonie@kernel.org;
 h=from:subject:message-id; bh=eUs6YVU2iFtFB2JHUiISX/6iwqnt7Bq1OFgZKZQ0uKg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqEC6sfKu343MptDCXeGNaCumZEVJKfrQjhNA3J
 6agdVFSQWqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahAurAAKCRAk1otyXVSH
 0IVRB/4jjzULxCcwXtugQpfoBXaIoe631zWgzVhxI8oyXQwUB/80TUP7HI67KBrsOUr8wlb8/Xn
 zyKVcIqdisj5cUxOU8D3WcYyauBstYtgBvzhzzQ6IPkc5nwaEPUlttCiI4lcV/DJD7rgeZh3zU7
 obshP4uzV5gx0Z/X2RqxyfqgzAa04cz1i/872sJv5NwleVQvo7m+32+mDjvgpvlOjsXSjrCYKDR
 NX1fNyPKHDI9fjDcWN2fN2ktAYoNGa/3iXeO+x0552DrEsEJqbLSxkLtqibKX2+pOBYiODMGuHw
 2HOk8JK66w563dovBqPcXl18s/HT2GuIHEsKwOd+0RMaQW2n
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Spamd-Result: default: False [-0.66 / 15.00];
	DATE_IN_PAST(1.00)[24];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37349-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 7DB6F5B2365
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 21 May 2026 10:34:48 +0800, Thomas Lin wrote:
> Subject: [PATCH v5 0/2] arm64: Add LECARC ACPI IDs for DesignWare GPIO, SPI
> 
> This patch series adds ACPI identification for LECARC SoCs that
> integrate Synopsys DesignWare peripherals.
> 
> LECARC platforms use the following ACPI HIDs:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.2

Thanks!

[2/2] spi: dw-mmio: Add ACPI ID LECA0002 for LECARC SoCs
      https://git.kernel.org/broonie/spi/c/019947c49585

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


