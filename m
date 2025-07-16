Return-Path: <linux-gpio+bounces-23375-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA555B07DCC
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 21:34:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3847B586B0B
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 19:34:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 947AB2E1744;
	Wed, 16 Jul 2025 19:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pv3uPMDH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF622E090E;
	Wed, 16 Jul 2025 19:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752694307; cv=none; b=rHLzClrM+Hip1XGRgSIeeKqUtlss5TOk9do447BaM2QmWs8ThspKf7SNaP8iHMQ8kn95j7UA1nL5JAy4riFmo59CAa1T6A8Eorju6Hkd9pr2doA0i15MIRmo+e5NSZIdMT4vhEf97An04GMRTe20oWyyT5dlo6FJY0ZDGIo2dRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752694307; c=relaxed/simple;
	bh=Tya7H69uCHv1F64bK9DJxRVSTo9tF9vvkubVhW3RXZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nQRxPpgwptH/P2fHInDhtb9lgwdbhAqHu46daQ/JOqO3FxgpVzS4eUbZcdCykxJ6ShlRl5kn5jYGtgu6i2br80Y1oatERqqAEhKi2qPunPWLkX0BbDaCfLe0/bzYmiAYwcSuk1sbPb500WpsTpoAIPwiMnxiIKYxW8qtjsNzetI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pv3uPMDH; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ae36dc91dc7so34209966b.2;
        Wed, 16 Jul 2025 12:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752694304; x=1753299104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1YhQAjQyJkWY6Jp3g1C7XqqcjfeJK/9/EyL1eyErKpI=;
        b=Pv3uPMDHNw73zR8rTHAIxuDF5yA8/JgsIg9gAQF22XuMGelJcmsU7S22vO4AdeFXQ9
         0T2SE4yvKhsKUjYaG4DZeXDG+Z4dNjtmU3GmmQQWT4C/8yX8oYRqr0WTVZcxEM7Qb5Hp
         MypOHYwCxSOp0sC3VtRsUnTQnOLlckL89O0lsam8C8BhnQQ7mJ/VPZ1AJKVC6Tr7FCDc
         lZ3+eSM677E0PwNSY4M/QyntRAncbtuCurTJbp7Ue9upcegYERGwHloOfrDSRfO26ZhX
         pdSPnmhfa1uvolh/nDAAboZaoVsPwTvy5yHlrrg1tB3B0triYq4oIIngXIjd5kLUna5J
         VrUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752694304; x=1753299104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1YhQAjQyJkWY6Jp3g1C7XqqcjfeJK/9/EyL1eyErKpI=;
        b=Y7tzhRIPPqgtBXgOwD1e601ta7UPVpwXh2Ny55YHnDbeamy5MMc3VQC0N9jlzE7BoO
         oCWhqe0zcXSSrjaGIf+ssB2U2jy6c9ecoacyB59ZerCinlrZnLBYCcg8AAFv4Zu/45Yy
         ssZ/eZj/HfRvvnuZPcSgMTUtY7bt5f5iceOXypcSD4wEZEybxVLRk765BNH+rgj81qgO
         5Yqz4PSvIfOlXaArEoba/5El7nRe8EYKl8zwOhfC/F/3PVTm7vA6fYKJzRI9kvjTYvWf
         hoyLNWA1QrLfHp4cKNafQHy2UkGH6y7LzwgUNXTNXzWV1wYbBnzQ3L2cnX5tLJxJD1/F
         GvZg==
X-Forwarded-Encrypted: i=1; AJvYcCUx79HH2vlcvgRMTjj9gvp0W2Bvi6iXXp3ADhem1AeN3HRrv3FZoeX+SLNyzmvK/Bp4gPt/onsv1wS91Dk9@vger.kernel.org, AJvYcCWefjlmSAr+3nR2jlDBsLOc0JH0UP98eXsscIxCUe/R3Sr7qtUMSKncCX1xagqydvVfI2qP1RztADvg@vger.kernel.org, AJvYcCXjno2Z56Gq3w80pvLUfVsPgfn35Tg5IDnUj/wnED7QdzIl3rh+D/LJxtXIYzKzHGKHKOixPU0Y9ly+MA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+86AYmrjCw/qXenB6HqpsbQv42HdzWLAbKMQrs6kcJG0xiP2Q
	He/kVG11CAjRmOyhY1KTVc/ZFq4PyJMc3QPS/z7j6UFnkInOZF7NkvhH
X-Gm-Gg: ASbGnctyW0L0MpbyTJSj/d9X6kaPHqgM5n8C5ZDXH3c4t7pWQkV2oT+2b0ppO4kEsFw
	K8YWpJNmTXxMmYrwEnAPr+UHxKn8maQiUcDLEBVJmzvGZ2V9CFc5dGWhw29nUF92DslhV4+2sTg
	uC6iWkYV/uBMn0hD2a2wrKl0dgr9yP9qyPSuKqKzyKDSYQyGuSRPPVPvkF7HPZ6zOYlEV07b9Eg
	Asq4lZogR1lpgz0h21dOO5XMXq8eQgj0//65jouXLRyAd1BTwOzWaqE2s4TRdhVj07kcXFWLcr/
	B6wHZVZP7T2UkBRbkTVUKFX9cRI0k8nfU0b1e1urKg0g3BwsV8h/fupRbGLBhkj+uMSHJQE1xR/
	KHRjCH3KJCGIaO+/BNTrlCZCIH0dCNfNnf5Q=
X-Google-Smtp-Source: AGHT+IEsQJRdGqu/qTwBOaHc+FiLvZ4m8UDavPdSRUZGpJBwNjalNTkg+vxrzylDLQtfYyEHd3CBfQ==
X-Received: by 2002:a17:907:86a2:b0:ad8:a935:b8eb with SMTP id a640c23a62f3a-ae9cdda9e7cmr406952966b.3.1752694303989;
        Wed, 16 Jul 2025 12:31:43 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df54csm1226534666b.155.2025.07.16.12.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 12:31:43 -0700 (PDT)
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
	Cosmin Tanislav <demonsingur@gmail.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v6 10/24] dt-bindings: media: i2c: max96712: add support for POC supplies
Date: Wed, 16 Jul 2025 22:30:55 +0300
Message-ID: <20250716193111.942217-11-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250716193111.942217-1-demonsingur@gmail.com>
References: <20250716193111.942217-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The GMSL links can carry power to the serializer when using coaxial
cables.

Document this capability.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../devicetree/bindings/media/i2c/maxim,max96712.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index 758c0223977d4..b345305acc4c3 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -96,6 +96,10 @@ properties:
       - required: [port@6]
       - required: [port@7]
 
+patternProperties:
+  '^port[0-3]-poc-supply$':
+    description: Regulator providing Power over Coax for GMSL ports
+
 required:
   - compatible
   - reg
-- 
2.50.1


