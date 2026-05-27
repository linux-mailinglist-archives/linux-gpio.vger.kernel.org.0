Return-Path: <linux-gpio+bounces-37591-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDApLUwRF2o12wcAu9opvQ
	(envelope-from <linux-gpio+bounces-37591-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 17:44:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 943755E713B
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 17:44:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D84803050BC1
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 15:43:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 663A342EEC4;
	Wed, 27 May 2026 15:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Dq+TW16i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD46C3DC4DC
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 15:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779896596; cv=none; b=Zmun8HmwI7S2JahooAebtBuPASlUUsD4QkD/oFRS+UuxYTgzTXPmLD4HC2p2I3QoaH2M69AsJVj5MEK4/mXHVFKFJ2zsnuzmjPB0jzY4aS6S25s40Gv9aNCJj36E9w26fhYx3ZhMn6QaTu1A0Y6yIEihuPp2ZCIbvO4M+4Hgxkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779896596; c=relaxed/simple;
	bh=wk+ZfnUs0TU+dESihkwAC46n1pq4njyS5t82Crc4TGc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H7W7GmTPzCvqs/sm3cmdvN9ebA0ZndOtdJl1xBabkORJd+nGC2iEgfvd6fGJMqKTaZi1a9zulF+85Rao9bsjJMzL4YXI+VjzOlwLNO+ddIZI+IDMZxC/0EtB9bJs+iiAB8viMna4k8nLgv1HFIl4uqc3JYnh8v+MB36A3VHcDqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Dq+TW16i; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49056b9f04aso56266075e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 08:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779896593; x=1780501393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m35jp3Py6wjAdvxeZDnp0MkWyh3TLwkNAGMef3b8C3U=;
        b=Dq+TW16iUwxnE+VL60GbHGpD3yUEW/nclH/gQiZjtH0MFfQLXuQf4CbqAS9gt5Zcla
         r0E12rl/Hjx1xaQuTLZgGe8FLh1xrxUbFNnXQnUyeqnyiXas7nhQ4UR/BNScxuRixwt0
         bxcT5PRYWYqydeaw6XlYhnqH8PyRVdIgDz333K5O0Yoio/Mb1Ucv77I08Cf+1QJkHhUm
         njo11sJ3N7lS3B2WNPDDb/Ky+4n+KjRm8qIeUqPH8r0wmIv8Y4/PDhzLZpyIH6kOtkDo
         IwE/cJqFzijvD+zUH1Sz6AZussjxXgeL0kocJxSHLLsI2vwQ6BQjcBfEtbzR8QheZ6bW
         pgwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779896593; x=1780501393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m35jp3Py6wjAdvxeZDnp0MkWyh3TLwkNAGMef3b8C3U=;
        b=BHTNkGJgRxzWBtrq9u1qexMVFeQDROcBpWr99Q2c3Lwpub2/K1wiN4EwebrWoagRKC
         CsISQcEYqX2tkEqQM5hHqaZt9V8Dqlb9nKrakevqJYpR2tJgiAxjYrjH9+eFowXxqjiS
         CBz7G/JVY12XdSkSrOGr0CLdoKFlydm676YvcLlynDP9LKLFTNU20MbL1/4LiupRfwRQ
         QC0tSDCKT7T/rD55P5tTEMhMuVgceI4I15P+qtGAo9YwzpY9SIPoSsAJF0vyCkXE7wtn
         B5pCY2m9oCVWmdsbKTinrczbakAnkYmmZF7gclmRtPPA+jtznPHbp2jbVRkm1a50jfH6
         B9xA==
X-Gm-Message-State: AOJu0Yzk+/IV8eD3fsfP6WUKoydQLqhahPs8vIvZtxSeTwe9rtGjJbXH
	q4chALaaZhGG4eKfNwGHrfag4ziApV+4/IqzcQVYJ7VtXn25QdhZbprot3+jOkdzNRg=
X-Gm-Gg: Acq92OFgeD7Ni/G3BKpYEYhL+RX2X5iB1ebK56mkwi0pBh/4rvL6ocS/K0rltlRoLSX
	JcgE3jpeo59KE50A+YU+sA3EDOFAYXbMBNlDWxnPLL3bk1qQX7mETUuYSeiPQT1Ka8532kG72K7
	AFBPeDtyLswbSBhmIeUSLt+6sgJKcCiiEQyWJP18ooAa/83lp/RCeFT2vO7Wm2b0XBkWQZirzNP
	Ft166mDZVLYC19ec2jQDG2ff/XPdNub7tBwsH+qcXSc+Bqa+9UmZF0nMrVnNsBesWyjFyAjpY1+
	8XWDvH57z+/jGMImHEjGEv7WjWpjxUZ5zP+AGhXegyNjvFikRslqwXrZyZAVXu2oZ/TDIAhjuM/
	c5RwxzZBP7Jh7UcjTx9W3zD55i9mYchbAGzOKrCRY8CfjZ0d/TLqFF74/T04E0Dvt5aACRWgrsM
	2T+qxvCSFBbFtkQ2/FIClKwPu1vfo9ckZb9mjKKDZmNzDjTr0JJx5fsQtlyr3eLqSpiakfWu8k/
	OJIQJY6LMKc/ZKYSgseIDAnlg==
X-Received: by 2002:a05:600c:4688:b0:490:4224:e0a2 with SMTP id 5b1f17b1804b1-49042ae265bmr408015645e9.33.1779896592997;
        Wed, 27 May 2026 08:43:12 -0700 (PDT)
Received: from localhost (p200300f65f47db042b54ed4dbf2ca0b5.dip0.t-ipconnect.de. [2003:f6:5f47:db04:2b54:ed4d:bf2c:a0b5])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4904527dbf3sm381384805e9.6.2026.05.27.08.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 08:43:12 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] pinctrl: max77620: Unify usage of space and comma in platform_device_id array
Date: Wed, 27 May 2026 17:43:01 +0200
Message-ID:  <1d8c53fb9ca44697c6a1f650311ac2bf72ef9f54.1779896151.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779896151.git.u.kleine-koenig@baylibre.com>
References: <cover.1779896151.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=999; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=wk+ZfnUs0TU+dESihkwAC46n1pq4njyS5t82Crc4TGc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqFxEJwp1SOEmtvbqQNKibz29YFbtqAWvrms6lG H+FqMsVy4iJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCahcRCQAKCRCPgPtYfRL+ TiFVB/9iV5fZrJcABFu1dICWRGm5/I291po04O6Fj8QSXcSE4qM7MxdLlnvSvbck0Am/rq8wNZ5 wWX1NxXrDOB6ENgC20G+kVaj/FI1GM9hqNir1bixsvD0PFeb8TzSV3CKpELZVW1AZQArn6BqtMc 7SOD7GFsmToa3Groe06GNBSYMXomRNszRlT85RFq5cFo2vQ53idLYKNU6BZUn/XlnLyt9eNkhOk 2Y1QWCB/WINhhfe1v/OxO9+CyNNx8HCnoVutdhC5Ve+g7PYit58RhL68Bhw6MmcnTEl3K9SpFXz 781IObNituoMTpRBGgNgjWCNYtsODU/VlKL3wWbrzwZ6zT0R
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37591-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[baylibre.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 943755E713B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The most accepted style for the array terminator is to use a single
space between the curly braces and no trailing comma. Also don't use a comma
directly before a closing brace in the other entries.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/pinctrl/pinctrl-max77620.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-max77620.c b/drivers/pinctrl/pinctrl-max77620.c
index acb945a25743..c47eccce7dc0 100644
--- a/drivers/pinctrl/pinctrl-max77620.c
+++ b/drivers/pinctrl/pinctrl-max77620.c
@@ -645,9 +645,9 @@ static const struct dev_pm_ops max77620_pinctrl_pm_ops = {
 };
 
 static const struct platform_device_id max77620_pinctrl_devtype[] = {
-	{ .name = "max77620-pinctrl", },
-	{ .name = "max20024-pinctrl", },
-	{},
+	{ .name = "max77620-pinctrl" },
+	{ .name = "max20024-pinctrl" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, max77620_pinctrl_devtype);
 
-- 
2.47.3


