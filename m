Return-Path: <linux-gpio+bounces-31339-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UD2UOII2f2nllgIAu9opvQ
	(envelope-from <linux-gpio+bounces-31339-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 01 Feb 2026 12:18:26 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 474B3C5B80
	for <lists+linux-gpio@lfdr.de>; Sun, 01 Feb 2026 12:18:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9A4953012BDD
	for <lists+linux-gpio@lfdr.de>; Sun,  1 Feb 2026 11:18:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B290322B94;
	Sun,  1 Feb 2026 11:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jgJ1UAxZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD662ED164
	for <linux-gpio@vger.kernel.org>; Sun,  1 Feb 2026 11:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769944700; cv=none; b=S46gr/NowbuugHuQvbblH2qMFpb5HPWE05dEbNRBXArgWVXaBu3t6ADGiPoou933KMwybGasYfMrcaW1oU7E944qteqTJsKJCnAn4pZcBfeBgRmIF+HxioArE4HQBo/lifQYmgRcAaiUoyC1rwTU1yWqr0NyOm7xMHN9pP081fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769944700; c=relaxed/simple;
	bh=PnFCt7U5faHEoRgRm4/E1Qi8Fg0C73L8gOhM1SYo3fI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FqjUTCKNIdWbUiGWsFjGpJsev1qNl3B2JgmNE1Pa2NJV6ayvMhoG1aH2kXmavGX5CqGD7lZT2+iVqArCWbfMBMKnvATm9xBsUVGxWcT2n8UQsZbPLaaL/kL0jpu7r15iafhGZzt4EPRDa6j47wkpSlGShR17gEyQQRgtB5JrFwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jgJ1UAxZ; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b8d7f22d405so571984866b.0
        for <linux-gpio@vger.kernel.org>; Sun, 01 Feb 2026 03:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769944698; x=1770549498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Apd4Pw04WM7E8SQOUu4pdhPSYadrEuDMSe+FLY9m1bA=;
        b=jgJ1UAxZY3fX4xPWDcv60FOa/hKhGHJqqv3hGiKlVKbN7ntx9LRG3NSEqLBvPo+ppn
         oQICEJdPXRVAKuf/NLXxKK42N9NgB8h+pQq9GKBEMYBL7KZ3VKdzP1lWpUHdDjO4iztS
         gr+RVEeBG6yop7tebAg3ndsg0zOAXkV7o37TK8U7reyLaLPaaayL+1ZsG1NQVAA7lA2O
         FnK+VBjw4YjZwYVrPOAGG7Ttxme45KXM6RVHfQC05dg2aMT6ZpCELcKR2BedlAPjDcV7
         HRfHK3Kg45hOtuPEAJyWBChx/GL5s8ZWpwN/8B83b36NMH4Crha04ZFBuYYeoS4ElhjK
         lB2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769944698; x=1770549498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Apd4Pw04WM7E8SQOUu4pdhPSYadrEuDMSe+FLY9m1bA=;
        b=NcNmD4bYZnrldgwRcE8f6fdiWYL2e64EfLjrExJCzu2vqbRBclLPYDktE+IDnrTP6X
         f7yk1HACriXiCi8g7putBaZ9NF6E3kB8jERdoy/XsVu7WCEIo8CYNyqnRiCt1NVyTItn
         L54738qCjgI0/Q1rbr330bPrP6S57HTE/p4lHvDvIEmY78TRhgmwPjB7HGuueqC0bxqc
         nlZ32Dt1+ZXMs+8wK4JjzOVPu2tHTDOpsVwslWaJ+q9NM/O8t7rg8f8f9tRqly/RwOGn
         xSE9R+laxop64xyF3kjVATyYUgjQ7C2XgxkvH0X+xmF6TlIR35arus/O6z3MO5Pv0yKz
         jBmw==
X-Forwarded-Encrypted: i=1; AJvYcCVz5gBeYrlx+hiBFw8ERpqG8wQWQfUcPTSwCyRnrqHvOaNhwfOIBHNSFRSP0pVsEJR761siQAeociFz@vger.kernel.org
X-Gm-Message-State: AOJu0YxB1RhtAqaTwW3urPwzgjc6Td0ee/EYgIJc7J2x1W0hPR1x8QnQ
	CwMiLxzbaJUtSL6g60aiCZ8epKfR9FH+9uuCo+TZsqIhNkIyOjsoFppH
X-Gm-Gg: AZuq6aKmZkhgzCXUI7csKN++G1cCsY9NxdpSNtoCrwIky+Et74TwwPtRuTeNmxe5m0T
	+AFJgsqvYJz0e5CJ1QaoRW+gWt/kNrBFcd555hyLL+hXFZb93/Da+2VbyQGkLSGC/SeuqyjTSg4
	445qpk1hd+TUoVu9oTqbAPxtwrOL4CXCp2UFGBrgRBIzTstpSAXYGpuVj/3AujmQccJWEx/AmVk
	sJet9PVfel1jqouLlXjT1LbOXaTOGz3+jTeTqPY1NfUdoR11eSst4RieVfRbvRG8GGJBSGdrzza
	LcAnT/bOhnh+TA/BBH25Z655t/30pfCmALtln/wbHWpgUsmgP6NpWqHvCeGFjpWzVjcxl6C1hj3
	i3j+VC5NKivdZ+yqxuF4LjEyp43zXtay49EYn3hFN4Y9P4KSYl3KVaXzwAITPQe3d+LZQ5P6n1o
	v91jB+oFXJXW1wfmkt/ZNxMBs=
X-Received: by 2002:a17:907:97d1:b0:b87:1f21:f09d with SMTP id a640c23a62f3a-b8dff58a0ebmr540036466b.19.1769944697422;
        Sun, 01 Feb 2026 03:18:17 -0800 (PST)
Received: from C-PF5D4647.localdomain ([147.161.249.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf2ed6besm714713066b.60.2026.02.01.03.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 03:18:16 -0800 (PST)
From: Jie Li <lj29312931@gmail.com>
X-Google-Original-From: Jie Li <jie.i.li@nokia.com>
To: wsa@kernel.org,
	linusw@kernel.org
Cc: linux-i2c@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jie Li <jie.i.li@nokia.com>
Subject: [PATCH v3 0/2] i2c: improve bus recovery for single-ended GPIOs
Date: Sun,  1 Feb 2026 12:18:10 +0100
Message-ID: <20260201111812.18945-1-jie.i.li@nokia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAD++jLnk_5KG_q1aCtpOrTCbhtK-FxXH6BhPFSwukyt2F4uxmQ@mail.gmail.com>
References: <CAD++jLnk_5KG_q1aCtpOrTCbhtK-FxXH6BhPFSwukyt2F4uxmQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31339-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lj29312931@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 474B3C5B80
X-Rspamd-Action: no action

Greetings,

Apologies for the delay in responding.

Thank you very much for your review and the specific guidance regarding 
the return types. I really appreciate your patience and time spent 
guiding me through my first contribution to the kernel.

This series (v3) updates the helper function to use the 'bool' type as 
suggested and includes the Reviewed-by tags.

This series addresses a limitation in the I2C bus recovery mechanism where 
certain open-drain GPIOs are incorrectly identified as input-only, 
preventing the recovery logic from functioning.

Following the suggestion from Linus Walleij, this version drops the 
previously proposed "force-set-sda" DT property. Instead, it 
introduces a generic helper in the GPIO subsystem to identify 
single-ended configurations. This allows the I2C core to reliably 
enable recovery for open-drain lines regardless of the 
instantaneous hardware direction reporting.

Changes in v3:
- Patch 1:
  - Changed return type of gpiod_is_single_ended() from int to bool.
  - Updated return values from 0/1 to false/true.
  - Added Reviewed-by: Linus Walleij.
- Patch 2:
  - Added Reviewed-by: Linus Walleij.

Changes in v2:
- Replaced DT-based "force-set-sda" with a gpiolib helper.
- Added gpiod_is_single_ended() to drivers/gpio/gpiolib.c.
- Updated i2c-core-base.c to use the new helper.

Jie Li (2):
  gpiolib: add gpiod_is_single_ended() helper
  i2c: core: support recovery for single-ended GPIOs

 drivers/gpio/gpiolib.c        | 22 ++++++++++++++++++++++
 drivers/i2c/i2c-core-base.c   |  3 ++-
 include/linux/gpio/consumer.h |  5 +++++
 3 files changed, 29 insertions(+), 1 deletion(-)

-- 
2.43.0


