Return-Path: <linux-gpio+bounces-35858-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJx7Dn0n82mwxgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35858-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 11:57:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D324A053C
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 11:57:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 98BF4301AA52
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 09:49:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69B143FF89A;
	Thu, 30 Apr 2026 09:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LOHu26B/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A4E3FE645;
	Thu, 30 Apr 2026 09:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777542499; cv=none; b=ZUfAERxZZjr6Y+PzRIAoT40JyXp0/mBJL+Klt9cSDvzHzHrCU+VVuTU0nSZj7Qt+75SSZJQesuLXuaK5wW1czFK/80IMa5nq6NDaGS2QPR2PTlk0+wYIRwgpPfpaNvq4np6yEyYW+Z+ihzXE/ikPDxeS202e5w+2YvZJYrWmJCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777542499; c=relaxed/simple;
	bh=gwnagyQsUUaKYrMkVsr/+NWttRGL8//k2v9zlIqxdWA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kluUrSW8BkRqwroPLzSeC0PKm4aRqael4466SYNcaBVDtqdwfO2j+8WUuO/Q3IWxvpBhb7mWj6QzONOQSX9g/00AMS2gcEA/Yq0FoOljmO/iLm0Gzn9qso5eFLvHyhUugm+iXVYbVEAhPUQrGK1ANZrWlkK0dAjiOFy0mAEmTkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LOHu26B/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59A99C2BCC6;
	Thu, 30 Apr 2026 09:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777542498;
	bh=gwnagyQsUUaKYrMkVsr/+NWttRGL8//k2v9zlIqxdWA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LOHu26B/q/3+OsSK/OBhfERdhimkxZYMKrEmQr5Mv4UQfJMi7MRyd75pxLnVhHZ8K
	 bofYnBAczV2FRI86KE9fn13zxWZ9wLs4Z1/ohsskGW2sy+fyJSqvCbPOuZvFaSWgzK
	 csbWhbdolayrfSq+v6M9Khu8Lq1ushpvrqCu3CUhj7NBTVXhNaLFYP5rD2/vJKFbg3
	 TQTUslKaacnLeUou67JA4jCOFEK/68ET4a+MFIKX5ysbo/i5AT9U1BKxeVrlJ6fNrM
	 tLMABPuQVJ+lHnoMfSaM3L71QfRIr4wRPuXj//qtnyFPGwpKK5ZqXxOlYkQ8CA6jEj
	 aLkaQj3o1jy4g==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
In-Reply-To: <20260327-gpio-timberdale-swnode-v3-0-9a1bc1b2b124@oss.qualcomm.com>
References: <20260327-gpio-timberdale-swnode-v3-0-9a1bc1b2b124@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/4] gpio: timberdale: remove platform data header
Message-Id: <177754249703.2432539.15541841890441225607.b4-ty@b4>
Date: Thu, 30 Apr 2026 10:48:17 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
X-Rspamd-Queue-Id: C3D324A053C
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-35858-lists,linux-gpio=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Fri, 27 Mar 2026 11:49:06 +0100, Bartosz Golaszewski wrote:
> There are several GPIO driver header scattered directly under
> include/linux/. I'd like to either remove them or move then under
> include/linux/gpio/. In case of gpio-timberdale, the platform data
> struct can be replaced with generic device properties. This series does
> that. It can go either though the MFD tree or GPIO with an Ack from Lee.
> 
> 
> [...]

Applied, thanks!

[1/4] mfd: timberdale: move GPIO_NR_PINS into the driver
      commit: c44d171a52513bfd06b5d847b42b0c1013ddd46e
[2/4] mfd: timberdale: set up a software node for the GPIO cell
      commit: 2012c0d1b91767b68dedac127c3575cf816313e1
[3/4] gpio: timberdale: use device properties
      commit: 065d211f9ef7e60c510cbb3663ffdb7ca14efae2
[4/4] gpio: timberdale: remove platform data header
      commit: 0cb4edca4ed1325ddeb368f80807403cc37edc00

--
Lee Jones [李琼斯]


