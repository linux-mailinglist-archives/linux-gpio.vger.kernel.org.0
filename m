Return-Path: <linux-gpio+bounces-10324-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B746597D7C5
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Sep 2024 17:46:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EA825B234C5
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Sep 2024 15:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E02B18562F;
	Fri, 20 Sep 2024 15:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BKvDMoxg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC86184539;
	Fri, 20 Sep 2024 15:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726847129; cv=none; b=IMoZnSuD2ufAHJjVHfD63zmIL5e54imLXf2T5/bsVnsNISf5LMRnCBpqsBP9g/PYFfzZetGe9/PpZrfUuG3KCMAt4atGd+9SVTY19ImLuSrjVHHnbs0lECNgAMkP2A/xomRPNJH7FMQtWs0A/58DrFOYN1Im3ZIlqNq23VCIVjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726847129; c=relaxed/simple;
	bh=yMd5DLIFL4KIeheK3HmX082PFerBBz9EYOrbqW0N5mE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bO5wOEJOZ0H/aXb3ppiRQq4rJPCLuY0Msb7ZMgzzqnX78lO2QHT6QUma6S3lnlicgt/oVPYFuaweJUqFVtW7ufrXngUqqhiNPkGBSwYDD7QT66jMrv/I7U+UR5N4HouUY0sIdgRsJKeuyWD0TjHQ+p6DYz2q4B5NlfHtJR01zfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BKvDMoxg; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-378f600e090so1313927f8f.3;
        Fri, 20 Sep 2024 08:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726847124; x=1727451924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qPlQaV17FO9rLqzivtvGzpDMjb4IPNY2uj/S533b4BY=;
        b=BKvDMoxgDecmVNs/W89OKHE27kvOGyPqbRVtIQafyZSX5zxxCC1IiT6rfPyUJDsx4T
         dPvF7TvVegxOd0/mjtUJPDAl8DPcrENzS6X20+hm353utYchNjOhPF6vGWrabD+ll5Me
         UfOMIIGyqr0OtMyo0T1zKDs3L1tIFR0fF2RE735F/zMldMTvx3L6nOCKTFmFvcVgPpr7
         VbagIcKU2dY3RmwFvyiJ0wswHfxJALgv67mgleaKA/KawXwskLLkyFomXnD3bXgBX7BU
         FmGdSHr36jjfGPTCxfFcMLACOoRH3wDbV08XT0hp8I10EfV7ISSy9y0wg5MhKhGgpB25
         BwSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726847124; x=1727451924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qPlQaV17FO9rLqzivtvGzpDMjb4IPNY2uj/S533b4BY=;
        b=gOLF6vfq0sMBPRsfZYvg4hLHiOp5A8CkCoU+pI0BEBDgJ8mM7/YOh1u4FgQomKzSCu
         yGLGDeA3a4gxkFXQKmB73duepNjxx1q9AS9n/td60gkKU64tCGD3Now2MH2hZmSWLBpE
         dBHHc9wEMnZipJQJe3oxLiEXOB0botiWgWclXh3T87tczJBhSA2k/CJWxxC3fIMtmQ6Y
         NpryAVbe4y2ryWTmiLWq8QvuAy9unZTt7H9pU7QIBjWFq6XjTyi6WMXtx2dSXNk+1X0r
         U1mnLpOtyDmoUW2lvSWgYG9CjcOQi22czxCJPhpMgFhAl7S6gIAeITUXAkEgAJb33PUL
         iLFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZHcPkyuzFrh9FgruTWjixNU8I3dmjfpV+OGGr7ygV9PO/PR6Go4L9WE+tZKbh2U0W7hfZmHxngQKK09Ti@vger.kernel.org, AJvYcCWE7X6giJcDiRswcB3rgOHVANQSZ/Zvq4h4TAPkmY27nXRUyiIiSMPXpS4iDfTh5qSfypOSGO7o3YnJLQ==@vger.kernel.org, AJvYcCXgDZWA4n1k0KS4TH48iVoBr7SKKP6Cc0ivDFL7qJR1xDTSznJt+8ecXKxreIUUb8YTWQqHVlXgu8Pv@vger.kernel.org
X-Gm-Message-State: AOJu0YwztzUgnbwDfxi1eUB0Bt7NUOqzFwliqTNzgoJuQaMrn1kCB5Gn
	IiF3HcCnCjTbKxXkqzjxe0xJgrCTI7q06dcvFP7f0vcBLyDiJ7NwO8rjtA==
X-Google-Smtp-Source: AGHT+IFzxh3Xfv8sISLMxWoeKGFXQDvnCwxt1UHMHCTChvCOz+SvynM2eOM/U48oQFnvfqlJex5UVQ==
X-Received: by 2002:adf:f942:0:b0:371:8cc1:2028 with SMTP id ffacd0b85a97d-37a43131abemr1678022f8f.14.1726847124363;
        Fri, 20 Sep 2024 08:45:24 -0700 (PDT)
Received: from ivaylo-desktop.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e780defdsm17772839f8f.115.2024.09.20.08.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 08:45:24 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 06/10] dt-bindings: pinctrl: samsung: add exynos8895-wakeup-eint compatible
Date: Fri, 20 Sep 2024 18:45:04 +0300
Message-Id: <20240920154508.1618410-7-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240920154508.1618410-1-ivo.ivanov.ivanov1@gmail.com>
References: <20240920154508.1618410-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a dedicated compatible for exynos8895.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
index 4dfb49b0e..91516fedc 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
@@ -42,6 +42,7 @@ properties:
               - samsung,exynos5433-wakeup-eint
               - samsung,exynos7885-wakeup-eint
               - samsung,exynos850-wakeup-eint
+              - samsung,exynos8895-wakeup-eint
           - const: samsung,exynos7-wakeup-eint
       - items:
           - enum:
-- 
2.34.1


