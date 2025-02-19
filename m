Return-Path: <linux-gpio+bounces-16239-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C793A3C528
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 17:36:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96396166FF0
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 16:36:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2F2E1F8F09;
	Wed, 19 Feb 2025 16:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TVA9V6+8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66045198E81
	for <linux-gpio@vger.kernel.org>; Wed, 19 Feb 2025 16:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739982998; cv=none; b=rhMAlfOBw5EJxF3lAZBSXJy0bvR74i86eb2RjBjSbEE5SuGVmo/nvqky3A4Ru72QFv3AL+MyMrLfbK4s9/Ri/fNtL6yiOZVHGqpqiN9UmkFs7k4KhPcBYOZ1zI1k/hyL5/G0ptVjyfr1tQPK+cTfm2HcfR9iFlNEVmQUm2jDytI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739982998; c=relaxed/simple;
	bh=PWxbo0Nj/ORNHe/HN3+hY0rbzi9JP2Y2DuLTad2niIk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cL0QU6gzD1aeInUMpQUJlthTmPmMkjx01Hu1g+hyQNRqywfGl3zdy+LPtNtncD7YwrtsPFA8FU68QJg04XoecMgc2Ic74XuuzqjeKULxpZ7swMkubViigNguLNGevXDUfTLNjeD6lnpOl2mKb4+2LjwHEGuubB1DdS64thfjVbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TVA9V6+8; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-220d601886fso94859765ad.1
        for <linux-gpio@vger.kernel.org>; Wed, 19 Feb 2025 08:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739982996; x=1740587796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jcRFOWqiwvbx/cuDCSDjWSGRAtOxjGOL6Kce8UnzUfg=;
        b=TVA9V6+86qcKJ2WQuVGf96ZMNkywjwvoXCWeLz87iyoCMnAxQo5kCT8dREGRdXf5YU
         ++KaJh0DuIDvV5HNZqxjZe8ovxil7cGY6wyYE/LJC1Aa/QsF2CsVs7onKVxdcXaT6f/Y
         T1JSFk/40Q8m9HITAstn/P/oGg2Sodc1xb+Ra0NqIXEheKrt95PwxDoqcKIWk7BUmqRT
         nAiTwUvEvHKNit0tQpTbU1m4zLUWXbX7AYCUS4bEWnBaFQDw04lO1GxY03ms5ad+Gkkq
         X1uOIYN9rihH27ndeIcMVvQ8ADf7Ui+szbzm5qi2bOS/MZsF/Ac3HP0ahK7drU5C9jv0
         2IlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739982996; x=1740587796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jcRFOWqiwvbx/cuDCSDjWSGRAtOxjGOL6Kce8UnzUfg=;
        b=RtL00vlZEi/ZuvaKwerQyjsT7KTTxsM8rjQTn5rRG8gKwyEujpJcSwrA8CTov0FTkW
         PUcL/IwDAX78Op1cg15/+FZt+qpDdoL92oXpSGChk5iufZdaNeG21H3xdp9oao3APCWb
         ETZ+fDOZbsmzcuA01mBumKLQ022DVzvaXubR35BavUMe9dmyWbxGv2o80Qs9pc1l0ciT
         kJHB2HvkFyqCK0vlZF8jREcd5nUuXvUlUmS7T3EtoF0ocGl4wfy6AZubEEdK7WpnzCwF
         HBiplCPRGbCoZ9KuJHeWSAnoVRr6wrOB47qABfGM5CTfcyCMJ99Cr2kIWIETXNHtukUb
         vTyg==
X-Gm-Message-State: AOJu0YyNUNwRXmEepmv4VWTmmIP59PlPqAvpQ1DNczCP6mh7dCRYR4Ce
	zDVmhPkpIok57KtL7Uz8ScKiR1vkMV0dJu1lK32WxicDqbyEcP4uVnnyoHaS
X-Gm-Gg: ASbGncvd9qjZsnKRBLgsWTOqq97nVJW///1NKKpVYZG8M+GxoubinVDaWQjUiV8FPn5
	TjNKLa+bzWBj6eHEECeU6oKlquvm3P+3vhOE9dy3gEjQpJdfj7zoNM5rM3gpeCnM+qvufC0wup4
	x8yIVAgUsGngIljnXgRQhgR1Nz0KhpBIKkEzIOEKt4bcgLsQlqdWx5UgyeIaXTyvCedmN1upbgN
	nF0BeNdYEQRTZTXXFiAwotVYPBk8WNmFvtQjXVrUtjyq78TC2P4lMgIgz2UW2xkLgqKl9p6mkFE
	pwBVno8Y0bA+ilvgMcReTGbqetXEzl+iNvHh2Ga81wo4ZpsC6l1RulDFH0LBav5IYUOZ3Fyg+IE
	gxCvXgLJc
X-Google-Smtp-Source: AGHT+IF23A1zaDKKwL9Uw73DtsY2b0mYkDODwE7gEbTZH8a6v0lXJLzL3BEdtrkrgvga8/imfg8CUQ==
X-Received: by 2002:a17:902:f706:b0:21f:71a8:f669 with SMTP id d9443c01a7336-221040be573mr329384685ad.38.1739982996450;
        Wed, 19 Feb 2025 08:36:36 -0800 (PST)
Received: from test-suraj.qjz2hk5f2gku1a3adsvczrat5c.xx.internal.cloudapp.net ([20.9.134.79])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d5349203sm107531625ad.29.2025.02.19.08.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 08:36:36 -0800 (PST)
From: Suraj Patil <surajpatil522@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Suraj Patil <surajpatil522@gmail.com>
Subject: [PATCH] gpio: gpiolib: Remove FIXME by safely handling const in gpiod_get_raw_value_commit
Date: Wed, 19 Feb 2025 16:36:33 +0000
Message-ID: <20250219163633.162613-1-surajpatil522@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Suraj Patil <surajpatil522@gmail.com>
---
 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index ff64d84492f4..59437c8f31d7 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+/// SPDX-License-Identifier: GPL-2.0
 
 #include <linux/acpi.h>
 #include <linux/array_size.h>
-- 
2.43.0


