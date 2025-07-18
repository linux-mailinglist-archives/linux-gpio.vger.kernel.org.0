Return-Path: <linux-gpio+bounces-23482-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2663B0A748
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 17:29:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0E34167380
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 15:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E06BC2E2EF0;
	Fri, 18 Jul 2025 15:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KR3KKSqK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A242E2672;
	Fri, 18 Jul 2025 15:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752852343; cv=none; b=TOYQgC2Nv9Ednr4a0E1h2fDQ3g/z7HSfzsXI6OytKOIK3cVEVKo8SEfBdwFuikEFDcalNOOLboJA/zyc83sHcO/4xJfE2P+4qHTFENK0QRpr23V/sNOZpGDgdhSFa8t2CaXbGliOCkOG6OzByL8PDVAuiPSjTGk2aSrJC5G1f9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752852343; c=relaxed/simple;
	bh=6IaLZk5ajCLYmQ3Mz5pBghgvBkfz9rSnhglhzXJVewI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QsH0b0UAb+/mbdUyfT4zzM4D7ZMGne2UygV0N6a21LvTUiwbybkMGT3uKeIPQQaAYXt7V6KSkeCchJFjlg0pLAlcuzSKYcoNfb8yvo+40XFCwQ7DqL454uPn+y6Q/4SGK23VzOr9SN+dJMiauMs7HCoAtgpfKivM1Ty5cLw4JHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KR3KKSqK; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a531fcaa05so995133f8f.3;
        Fri, 18 Jul 2025 08:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752852340; x=1753457140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nPCXaM2fReTmTR1+dO9f5EB14T9FRoV7tVgoNxuKveQ=;
        b=KR3KKSqK79LKEDBnykv9Pg7FTIoa1yun2SYsj4D66aoxm5EEeCfhdc6jg1OgatdGg9
         oQAY/xREeF37SZulesyZJiOxgpJL7dDg0nj0PGC5Tag7OwFpbu6BG9EFDlywXlzohBnJ
         utzFL1Wr6XzS+ZWhwtkiJzswP+d8IQtG48OuomAWdCeON6Qw7imCLB3L+mVl21XFOlVW
         0RSCp2Ic5XaU+7mBt6ZRpWaKuZAuaxfU/K2ctFdDBmruxgkJVz9vdMNWXmyv349iyEQC
         PoKM4SqclQTnIsmniYeSO0Pe1d5QenQRvbm0uMI9Hgg7ahErbjov3ZCXOjVZHvFIcmzk
         tVLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852340; x=1753457140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nPCXaM2fReTmTR1+dO9f5EB14T9FRoV7tVgoNxuKveQ=;
        b=nTR/7kDJt+krn27Bwdd82TJPdyle4RtV93TmwCDVZ7cxA+8SlxTiltC/uV9jkiPb89
         SQPVpBqgsCf4sOQRs4SmmSu8XZbMe+H1xaAnNLUxT9jYVJAg9Svn5IxKQwBG6tQURy8y
         fjidz7sofWhToGWiCAcY+jzCDhnTE+qNXrUDdKdlqeiddHHmKirg/zau/HB69gYXNTLJ
         tu0/0QyGGGrUFVYALnHKW1cQcHxpp3AaNYtT5EOX6PzfKnXVTvDTWLsNcYHFrtsUyheH
         XY3wuUPDSmFfIY1vKk3gKrV2xhz69bxBh/o8O75nMSPdnHsHyibQ8/BVqoALkzURUle7
         z0uw==
X-Forwarded-Encrypted: i=1; AJvYcCUk16B8325wDseTG7z/OYYECLEmGGRCvV1JOgTLHrUKkuFRNnTSegFLWQyPlQM92/rSrAW77jtw0rEZ@vger.kernel.org, AJvYcCV9Q/3XJP189UyO73hHzTfuVwyPR/wtilG3r0stO8ZEsq7/aLyQQTIZoOQgM1ZGIz5SgrLvopRM5Ydm8Q==@vger.kernel.org, AJvYcCVRzyQUDZO1P9/t/87JcDl6i9p79/ka6WMZFr3bykaoK4GUl43U7NxFEe5EmweAFYt0h17vfZBk+aB+lafw@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrb5S18OWSxyV0rXec/0xwZ88EArgreF8Jil9sEO9QuWYL98yr
	CIB2wQ/vIblDtHJ3C7oNLRcR+fibdUllGl1aud/JqMBSjTUfZOZnBsP5
X-Gm-Gg: ASbGncuSHd7kqleKuDWYoFfzBCmc6qn5E54NpM/cZqZXY1Jji9zIVovexiUkZkpPPnb
	yBF78iumCn4yLzRZ4+hFFjWdeNoaQT7GtS0UZt6YK/Svj4glsqN4XsyC1oAEf5E43HSWhP+WKg+
	dQeAixzIOfGTct+RuRNihVxuQGx6zYkyrtQbUSnAfzYfpwa94uIOA4RsKFCJu58W7ElRv/0wajB
	KG1opk7U/JrU2TNI/x+5jVSxdpfF+TgYOg9rhARyLNNVsoyBJRCsO5fuNKVMbSXQOH+eKJm4kNd
	K12o5oR/avY4+5mG+AExdNoOAp+X6GHp66CmTUjGYJx7dsmhD7HTFS00ZGmvW5GzfsAWuK3JqXe
	+veHeX3f3Dw0c8xldEimB5cjtV4X/VlhH2KI=
X-Google-Smtp-Source: AGHT+IEZJvH2brWPqdjnylH1nGNNdQPMn9WAZeVtiulFy8Wb/LXo/qxYfZZtxFSL21iJFnc7/1b8ww==
X-Received: by 2002:a05:6000:290f:b0:3a3:6a9a:5ebf with SMTP id ffacd0b85a97d-3b60e4d0841mr10146216f8f.20.1752852340160;
        Fri, 18 Jul 2025 08:25:40 -0700 (PDT)
Received: from demon-pc.localdomain ([86.121.79.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca4893fsm2195780f8f.52.2025.07.18.08.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:25:39 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v7 12/24] dt-bindings: media: i2c: max96714: add myself as maintainer
Date: Fri, 18 Jul 2025 18:24:48 +0300
Message-ID: <20250718152500.2656391-13-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250718152500.2656391-1-demonsingur@gmail.com>
References: <20250718152500.2656391-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Analog Devices is taking responsability for the maintenance of the Maxim
GMSL2/3 devices.
Add myself to the maintainers list and to the device tree bindings.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml | 1 +
 MAINTAINERS                                                     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
index 3ace50e11921b..f53c72e5c5727 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
@@ -8,6 +8,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Maxim MAX96714 GMSL2 to CSI-2 Deserializer
 
 maintainers:
+  - Cosmin Tanislav <cosmin.tanislav@analog.com>
   - Julien Massot <julien.massot@collabora.com>
 
 description:
diff --git a/MAINTAINERS b/MAINTAINERS
index 3117345d0619c..93e22dfd61c17 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14755,6 +14755,7 @@ F:	drivers/staging/media/max96712/max96712.c
 
 MAX96714 GMSL2 DESERIALIZER DRIVER
 M:	Julien Massot <julien.massot@collabora.com>
+M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
-- 
2.50.1


