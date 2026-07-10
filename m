Return-Path: <linux-gpio+bounces-39843-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XAdPHnY7UWpTBAMAu9opvQ
	(envelope-from <linux-gpio+bounces-39843-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 20:35:34 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BFC73D625
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 20:35:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=disroot.org header.s=mail header.b="T51G/uhb";
	dmarc=pass (policy=reject) header.from=disroot.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39843-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39843-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 31C0D302A71D
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 18:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE065379C2A;
	Fri, 10 Jul 2026 18:35:21 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49CB3749E7;
	Fri, 10 Jul 2026 18:35:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783708521; cv=none; b=rOCRYscU6imgo1KB/J1jR1O5QhP+C7bo0Cun7wC61YMuSXwaN1y02VrQSvnqBhSkgYFf+0JDFb6CmK0OVvhDWrgLZd1vr0MxBaHYBgbWOtxdrSPlJ9GFu/nOoDhuy1H7yxuiwVk2Tr7dePaGK12YudRU0GkiJJ35Eq/sDlqccGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783708521; c=relaxed/simple;
	bh=dgYiK9KMY+RtlaTkj1TO2jyMUcHwtb8HvGdYAFnAWms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UZrCO+tPFLcuNLm2TfcuY96GZDEgCb52/JmHzIOcUQVaBSMH3BLhoktb80LtqHjwGY9jP+4gOrL7ZtsRqrkm7lbuyakVExtMZTk5/q7ESWBlIh+h5AYgrXE+PW229LnU5tUL+suMPTvikgezwfgHr+KHFmpTiEIQ9HnDIQg1WhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=T51G/uhb; arc=none smtp.client-ip=178.21.23.139
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 1A8EF86D22;
	Fri, 10 Jul 2026 20:35:16 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7tUOzMIi-HVe; Fri, 10 Jul 2026 20:35:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1783708515; bh=dgYiK9KMY+RtlaTkj1TO2jyMUcHwtb8HvGdYAFnAWms=;
	h=From:To:Cc:Subject:Date;
	b=T51G/uhbbkdo15xlJlefRbj+OmbzKElqW77xiZC1DA4eykgHtEkvKr60u1/C95STa
	 dYx03Qw+CqCyF9SoORB03YrK5c2Yzq5bD2OIh0P0Z9dCDfZ4j1IBucaRqbFtC95RjU
	 Xzyl+m/FFirZ4xSkN3kXpIN5TBcazXdkKUyL5K9IlKfY154PcJPvx7c11q4S72HeEm
	 Sgoz7UkshOGd4TkbEzwLSLgAqPlDmBMlRxF2+5kGELxvL4MBuV0O9SAMBV6tCmI+iD
	 NGpW9a57mGqXTnWFlxr/tK5d9KWWkYml/gl3ZW0iuSNzSNyt5YoDMN67/YGfLwgKrl
	 vU64k1VMJvR5A==
From: Rustam Adilov <adilov@disroot.org>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Sander Vanheule <sander@svanheule.net>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Rustam Adilov <adilov@disroot.org>
Subject: [PATCH 0/2] gpio: realtek-otto: make the driver work with SWAP_IO_SPACE
Date: Fri, 10 Jul 2026 23:34:37 +0500
Message-ID: <20260710183439.996923-1-adilov@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[disroot.org,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[disroot.org:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39843-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:sander@svanheule.net,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:adilov@disroot.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[adilov@disroot.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[disroot.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adilov@disroot.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,disroot.org:from_mime,disroot.org:dkim,disroot.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F2BFC73D625

This patch series changes gpio-realtek-otto to be functional around
SWAP_IO_SPACE config.

Firstly the ioread32 and iowrite32 in realtek_gpio_update_line_imr()
have to be changed to their __raw variants as it is the only point in
the driver where both devices with ports reversed and without meet.

Secondly, the bank_read/write and the flag for generic gpio config
have to be separated from GPIO_PORTS_REVERSED as they have to be
changed to the opposite one when SWAP_IO_SPACE is enabled. The
device_is_big_endian() function seem to be a good choice for it.
That does mean the rtl838x, rtl839x and rtl931x has to add
big-endian property to their gpio controller nodes for gpio to be
operational without SWAP_IO_SPACE.

I have tested it on my RTL9607C machine with SWAP_IO_SPACE enabled
and with big-endian property set under gpio controller node and it
was working fine.

Rustam Adilov (2):
  gpio: realtek-otto: use __raw_readl/writel in
    realtek_gpio_update_line_imr()
  gpio: realtek-otto: decide bank_read/write by device endianness

 drivers/gpio/gpio-realtek-otto.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

-- 
2.55.0


