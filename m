Return-Path: <linux-gpio+bounces-22630-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E594AF58DD
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 15:28:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0ED6416943A
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 13:28:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A776328CF6D;
	Wed,  2 Jul 2025 13:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CLDU1HIG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA1528C5B1;
	Wed,  2 Jul 2025 13:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751462501; cv=none; b=OYyyoDSuhGahfqNhEVlYfqqgxfXeY5RcE2d4cQTVxOMqsbARd7GNwKOQDskLFwYVPxSAqikKgWx3YH28G9GlV7IGLGOK/0Xjb1CDaCmKetkGuHs+eRWbdK0wGIUhUL+OtV5sBunKdHgaJ+Rq5pz5a38+XSL3YW85J6vnRHsGCYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751462501; c=relaxed/simple;
	bh=Hx07C8J+kaLoUADpRmG579tBQ5v1v2hmHsUK2Ea3QMg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eiu8gYyIYTJNpUviD2Cqb9nAmK55aeNrQZSkeeN4XQYtyvqDSq1eVDCtRTB3msAWL3MGIla2HJWFyW4FjSwL0Y5oaap5VgR3OXaSycAQwpM53IWZeSW8GG6irfAZCb8p1qI3e7uRBRvezg6EbSd71PduFGxzeNfevkhOphh5W50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CLDU1HIG; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-addda47ebeaso1424963566b.1;
        Wed, 02 Jul 2025 06:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751462498; x=1752067298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BFetkJ8v62nDUZ4qivoqFltXa9e9lgHI4HWafIdFbA8=;
        b=CLDU1HIGAOPlX+/AP8ccLiaXYrfuOSTRqu1YWvQ4gmsBAcoLxxgErzaixXNi+fejjX
         8uAaoo4wVKGhLVhlgl3pWsgQFnXSPIdFIAxximiS+nyAlD4hhNkUPdf4zJ4H8yXPwqV/
         +EbNTwu+Uiu57wCiscIWcDENMWSR7HnIqyQK+CpBh4xsPQoAvrNWyLTYIfQhEkKvR/Vx
         OzNRle2eodH/O00kabM8uWp+HktQCJkirM0Sl/w6umWu+LJWyx2oUYRqR3ZCBFFkbS+C
         oFYdOjK2IQbEQSJQBsbGTfSuBmsUKI+mQa5l8IKdns+WIIFEEpRJiuf7KBIfd+rQKciF
         AD8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751462498; x=1752067298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BFetkJ8v62nDUZ4qivoqFltXa9e9lgHI4HWafIdFbA8=;
        b=SFywJWFbiOAVhk0s4sCo6QfHih5qXpV1tCCpvalhBS9NuLAALyUzQIkHE/2PoD4Hm+
         AqriE5yAL7QtBjJQQiaeJO9qmEV7Puq36tY44Apai1ZvQ1tvmSda/0Bpc+G9RHrrhzru
         SbLqfCbRLAgrzEE1ZSCsaI9j4D7/xcST3kIDCSqpZm1Eofz/4ahU9Omrg2D5zfEXLyum
         53/xwDalnZEJOkbrghwKcM1AUyUqNksSRZRVmO2TiVDw1nNLNylBYV2UBTuatII/6NzU
         0stMMjRhobbkTCY1JKSwSPkLpuEkwhgoVYgsCBd09XtS/r1Fs9LlYy84+6ZbKS8ryWqI
         5NbA==
X-Forwarded-Encrypted: i=1; AJvYcCUhhxusY0+S1RVo54fvxwZOUobZPO+0NeaGidTbKkrh155wv0ajlnjc9rrJt6O2vQ/MnC/pgDihLArW6WV1@vger.kernel.org, AJvYcCUkCx3SNkF+x67BOA+N50salSv+iA7BwGsE3ALI0DqlpRNT1rPuaF112L2eMTEfRhr5dGiG3Z69C+Eidg==@vger.kernel.org, AJvYcCVdgtGVTHTWkpZoiBRRzxax7jcRUkyHAlOkdEaRVxzjOuM8N55wSGxQeAgX7xZqrYQzDL5uVGe0F3Bk@vger.kernel.org
X-Gm-Message-State: AOJu0YyDo1mJ3GopbCowPbnVZhpR+Mcy4aJWkBb3TFAKmt+7itS2mWpT
	Q4T79xGTHsQgYn+LzIlzK5QIhR2WJDDW9ido81WMpI1ad/jrwqMPw3hx
X-Gm-Gg: ASbGncvRB6IGXujVrT1iwTy+w8fFEvud6meuobRAAu5WT2Kca7G7rXaCy5B6/7yAqwX
	uMhh8XgdDL5+YK8qem26HwMShVFt+1mVfage9d5doYM9blUX0Z8+wmB4mhtt5mhilFajaDN/Jw8
	V14wTtL9T2ZrosTWPW3iov8bsXaei7DGoBdCZ4PV+Jtbt5RqNO4dMnMbhNfR0LIb4za+ML+nkVc
	DkxVTTCeHizoAo6G1rTzjF8aOjxvLGA9wmbv/lLOdclMK0eUbhpXMGZ1S4+D0pmmVcRhsRW4ulN
	jLOmQOXC/wnqBILjNqQeX+v7JhZGo89IJ1FJXPfrFC9iF47fNung7RIx2Xg1v+DJ/2oGAn61h3g
	=
X-Google-Smtp-Source: AGHT+IHI//NlJkyO0mAJLjERVp3Si571/ndIJ883TF/dcmn6gSg4Dwn/0R3LyLHWa3KrwYYCeLuPyw==
X-Received: by 2002:a17:907:3d8b:b0:ae3:b2b7:7f2f with SMTP id a640c23a62f3a-ae3c2d7fa07mr318636466b.40.1751462497763;
        Wed, 02 Jul 2025 06:21:37 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b094sm1063800966b.22.2025.07.02.06.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 06:21:37 -0700 (PDT)
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
Subject: [PATCH v5 12/24] dt-bindings: media: i2c: max96714: add myself as maintainer
Date: Wed,  2 Jul 2025 16:20:38 +0300
Message-ID: <20250702132104.1537926-13-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702132104.1537926-1-demonsingur@gmail.com>
References: <20250702132104.1537926-1-demonsingur@gmail.com>
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
index 3ace50e11921..f53c72e5c572 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
@@ -8,6 +8,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Maxim MAX96714 GMSL2 to CSI-2 Deserializer
 
 maintainers:
+  - Cosmin Tanislav <cosmin.tanislav@analog.com>
   - Julien Massot <julien.massot@collabora.com>
 
 description:
diff --git a/MAINTAINERS b/MAINTAINERS
index 6a89cbb2d14a..2fd3edef879f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14736,6 +14736,7 @@ F:	drivers/staging/media/max96712/max96712.c
 
 MAX96714 GMSL2 DESERIALIZER DRIVER
 M:	Julien Massot <julien.massot@collabora.com>
+M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
-- 
2.50.0


