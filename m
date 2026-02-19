Return-Path: <linux-gpio+bounces-31834-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id I4HsMpd1lmkIfwIAu9opvQ
	(envelope-from <linux-gpio+bounces-31834-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 03:29:43 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E24DD15BB53
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 03:29:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B5CA23007AFA
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 02:29:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 340CA26ED3A;
	Thu, 19 Feb 2026 02:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gD5GMvFt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B2324E4C4
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 02:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771468178; cv=none; b=GRqr9HgV3ICpzNN5CxWzxQfY+Ai3KzBLfEvKUNuYxxVWTHBymJqL4SNpU3uI7nmA/JRtuEowIQ8yPs4FRiS+h5kGO5DMTxFABN/yCVj76lsgeFAhMrYxXdfluJK/7wJuJ4zXTgxn+sCJtKRsG54NEktplP5DnFELlpEutfehMaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771468178; c=relaxed/simple;
	bh=y62dQmcfzA7x9evjRbkFtEx6ixLGw521fZkusri9NRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UclDmCrE1PZVSIq3udOWp6VvN8+3Z5wVw1VLsonbSH675yYuaXDTy8KoqkgowCEMNZV1TTUoGEg3OC6BWQ0as8lOwmBRJ9pGWacgxXvTeuFeTohF6fFg3VQdh1vGbQoP4JvqNeUILoDfo2I2pXWC4+hEKXybRBsmubUTHhS0BKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gD5GMvFt; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-127380532eeso1049264c88.1
        for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 18:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771468176; x=1772072976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aHHqKD+lhoCXs9icmscKR43kyWRRP9aoACTlazkgEzo=;
        b=gD5GMvFtQFpyHTDte6hhs+IOOyx7YzSQOK4eitReKF9YL0pOJILFEn/uXBdg0P6Co0
         Jna8xo3xOn81L0uZhO3IDF++OKPezmRIOsTHNrtJNdKeyucCeNX0o3VetiuDSxI3vKxE
         M/+T68ZkbKO9obt34sQyjZVqFfF14M62ANHJqOzO0hTy0RBC2p9BwLOXjUXfyffABHB0
         qfqk6+NRnrC0AqhDG/baOlrfd/o3hsbbYpKbReUuy19I3tsZN59kAIFq0cwDbutudzKT
         tbhnX+rKpJa7TNE4TnWNRqYUJhe43KtoIyMBHwIfCSdAUzxA7qSohXYF6/IgeYbUO84+
         4/6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771468176; x=1772072976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aHHqKD+lhoCXs9icmscKR43kyWRRP9aoACTlazkgEzo=;
        b=BHLddA8HSQILY78DehPDzMtEqPNJ68zULDsV9Z6vJvecqJ/bH287MjpWYy1+kt+6QU
         LFF+ahTcCtwI1+rPZOV9YBXk4RHUeS1Qf8ZijCsT1WiKOPypFf6CUW1F1f/e53kSB8tN
         W/xSZn9R1BZbFNr//7yMly3gZd3PL1lDwIORWrsCQUIBriFrKMQkq4tNRIvz0JLl3xqW
         UIPCTltf+g8ey5elbs9LGXALeggcJNQ3s5H7mezmzYMbePaEEuzNVfpP/NHMhG4dI2Ij
         8r+PsH98AhXNjN6LcW7/GVV9UinNFB4ziW8n6it+u6F1ljRaYRZa/tDA2pFyG2YPO/+n
         rVdA==
X-Forwarded-Encrypted: i=1; AJvYcCUXG3LRkD+ndv2nBJvIDMiu1CYZ+TrKfgxF0yJ0RuTpCQnR92xXH+MgsDSBs/Koo6dQdKXbY4WRRjg8@vger.kernel.org
X-Gm-Message-State: AOJu0YxRTExBJGCpcfKtnA6RCINLqyXnbcYwJVk946P5eRF41S8T5F7A
	7zUaEv8URxrFoHdHMiqOFBdvgmJXq47H+x27GUGz0H+KJsocfODXUX/n
X-Gm-Gg: AZuq6aL3zBNoWzUT6izPstWxGrXwC6xu7te2JXD6vc0+f5f3jrrbyQ8y1cBzXXEAr3H
	pjLGYlqcGLPijyynPuUYQwRBWJykdlBnsAP7BfMOioej+gzQtgFu67xOe7H3Yep1SMRn9ajl08Y
	dWDqqTI7+rKz/HWTlgC+O0jHaENPNjuLde5zP6kO7JvNNn9TlyYHr+FJPPJJzuMDXzAeLqUwTZ5
	nYNJCfBCHzp/C0U5KTzb7Dbd5DKRe2TvHqbEnjnqp/rF7ah2V11+pN3nTVlzqVOPNyEKsfK+rmj
	tNyPeuDq3EbjpAJBXQ9fNBLCGPWzkxOfDfC+Qz8ihp8rGdgU2IvupjVvX4gVREVD47w6Nfm8Wik
	zLoeI0qwI8NTC2BEclzliUKdU6T//LVS4dcQgpuicBVasO6UwS83/iFdvoISkZMSLGaP3a6ggzI
	4RTDSxL7l1AWNVIMBGLaWUhRvpUX3wdPhBcqSO/ALxIwdbtz7AHcmnVlhp48cdJruWz6zNYiALB
	YecSMgPo0mMaMU=
X-Received: by 2002:a05:7022:248b:b0:127:3b1b:c816 with SMTP id a92af1059eb24-12759a36a1bmr2420480c88.20.1771468175930;
        Wed, 18 Feb 2026 18:29:35 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:265b:f5ad:9e03:677e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bacb577bcasm19609433eec.12.2026.02.18.18.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 18:29:35 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 0/4] ti-ads7950: fix gpio handling and facelift
Date: Wed, 18 Feb 2026 18:29:24 -0800
Message-ID: <20260219022929.3558081-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.53.0.335.g19a08e0c02-goog
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31834-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E24DD15BB53
X-Rspamd-Action: no action

The original reason for this series is to make sure ti_ads7950_get()
returns result in range [0, 1] or a negative error code to comply with
gpiolib requirement.

During review David noticed the fact that the function also clobbers
gpio state. Fixing that lead to adding cleanups using guard() and devm.

v2:

- style fixes in #1 (per David)
- fix to not clobber state (#2, new)
- #3 and #4 (new)


Dmitry Torokhov (4):
  iio: adc: ti-ads7950: normalize return value of gpio_get
  iio: adc: ti-ads7950: do not clobber gpio state in ti_ads7950_get()
  iio: adc: ti-ads7950: switch to using guard() notation
  iio: adc: ti-ads7950: complete conversion to using managed resources

 drivers/iio/adc/ti-ads7950.c | 206 +++++++++++++++--------------------
 1 file changed, 90 insertions(+), 116 deletions(-)

Thanks.

-- 
Dmitry


