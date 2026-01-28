Return-Path: <linux-gpio+bounces-31221-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMWMC5kAemnq1QEAu9opvQ
	(envelope-from <linux-gpio+bounces-31221-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 13:27:05 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDA1A1338
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 13:27:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C7F22300C241
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 12:27:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A25B234F24D;
	Wed, 28 Jan 2026 12:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="bM1AAuD2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7285434EF05
	for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 12:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769603218; cv=none; b=umAVsO0mrc0zvdzLQsFH2Pj33Vb9JaN9lBh3WHZlqkcz9bqbmL/ZTAKBzjz6wqqqB/2Su5uxkmL60/VX168yXfyUvVmu0lFcQXnM5ozmJG6H3kDnQHcrN3UHQ6uEtEhNZtIZ+iDomYItzNcDjOJ2oVHXLnEXcMQzTihp8x5Ybj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769603218; c=relaxed/simple;
	bh=PMp+SYYveIhSJZHGkVejvHSGEyMcoktcC9f/SvT8FV4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mmJ+sxnlmgcYhsBbWnpo+U4KNZ8p7JttxClvDWYenKShjE72tO15ivGZobNUOJTTWGBoPoWAiDh8x8cxDONO+RrXmqENAL5adQNK7v0V3bN9Oqxrqq98cXG+QliqiE3cHWXXi2SeU873g2QfClF4QG+BEpoky23Ym6LRvnxXsWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=bM1AAuD2; arc=none smtp.client-ip=209.85.208.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f67.google.com with SMTP id 4fb4d7f45d1cf-64d1ef53cf3so8703459a12.0
        for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 04:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1769603213; x=1770208013; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5t5z0ZO3g+Pz6/wrKMnuRW0D0vGmyfcpUHFLY2ZznsM=;
        b=bM1AAuD2KvXogd5aScJ/QmkjU/l7uS3WAfQbGioAUERsUe9UDXyHsUHajfaqFIXo9N
         4Snm8sCVXNnnYfSKUahtMhzGkAQ1Qow5mkWva/H9h1t2utCcrnrTZbPdV61XRcO28Wje
         t2Wv+Zc5wI5Nj1B4PybxafeLrR9VjQXcPaV5aYMM0skZOn/J6g7fEPBruPxy8tyyPV7U
         M0WFhhxqjYThZlPXApbZcx/XeUy0u6/OMJhjnVsHCb5CPRZ3AXVm2ygoNnummgg+44ib
         H4ZBwJ1lTzrXTLh4eUe38YFisgowgXU6zgnJH14ycxGPgbph3A1elBe1iynh2EuCmcQ3
         6pog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769603213; x=1770208013;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5t5z0ZO3g+Pz6/wrKMnuRW0D0vGmyfcpUHFLY2ZznsM=;
        b=YhxmbybI/Esp+h102pMC0c2kygp3tXSfg05RDioRLLbCEjohrNa5y3UjgDqcz0kFOi
         23koXABdbW0DLp/fHlYHCPhKJUowEIY9ApA2HZz+OOZTDkdebZKL4Eo2YkXE6pkfYzEm
         IKZRqIpLfXG58qPL3Z8V2habuP6o7kea/0wDe/GKq3WquJzL7fTlwOV2K603q3kQ+s9W
         8eIoiAYgn/psdHYVBbDWvqpkSBlbDAHTp2WHwjxHobEJcDVjVaoZGZNgYM2O5oUku4aJ
         V13u3vOdbfdQ8XtsJwqKSXexpEroVIQ8zGopocRqNSAeFc5qyASnWRnmWtYWCm53t+y0
         47NQ==
X-Forwarded-Encrypted: i=1; AJvYcCWL8JJ/aZkjb/ZpB0m54+7zu71Q7VsTgNe7pw8z6yoD+pDh+EE1jyOZzbnsj9RaXFwhYUTzjH0Cllio@vger.kernel.org
X-Gm-Message-State: AOJu0YypIsr3MoCY1fmGhzBIFUQTFImSjVcO+4ssGmTipW5nMyrghlUV
	aDx6Q1bogx9TQYkX1LNLa4iWcMVBS337jWcOuGOa6cpNDoaLNntnVN/ZqNu+Sxt2Wv0=
X-Gm-Gg: AZuq6aLSHsRgB0vfm5MoI4tfMjeOQCXPxh2rx1FtCkc/6RKF9HSD8qR78RFzVsOI9p2
	DGFhRuj30CFyneSvcb692F2R7lUlh7GRiPvPizHXUaLnJDU74AbpD7EPpNs+JXUpP3AK2op9olh
	Yi5nwYBYG8K44eFu1pDNlPlqNY2b6jhkgd4+s6hCGwQ+oYuGSBIBC6nexA6iGlBMT0KM4ERkd3/
	C/Vsi3JAQgum5NNSuapl8omHf+Xl74PXJNhSsGH91kLautSRYOPAs8VFpON6lhbgu3PL2skp4fw
	K94RwQQIpzUbudeQeFU6qaLe9fYVBfrq/uEo6zr9hCYcYvBX/asJpktpR5eETcC1tITl0PlEM7u
	GagnKZe7PnmCo1aMY1RtgfJriDboPLsIobv1Vr0d04pSeA170FXxWY5/aB+kqQaitPRPWS3c/jl
	MMdXw3b4+cmQItYnERjbAdZFHE50bqPmarEntxlFiza5wSrdVQ8qxJdCm8rXOLR7aNQg==
X-Received: by 2002:a17:907:6d19:b0:b87:2c3d:ef08 with SMTP id a640c23a62f3a-b8dab346cc6mr391601866b.33.1769603213084;
        Wed, 28 Jan 2026 04:26:53 -0800 (PST)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1baa42sm119536866b.46.2026.01.28.04.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 04:26:52 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/5] Add LPASS LPI pin controller support for SM6350
