Return-Path: <linux-gpio+bounces-10320-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7254997D7B4
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Sep 2024 17:45:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24B501F22A06
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Sep 2024 15:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DA2217E8F7;
	Fri, 20 Sep 2024 15:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OEJThr2S"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A924A61FCF;
	Fri, 20 Sep 2024 15:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726847123; cv=none; b=RPJ+RrdR7h0Ne4ybgcpD8cKm5FtXtxAZJCehzH6LiE5C3e8qqyLJ8XrBy0cQU/wBULWyvjMueBB0phF7nWzeockga18N+LvpD/LnyNbVIo+j6L5ay7bxmvqdQ6nNSMV4Qa2nlGI+7UpvWegxz1MdvEi1UMWZJKHVkbA4oj4KG14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726847123; c=relaxed/simple;
	bh=yg4lWFLsux2GkZkTBE5nid/8euszrOUu40JI4Fymam4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eRHOstsiyNBlS58dKTQXk7i9/THgO1YT7U75NEDS7RydN7r7boiCsAdOwPpjFoAQYbWXLFVWK2Tf3+7WYLeM/XHbqxQ0+CUezd95mkGiJxrUjOJKIiFttvBodU8W1ani0obxW3cNWYcCh2H4Mcn9Ai7x1SXS93UzgbJyJPnQe2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OEJThr2S; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-375e5c12042so1236112f8f.3;
        Fri, 20 Sep 2024 08:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726847120; x=1727451920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gFTIk59DfHte/4Im9/5rXIn7HhETWJ2FxxMWTmfCArg=;
        b=OEJThr2SIO8zGRIVL8Baz+dVGqVF1EcKMRYZI82XSf1boaNUdf6Z8efZ+dANRBXwEK
         fnOa1jlcoC9HKRJTo+I4GqC6qEH51lq1M+qoFPKmTzly905Cq7Fceb2ZqeOaNYSq8YTC
         gD+vKTkN/XWVV3LPS23mN6t1JmcsWP774UHW25hro2yOgthG5B3eIiWBGCMpOSoNPxKb
         bACm7q9maYpPncYWa61ezp9hPd6TWPDNp5oUNN/ttH6zAXRHkZu4gzxnAPgpU9s3hTXP
         3Gj9nxHLLOLEC54xAEA07lRaDgOCbmQU6yt5ehBel2X7qb5zX7SO9cBhpj/vhg/56OK0
         US6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726847120; x=1727451920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gFTIk59DfHte/4Im9/5rXIn7HhETWJ2FxxMWTmfCArg=;
        b=fn/gfDjmotjcUIHnZOajViOkBjm361q/xIe2/pzbN37WsMZWg95A88JmvNwH3FdXbu
         RE89lif0NUb3uZXcswWIgjY+FLasuARt6gmY1EL1Hhg+nnyOTBNoPGe61AZA5Iyy7T3A
         No1BNagaOfnlYoSkGKFU9XqVB2B7+pcp4slYu+NFXJai44jvv1ujwAr2BdFrZ9+b4kSd
         kygjju/hD9Yv4XrGD/Ddm//la32mRyETRz/7vaD87vNhuvu6q22w68vj0971W1gOVcyH
         ud+RgD2LnS6CdQwFBObNKqsgHQedUxdBgwvSsBsJkdV3pjiuEjwHwcqHCv65JoFGYKXN
         JNaw==
X-Forwarded-Encrypted: i=1; AJvYcCUuCSq+Vwl/fzrTkMglocAQ3NAZmhmsnG+tWsqEZEEsv418exjv3yPGVFkMcNDN6hBroBKOqS9eiYF6yiim@vger.kernel.org, AJvYcCVHj9i5AfweLwMtpQAQ3B8r7VyXP3tc4ygwPCbSn4uYOz3a/pgxSHSagxC7h0xf4a6vwT4fCUJWdHhkBQ==@vger.kernel.org, AJvYcCXU7erJhdpz7YHyrQawLjUtIwtkNT2GXM61Pfc3XkwK2MEubjnXrmZM/gc0Gi2jMeUOqEGoOgun3ht9@vger.kernel.org
X-Gm-Message-State: AOJu0YyvmMsJJe7JFhJFLXYUXJq3+Z1+Y3xA8/tIaaFx/qL/j3ZDgtcX
	GPm3OyahTUXSuaP9YglAmob6JalMMZWYos7wKvgP5bew6tEAw4ST
X-Google-Smtp-Source: AGHT+IE1ed1khk3cPITwLgrPUAHSUd1bpo4PNU0Pry7ekwp7U0jekLc5F8l2SdED6qS6d0yr98kx9A==
X-Received: by 2002:a5d:6d0b:0:b0:378:c2f3:defd with SMTP id ffacd0b85a97d-37a4226bbd5mr2397173f8f.13.1726847119790;
        Fri, 20 Sep 2024 08:45:19 -0700 (PDT)
Received: from ivaylo-desktop.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e780defdsm17772839f8f.115.2024.09.20.08.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 08:45:19 -0700 (PDT)
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
Subject: [PATCH v5 02/10] dt-bindings: hwinfo: samsung,exynos-chipid: add exynos8895 compatible
Date: Fri, 20 Sep 2024 18:45:00 +0300
Message-Id: <20240920154508.1618410-3-ivo.ivanov.ivanov1@gmail.com>
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

Add "samsung,exynos8895-chipid" compatible string to binding document.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
index 780ccb5ee..c50ee587d 100644
--- a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
+++ b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
@@ -23,6 +23,7 @@ properties:
       - items:
           - enum:
               - samsung,exynos7885-chipid
+              - samsung,exynos8895-chipid
               - samsung,exynosautov9-chipid
               - samsung,exynosautov920-chipid
           - const: samsung,exynos850-chipid
-- 
2.34.1


