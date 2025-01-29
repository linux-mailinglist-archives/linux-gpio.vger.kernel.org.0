Return-Path: <linux-gpio+bounces-15090-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DF2A22100
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jan 2025 16:56:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0FE3318836DA
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jan 2025 15:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84BEF1DE2DA;
	Wed, 29 Jan 2025 15:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="u80WdXRt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E960D1D6193
	for <linux-gpio@vger.kernel.org>; Wed, 29 Jan 2025 15:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738166166; cv=none; b=If0NhLYEHCOc1aW9wa8qZivX+0/hKIgAZNzSwXxnbJp1J6rL/N4A5BHKISu+Co4FVl27Pzw1tW94kpjaC09szNCkvLtQ3yAyed4I3SU4rCEN+QKEcmR46Ynv/tX4PAaqO/EOlwVIotMjJZ3IIykdeOkzL+ZaAB/j7TmyXypHBqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738166166; c=relaxed/simple;
	bh=VtVAh2VfHgr31+drTgT7Pvcgcs24/ZSVTsXm8vfJN6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QMpSshoh8wegeqadhNeVMjOXDXH2T7SSTMK7SWLFvwnbp9SFgYYd9jeuu9AlP+TG+s3RGn23Zmce2WiR9ZyOoqu6WTOxPlQyGgPnnWvL/Uj/ZjxpWsQ5UjU93dPqCxz3HqGiiTcqU9JULoOttmFrmvoW5Exc54n4TcmD2ZlwO3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=u80WdXRt; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E36873F284
	for <linux-gpio@vger.kernel.org>; Wed, 29 Jan 2025 15:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738166160;
	bh=pmsvkeTFmLqKgoiwRtA7RMEXjEmdiy9fitR8oZ87sCI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=u80WdXRtUNi6kZNQqZskxAW09EO5sgvgKLEuFY8AIYu8JMwTX3R993AnDyV+CSbvP
	 hGfjVZQTREr3ipA4gyVzOZZZswbJNT4jM82nJMnNOvN8Rw+OR3JCagZ93cQiz5iYq7
	 IJIzi/g7kTU8yzamfRs5duLYaCqrwdvMgYFl5ZnWtH8aXo0msbtVOSvzomm4bQFvGa
	 cHjxIOWdcXptqiLyD0A4roF+EnHtsO4AdZ3PaWObeVm5bwjiVLQWiWM9s49kAMmoqg
	 IsQH90MAwlyufZRKHTdMHg8WIU8GS31ENZ28XelQ+IbYMcYnJ3ULtpJ+XXVASJ1B/+
	 VBUUT3tq40Fog==
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-21655569152so142387775ad.2
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jan 2025 07:56:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738166159; x=1738770959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pmsvkeTFmLqKgoiwRtA7RMEXjEmdiy9fitR8oZ87sCI=;
        b=NNRmduHmq52BoJWwwemSM8DTHFZM3KUxUw74zbNJJFSw0wz/JSIogYTXkkI9js9uLx
         +ix+BgMaZ/dOIcdj/i1YFXSjjb+aifA33/bKXGQz5Q0uCgCF69v7rSCe2m0uxwAfIlZn
         YL1CiHN0Jn8HcR2P1pWnR6jK9WHeM1tEieRKsUVlncOXs2FlJVgVYKX4YP2bxkjBdyN0
         /Nj4us/jhihCw/CNR5nmITCF+FK6dFNwM7rRLglBIYuCiy1vXrp4Kz9KSrga/ARwTTM6
         wq/Z4bCX3FBBW0EfSTDNQV7Ak3Wpm8d7XjJa/zZuIR5qQeOYeNc+uWnzAt9bsKLtLGYo
         FCkg==
X-Gm-Message-State: AOJu0Yz858ApScOib+4RvwIQtCHFz+wgWiRIyYO3KyhCMqqqfpQsibNu
	ieB02bk5E1dJSLIKmJZusmeg/ktfnIziwHuT8RFCngVbMkCegyFYlrlbuisvfIJ2mHgFFDcS8oh
	wK4lsAfk0jMfTtSnRGvmE/OcCrvVCnCfnc1p8v5qdQONRFq2+YdEjFhnjA75dMrWg8DHnoRS+J7
	BxKg2Xt6o=
