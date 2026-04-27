Return-Path: <linux-gpio+bounces-35540-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEzNFfki72lV7gAAu9opvQ
	(envelope-from <linux-gpio+bounces-35540-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 10:48:57 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CE446F603
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 10:48:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 448FE30154BD
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 08:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AF353A0E94;
	Mon, 27 Apr 2026 08:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AEMR9xX3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8F339A7F9
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 08:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777279681; cv=none; b=nyY2T4pyr62x1i4znZtv6GMjZvqBuDI0dBelO9TcLWjegKiiRfwY4wltrM554CJRZ/mVJMFJWYy7nJ27mK6wsBNNIlLyH51NAYTmoGUWhoTxxdV8cpiYbZz6l8U99i3vibEnhwhVmfszFQaf3k/akGxcBuDV6s9/NBYicAwxIAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777279681; c=relaxed/simple;
	bh=OYK/lsqJavoPyaw5B4T9HRR1sjlqzNr0n0JdxZm77f4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KU4m9KezMbi41yGxu6aH7z5VKvdC5g5/FjK3sffKZcn6qCXROPTTxA9kH8iFmDyMXiqMdG7Dfqmp9T5R1EjZfkbifv9PlIc9Fy0lJPLZ5G6ezeHMfJUg0CgM8frK8CN2yLQNLAX5mPXOIVdXlRtBCV6fGXM9VyU6c0ULixbuZ58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AEMR9xX3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93F19C2BCB4;
	Mon, 27 Apr 2026 08:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777279680;
	bh=OYK/lsqJavoPyaw5B4T9HRR1sjlqzNr0n0JdxZm77f4=;
	h=From:Subject:Date:To:Cc:From;
	b=AEMR9xX3rehNy/r4hqzns3rvMSv1cwToOavMcKQDO8ddO9m7fWhxTiFxEbLs/cJ0J
	 Aqy594hQA7c9ObssITA7oNUBoktGrYvzSz4ypZw8JfqyX3/Y+VdhGlPATHCtk6RGfM
	 S7QvTlRrUbx0/3bpZAFFT/Whynjf92DkdyLysljedPVPcJ7+nL7DmNnnWmYZ3xKYtv
	 X6mW+bH7WA3GRXPh87jtxvT+e3rOk3xcei0M/pDaJKdwpe7MbHQ3JTperNQNXDGrGH
	 HCSP6Sx7Mkt50neVuwTb5VU2ebSrWS+3yjOBkEasESNWV/YnVpFJmcY72guePtHj9F
	 pNvUWfXJatFIA==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH v3 0/3] gpio: Use generic MMIO GPIO some more
Date: Mon, 27 Apr 2026 10:47:56 +0200
Message-Id: <20260427-gpio-mmio-more-v3-0-fe1882351424@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WM0Q6CIBhGX8VxHe0HVLIr36N1gfGrLAUHjdWc7
 x7YumrdfNv5tnNWEtAbDORcrMRjNME4m0AcCnIblR2QGp2YcOAVcC7psBhH5zmP80ibBrADXZ9
 01ZEkLR5789yDl2vi0YSH86+9H1l+/6Yio0ABVal0KbSAsp2MVd4dnR9IbkX+9WsQTPz4PPu9l
 LKrBYNKtXf0FqePv23bGzzBfGDtAAAA
X-Change-ID: 20250227-gpio-mmio-more-990eb0d68d5b
To: Bartosz Golaszewski <brgl@bgdev.pl>, 
 Mun Yew Tham <mun.yew.tham@intel.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: C6CE446F603
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35540-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

I found that the Altera driver is easy to convert to
use GPIO MMIO.

Only compile tested, I do not have this device.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v3:
- Rebased on v7.1-rc1
- No reaction from maintainer, just apply this please.
- Link to v2: https://lore.kernel.org/r/20260313-gpio-mmio-more-v2-0-0f777b63105a@kernel.org

Changes in v2:
- Rebased on v7.0-rc1
- Rewrote to use the new generic GPIO config struct.
- No reaction from maintainer for 13 months... Maybe we should
  just apply it?
- Link to v1: https://lore.kernel.org/r/20250227-gpio-mmio-more-v1-0-0ea4ad43d304@linaro.org

---
Linus Walleij (3):
      gpio: devres: Use devres parent if undefined
      gpio: altera: User gc helper variable
      gpio: altera: Use generic MMIO GPIO

 drivers/gpio/Kconfig          |   1 +
 drivers/gpio/gpio-altera.c    | 124 ++++++++++++------------------------------
 drivers/gpio/gpiolib-devres.c |   7 +++
 3 files changed, 44 insertions(+), 88 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20250227-gpio-mmio-more-990eb0d68d5b

Best regards,
--  
Linus Walleij <linusw@kernel.org>


