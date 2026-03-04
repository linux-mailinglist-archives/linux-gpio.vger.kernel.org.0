Return-Path: <linux-gpio+bounces-32468-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mE+9FBAPqGk8ngAAu9opvQ
	(envelope-from <linux-gpio+bounces-32468-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 11:53:04 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DE91FE902
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 11:53:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1833F30268AE
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Mar 2026 10:53:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC6983A5E69;
	Wed,  4 Mar 2026 10:52:58 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1F9327C13;
	Wed,  4 Mar 2026 10:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772621578; cv=none; b=Gh5i1AHgZ1/BnAh7N8638a5a9hy6/2L5YE8x4nmAGUe9wHiW9RiBkhSrR6dn5k66UYSERDL1n0zVEmtAV6CQLlVFfMPqDd0qGyRjHHfqPCxAj4aqixgWrTMoUdSjdwWgVrq38U8wzcrFM50MiFfERUedId+sv9lN78+B2DCAcuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772621578; c=relaxed/simple;
	bh=PIwQ2OAx5UFAAjHUNWbl4Mi8LTSAxm1U/Yy6IUcjPBE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OrXh3qXaZG3CZUHOWwAlPgMXpAURB2fYq1JBH4NrJc/RG4sWnqI8n7h7CFkk2jrmpKzlCdNVdpWnwor2yYW+vkKe+9dnjaYT9Myaj9RZ9xqreWV3vjnIqwpT8jXdyI3DPY3bTxqibh1cNJxdFQ7ktWBQqMpF5pCKWTHDIFkIz1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vimux.org; spf=none smtp.mailfrom=vimux.org; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vimux.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=vimux.org
X-QQ-mid: esmtpgz13t1772621552t11aff9e9
X-QQ-Originating-IP: gJW4bv1S9bxNYJBk3kitEWKtlcCBqIn6Y3Ddf65K4V0=
Received: from localhost.localdomain ( [219.147.0.82])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 04 Mar 2026 18:52:29 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7595117862615817375
EX-QQ-RecipientCnt: 8
From: Jialu Xu <xujialu@vimux.org>
To: xujialu@vimux.org
Cc: brgl@kernel.org,
	kees@kernel.org,
	krzk@kernel.org,
	linusw@kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH v2 0/3] Remove <linux/of_gpio.h>
Date: Wed,  4 Mar 2026 18:52:12 +0800
Message-ID: <1777BBA64A3D0F97+20260304105215.536399-1-xujialu@vimux.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <7187C401290C256B+20260304084808.440955-1-xujialu@vimux.org>
References: <7187C401290C256B+20260304084808.440955-1-xujialu@vimux.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:vimux.org:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MqGTbRWettN6eACIgmyh2O+BHaSczMtleslrKXYKGqEnwjOnuQgdroL5
	/dHIPN3qL8oIaKcENpa2COAkdNfqyHMuUfswtEZ2iwEwKgD5/wkahcFZQOsOh2H6CzAIeI7
	2R6n7+2209/BUp31NIOqZepn7I8QvSFN0bA/dgVzLEEZOjKQjdW2QwZ/610r3wc1TEdYVDW
	g7OFChhTuWE27jPaxRn4s06B5IbKtL2PLEpOavPv3zM+b8binTgATU+txj22wn2juR4fad1
	mczgraMJUCZ21s5eegllK6Gbz1bGT0UlwtImwVC1PCPMLN/naB309aSk9GbVnbXejQGZaxi
	DU5XRHS0U0AvL4jHRGYej2WaAbsoL/A1p0D3e5nPLYtkABHOeYGIu/IU8f1Y+M6YFG7XaiG
	uX6mdu3ruk1a2VBDLNQVxbzR91KTX0gDxRmRX2lzIGAaa3CzrfTImJsy+KlwAf7zaLDRYq1
	3hYipdYpvEoNtqefuKgImVaT7Yt4sBt35Ypg8Th972FWBC/yBHjrad8pDk+6tPvLCrZxr27
	rJXbNYoPCOugysjgszgxttPQdq5ViykMaeMlvdj7Avj7Q5PQDcByRQN37titJd01gAcme6Z
	mwf1qJCe2B+S8sZfQXah3cu8vVq+IJcllNuPb3XIN9ssQ+wemcc0xJfOWmVORphNEzCFCfO
	ItCbVRD2w1VYth6pu/j8Auouueed48JCwkEfGsTuY4DqnaemlFlB2dBupnxeGWFSdZcLFNf
	XCEggD2xvoGal68Z80THC7KMeO8iSGGiUCDIS8zo5HQOGMG7vS/jYMo0TJa3z0ULkRI7n9O
	cy6AW1tTV4hwhaANFjv2pqIEhctx8TKsG+oplPo4Ov96RZtvfi4QPX2o4IaK2NXQimB9KIZ
	HGjntBw+VXhLQhCSztR8GWUK4sPhMdkFvZOcJ10w5tWWVeCCIhCLJrumB3qk3X+dlNll84Z
	+4JhlVuOhOGEtjQvrW7rY0RacsEq6USet1yJA+gZIFczOK+3zRJOGC8lAw6AM7ddPq3k=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: 14DE91FE902
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32468-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[vimux.org: no valid DMARC record];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_NEQ_ENVFROM(0.00)[xujialu@vimux.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vimux.org:mid]
X-Rspamd-Action: no action

Convert the last three NFC consumers of <linux/of_gpio.h> to the
GPIO descriptor API, then remove the deprecated header entirely.

Changes in v2:  
- Add rename quirks in gpiolib-of.c for s3fwrn5 legacy DT properties
  (s3fwrn5,en-gpios -> en, s3fwrn5,fw-gpios -> wake) to preserve
  backward compatibility with old device trees. (Linus Walleij)

Jialu Xu (3):
  nfc: s3fwrn5: convert to gpio descriptors
  nfc: nfcmrvl: convert to gpio descriptors
  gpio: remove of_get_named_gpio() and <linux/of_gpio.h>

 drivers/gpio/TODO                | 28 ----------------
 drivers/gpio/gpiolib-of.c        | 31 +++---------------
 drivers/nfc/nfcmrvl/main.c       | 46 +++++++++-----------------
 drivers/nfc/nfcmrvl/nfcmrvl.h    |  4 ++-
 drivers/nfc/nfcmrvl/uart.c       | 23 +++++++++----
 drivers/nfc/nfcmrvl/usb.c        |  2 +-
 drivers/nfc/s3fwrn5/i2c.c        | 55 +++++---------------------------
 drivers/nfc/s3fwrn5/phy_common.c | 11 +++----
 drivers/nfc/s3fwrn5/phy_common.h |  5 +--
 drivers/nfc/s3fwrn5/uart.c       | 45 +++++++-------------------
 include/linux/of_gpio.h          | 38 ----------------------
 11 files changed, 67 insertions(+), 221 deletions(-)
 delete mode 100644 include/linux/of_gpio.h

-- 
2.47.3


