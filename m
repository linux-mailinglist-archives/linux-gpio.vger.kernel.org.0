Return-Path: <linux-gpio+bounces-32622-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKKtCEU2qml+NQEAu9opvQ
	(envelope-from <linux-gpio+bounces-32622-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 03:04:53 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEAF21A744
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 03:04:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E41C3043032
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Mar 2026 02:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FFBC30DEB2;
	Fri,  6 Mar 2026 02:04:47 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4202749C;
	Fri,  6 Mar 2026 02:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772762686; cv=none; b=err4dzdnWhVrIt3Ziz/OJ9+2uzLd4HOUmSWNCWTAM4eyinh5lDD3VTnn4uJ+jxOxMO8Ih2vOPrJVtygjm6LsfAxeIBlZXbbWbkSt5mY/Vy8pU2fMZCquClvwCZoCH1Q0FB04mM/ZSdaVwlMlpDSkBOxYb8dcTPZqm4f3akgcK40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772762686; c=relaxed/simple;
	bh=lmBVwE8AshPgiyvn/kq6xEO5gknrmES1SJka/+ZEaKU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MEYK9jA5ZlzOoVaFmfS8ARTkHjHW45+WtE9vMvlOiINiYSEXzvO7EHdX0TIOjM3k0Tpynsnl8a6Vt7sGgFw2TcMDYaT9hwoKQJ5OekbaqfgfC+XHL1+kfGRux5RbWc27DF63LYTMjS3grXIe866HA/IlSa10Si/bUFTwZVpFW0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vimux.org; spf=none smtp.mailfrom=vimux.org; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vimux.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=vimux.org
X-QQ-mid: zesmtpgz9t1772762659t52ed2202
X-QQ-Originating-IP: sJ4ltfzKRtkwAFRk4r7BGZhDj75YwxAkzUqL1YKmCP0=
Received: from localhost.localdomain ( [119.167.27.218])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 06 Mar 2026 10:04:16 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14452768770087705391
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
Date: Fri,  6 Mar 2026 10:00:31 +0800
Message-ID: <9664C03EC3061D3E+20260306020359.2356587-1-xujialu@vimux.org>
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
Feedback-ID: zesmtpgz:vimux.org:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: OTcpUPEtz2BjS6oa8cYvW38Jt0ay0SK2xY3ro5mVhWJKCIBOLHWkvYEq
	gpD53lYhANa2uwaJdMBqYe4aSgghidxgAh8kVrHzwDb8U25Ei7Wm/e3abZU1NR68QyWnTaV
	hRYleD3/qNyxhTdZEvUwmrPbFGVQMO8IAIIdj91zuv8MNoqxLRE++1IXv1cIs8sk6iTPV45
	24a63tfJRxrRyhsiOnsTos31s0jviEWdpUiAl7oUf200KOHzzWsrtFW66+6Yr5Ft41TftXB
	K/+U8DbTbsklftazuQSROiQhs0VGm5dbviyqO5O9wuNrUHV+a0guEd/wqEN3ucbW1bSqLAE
	1XhF6xj8xyX9AS2p3YalvrsYmxe/6y9nwqnvTd3lZxXILpY/2lehqac973BhyPyaE+3tmC8
	6U5weZGVzhAodHK6coNQgGDctKth5U5WcqeGsCGX+aYHaenPoHiTl3Fi/QWWmgAsqn9925d
	FyrEqAy6h3qDSYyslWnRVyBrUCUX5tTFgaDCqLVMCQONJOvle8E76QWNX6lErHR2o1Zy/70
	TsRrMdpFZujn8nRfnx/gXYjueN/I3+Jpa5rdapYI1KpVXGG3DzXPoXMLphf98O8hAd6oDi1
	/vYAsLYQ1WURE0Q04wcWeg6V53Vhn2Ygiwqk+wDk3tEQLkBLImF/DQfZsTLo9qEIDbE9dkP
	L1JiL5JHRbTxReeHdvQ8Bo6KIxryKUG3ipeHE85DvKZYEns5PqIJTayBa4SO/dg3rYjrgbI
	zSninFO1Em89XBkbN26s+5YrC+7rntLcpg5jhAdQfLrETX31KinPqM55DIZro9F7N01GVZF
	P3hqO+0GEOGdwD8W3IlRIp8sFaomtMCeRe8ov+SImyDzLF2FeoM4RlWKIvAjJuE5VBU/5WN
	GlLHOoEDrxCR4V70wgKdi1eMvRWKAphn1IbOg+BBGQh/SoCKEpNh+u/aB23czNNykv4m2nJ
	GN9jm1Ns5DJENd7GRw4lodXsbuaLAroZKF1/Dgvm5AlLD6LgNIKlcJZ7/
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: BCEAF21A744
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32622-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[vimux.org: no valid DMARC record];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_NEQ_ENVFROM(0.00)[xujialu@vimux.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vimux.org:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

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


