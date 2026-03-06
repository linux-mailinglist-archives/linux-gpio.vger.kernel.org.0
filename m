Return-Path: <linux-gpio+bounces-32623-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDzBJWtQqmktPQEAu9opvQ
	(envelope-from <linux-gpio+bounces-32623-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 04:56:27 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D5021B546
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 04:56:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D1E2E302C5D0
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Mar 2026 03:56:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43B4D36C5A0;
	Fri,  6 Mar 2026 03:56:19 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279C815B971;
	Fri,  6 Mar 2026 03:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772769379; cv=none; b=C/02MmbsVG/McZgs3amxEbsW9ozurEo1aYufDP5B/4AvqIJmAk7D47eitabc8txxg8JSrbe2+SbdTiCSzIs3Ip6Vatjw1H1klYUbkTobj+pgGPsuHOCYlw9BQMmi+cpfIVgHEMGG3gAoiFNotO/sBW6olG01NU+EREKJsjF/IJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772769379; c=relaxed/simple;
	bh=o6rF9s4zSbCq3JBi/YYnPZ8Kt0rMmZQ12sel9dbCuWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EYoNfC0B7X2Tg6lx5Sr+HVRI9D8zZoN+0uNV9A6e4LaO0+V/Y5Aq7ie0cHiPSR5KEEVQ5WfzQ3fo1kNETu2D9k7j19wx2olfERsnNG1hWrLdYIWSzqq57VQDuxAMYZn8IJredHvIndy6sVqMLfRoca+TJHSRdujgGZwd4/eeHCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vimux.org; spf=none smtp.mailfrom=vimux.org; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vimux.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=vimux.org
X-QQ-mid: esmtpsz16t1772769356teb805c45
X-QQ-Originating-IP: 0WbQ8Cs/6XDkzEfM2+B6aawAkwXW+iDEsaPKq+113Ys=
Received: from localhost.localdomain ( [119.167.27.18])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 06 Mar 2026 11:55:54 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2877752370245726965
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
Subject: [PATCH v3 0/3] Remove <linux/of_gpio.h>
Date: Fri,  6 Mar 2026 11:53:39 +0800
Message-ID: <D5F95320CE72E20A+20260306035539.2443355-2-xujialu@vimux.org>
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
Feedback-ID: esmtpsz:vimux.org:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: OCUSzqUNJvDoVsljY+TJkdVj+DRlD3h4OlCdW+Wc2TO+wpwMuvmK6Kqh
	UzNwBOQPzYTWYdEHVPNRIXpE7fzNC5kG1mPbHMnT/4xs2ufW6GsO0cDv9OpVL1OsyB57aUg
	Hzj1nVDIHB7hJeOAH57fYV6C3VwxlGntIHHr6GoatZYPvig1tGiO3SvZ7A1ZRvzHfs1PaMA
	qGx1mNsLY4V6fC59sYJhPjPHB84YyN36ESh27a7lts8ZyqAZ7yFAcEjRpKAlcHDq7qw0Oaf
	W/AKuKQ1CY/XkZlEaDEvlMdC/sid/1GNbTgy1CbTTlpjyD34Lf4EZebJnoMSKDOdfMn4HZy
	tmvMqqp7X8hDzWoBIZbLJKCL2aJXfEwX/DRBXlEcGxAstIGzwybf/rcd9VfCxeJ9yz4QJcp
	IxGgCOrsDxm03Z+bTorKMTaL+fTzyWBRD30q3qCV6TwBjr56Pzv5pmmxGky/Fgj9rR7c4/i
	4iI6C1PpwiJd1M2uJHOKE36Yc7unFTgY3Wb5O38VBkSp1Xrw4rtLWOpKpkZOntOwvhJwcvH
	YRaNGKDpMOUdYAq/QujJXG4LegdLpigog53v/SqBBPEXANC3O2NHk+fabxissF1AHoB8Y5I
	a3QZ1D3bWOYsxmfV8NsKtndY8o6/985josZ0x7PpAuw3pfNsiXt0EfQIHU40+Fs9woe+NHR
	4tJl4Ck7gWoHlprOW29kIH6C2nFYE4RAD5hLbJagGL71+tv5IdKDK/qou0R7Z6C0OMLvkCu
	mIZmd4/V5FZHZux/x/gtBJP22NkVqRRFr51QShVOc6upJ4mCNaFdzNJJHKGmlIf+8rKcsss
	lZcDFF418+aZUszlNaCBeCNgt340v4QQRu+W5nVacrDYnItgRaZYmLFCNpEigLYw3MgtGJI
	JAh4KpPqj4kW1ENqEucene0dtctmZrcxzlkyEi0AXQFqx0RV7Yx8O5NW0E8knf8tBHzqejn
	YlolI3oXDexAeFo65/de9pIUe7hKRN1h5Ygw96CAyu45obby3FVEoy7xw3c4ezg7EoCX75u
	LkSN05Pw==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: A8D5021B546
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-0.991];
	DMARC_NA(0.00)[vimux.org: no valid DMARC record];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xujialu@vimux.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-32623-lists,linux-gpio=lfdr.de];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Action: no action

Convert the last three NFC consumers of <linux/of_gpio.h> to the
GPIO descriptor API, then remove the deprecated header entirely.

Changes in v3:
- Expand commit messages with more detail. (Linus Walleij)
- Add missing Signed-off-by. (Linus Walleij)
- Remove include/linux/of_gpio.h entry from MAINTAINERS. (Linus Walleij)

Changes in v2:
- Add rename quirks in gpiolib-of.c for s3fwrn5 legacy DT properties
  (s3fwrn5,en-gpios -> en, s3fwrn5,fw-gpios -> wake) to preserve
  backward compatibility with old device trees. (Linus Walleij)

[PATCH v3 1/3] nfc: s3fwrn5: convert to gpio descriptors
[PATCH v3 2/3] nfc: nfcmrvl: convert to gpio descriptors
[PATCH v3 3/3] gpio: remove of_get_named_gpio() and <linux/of_gpio.h>

 MAINTAINERS                      |  1 -
 drivers/gpio/TODO                | 28 ----------------------------
 drivers/gpio/gpiolib-of.c        | 31 ++++---------------------------
 drivers/nfc/nfcmrvl/main.c       | 46 +++++++++++++++-------------------------------
 drivers/nfc/nfcmrvl/nfcmrvl.h    |  4 +++-
 drivers/nfc/nfcmrvl/uart.c       | 23 ++++++++++++++++-------
 drivers/nfc/nfcmrvl/usb.c        |  2 +-
 drivers/nfc/s3fwrn5/i2c.c        | 55 ++++++++-----------------------------------------------
 drivers/nfc/s3fwrn5/phy_common.c | 11 +++++------
 drivers/nfc/s3fwrn5/phy_common.h |  5 +++--
 drivers/nfc/s3fwrn5/uart.c       | 45 ++++++++++++---------------------------------
 include/linux/of_gpio.h          | 38 --------------------------------------
 12 files changed, 67 insertions(+), 222 deletions(-)

