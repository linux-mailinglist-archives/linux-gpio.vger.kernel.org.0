Return-Path: <linux-gpio+bounces-3244-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 00898853592
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Feb 2024 17:05:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 84B34B218D9
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Feb 2024 16:05:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA09E5F568;
	Tue, 13 Feb 2024 16:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="IofNreb2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90585D914
	for <linux-gpio@vger.kernel.org>; Tue, 13 Feb 2024 16:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707840347; cv=none; b=nTFzZtn5SrTXt0f0aUDxcyjxXvlk7KG7RZC+zoB6KrbjROBlRyki9od5uvyPE/JKgR9L5S7nSNVEUGAHpGNxaUfxeQ/m9led8SzgXTD1P0rBZ7g91P4RL47iloZdFxnwpM035kkdkCcygMBLDvMFJfEHbsvHz3yL3FQ+1Vb/Ung=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707840347; c=relaxed/simple;
	bh=WlWQhkPvqvvxS2SzBrkZ/UlzsYw4kCBq05WyUUmIeGk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Zy2mk4ogk/s/F/kJJZ27n9P6SwXtMhdT7eAslaW814i6Akljhe7/axJmAVjFvVleT3uw/9kNqm5IIpjKRGCJ9eUNxHC07e00Rwg3DMEmOg0sOpCP7GRmdwwhFxBIpaFHzDlNbcKBDpBpeWcgP78sSKRLHQm1jzt9Nu6mP0nQyk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=IofNreb2; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4ABC240A29
	for <linux-gpio@vger.kernel.org>; Tue, 13 Feb 2024 16:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1707840337;
	bh=m2uF9MzAc75gHZLl1cGiAQQWw9h+uBS56/okcKFf60I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=IofNreb26QDE/v9VJYAhpIN4A9BaGdNIqUjQRPFCmwE35M1zlOpK3oVevC9bhLfH6
	 osf7XUHSisCFsHNBmtFjx49w7l5FdEf4bvTVgsX7UJsDGJxHjb207jhRQYlkAIt4TB
	 LIa8k4nNc5BrlS7SyjGAlxEwfxGXQym+dQ+cGRtf5J1SKenQQOhEiCflFbM9YmQMYf
	 T72urz2Lahxmt7zryFltPrYJBq2KNflBcED94AaVmyoKZ2CcRsNsQK37XNrrDWKQON
	 71sibNAWCFYWNqJoNY/ykbypbnt/ZaMMKtmp8RSBoQJ0T8XvtkcA+b+N5hj/77DIuw
	 zg0///+Zbs68A==
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-1d45d23910aso53166965ad.1
        for <linux-gpio@vger.kernel.org>; Tue, 13 Feb 2024 08:05:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707840334; x=1708445134;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m2uF9MzAc75gHZLl1cGiAQQWw9h+uBS56/okcKFf60I=;
        b=PGksZ6Z186LIlN5QGUe2NzPgeWZRR8M8uGQmGGnMxvSzT8EbstOnlazEHjUMscWbvD
         dGG1okRez8EA12xd/+k7DjX50stu62AiczX4o3seb+qVUn55kxuvmi7XA70wT5gviGEZ
         e7AE4SywbPdMNmwqEmFS2CxDVTQugEdb6QuzYZgG5fp/u2/2oJCZzXkliOPYq9WKs6Dl
         hX5SXW9BOZ273cryerFrydLVDHlvZJwCCZ59w4l3ZzlTkrxVOlQHS2f8keEAoNtSaunm
         UM2wvohz6wa2XItVQ2Y4J04GD6kyfj9A5PM7+vFmWHw4tMsWzct+xBqmgkccsqnoq/tl
         AcAA==
X-Forwarded-Encrypted: i=1; AJvYcCVu34tEE+W9nh/wyokMkDELldyLDtbk0FhYsrDWoRgbUGj0HIC/Ro2PkKjr7zizC7OfjA5MhHIOGFScCUrNeeF6K8dyMZqvZwkPug==
X-Gm-Message-State: AOJu0YzjdlYhPyVFcU/kqtrHv5ZYFfW3aj8zlqEJQcYfthoZ6KgQr0S2
	wu/bcr8bW2Fbuq1VnwyK553bMajiGmKN+Llw91HksUsJ3Q0V420GQa85BYaryz+JuS7igabOIPM
	JK52ND4QM13XMBs7cQm4/3cLf4eYfHmm7oyBXmgGlbICsm0EN5f8XregyKHjw6eFIZwSYL2QrlL
	0=
X-Received: by 2002:a17:902:eccc:b0:1d8:e2af:f7a3 with SMTP id a12-20020a170902eccc00b001d8e2aff7a3mr9033467plh.60.1707840334701;
        Tue, 13 Feb 2024 08:05:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH/I9tj91UbaygSHRr/+8Vld7JgcLjlxqJeYSEJsh8+q9pnwmMcdOZcAzCm83FWMUNwV/QEjQ==
X-Received: by 2002:a17:902:eccc:b0:1d8:e2af:f7a3 with SMTP id a12-20020a170902eccc00b001d8e2aff7a3mr9033435plh.60.1707840334330;
        Tue, 13 Feb 2024 08:05:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU370TRTXx+dacoVfx8mFo22IPUsO2OwdpclHJxKZsi5lmYJwY+5eGsyVEBemBP6a1cq6kbjlf50zD3qUaVfvGtd13P4uTaqf+6/t9abkgxfKkieVEaNkc7XiJdjIz0W28DeO9YExb6vkQMhffzi6tkYW2S8/O6ssHihqQQe4+ENcjGXPp2yrt0WFE/PMqqrCIE6ECppESNDIqTO93hgA==
Received: from fenrir.. ([179.108.23.66])
        by smtp.gmail.com with ESMTPSA id bf5-20020a170902b90500b001d9c1d8a401sm2251685plb.191.2024.02.13.08.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 08:05:33 -0800 (PST)
From: lincoln.wallace@canonical.com
To: linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	corbet@lwn.net,
	brgl@bgdev.pl,
	linus.walleij@linaro.org
Cc: Lincoln Wallace <lincoln.wallace@canonical.com>
Subject: [PATCH] Documentation: gpio: Add a note on the deprecated GPIO Testing Driver
Date: Tue, 13 Feb 2024 13:05:22 -0300
Message-Id: <20240213160522.37940-1-lincoln.wallace@canonical.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lincoln Wallace <lincoln.wallace@canonical.com>

A deprecation note was added on gpio-mockup Kconfig since v6.7,
update the documentation to inform users.

Signed-off-by: Lincoln Wallace <lincoln.wallace@canonical.com>
---
 Documentation/admin-guide/gpio/gpio-mockup.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/admin-guide/gpio/gpio-mockup.rst b/Documentation/admin-guide/gpio/gpio-mockup.rst
index 493071da1738..a6424de925da 100644
--- a/Documentation/admin-guide/gpio/gpio-mockup.rst
+++ b/Documentation/admin-guide/gpio/gpio-mockup.rst
@@ -3,6 +3,11 @@
 GPIO Testing Driver
 ===================
 
+.. note::
+    Since kernel version 6.7, this method is being deprecated. Prefer using
+    Documentation/admin-guide/gpio/gpio-sim.rst instead for kernel versions
+    newer than 5.17, which is when gpio-sim was added.
+
 The GPIO Testing Driver (gpio-mockup) provides a way to create simulated GPIO
 chips for testing purposes. The lines exposed by these chips can be accessed
 using the standard GPIO character device interface as well as manipulated
-- 
2.40.1


