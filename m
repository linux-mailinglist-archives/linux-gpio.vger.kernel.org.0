Return-Path: <linux-gpio+bounces-38621-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y4xSB/tFMmpTxwUAu9opvQ
	(envelope-from <linux-gpio+bounces-38621-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 09:00:11 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C141697012
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 09:00:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=kDWipJBX;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38621-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38621-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 676133018085
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 06:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5EAD3B9943;
	Wed, 17 Jun 2026 06:59:47 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AD63B992A
	for <linux-gpio@vger.kernel.org>; Wed, 17 Jun 2026 06:59:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781679587; cv=none; b=E1vn2EnV19Lq9o5Q6KUIPFnFgwEvpAmA48IyfILOhEpdbjHr8Ah39C3RvZPqsArenUQ/MCYwFjrU3WhTz0rNp2k+uEX7G6Zjn8ad0NU3qUxUjq60Q88THEwLGttQsniuMua9WkPW6njbB8YeNFoe9iwl0rzDCx1BGiizsTC4xTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781679587; c=relaxed/simple;
	bh=njX4kjH9VNfVjsyF7DQlInsFhd4q08GMPgkouSTFro8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gOmEySimLYIxzj7+og/VqW2AzjXOGOoG9OGHj8g6kcltUKtdHud1cpGe86QIugoi1K0Ox/ZpF3cbycoyasXnsv0o9LIOeeg99kDLagBiZNQLvJFXeb6qWtSYns+pTN/HCP5OHdDroPWoBWgXPnbUrksLN7pIpcfDfflwCd18gMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kDWipJBX; arc=none smtp.client-ip=74.125.82.47
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-13986d61b4fso1566859c88.0
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 23:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781679586; x=1782284386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TXbJQhUMuKVvQIG2xqPeUT189Ia+/U2eNTBYjldFsPs=;
        b=kDWipJBXWHt0juL1Oc72ddG3DNlGF0xYFo5NSq753gubgYql59f7LMd/eY4f9B6Npu
         0lhTLKGTqRMXl5EAY3Nu7G5imYYRjFLFy2AmI1AAAufFaHGQwXz9IF882h/VfY6azYM4
         PILGGqpZck2NmtdvcIl/9SZdGkemAZjlsoQ1J9Dy6m6bN9AI1/UhhwoDzK3JwdgPO6Xn
         C1T3jvPSg0/wmsc+lafZFrZ7luWdU8MYL13BYGab2nFJwGDKN6Lq+2FgyyJE6GBazJUc
         Q7Q1yw4AD2UQV2aCjxtpZoJp3Rrgss3pbDdg62a32Fbj77RWB2uI9rNpO3y8cKOk3SZT
         NkQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781679586; x=1782284386;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TXbJQhUMuKVvQIG2xqPeUT189Ia+/U2eNTBYjldFsPs=;
        b=TMHfTgIZPoIXgH21HJW1yQkOrqfuD32zPsh5guNr+r7xqsy8VkoVWtYhzB+czPbe5M
         cmUUkoyxr70lPIgP+2dKFHc0NDmxZh1z62g1fasCc2dQ6WJulEjvme4gF/L09UJ1Y+RP
         GKfUU8MLIxk4mAThyiWyvvRU9Osov+K3PsT4WlBLDlsqmKmyyrUNWhBxfAGGCqFs4d9V
         u9juzr8TRdsLXIXgTcL6Ue6dh42izbjp28UIzZygTMpXj8pQOPlQIH5eY1ttcTffljdK
         VkeHQc/8tKvLTB6nVArCrXm3jBY2TMtHWOu7kqcvuWgPJ7JN4zHw8VS/Lufz2exf5Tpw
         Vy9w==
X-Gm-Message-State: AOJu0YwW6465sqNA27HHxG+1zT1+tqljhROOMy1P4kuGhmWcjD7RhgTb
	0FUP5zryzSQ9wtP/tF4LvFV5axxbDf8FfOULPFnrWvN0m5fe3HOwOBT0
X-Gm-Gg: Acq92OF+VfeXzA1NF9/5DkVUELOoonUedNGK7HlgYSPLfpD5YeXa743ckC9gNitR2oh
	cx7Rb9IeY0w0lPjSXGW+lK3cQWqkv9eAjwSVbFKaeVbRHlA8orSk5YWG0cNPGjwOHT8XnEBKIa3
	a01UT5hX6rR0EkqbNibRkg5Fjvq2LghrhBSnsRTAsGm+m+D5r8g8HxFC0/D1tue3bWkz1T7TdVU
	fscgo0KB9CSZLpPhs+qvDlU8abUQVb1bfryoSL+r7XXB3lMBEKqkbPqTFvjIjVGKl07DDxtAfZl
	YWHPI6nsTdoCuJg9GmV5M40Mwihkyb03tCmyAjIF0n87RNw6Pj6RBb8WRnsez7v01kATYh7PfFO
	rLmwMxc8P5GZODg2XqcZG0HvNSOq6hHyM4oy85zT4EJFUgjiWF8+IVfe/0LZKUnUYVVW70CbYDU
	Wniw+NwP38i7SPr5p+4q/PAyr6mhQ+Nk0WdsHnmpfwYeZ3yz17dh/crZ6B3RYZwRBAo2T+x+Yaf
	urmuFnNKE5o9le1OH07fQJdQ7ShH7S8C44cNfg6HBAX98yzFde8r3ogeNeSKxmDk83AEOTdFq57
X-Received: by 2002:a05:7022:fa0b:b0:138:50d6:7ee8 with SMTP id a92af1059eb24-1398f6720a9mr941357c88.16.1781679585497;
        Tue, 16 Jun 2026 23:59:45 -0700 (PDT)
Received: from hardik-yoga.oryx-cobra.ts.net ([2401:4900:1c62:151d:8407:852b:5db:1408])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1386f20ad25sm14118376c88.0.2026.06.16.23.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 23:59:44 -0700 (PDT)
From: Hardik Prakash <hardikprakash.official@gmail.com>
To: linux-i2c@vger.kernel.org
Cc: linux-gpio@vger.kernel.org,
	wsa@kernel.org,
	andriy.shevchenko@intel.com,
	mario.limonciello@amd.com,
	brgl@bgdev.pl,
	basavaraj.natikar@amd.com,
	linusw@kernel.org,
	nathan@kernel.org,
	chaitanya.kumar.borah@intel.com,
	Hardik Prakash <hardikprakash.official@gmail.com>
Subject: [PATCH v9 0/2] i2c: designware: fix WACF2200 touchscreen probe ordering
Date: Wed, 17 Jun 2026 12:29:20 +0530
Message-ID: <20260617065922.26004-1-hardikprakash.official@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,intel.com,amd.com,bgdev.pl,gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[hardikprakashofficial@gmail.com,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-38621-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-i2c@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:wsa@kernel.org,m:andriy.shevchenko@intel.com,m:mario.limonciello@amd.com,m:brgl@bgdev.pl,m:basavaraj.natikar@amd.com,m:linusw@kernel.org,m:nathan@kernel.org,m:chaitanya.kumar.borah@intel.com,m:hardikprakash.official@gmail.com,m:hardikprakashofficial@gmail.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hardikprakashofficial@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6C141697012

Patch 1 reverts the broken v8 patch 2/2 which caused boot regressions
(NULL pointer dereference and probe deferral loop leading to CPU
starvation). Patch 2 is a corrected resubmission addressing all issues.

Changes from v8:
 - Use acpi_gpio_get_irq_resource() instead of open-coding GPIO resource
   type checks, eliminating duplication with gpiolib-acpi (Andy Shevchenko)
 - Remove gpio_dep_ctx wrapper struct, pass list_head * directly (Andy)
 - Add const to gpio_controller_ref.path (Andy)
 - Add NULL check for resource_source.string_ptr to fix crash on hardware
   where GPIO resources have no named controller (Nathan Chancellor,
   Chaitanya Kumar Borah)
 - Use acpi_dev_get_resources() return value properly (Andy)
 - Fix all error paths to call free_gpio_controller_list() (Andy)
 - Change guard to #if defined(CONFIG_ACPI) && defined(CONFIG_GPIOLIB)
 - Remove erroneous put_device() calls -- acpi_get_first_physical_node()
   returns a borrowed pointer with no refcount increment
 - Use LIST_HEAD() macro, split adev declaration and assignment (Andy)
 - scoped_guard single statement without braces (Andy)
 - Remove misused Reported-by/Closes tags (Andy)

Tested on Lenovo Yoga 7 14AGP11 (83TD), Fedora 44, kernel 7.1.0-rc5+.
Touch and stylus fully functional.

Kernel bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=221494

Hardik Prakash (2):
  Revert "i2c: designware: defer probe if child GpioInt controllers are
    not bound"
  i2c: designware: defer probe if child GpioInt controllers are not bound

 drivers/i2c/busses/i2c-designware-platdrv.c | 133 ++++++++++++++++++++
 1 file changed, 133 insertions(+)

base-commit: ef76a3a28c79b628890431aa344af633e892035b

