Return-Path: <linux-gpio+bounces-7743-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC74919BC6
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2024 02:37:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 915321F23642
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2024 00:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E34B2139B6;
	Thu, 27 Jun 2024 00:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PGIvK+Ie"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967B817E9
	for <linux-gpio@vger.kernel.org>; Thu, 27 Jun 2024 00:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719448620; cv=none; b=YVGLCniJlinuxPTI02DybwDfKNsUiB5bdDs0OZ50iOLFEYxc96jbmbLvbDwnTpoaHn37rCeW/O0YturXcemhfdKhi1++teeRFs2utE8M45UhyVaEybrZ4X17FWc5KZaRLgnRGbxkFgGeLUkMScqMiyfdrYblbtFg4j+ILaFgHsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719448620; c=relaxed/simple;
	bh=1xMVh8ScIm4xYf1L3BN/up7SGtbr87e/bpoarMrLQ7k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L8TldZ5pyJ1sNyfP8heNPQwGxcEfQxOdc+IXuJLAeXfeZOksn6rDfgmpvk/2w7eaf2VvShTyvAP2UPEdl3YHcUpvBra1/ySrUylr7EDrgkV3GkRI+b2rsbaXQLtvb9Sy/SZdPSh9CttxBxASv4ITwiDurxypNFJHccfimk7ftjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PGIvK+Ie; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52cdbc20faeso6926588e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2024 17:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719448616; x=1720053416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ud2roWqWNhVTuooTF6iHm/h3cs2B/RK3gWZ0j1/3e2c=;
        b=PGIvK+IeGbsKhw0N91JDdgx13nWGmWBycvbUx7kHyzPWQU+tjix/i4kxQa8eQir0I9
         t51lW1+UqTArSeg7ayutqWVHIoAdTcdNFWfcuY9j6N+LIfKgEpqUGPYaNIvR/nez9jwf
         zaAtZzZRaTsuiH1JpvqPRQbUX8JOGHquxhO+jGex58v0tP97gQgBRqy4yQVdwKyUW8nU
         yAMPZqd42yvs+cHWZhZmr774t4OW078Ut3IbOvq5V5ITFplqdJDSUe/Hs2LtP0LYw6/t
         I5d7g7soB1sJcz9oTxoRYiXeExPze05tD2aUk4qybzLnm+CgKIp/yW/iRCBklVUrExUH
         F9aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719448616; x=1720053416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ud2roWqWNhVTuooTF6iHm/h3cs2B/RK3gWZ0j1/3e2c=;
        b=BkWQccRd3+s5cJS2PpoaY42w3bZhvUFkvj3bXcMM94eTRlFzfrtbJVzuSTffvn+Ccb
         zoGsPnBlmyBicfQWzxanRp/UgCL6d/XbqHQEcPPbju5W8KAd3TL27bh5+nVsfmU2hM5B
         CoXKUcNCpiWkwjr0ikaQjjfxy7uRBlVEjDdjW0x3u50M3W5uEjJaH3brgvdMKus60QGH
         I9sefnGklIn5i+KzAbxREhQQCPynLmg7rzzS6ueY5/Am5FaTtAOKq/Q/pfOec/lmogXF
         066hOqEF7UR3VD2LA+zpDsQEl/kp7kEmJ6oe6phUyhuo6umZHI379+TYPZ4L651F9k/j
         io7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWxe05SwVQVz6/iRv+o5YJVK9eJqXT6HFTXdVtAyi6oQJCAZqu5DHZs1jTnKgxa0YEKYVPEo/5qT1qq0JPvA4sm4edPWBif5mUf4A==
X-Gm-Message-State: AOJu0Yz9GvAmzrWroNeUWTvfU1X2v33LRdm7KICTYXf+J7/gWrQ+u+D+
	AFgOAMmwiKQzn6yPPP7beeuJB35hGyGZFW9i0350Qez2kootTQaXOwJ1kOPizB0=
