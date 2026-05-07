Return-Path: <linux-gpio+bounces-36385-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iB5rGxKw/GnlSgAAu9opvQ
	(envelope-from <linux-gpio+bounces-36385-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 17:30:26 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 189044EB182
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 17:30:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B1FB8300E293
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2026 15:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B7FE42EED1;
	Thu,  7 May 2026 15:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KI39lWtN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB0537C91A;
	Thu,  7 May 2026 15:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778167720; cv=none; b=Yk8Pq+TiDSMIgn2TEsuQpnGD4v8iGd6LpKaxEfD6ju15GUBqFfCunA5JTn8OCLvMWDlFI5lxsYsyEvhc/+du1JioGrGDE6hu7wqTsRbYjy83y6sESRZFYPSu7LDdjGoBGzJyDbt9zsnWk2OzVTc5cx03rWXohq1kq2/RQTHTHL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778167720; c=relaxed/simple;
	bh=wovRPm9Gy/tDfxp0oJi6Q9AG8qViUf9dQkYWlWX4Xf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d2wcLugY17N/1DR2M34pLy4nXgs1Oqt1NAkZbYGUNJgKoOsj0QFJxC/R4VMfiB9jBTz4OWYvV8KCYVa6DlfF3ZhoS4bREcoVaqBuzT2IkaEmBk2CT03eLcHI9ggcQbxz9S1j4obBFjqJM//BhdzB0VPI/IbqLjcxgDhNOwCcTlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KI39lWtN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74FF9C2BCB8;
	Thu,  7 May 2026 15:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778167719;
	bh=wovRPm9Gy/tDfxp0oJi6Q9AG8qViUf9dQkYWlWX4Xf8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KI39lWtNos57vloUDQjOlBLdYuEQmZ+jL/qKljQXZhPecuugaxj6bJH8kX6xAKneJ
	 U2vcvh9ADkAIgpI6cCifII2D/9ZZmTKI79T9Hy8BGdSF+izNCXThKGBw5rMuLeLC2l
	 s1NcD0OzW7G4RosSQsF+B3wMDB8p0RwdCEv8zYdxyToqiFdJDR4OEUu66UMsXrE8Kw
	 3zoqK+cxwI2wgs8H3rG5GeaRT6cXaH8jMeqW4XmGfdTCv9V0D+fmwLU6Jl07QRv1dH
	 XQOw1IgvNNpfjpfBDotgZvyaYQmXC1Y97MMiiG2YtIHINbSnu/to4lzKz+1TS5teK3
	 doJ10UaXN83tQ==
Date: Thu, 7 May 2026 16:28:35 +0100
From: Lee Jones <lee@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [GIT PULL] Immutable branch between MFD and GPIO due for the v7.2
 merge window
Message-ID: <20260507152835.GR305027@google.com>
References: <20260327-gpio-timberdale-swnode-v3-0-9a1bc1b2b124@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-gpio-timberdale-swnode-v3-0-9a1bc1b2b124@oss.qualcomm.com>
X-Rspamd-Queue-Id: 189044EB182
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36385-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Enjoy!

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-gpio-v7.2

for you to fetch changes up to 061bc966cfe97314b9f4dcd849fc7042fb12122f:

  gpio: timberdale: Remove platform data header (2026-05-07 16:25:48 +0100)

----------------------------------------------------------------
Immutable branch between MFD and GPIO due for the v7.2 merge window

----------------------------------------------------------------
Bartosz Golaszewski (4):
      mfd: timberdale: Move GPIO_NR_PINS into the driver
      mfd: timberdale: Set up a software node for the GPIO cell
      gpio: timberdale: Use device properties
      gpio: timberdale: Remove platform data header

 drivers/gpio/gpio-timberdale.c | 26 +++++++++++++-------------
 drivers/mfd/timberdale.c       | 33 ++++++++++++++++++---------------
 drivers/mfd/timberdale.h       |  1 -
 include/linux/timb_gpio.h      | 25 -------------------------
 4 files changed, 31 insertions(+), 54 deletions(-)
 delete mode 100644 include/linux/timb_gpio.h

-- 
Lee Jones


