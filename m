Return-Path: <linux-gpio+bounces-19587-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8380BAA83D1
	for <lists+linux-gpio@lfdr.de>; Sun,  4 May 2025 06:11:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63F26189A338
	for <lists+linux-gpio@lfdr.de>; Sun,  4 May 2025 04:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19CC915B54C;
	Sun,  4 May 2025 04:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XONysR+v"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE95014B965
	for <linux-gpio@vger.kernel.org>; Sun,  4 May 2025 04:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746331854; cv=none; b=IZWYxXdVK+MHUBh4yzRjZtikaP83OeHNbfsTFRhtcm/PJws6pNXLTXnLi8CeoUSN1YSULANaHjmfvlBnaiXsGCZI5/wLiaxT2IMuIe0M5+1o46RKOr0jSjEZUN6XsX+q+OwtbPPLyQxolq6rQiu1XxRDSX6oPelI907xZ9xEUjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746331854; c=relaxed/simple;
	bh=58y1wlPA8jRdV6kOneRQ3qISahx75Mn9ln9rC7q2WlU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=He0VI8Cyj7c5QvAZdG2FW/F2klFJvZGSfdyQ4WP6AGpehaoqZoHckglnfvDXg+n8+TA7ZEUBWsN2AnCcHjuyugxoj0rUzx6UWqXvaLsEQtlXyz+tEg2hvDiW/kxF+7HnEr4Eu2TatBiyqk2npKB25xuPbkf5r+QB4kjDzAk02HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XONysR+v; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746331850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pXg0ERkF8XHkKLcRr4bURjizOpgCnyyQy1hmk10qVvs=;
	b=XONysR+v3TIAgxCzCjDvAMatNCK1MhpEZdPEZqiQWGfReSZaUSwO/24nzRQjuWbvqZCdyp
	N3Q6xwQ3IIgNuaswyK13LqZUWJkrQ0uw6o5lQHMmawxhc/6Om6VyM5ppV+11RPIFtlvHIS
	5bxETxriOB3fbcILdAol0Km9lbIi6WE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-J5ubn-E8PZm0yakP1_af_A-1; Sun, 04 May 2025 00:10:49 -0400
X-MC-Unique: J5ubn-E8PZm0yakP1_af_A-1
X-Mimecast-MFC-AGG-ID: J5ubn-E8PZm0yakP1_af_A_1746331848
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43cf446681cso18851895e9.1
        for <linux-gpio@vger.kernel.org>; Sat, 03 May 2025 21:10:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746331848; x=1746936648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pXg0ERkF8XHkKLcRr4bURjizOpgCnyyQy1hmk10qVvs=;
        b=SQJW/bQlgLdag6z0NwjVeuN/C4LsEaJduLc+Cgk5keEPxM4VOpBH+meKtDsQl+mVkB
         pdMQpx5rH0AietLhgC5rIHa5WV/xcjs5X8k5Ak21uAF6jbAm5VuPKWDe/nPy80+wCeGY
         qyNH4X4edvG2f1wiJa5ZRzy5PH3XLMOk6wdLgHc70IiorG/ryLO+JEx/GOXt3AArcL1U
         CBPUL/arQHXpW762TQFWiQ4pgHCmLYBuVIRvlsYN6RYmxyZEgdnz2neV9ugIlKyKEFlB
         pI4S2LE0ntRC9mmUAE83+mkEyq1Uo6Nc/Bl3CUlkm6szYcrt8PQAtXxE1GD6Uxc0oUv/
         rnzA==
X-Forwarded-Encrypted: i=1; AJvYcCW8TLWjj502bEkB6KgiRTwkZWoZ3f3J37L7L5kCsq6uJiV/Cgoq7SfK8Mj3eX8LTmr67WtaiuWjcRp+@vger.kernel.org
X-Gm-Message-State: AOJu0YxTu7gWdvzZZGwPo9yplJWPm82i8Zjvfvnp4zksmKYRYIhYkvkC
	HHFe7B141jiL76B9eOg9/7dPWhr0GwIGPLbdLp36ReCndSquT4Llj9h+07BpQfTr4BQ9+KgFAs4
	5r35dtw1zomPUy5fJXiaIaoWAn4pDXDH5sWWDEsA7NeXo+SJMyy4lFPg8Ybs=
X-Gm-Gg: ASbGncunX3B0ho0ra5oJJhnOrSXCeaGOeMZaiYN9L+PkQw+Wh4QkDvZXHnpuZ+AVWfL
	baxGszgTGuPBssoojj6QVTQ27XqZwUe4RN6PXXoMdvjSGmASWaAgnD966+DiUqsFLperqN4rV8g
	M7vvj0Jy43ykWdQy7h6Sk6FXFrlBqayL/JQDuNDsFOUAN+P1ZuybbNV2ZySLcJ8y2mZWSgwhf6L
	fPt8rs5sxih1VCZZRdF27j8be+IG6igNfqrQVOB7WfiRApXsQV4QNRHfxki2nsy1rj7EOGgIabl
	xB57Gw5sCsjzfnR8GZH90SXK2bIcBq2VGbMpgbc7IdfqiPz8OEAJrin7cg==
X-Received: by 2002:a05:600c:8283:b0:43d:8ea:8d7a with SMTP id 5b1f17b1804b1-441c4948691mr19622075e9.28.1746331848172;
        Sat, 03 May 2025 21:10:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+L9gMdreyvyzyLlq3oHQYPX/FO9Npa9JrKoYnNFTKf5gqLqTcPTA+0B3G8oMkDtOUnSc9ZQ==
X-Received: by 2002:a05:600c:8283:b0:43d:8ea:8d7a with SMTP id 5b1f17b1804b1-441c4948691mr19621955e9.28.1746331847872;
        Sat, 03 May 2025 21:10:47 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e01:ef00:b52:2ad9:f357:f709])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2af306bsm138229675e9.21.2025.05.03.21.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 21:10:46 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Lee Jones <lee@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-input@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: rectify file entry in ADP5585 driver section
Date: Sun,  4 May 2025 06:10:40 +0200
Message-ID: <20250504041040.40421-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit a53fc67a1e21 ("Input: adp5585: Add Analog Devices ADP5585/89
support") adds the file drivers/input/keyboard/adp5585-keys.c, but then
refers with a file entry to the non-existing file
drivers/input/adp5585-keys.c in the MAINTAINERS section ADP5585 GPIO
EXPANDER, PWM AND KEYPAD CONTROLLER DRIVER.

Make this file entry refer to the intended file.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index b21363fdbf4d..1401209d06df 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -550,7 +550,7 @@ L:	linux-pwm@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/*/adi,adp5585*.yaml
 F:	drivers/gpio/gpio-adp5585.c
-F:	drivers/input/adp5585-keys.c
+F:	drivers/input/keyboard/adp5585-keys.c
 F:	drivers/mfd/adp5585.c
 F:	drivers/pwm/pwm-adp5585.c
 F:	include/linux/mfd/adp5585.h
-- 
2.49.0


