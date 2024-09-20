Return-Path: <linux-gpio+bounces-10319-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A1B97D7AF
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Sep 2024 17:45:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6275287082
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Sep 2024 15:45:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E50E17DFF2;
	Fri, 20 Sep 2024 15:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VwLVb70u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C731E521;
	Fri, 20 Sep 2024 15:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726847122; cv=none; b=j0TgCKk36IjDHCkSrsArgQpmzoGPAeSZW5tVuMQBCMU+wf4+DV7d92m57zGaXeduEz7DTa2LGWYZPPeaspLJ/d2EXri0NU9ONgiMZ6lXAKhj2s2Kp2Mr/vx3mKZhefbW2PgZcbe7o40YO58qwpJoiq1HVeL6gNW+67rs1hZkqiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726847122; c=relaxed/simple;
	bh=iuWJjTI0mje2fCoCmmIcE9TUhsfeqtSk83XOw/Ho0+Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BZimXx2qfFUzl6YDwBpUczrWX6v7FeL4OH4SKLIZOBIslqPZKyZCk1eTaExcelE5Ty4EzaA6ccybnTOG0DInxgazVatQrDOkkJmcl+1c9Qw4CXbYDLWVAEF6Q8RRhSx5Q9csxitpzTVO11IxflFod9F+N26yt5h9ca8bDYrrF9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VwLVb70u; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42cb1e623d1so19763945e9.0;
        Fri, 20 Sep 2024 08:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726847119; x=1727451919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=81DH+LPBNoXfRGAcLzh8y+7rUBjIkmKd6TgqpUqqzZs=;
        b=VwLVb70uhzS2aCmssXv1Us2XLb/l79gmPNpUI/TC5Qp5L8//jkH2g4zJ0gi4JqkiTF
         5UQbKIxN91IHF+SRjprVXXwEwRoqCYM9f7I0bLWT0la50YfasyVGfo4gitlwrBOOcjki
         xYnF86eYz4CL0KOfDZevL1RaSWweddwq+SQ6D/f9GsFla1rZkYnuOb0kvkVx2Xtpyo6o
         Lph9/wwhxizldZv3avhVEHiWjFPp4JQnSqS5fsuI09S2uC15b5MCPaQ2UoTxIT2EVSH3
         EMWqjJeutw72z4N8bG6WDm4JDu49SiAcHmijXN/YgL43kJFOrK1yeurCGekARcwCIYY8
         fzfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726847119; x=1727451919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=81DH+LPBNoXfRGAcLzh8y+7rUBjIkmKd6TgqpUqqzZs=;
        b=ee+M8KvUmxh3vw9CSUkdik7yCU0D/tcBFTYmwMF8oeRiAqe4pbyOSAWoRJxstKnA4V
         8zkE1jbURG+2q3fQMJnn+ZHYLbnEU7k7zGwz6N5waUOFULooYgWyI2v/6Qxb5LHb/qiM
         gR1tuhbpVRPb0b8gx/5EA390tJ71iQmKbeyAH+HKrqqMtmHPqpstGcC2u1KyIElhBcdV
         0hrlGDfd9LLZWcwwCV4oXluOih9ZuUmxD1Pr3mFqs1YrzbqzvnF4JP4HKtinRYG6tntT
         taPXM7ftAhsFEi8d3x+5tzK89oijmT72bYCji4T7Rt85rEx220/sm3i+CPqV27PEqoyi
         uHkQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9PVfmjFZoYwtCLYa5jGqbCVl616dCeCPc+RonI3Mazf5K0IoqzIdYbVJdN3zRQ72ZRMZzq1dDuQT4@vger.kernel.org, AJvYcCWGgGpL2SPTcMyEQavZjSNqaPNM5R5abxDSSW+Y1qUQHtAa6Qhk2GeOIPEgXUeKh7kytJKVDShhUq8u0Asw@vger.kernel.org, AJvYcCXnfbMfzLFx4zRcMFoYsz9XrTXiSh0EYCwPxgoBCLt3gLy+kxU1WSzwkawcH/4ZVdNwpmTGWCAmj9S1tg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbkbOct6UzcN7b7kGCg2r+FKIw/VuSibkHxSYNaS/vSJiLzZ5A
	kpIwcD+NJzAFnhXM1tAg5HrNzJV+8SqrxaKs5cutIdlH34Z4C+4F
X-Google-Smtp-Source: AGHT+IFES9eAEURNK64oZ/vhIIUWfp1AEFdGWhq8oAHMwk9Y32ZRnJxdZyCQ0tUZu4FVwnhiYM492Q==
X-Received: by 2002:a5d:6291:0:b0:371:9149:dc54 with SMTP id ffacd0b85a97d-37a42252c2bmr2146433f8f.3.1726847118430;
        Fri, 20 Sep 2024 08:45:18 -0700 (PDT)
Received: from ivaylo-desktop.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e780defdsm17772839f8f.115.2024.09.20.08.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 08:45:17 -0700 (PDT)
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
Subject: [PATCH v5 01/10] dt-bindings: arm: cpus: Add Samsung Mongoose M2
Date: Fri, 20 Sep 2024 18:44:59 +0300
Message-Id: <20240920154508.1618410-2-ivo.ivanov.ivanov1@gmail.com>
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

Add a compatible for the Samsung Mongoose M2, found in exynos8895.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index f308ff6c3..e41a8aec6 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -206,6 +206,7 @@ properties:
       - qcom,kryo780
       - qcom,oryon
       - qcom,scorpion
+      - samsung,mongoose-m2
 
   enable-method:
     $ref: /schemas/types.yaml#/definitions/string
-- 
2.34.1