Date: Wed, 28 Jan 2026 13:26:48 +0100
Message-Id: <20260128-sm6350-lpi-tlmm-v1-0-36583f2a2a2a@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avIrBtQM4muEi1KpxpIC40IorsnL
 d/i/wcyJaYMnXgg0cWZ91igKgFuHeNCyL4YtNRWKt1iDrZuJG4H47mFgJN3o/E0NdYoKNWRaOb
 7P/bD+37vl6xUYQAAAA==
X-Change-ID: 20260128-sm6350-lpi-tlmm-bdca4deb5641
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769603212; l=1773;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=PMp+SYYveIhSJZHGkVejvHSGEyMcoktcC9f/SvT8FV4=;
 b=UsE+EyCE2pBBQZcFymi5Q0PEW7r/CykmAv6cAEboBbsuABg6FyiTEFpjDDYFfyMV5kqMeo4vV
 FWV/6spJRJHCmqCx2acLsST+juopXH9Pt4zcWzBt6+IF99A/YA/J0Ny
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-31221-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,fairphone.com:email,fairphone.com:dkim,fairphone.com:mid]
X-Rspamd-Queue-Id: 7CDA1A1338
X-Rspamd-Action: no action

Introduce support for the LPASS LPI pin controller for the Qualcomm
SM6350 SoC, by adding the dt-bindings, driver, dts bits and enabling it
in the arm64 defconfig.

The custom slew offset for gpio14 is described as
"qcom,lpi-slew-base-tbl" in the downstream dts[0]. I've tried to find
some reasonable solution to have this handled correctly in the patches
here, but suggestions are welcome how to improve the situation. There's
of course several ways to implement a solution for this.

[0] https://gerrit-public.fairphone.software/plugins/gitiles/kernel/msm-extra/devicetree/+/refs/heads/kernel/13/fp4/qcom/lagoon-lpi.dtsi#25

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (5):
      dt-bindings: pinctrl: qcom: Add SM6350 LPI pinctrl
      pinctrl: qcom: lpass-lpi: Add ability to use SPARE_1 for slew control
      pinctrl: qcom: Add SM6350 LPASS LPI TLMM
      arm64: dts: qcom: sm6350: add LPASS LPI pin controller
      arm64: defconfig: Enable LPASS LPI pin controller for SM6350

 .../pinctrl/qcom,sm6350-lpass-lpi-pinctrl.yaml     | 124 +++++++++++++++++
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |  66 +++++++++
 arch/arm64/configs/defconfig                       |   1 +
 drivers/pinctrl/qcom/Kconfig                       |   9 ++
 drivers/pinctrl/qcom/Makefile                      |   1 +
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c           |   2 +
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.h           |  20 +++
 drivers/pinctrl/qcom/pinctrl-sm6350-lpass-lpi.c    | 149 +++++++++++++++++++++
 8 files changed, 372 insertions(+)
---
base-commit: 4f938c7d3b25d87b356af4106c2682caf8c835a2
change-id: 20260128-sm6350-lpi-tlmm-bdca4deb5641

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


