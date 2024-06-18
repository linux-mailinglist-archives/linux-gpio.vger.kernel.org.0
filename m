Return-Path: <linux-gpio+bounces-7554-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5656C90DB02
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2024 19:49:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BCB4283B10
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2024 17:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF3F315251D;
	Tue, 18 Jun 2024 17:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qj/04zOk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BDE714A08F;
	Tue, 18 Jun 2024 17:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718732937; cv=none; b=s+zgdIYthyZk2GbW8GG/ZDygEplPJCeNUIx8GXs6S68j7oAEbZbLh2yt9tdIai7SETO86UqhsUIfCuacWOQYgxhCW2Dp63W3Uqlcm+BTAeMOmVErQTMt23QZOEXfJ34HGBhXTVw2OTVq6gwWskss5tdPCoHKM/kTT1n9US73cLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718732937; c=relaxed/simple;
	bh=O1oTaC+3NZt23oRzKJzrZvIvbSCk5gImwSz8Oc2a+To=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Sgub5AbFJGIC5C3JjVdTWXmnULJ+gnN8iJNchHQumGZyTtxKpZDjbU1m6C2452iSFgGan5jIWVThu1O2bLMfE7HFbKttgshgc4KBinpDnBY8Pvlu7Zd7NUN86UpDhvo70LdblWL5/V6yvYE1mfndFv7ftX/BIBQKyvi25rPB1dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qj/04zOk; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-362f62ae4c5so39522f8f.1;
        Tue, 18 Jun 2024 10:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718732934; x=1719337734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UTF2BFSSLeDz489s+ZDBJZa8qzk99UxkAjfUVwQalL0=;
        b=Qj/04zOkVvldFxGLeZ9aM23ol0Sd9R/Rkr5BfjGOtgDKybYs2Ka+voOnF64hZe/S55
         Gm+5OICILtp4RRzdtbpQO7Iva1btglcLJXeG5TtUurMHlNiEfs7/Xcem3Mx1xl2pCr4C
         qHLXtLf2WikiRFfFEf1bbRyR+qOyhVJgfhWLuxa10LWHZQ3RV8O171Zfak1YZ/uu1geU
         NjE38LzWO2Gh0yBSA9imuCqwVRGBb/yhf5sIrSlgxurlM/BVED2CWfXf97rAdhC3Q6HP
         0Ba/hYntaHiZ07epvv3hflgsiuNeHPHbrxK6/zH6X2k6zYrexpjGh3Syo3FN9VL1Fklr
         vCwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718732934; x=1719337734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UTF2BFSSLeDz489s+ZDBJZa8qzk99UxkAjfUVwQalL0=;
        b=NU89q6hnfSsrmRNHXQNlfzLzk5ozY3d4nMi5TWVBDH/m0+P28mCkpRUCQYGZ4sqnBb
         3nw1k+aOqUyBmT8V9mTvte77Qk/KvKrPW4zAqP9T87ENRIaDyTyCZXTgGfWsYf2zyZq7
         vMInugQmGhNBq4jazYwI9mQSXis3a3XoZsgsTJGVW3ZcowRACsBIMyMvOmFglM8Angh6
         xIdVRqOIsA0SSbDVqpV90P3rJOT0grXURpHYLAhCPionTJnYjNysOYmuwC6/SOWQvHyu
         17EIEHODRO6hBir/t3246MfJUPDkuYtICaDd6r4TU3Fg59p7RJnPVPdOAtTs+6GdLcSz
         dGBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWV4UjWqxTbRonqb0mnzQMzhpE/GyHUgWlxg17NQnQAK4ruw1LhBNTslxWw+szoT6qclh7/bxexZsOxLYLeez9C0by6R3Um+I9ARnHx75o6AuObwxZT/A3Yclp3U1HZ6R7CsCOLR6NOzg==
X-Gm-Message-State: AOJu0YzphymGB/z4eABUjAoJxltg09FQ7MEIKOnlvfo/PCrtlMR4eUPy
	vcvmOdp5jdQvm0cJCg56CphDOa8boFsjo3Xvuv3HasKMtgvFMhMn
X-Google-Smtp-Source: AGHT+IFHQW6hBw0alUqJPTFyqp+/+k7A7etWQ3YmnqQjExIuzCXz4LWsbihlWLkKn7jeoQ5RpYx+OA==
X-Received: by 2002:a5d:4009:0:b0:362:5f91:901a with SMTP id ffacd0b85a97d-3625f91a24amr1749782f8f.31.1718732934380;
        Tue, 18 Jun 2024 10:48:54 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:d6f0:b448:a40c:81a7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36289a4faeasm1253644f8f.95.2024.06.18.10.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 10:48:53 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/4] pinctrl: renesas: rzg2l: Move RZG2L_SINGLE_PIN definition to top of the file
Date: Tue, 18 Jun 2024 18:48:30 +0100
Message-Id: <20240618174831.415583-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240618174831.415583-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240618174831.415583-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Define `RZG2L_SINGLE_PIN` at the top of the file to clarify its use for
dedicated pins for improved readability.

While at it update the comment for `RZG2L_SINGLE_PIN_PACK` macro and place
it just above the macro for clarity.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index b79dd1ea2616..37a99d33400d 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -64,6 +64,8 @@
 #define PIN_CFG_ELC			BIT(20)
 #define PIN_CFG_IOLH_RZV2H		BIT(21)
 
+#define RZG2L_SINGLE_PIN		BIT_ULL(63)	/* Dedicated pin */
+
 #define RZG2L_MPXED_COMMON_PIN_FUNCS(group) \
 					(PIN_CFG_IOLH_##group | \
 					 PIN_CFG_PUPD | \
@@ -105,15 +107,13 @@
  */
 #define RZG2L_GPIO_PORT_PACK(n, a, f)	RZG2L_GPIO_PORT_SPARSE_PACK((1ULL << (n)) - 1, (a), (f))
 
-/*
- * BIT(63) indicates dedicated pin, p is the register index while
- * referencing to SR/IEN/IOLH/FILxx registers, b is the register bits
- * (b * 8) and f is the pin configuration capabilities supported.
- */
-#define RZG2L_SINGLE_PIN		BIT_ULL(63)
 #define RZG2L_SINGLE_PIN_INDEX_MASK	GENMASK_ULL(62, 56)
 #define RZG2L_SINGLE_PIN_BITS_MASK	GENMASK_ULL(55, 53)
-
+/*
+ * p is the register index while referencing to SR/IEN/IOLH/FILxx
+ * registers, b is the register bits (b * 8) and f is the pin
+ * configuration capabilities supported.
+ */
 #define RZG2L_SINGLE_PIN_PACK(p, b, f)	(RZG2L_SINGLE_PIN | \
 					 FIELD_PREP_CONST(RZG2L_SINGLE_PIN_INDEX_MASK, (p)) | \
 					 FIELD_PREP_CONST(RZG2L_SINGLE_PIN_BITS_MASK, (b)) | \
-- 
2.34.1


