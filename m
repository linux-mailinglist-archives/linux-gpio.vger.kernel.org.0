Return-Path: <linux-gpio+bounces-34668-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QH20EHFg0WktIQcAu9opvQ
	(envelope-from <linux-gpio+bounces-34668-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 04 Apr 2026 21:03:13 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AE07739C292
	for <lists+linux-gpio@lfdr.de>; Sat, 04 Apr 2026 21:03:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 08BEA300B758
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Apr 2026 19:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F64E33D503;
	Sat,  4 Apr 2026 19:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bVITxH3L"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4632BE639
	for <linux-gpio@vger.kernel.org>; Sat,  4 Apr 2026 19:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775329386; cv=none; b=jkCfu0yQ7ywKx6wTKJd/zTCh1lOuQNMp7ubGJOY2+0876qtuZWXeXJmLplgWHapfIhOlqHp4YAzrs1EBcx3rxhRWD9kwYuQspNDNzyy36S4d+/gB2PaJqyiV92ItJMN+co4vvVTiW50F7yTf82JZBglm+BMMvwK3/N13nJNk2LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775329386; c=relaxed/simple;
	bh=afb07Pi/O/eBdy40R0PXKsSf3j1V/qKtlcICzITIhB4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OciOkiGBN36SA0Nj3kSQ/lNCHbgYzjUcq0kVQl+arIPGrP1qz1glBy/9122yFiGhyfIEIsA2wRB07JmmhdFazyiDkp432kHd8mqnSHiV+Q1Gl4Md2OkFFQbHypbxJsJ6Dz/7dcwC3bh/16VwYw3Qadgw0FLFmC3fZKkVpmdE8co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bVITxH3L; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82d0b68837aso958323b3a.2
        for <linux-gpio@vger.kernel.org>; Sat, 04 Apr 2026 12:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775329384; x=1775934184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ij2s0xBgVOJ8u/gh6zTM8yZQbKl0vNDOB3OHCkO4vCI=;
        b=bVITxH3LzS+dZzTEqaJQ2/nrMMs6BYJgl56INAJVKZ8j33voevVb5Ri47mGVbRU7q0
         5ZGR0yCqvf3bVJD3SKr8H6gxo0eI7BEwJ4c9lrC+GdqVfoCUfQmTGfEs0oZQm9ygeZio
         scybXoGEjbx37bHNUUXBDU+5suLenMwCJko3qs9BDcB9TY/qFLSPKEoljzPz4KA1On1j
         UT/RIuEa5u2SYxksZi+mJ33Q3hRi7luZuIETI4SuIgsDWgbXoQZAVzdDk63vykJYY1/z
         /BbKQ41t1zmrgUPn1I2qoD67/QnlwnVUZBkVu9/2jODgKQLuxtiAO8b2778SOt2fBxGf
         H+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775329384; x=1775934184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ij2s0xBgVOJ8u/gh6zTM8yZQbKl0vNDOB3OHCkO4vCI=;
        b=oJuWMqPq/Cqtsue46SIUGGd8okgN07lIs9ieVANkxooF/oUdpvgPK/5em7avlEmKnb
         LhstInBau0bHPBw+4Km/8pz11T3C1kSgcGz7h382Frlve8hmBFznmqHdbsPH5UBl0CCU
         G52Xi9e+6EbwDUtDbzoPBzb4izC0puFHcqY8/VIt3c7trlEKfGSlnnNQYDvHLQfCojWM
         C3T19FYOE0CplZWfqAmK5bLBk9ePI5gq6pqfU1/JrFGYDckPWr9xN7ehzZgoDOTQS/Um
         mPfBeRljy+ee5jeVyN3wVbu3o4Yf3rb/VtGmUpu8ILzO5S3d0XvK3BKo4YC6GaqWcx6b
         TfIw==
X-Forwarded-Encrypted: i=1; AJvYcCWxpLzxIAu44PxWR8L2BJaOALjepM799gvL+Emb7Dotn4n4cyN2+vossRWryZMbsu2JuGqocxgmZjb8@vger.kernel.org
X-Gm-Message-State: AOJu0YwBcGVwMpvUNTAAiMsxjU4Z9ETGRlayazFyIP4TNjDlbzkno8Tx
	V38zjYtVJRKEjZWwyG7hUmGBKdQEqs5f2zlnB0J0C5DoQdszv48eDPhk
X-Gm-Gg: AeBDievSvQW0wvQMFet3xXbf4P7rmLlE+ZDxAcxhLkTo1ySn6UAQM04rJV7zPz18pRS
	wwk4cdU4OoMTHoLv7x0EiyH4CbkkSjEiNn0jrzFmzM30lYR/Wr1ovo0MH/qH1azb668iEQVYSIz
	VAl3DwN9LHCYvNhzKpfqKw91+rfBlXSrTeJg28ChOduI+3f2KFe1pI+bCJtT7v44WFbnSs9pdhl
	q2Iq9JqBr67e9iPDVJ7O09aKvL96TO+FhjvsjAjC5r2gLlWI9OdtAiPaVqpQOsHsXhcQCuxc0NI
	pTCxGFvDY+XR9kAUHuDGY1NUTrRsfuDPa9ZiTvq7NAWvBK+s3+3hYu/HkGsS8/VUC+/WQWX9LEH
	3ZZB3TOuN4PveEXSJvawtordLe7c5WVgr0Tq5FQB/Rs35Ofo+dD7sll4SIZ/1nK3h8ct+fpyPbc
	9AZ5EF16RP2EM4nxlag9QHng==
X-Received: by 2002:a05:6a00:3e19:b0:82c:d6d3:31a1 with SMTP id d2e1a72fcca58-82d0db4f938mr6865339b3a.29.1775329384482;
        Sat, 04 Apr 2026 12:03:04 -0700 (PDT)
Received: from dell.. ([2406:7400:98:ade4:a008:2f74:2272:2da9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b261absm10968518b3a.7.2026.04.04.12.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 12:03:03 -0700 (PDT)
From: Vasu <vasuhansalia05@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	djrscally@gmail.com,
	mika.westerberg@linux.intel.com,
	Vasu Hansalia <vasuhansalia05@gmail.com>
Subject: [PATCH 1/2] pinctrl: intel: platform: Add INTC10B5 ACPI ID for Lunar Lake
Date: Sun,  5 Apr 2026 00:32:35 +0530
Message-ID: <20260404190236.5218-1-vasuhansalia05@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-34668-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vasuhansalia05@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AE07739C292
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Vasu Hansalia <vasuhansalia05@gmail.com>

Intel Lunar Lake platforms (Core Ultra 200V series) use INTC10B5 as
the ACPI hardware ID for the GPIO controller that manages power to
the integrated MIPI camera sensor.

Without this entry, the pinctrl-intel-platform driver does not bind
to the GPIO controller, causing int3472-discrete to report:

  int3472-discrete INT3472:00: cannot find GPIO chip INTC10B5:00, deferring

This prevents the camera sensor from being powered on entirely.

Tested on: Dell Pro 14 Premium PA14250, Intel Core Ultra 7 266V
           (Lunar Lake), Ubuntu 24.04, kernel 6.11.0-1016-oem

Signed-off-by: Vasu Hansalia <vasuhansalia05@gmail.com>
---
--- a/drivers/pinctrl/intel/pinctrl-intel-platform.c
+++ b/drivers/pinctrl/intel/pinctrl-intel-platform.c
@@ -204,6 +204,7 @@
 
 static const struct acpi_device_id intel_platform_pinctrl_acpi_match[] = {
 	{ "INTC105F" },
+	{ "INTC10B5" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, intel_platform_pinctrl_acpi_match);

