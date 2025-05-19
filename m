Return-Path: <linux-gpio+bounces-20274-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C6237ABB565
	for <lists+linux-gpio@lfdr.de>; Mon, 19 May 2025 08:56:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C0751750AA
	for <lists+linux-gpio@lfdr.de>; Mon, 19 May 2025 06:56:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 824382580F2;
	Mon, 19 May 2025 06:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XUGKM+Gh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170EF244688
	for <linux-gpio@vger.kernel.org>; Mon, 19 May 2025 06:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747637768; cv=none; b=WPAXIDnyqnspFFIWSD2Lq1hDdoeS3Q0pFtroFY6RcyhqHCDsthaFhFfsGcpiiAHnVJ5cHHyFcKXVa+0j1ncu3JOycRGbs8gZFh7l9dTD5TT5oHWWHpqTHbdKm2NPaGQhEOe0W9sPM58X/48TGZ+n/p+taO2ySu/pe/9VYRti+TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747637768; c=relaxed/simple;
	bh=8NDJ9XwjY+Hw9ef5xraaEJ2PXeEup+WOftekfr63tZE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jc7H/TDqrCR0SHB2at4v77R74PSgQsb2Xi94wHO/H84eUkoBz8I8Z3/8te0+B35rx9LJFzZr31U7siOuGQGpq0hnnAQarXLFvzdL4YyGqOfwqQeU/PfvK/1xHWUMp6oQH/+ulExOyRxS7skBE1dOHmFLdE/FR3AWAr8kooNF7+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XUGKM+Gh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747637764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uoYFGf22vXFHYoBtKGUddYJzSMczRem5Rut6KCdwPLw=;
	b=XUGKM+GhAtkVQ7Ql5mwGIuUHpQSMJSfrdCOGt2b2/XIWv0kQm5eWzu0p4LPWlIyYANNVSK
	f6fEpFqlup23f14azLeESHUZMfiNUFQ5HH6oE5AA6pImd0LzBW3YYARYW15pZJtptxA6S4
	jaRWQs8713h7qsZcFxvsNOuG2BF8+ek=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-EqgqXUdAPnWlhiEavHK2Ww-1; Mon, 19 May 2025 02:56:03 -0400
X-MC-Unique: EqgqXUdAPnWlhiEavHK2Ww-1
X-Mimecast-MFC-AGG-ID: EqgqXUdAPnWlhiEavHK2Ww_1747637762
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ad5697c4537so75839366b.0
        for <linux-gpio@vger.kernel.org>; Sun, 18 May 2025 23:56:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747637761; x=1748242561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uoYFGf22vXFHYoBtKGUddYJzSMczRem5Rut6KCdwPLw=;
        b=THSLPYh9fj7KDs2Xjr++NHm26l3Qr9sEutAPtEsRc/KBdFR7UKCI5MgSa1oNDnEPF4
         LsFztUunFwBJr15pgoeSOQHQ1xabClSrDOq2ArhVukI1Y2RNjmkoCmMlZ2YKg6Fwspkg
         ZsrjQd0rEa7Bk9EXP9Vz4PNp/cD9WiUTIqJvQV70HR+1XChf21D+D4GqxuhlzQ4LSVXA
         4TGUsFlJuiH19YiuDZXM8392WrFaWRBkMvU9mQq8kRZzl+cX9/Q2dDtKDmEj56rZF1oq
         oOeOz1UKi/89EbRzghtNEu0Y6WFMT8zJsK57Djqk9U13p5uPapimhA92RmVb66IpsETl
         hZpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpPUsY446g/ZQJw8i1YreiuQBN7iSbNaRq5RnP/GtQ83Xf3VYT/YGcaVhq47+R2J3O3QF3wSaX2ATn@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8Woo2iuR7PAJmjcESwLkfvXXByWwJJgQqkkWxhx8mEP6PY7Iy
	FChvUJeMkh/fED2y67mUUoK4vXycOWObR05yK79B6T/J+DJUXXcoEaobwqSXtB57xxpg0/JGJcr
	+/EdzTare/yMYT4hwAL4O29WMYaxkhoUV0M9bQacplCCApw3IcYaQ/NPNUdNxw08+7ZjMXKk=
X-Gm-Gg: ASbGnct0HAmSvcS5XRAhaWdo5J+M4vEV1LK04wjy9vb7hs4FqSZ50oSd25u+pTiDsId
	drgVl9Jaie7BO5QkeFhPMQKgMqLv33daEH3QnD7Enbau3SEhogZlt7NRfc5oo/shFHSwZElmF3v
	qjC2i9wQpDt8pp4qvKR2rBlD4NfRsCVNRFhmdMAkS6chIaM7fBDUscNIQfzPuVrTnRs1bxqVGwa
	2CCGR9DrZVOl9XKxEKkE7xaY8ToiB1uccNx9LruY/TPyyL6mLYitUrad3EbZsBN9+KnleiLDKf5
	/L8W+9/ppGRcTjb0nHYYcz62BhijO3xdIuyq+r/Z/4LSC/6qr5j4HPuRWmA=
X-Received: by 2002:a17:907:c21:b0:ad5:1b14:15f4 with SMTP id a640c23a62f3a-ad52fbfa34fmr875342566b.25.1747637761587;
        Sun, 18 May 2025 23:56:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6XDR4x7P+w+zNIdbiwaUD7ggLJDGBPXBLLoGw0L3zesxGdykirkJT0v+7+kEm5cfIYzsfNQ==
X-Received: by 2002:a17:907:c21:b0:ad5:1b14:15f4 with SMTP id a640c23a62f3a-ad52fbfa34fmr875341366b.25.1747637761232;
        Sun, 18 May 2025 23:56:01 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e01:ef00:bf5b:f273:a506:f71f])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d441fb5sm549446566b.108.2025.05.18.23.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 23:56:00 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <westeri@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust file entry in GPIO ACPI SUPPORT
Date: Mon, 19 May 2025 08:55:57 +0200
Message-ID: <20250519065557.659674-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit babb541af627 ("gpiolib: acpi: Move quirks to a separate file")
splits drivers/gpio/gpiolib-acpi.c into two files, gpiolib-acpi-core.c and
gpiolib-acpi-quirks.c, but misses to adjust the file entry in GPIO ACPI
SUPPORT.

Adjust the file entry after this splitting into the two files.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 20e07e61a148..c816f8e0572e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10273,7 +10273,7 @@ L:	linux-acpi@vger.kernel.org
 S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git
 F:	Documentation/firmware-guide/acpi/gpio-properties.rst
-F:	drivers/gpio/gpiolib-acpi.c
+F:	drivers/gpio/gpiolib-acpi-*.c
 F:	drivers/gpio/gpiolib-acpi.h
 
 GPIO AGGREGATOR
-- 
2.49.0


