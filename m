Return-Path: <linux-gpio+bounces-37774-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CF14BN1kHmrCiwkAu9opvQ
	(envelope-from <linux-gpio+bounces-37774-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 07:06:37 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB766285B5
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 07:06:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF802309AF7D
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 05:02:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5813125487C;
	Tue,  2 Jun 2026 05:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JAg4R7Vw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4BF2BEFEE
	for <linux-gpio@vger.kernel.org>; Tue,  2 Jun 2026 05:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780376525; cv=none; b=V6XggcUbVI5d3KNzg4nklmdE2fVB5ZOcOQJRgqBbHTWVFvvqsYZ4JAbu1DE3jjKvloev9jKL1GV9Fx1M4T7a/jTpxR+a7TPtWPlV6H2GwLYzzjVe2vNCday9/ridyHpTbQ6xQ38Kl/HidzTNxtBsUwnLQdXbXXkOrDr36F1DhW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780376525; c=relaxed/simple;
	bh=juyPqGUar4sjOgSs+KMzK+h8Ag+Xq/KQ0ouMoI5butM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D+8H2OrsnqxMJ1uIR7IIxA2xop2Idw6JwwWqaYBt0bUR6XU0I+Zu9iKjAz7bKrcHeWSGQZRwurVMUaqYRMIEhc6oMqVjyvCjcVJpLBxL27Ev/mWz30MMItBWLr2JxarS9dLqadsxd32SiKSNdomJy48WMDq9CGmndM7G4CXCmlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JAg4R7Vw; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c859a374903so713454a12.3
        for <linux-gpio@vger.kernel.org>; Mon, 01 Jun 2026 22:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780376521; x=1780981321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OqTLkJRRJJvi006mVkaAc8E9sVbCF/KUy5AnwNp0FQE=;
        b=JAg4R7VwEnUM6LpbLVQymoCGkph1vck+i2dOc5vOcPf7rFgBFxxv9n4YeX+qJWu81Z
         5nK7JEDj6iTZilVEhjCNWMhoJwykbDhTq+6ccoGAehZsV+zpmKSF+iD66XPsLYTp8JWV
         FSkkMmraD7d/Yu7a1Dm3Hl2cYr6++PFos5DI70G+v77LgUZBqoNtwEh4m81VCGMAT5P3
         JQonC6xeu+8ShwbGTsoWcs62jGtH4uTr8yq5gJ9ZaqBzH7OBpsKxsBAtcwqL8DGqHZoY
         R1OCOL6j82+QL/eo+Ye6pdTWPd+BPKYqR3Chp4RfnaaafJ2qzb0DUByK3gVUuiDYTEpz
         7M5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780376521; x=1780981321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OqTLkJRRJJvi006mVkaAc8E9sVbCF/KUy5AnwNp0FQE=;
        b=mI7mgkCliSvK65X/b+rhrAx3SMFQ+KPv84LuBAC/6xhm9qOxnic0Vw0GkCyfkK6b9t
         gHtcxqa+8F3FqYrbHSSoM8mAo5BPlB+WM6GeM64t+nt7FAXJ5EIYjBVm79O8yxE+8Naq
         +pwzI8N7S4sQHXip56zzlk5qgEiAxI2C3CgFhlf8FNRnPudMzyDLzXt4jm1/gTzJVU9Y
         Kej3XhrcU6k5olwF76HOf7H9VUfMEKgADs966z9mYT3upMWeVe4y5OyIwju207ae/9HB
         0bjvo8S5q7f6daRmtq5u5hMyK4zYEoE3mO0Q7bPefTvafhnOtQqeXFSrMpNemW2oA4EY
         MaLQ==
X-Gm-Message-State: AOJu0YzeKP1fsfdgMmqLQIjmWApkcVBt6dF0rn/F1vmeotwBwSlHkKQY
	zmcwBdNGsbVARwRzxIsoxTl9zxsOa1tuJ9fKfWRgd9DwH8YoylPqaVwxTgeKJt8+
X-Gm-Gg: Acq92OEk/gRzhNbFAWWcVN5Psh8IBrHxBKSbVdpirhLZV66lMMB7XLp8DqyGDJD/kbp
	hIL+1QiT5tOkz/emnWnz9aZsr8FuBe91ixINFmDnJxppodzzs92H+GyBQ9EzUfrHsqpyuT9LSZA
	IOBGHm1MkETtTtk2+jOHLa3H/cHSq2iq/BJkpMcopVKNDoUFlxR2S00HQ8aq8QjViZTX2f3uW4l
	IVd5Cl8Px20bSKAb7dzomoLWJxcZMrT2cjiZsEOtcmKtHHAhz4o6X9fxUKQGI3EmTHZyAZXR02x
	RWx9Y4hlUzRThYHWm3Xk3QdjaFZsF4RQMqtmNbJXuRyxG/9X+8j3+mWz+PKJVVXAB1NdXY3LtjY
	6IzxJ+8u7xXDSq9MP2PK0fg6Ixb8zpiFxIXYcPrjiFNbZ15YdXr85B+4OXWr2pLoxyTP6YCl1k3
	8CkafwSfQZAgUSpfbea55fXGrauaUCmCMQ4My2JVAT47uZiquxM6OWMLHMSzk0SHAIzAry9mA8I
	vVPhxAizUFVuLEKVSI0ZPaoOL/1vgkxiV46uzaJPziiPQ==
X-Received: by 2002:a05:6a21:50c:b0:3a3:602d:a0d8 with SMTP id adf61e73a8af0-3b427c2a20fmr16311938637.17.1780376520969;
        Mon, 01 Jun 2026 22:02:00 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8589d055c7sm8958467a12.9.2026.06.01.22.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 22:02:00 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	chleroy@kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linuxppc-dev@lists.ozlabs.org (open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 4/7] gpio: ppc44x: Use platform resource helper for GPIO MMIO
Date: Mon,  1 Jun 2026 22:01:28 -0700
Message-ID: <20260602050131.856789-5-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602050131.856789-1-rosenp@gmail.com>
References: <20260602050131.856789-1-rosenp@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.ibm.com,kernel.org,ellerman.id.au,gmail.com,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-37774-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 7BB766285B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Map the PPC44x GPIO register block through the platform device
resource instead of reparsing the firmware node directly.

The GPIO node now probes as a platform device, so use the
platform helper to keep resource handling aligned with the converted
driver model and to report mapping failures with the platform device
context.

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/gpio-ppc44x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-ppc44x.c b/drivers/gpio/gpio-ppc44x.c
index 07b699cc4dd9..b30ca357ab74 100644
--- a/drivers/gpio/gpio-ppc44x.c
+++ b/drivers/gpio/gpio-ppc44x.c
@@ -182,7 +182,7 @@ static int ppc4xx_gpio_probe(struct platform_device *ofdev)
 	if (!gc->label)
 		return -ENOMEM;
 
-	chip->regs = devm_of_iomap(dev, np, 0, NULL);
+	chip->regs = devm_platform_ioremap_resource(ofdev, 0);
 	if (IS_ERR(chip->regs))
 		return PTR_ERR(chip->regs);
 
-- 
2.54.0