X-Google-Smtp-Source: AGHT+IFg+LmSRu6c8EFUP+Q+42viamWZ+MzdBD69GLdHM/hnjuD+uyfe5eChJ8yeaMCPGetEGsJjLA==
X-Received: by 2002:a05:6512:3e24:b0:52c:dff5:8087 with SMTP id 2adb3069b0e04-52ce185f998mr8970423e87.51.1719448615612;
        Wed, 26 Jun 2024 17:36:55 -0700 (PDT)
Received: from localhost.localdomain ([2a02:c7c:7213:c700:2cd1:b0e8:abb:540])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42564a4daddsm3480625e9.9.2024.06.26.17.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 17:36:55 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: linus.walleij@linaro.org,
	srinivas.kandagatla@linaro.org,
	linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org,
	krzysztof.kozlowski@linaro.org,
	linux-gpio@vger.kernel.org,
	dmitry.baryshkov@linaro.org,
	konradybcio@kernel.org,
	linux-kernel@vger.kernel.org,
	alexey.klimov@linaro.org
Subject: [PATCH] pinctrl: qcom: lpass-lpi: increase MAX_NR_GPIO to 32
Date: Thu, 27 Jun 2024 01:36:54 +0100
Message-ID: <20240627003654.242870-1-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Account for more than only 23 GPIOs in LPASS Low Power Island pinctrl
generic driver. The previous value 23 was chosen to satisfy existing
SoC-specific drivers. However SM4250 LPI pinctrl uses more than 23 GPIOs
and its probe routine fails on:

        if (WARN_ON(data->npins > MAX_NR_GPIO))
                return -EINVAL;

with the following message:

[   10.709014] ------------[ cut here ]------------
[   10.719085] WARNING: CPU: 1 PID: 56 at
drivers/pinctrl/qcom/pinctrl-lpass-lpi.c:446
lpi_pinctrl_probe+0x308/0x388 [pinctrl_lpass_lpi]
[   10.719108] Modules linked in: [...]
[   10.719238] CPU: 1 PID: 56 Comm: kworker/u33:0 Not tainted
6.10.0-rc2-00012-ge45ddb1f8d34-dirty #7
[   10.719245] Hardware name: Qualcomm Technologies, Inc. QRB4210 RB2 (DT)
[   10.719250] Workqueue: events_unbound deferred_probe_work_func
[   10.719265] pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   10.719271] pc : lpi_pinctrl_probe+0x308/0x388 [pinctrl_lpass_lpi]
[   10.719278] lr : lpi_pinctrl_probe+0x44/0x388 [pinctrl_lpass_lpi]
        ...
[   10.719357] Call trace:
[   10.719361]  lpi_pinctrl_probe+0x308/0x388 [pinctrl_lpass_lpi]
[   10.719369]  platform_probe+0x68/0xc4
[   10.719378]  really_probe+0xbc/0x29c
[   10.719384]  __driver_probe_device+0x78/0x12c
[   10.719390]  driver_probe_device+0xd8/0x15c
[   10.719395]  __device_attach_driver+0xb8/0x134
[   10.719401]  bus_for_each_drv+0x88/0xe8
[   10.719407]  __device_attach+0xa0/0x190
[   10.719412]  device_initial_probe+0x14/0x20
[   10.719418]  bus_probe_device+0xac/0xb0
[   10.719423]  deferred_probe_work_func+0x88/0xc0
[   10.719429]  process_one_work+0x150/0x294
[   10.719439]  worker_thread+0x2f8/0x408
[   10.719445]  kthread+0x110/0x114
[   10.719452]  ret_from_fork+0x10/0x20
[   10.719459] ---[ end trace 0000000000000000 ]---
[   10.719589] qcom-sm4250-lpass-lpi-pinctrl a7c0000.pinctrl: probe
with driver qcom-sm4250-lpass-lpi-pinctrl failed with error -22

Fixes: c2e5a25e8d88 ("pinctrl: qcom: Introduce SM4250 LPI pinctrl driver")
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
index 0d98008e33ee..7366aba5a199 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
@@ -20,7 +20,7 @@
 
 #include "pinctrl-lpass-lpi.h"
 
-#define MAX_NR_GPIO		23
+#define MAX_NR_GPIO		32
 #define GPIO_FUNC		0
 #define MAX_LPI_NUM_CLKS	2
 
-- 
2.45.2


