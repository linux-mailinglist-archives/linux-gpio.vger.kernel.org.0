Return-Path: <linux-gpio+bounces-34573-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAEKHeL7zWlYkAYAu9opvQ
	(envelope-from <linux-gpio+bounces-34573-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Apr 2026 07:17:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 347A9383E9F
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Apr 2026 07:17:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B7197309BED6
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Apr 2026 05:15:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B36F370D75;
	Thu,  2 Apr 2026 05:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aexidzYF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FE536D9FE
	for <linux-gpio@vger.kernel.org>; Thu,  2 Apr 2026 05:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775106936; cv=none; b=apEqPC16YnGrpxZZkf/mTe+lM3SZLorjvzJNrzG164sFm9dS+kH9BOfj6hXpGsqLPTXDruNk9r0OI02XmtAe0Cif4g/pR0hnhDiUfdxKH+q0dF4sQqi/9wt6E8iX+Xjivie720X8gpTNF8TaRk+vabhPkHUpVZFQ9tf7vYQSYCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775106936; c=relaxed/simple;
	bh=HVoeiC7t5M0u01gC8ZWrF1ZSdndrYAnSTfQH8ssTUVw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bW8vJ6196Mew8IjhClvnmx8R1PRHOSdkAh2HnV62hbCCHpkvIECefFVvgD/nLl1p/LgGM0DvdNi+o8xEhkpgpOfPQmxLDR7W+PvcaOv6cOWhoIS2uSBLrVcp9fZQoZUQ5vux59ARvMMyKQbZ4SKfHRtO0+McyRzRKVYu3sbnabY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aexidzYF; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-35da2d35eccso263048a91.0
        for <linux-gpio@vger.kernel.org>; Wed, 01 Apr 2026 22:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775106934; x=1775711734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9VRhm1iFIbmMSuYjrKLq45KZf5lir66/ZO2vyNWUJDo=;
        b=aexidzYFvmt3YUxjauyrhjoe8SwDNNMksF916eZytT+OIQSDwv+fk8dut+4JpZJdf1
         FJ6tzmwntIrY5zt/ua4BlUIpJ2yr7BUK5vLmntaa6lM17aaSw1N65UnXEtmU4wQDChPa
         Hrp6o2VIXdXnE9X1zAmRB587COYxbWO3Rc6t3wbJcw9ZFYbhRbcLlz/1gfvPVHNJ9jLv
         jM2tr/bO/UPDAKTx81hkgJrfHdJlbUuBPh0WyDRibWzEJ7MRFDe4JIYLR0neXEaPYw7E
         VeLIu8Zo/y8OYP0GsN3gtGe2cj7cRi2CVT2rxGPmtrh0yvE2JDztD7sOsKR2AuvM/yjq
         ENRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775106934; x=1775711734;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9VRhm1iFIbmMSuYjrKLq45KZf5lir66/ZO2vyNWUJDo=;
        b=AZPjIH+3UeDZl3opMAMHhM9qxl6dGpy9IhKM1bjPxJvtfxwgHKRUz7fxjKGkeGZHTW
         EwDJloI1mKq81Lcvnobc9oA+t7l/jL0hEHizgh/JESwZCtVVWgmjT9mwyBuooeP5GF+5
         nz6/LTtG5QbRyI+1S04irkmWjy8YmSjL5YLsKKZoOG8IityJTNafGzAXJ6Sb0EEkh4t9
         bXeR9a6mubYEOCBiqnnwKwwgJ0eMcZZyCkGv5O+Loj7N8Xo9SbCPZvX24IY+0Xi2VHG1
         pWF6JY59wO/+SX76x0eiKEqfootTQzszSbCwgZ8lSCs/h2vz82TQr6TSqASWEBeotg4W
         b1Qg==
X-Forwarded-Encrypted: i=1; AJvYcCViLNxE4hgohNWlHvddIgZmZNpTmCITZQZ/NxBaVe3Y2uPhKDhrWZ4pBIZJ4mdEr3JBAkewlQ/YbG71@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0SnNxrhjEYkYb3dXAs3vj7fBmteXzEljoowUHiPGyt17vtEsw
	B2Wvacpv2EyZl2BcBcJQLtjhGICebPOGGVGz2JU0WPlO1K6iSUENkyh2
X-Gm-Gg: AeBDievWqP370l30COaflSYDfT3FA4zKZDtqVwO9uVVyd8pJF1i082PcHYhN3ljiSLq
	2MwFFQxdSR7hUAR00KWbt5SjtItGEEEf8sPS8AS47CBIRfO5TjsgRJWjkvBD9xiBjjmE6jZXvzR
	5FZd1cDBF7QCFdCPcUzmcIk8bYcgOF8kTrJfKXH25ERwdieg6uqfmnAgvOMEMXXo3kmWuTQVS7Z
	jRybhQWuyUT23e7X0xwu/nrhT13IfqBvcz1QS0MLaAtRw62nZEqQUVYm/b+rxXJubT8+dKrU/Fa
	w3t55S7e/GDD2Zl+VT3kB5uYJL8TUjRwdE3NPBQiUIpLaHnRFbMGFPRryLrse82cSJPaU9+ZGf6
	TP8w2yRr6hb1qcS8z64uTvu3LWJkPLdiN8jZhqL88C1zvan6gaHjcfQBce8hMicFKBie1/my4z4
	RDAN6UW/JX3+XbGBd5RI1ecvNX24gnkDx+L3RaS5+hv3549XqWjF0GuoVzwtYQLE35RA==
X-Received: by 2002:a17:90a:c110:b0:35b:9c97:3d18 with SMTP id 98e67ed59e1d1-35dc6eae327mr5651672a91.12.1775106933827;
        Wed, 01 Apr 2026 22:15:33 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe93661fsm6902107a91.11.2026.04.01.22.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 22:15:33 -0700 (PDT)
From: a0282524688@gmail.com
To: tmyu0@nuvoton.com,
	linusw@kernel.org,
	brgl@kernel.org,
	linux@roeck-us.net,
	andi.shyti@kernel.org,
	lee@kernel.org,
	mkl@pengutronix.de,
	mailhol@kernel.org,
	alexandre.belloni@bootlin.com,
	wim@linux-watchdog.org
Cc: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-can@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>
Subject: [PATCH v1 0/2] mfd: nct6694: Refactor transport layer and add HIF (eSPI) support
Date: Thu,  2 Apr 2026 13:14:40 +0800
Message-Id: <20260402051442.1426672-1-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-34573-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[a0282524688@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 347A9383E9F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Ming Yu <a0282524688@gmail.com>

The Nuvoton NCT6694 is a peripheral expander that provides GPIO, I2C,
CAN-FD, Watchdog, HWMON, PWM, and RTC sub-devices. Currently, the
driver only supports USB as the host transport interface.

This series refactors the NCT6694 MFD core to support multiple transport
backends and adds a new Host Interface (HIF) transport driver that
communicates over eSPI using Super-I/O shared memory.

Ming Yu (2):
  mfd: nct6694: Switch to devm_mfd_add_devices() and drop IDA
  mfd: Add Host Interface (HIF) support for Nuvoton NCT6694

 MAINTAINERS                         |   1 +
 drivers/gpio/gpio-nct6694.c         |  26 +-
 drivers/hwmon/nct6694-hwmon.c       |  21 -
 drivers/i2c/busses/i2c-nct6694.c    |  26 +-
 drivers/mfd/Kconfig                 |  47 +-
 drivers/mfd/Makefile                |   3 +-
 drivers/mfd/nct6694-hif.c           | 649 ++++++++++++++++++++++++++++
 drivers/mfd/nct6694.c               | 180 ++++----
 drivers/net/can/usb/nct6694_canfd.c |  18 +-
 drivers/rtc/rtc-nct6694.c           |   7 -
 drivers/watchdog/nct6694_wdt.c      |  27 +-
 include/linux/mfd/nct6694.h         |  57 ++-
 12 files changed, 829 insertions(+), 233 deletions(-)
 create mode 100644 drivers/mfd/nct6694-hif.c

-- 
2.34.1