X-Gm-Gg: ASbGncu6DQfeQPK0D8BnDKBhnwuDaV3L/NKkqqSJ0UAaZqaSVXnP4HHsb8XlvFmewiZ
	zLxTHL1q85oBDQMB9S2D3DPoSo0a7lOWhPgE4Th3D6t4O7B2ath/y9NG3uYpFV4jorK2SnQT1NU
	B3myVoo/u64gJ9SDTM67cJJl+2K2fgQ23fM9iCWqscwmNO03ZgcYnjdcmVQ+Ei1Yl5GihMtUOu3
	QjEnd5OCGyDTubuYS4vsYo96JlPf+PYFXO8VLczXy/pVJpCHIUHr7d9L+VOk0ueC8MEBgblvBYj
	lHBQ3FN1cysXu0Wq0Yw0Zvc=
X-Received: by 2002:a05:6a20:d809:b0:1e0:df27:10b5 with SMTP id adf61e73a8af0-1ed7a6e0e6bmr7049735637.29.1738166159202;
        Wed, 29 Jan 2025 07:55:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEEFdYQAiWLLWYn0BlsNbCWmLkCAC1zrD8TYyIX3e6mEdy6xAmSuYP3uU+vfxFvw/KK/Y948Q==
X-Received: by 2002:a05:6a20:d809:b0:1e0:df27:10b5 with SMTP id adf61e73a8af0-1ed7a6e0e6bmr7049693637.29.1738166158810;
        Wed, 29 Jan 2025 07:55:58 -0800 (PST)
Received: from localhost.localdomain ([240f:74:7be:1:daf2:7ab4:ebc3:f450])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a77c4fasm11674432b3a.132.2025.01.29.07.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 07:55:58 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: geert+renesas@glider.be,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/2] Introduce configfs-based interface for gpio-aggregator
Date: Thu, 30 Jan 2025 00:55:23 +0900
Message-ID: <20250129155525.663780-1-koichiro.den@canonical.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This RFC patch series proposes adding a configfs-based interface to
gpio-aggregator to address limitations in the existing 'new_device'
interface.

The existing 'new_device' interface has several limitations:

  #1. No way to determine when GPIO aggregator creation is complete.
  #2. No way to retrieve errors when creating a GPIO aggregator.
  #3. No way to trace a GPIO line of an aggregator back to its
      corresponding physical device.
  #4. The 'new_device' echo does not indicate which virtual gpiochip.<N>
      was created.
  #5. No way to assign names to GPIO lines exported through an aggregator.

Although issues #1 to #3 could technically be resolved easily without
configfs, using configfs offers a streamlined, modern, and extensible
approach, especially since gpio-sim and gpio-virtuser already utilize
configfs.

This RFC patch series includes two commits:

* [PATCH 1/2] implements the configfs interface and resolves the above
  issues:
  - #1, Wait for probe completion using a platform bus notifier,
        in the same manner as gpio-virtuser.
  - #2, Introduce a 'live' attribute (like gpio-virtuser/gpio-sim),
        returning -ENXIO when probe fails.
  - #3, Structure configfs directories to clearly map virtual lines to
        physical ones.
  - #4, Add a read-only 'dev_name' attribute exposing the platform bus
        device name.
  - #5, Allow users to set custom line names via a 'name' attribute.

* [PATCH 2/2] provides documentation on using the new interface.


Koichiro Den (2):
  gpio: aggregator: Introduce configfs interface
  Documentation: gpio: document configfs interface for gpio-aggregator

 .../admin-guide/gpio/gpio-aggregator.rst      |  86 +++
 drivers/gpio/gpio-aggregator.c                | 673 +++++++++++++++++-
 2 files changed, 757 insertions(+), 2 deletions(-)

-- 
2.45.2


