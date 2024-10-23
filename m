Return-Path: <linux-gpio+bounces-11881-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B299AD7B1
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 00:37:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1BFEB1C21081
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 22:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5E991FF5E8;
	Wed, 23 Oct 2024 22:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lhJtydNP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B20145B10;
	Wed, 23 Oct 2024 22:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729723034; cv=none; b=qumndNzBgkPLGiP8gdZ6m/1nD00mqrTBaIUVpt1XFS03UqP8f94b5CCjsLmIEuICgLv9gY87XOs3hGX4HMzPCHeEZGftKweCjkB5bBWfIC8//8lWs3efvoSP8XzPHr/+Hnm0WaswsFxce1teIBljmM+S5r6qWHN4kRToxObDjmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729723034; c=relaxed/simple;
	bh=cpG1Nx29J0gY4AO1qRA6fivGN9PyoSNxFoCRX2mvL9M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FMcK4YK2xLXvmQ9dVUwK4ZmbkxG+S/XvNBdvx8inVmUpd+z83SJLFDjRNmM/h5HRgde+6HkjhMgaVEmrfNlWhj/FWEm1X3CFeStG4+A8GYh4CsVcdu4vyqtCOlNOwYl7hkHqMrZA4W3liGuIOHUuVaZp2KH5QMYV6WzNoYabIbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lhJtydNP; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5c9634c9160so313109a12.2;
        Wed, 23 Oct 2024 15:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729723031; x=1730327831; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bO/K5p2U79DXHc4kK88A/9gpCaRB2v4NPByU1GBG/GA=;
        b=lhJtydNPAoui0dGvdh3tiWl8huFpNyfNUhpJ65Sfwo3okLJni+0iSiRGVdl/43QCD0
         NUazAdjRAYBYZLeWv3rnuqlb4/ZC2tSWNV8SJ3bSCOGyIx9+0V6Cg8tLk8l7W0hGctVd
         lU7B5ZMXH/LNddkNKNPkVzx1E2mM6CGG82zhgJeXYjvrRaLmt4yKI+Oio5e3fR2B7gyO
         jDtHYPnbUqfTc7yi2FjocSFV2OJPINH3qw0qNmom6A/y7rCgqa8qbG7ZFNcobEEK4q0l
         xZQ775M+p093xtrEylF0bZQbcJgEu8rLm5YrbnKDkgkAFHQAmazV8pCeILS/nJX05MiR
         3YAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729723031; x=1730327831;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bO/K5p2U79DXHc4kK88A/9gpCaRB2v4NPByU1GBG/GA=;
        b=MmfPXfVqJyHYxDXmueaNC4oi0bF4hYOMz5FtjlbWcPL6VH3itbJ2XGQJY0TOcEMszE
         Mhnczy710/h+KJoJ7yaGVLUyKOtcGXHXO5iF/Dak+wQyMiHLeS1bO4Hga3tR4o7O3Ia9
         MSrsp7ZEqCvuhk/21xYQos3Mrzjoz2qlXxn12me+q+f/RuvAsQh4Thz+gZ+xqUQG+rz9
         p1xv+Cm57B1w1F5xkid5cLW7Scd/ThOW/ugTPRwoZGUl3BCayfz8UkKjy++6OZM0TaZ/
         tih9wi7IhGAr94AvPEFsHcGIHWP22FNF8bX/c8AFYKaoYOSex92VMaieNTGRwId5iwNg
         rBmg==
X-Forwarded-Encrypted: i=1; AJvYcCWBwjDm4lwZqs0yE1iQVYnv10TzaWsSHNZXgd0hvdPnEf4uGJRwFkCRM3F9u0ZWFxzLKVHQT1icwrXc@vger.kernel.org, AJvYcCWv5pgiupK00HBJf5dUOK/Q/dPEqXcRC4PYl6w8kyWrZj9u36m1n98Xexp10fHKbXwbmF/nRByCy54P6IB+@vger.kernel.org, AJvYcCXIpPAVXafYdiq8bB1AsLH11SoVP8PVRYa5dg96wkTN2JfBKtgCVHg3Snbli9m0oTUEG1bifDUoRAJ8F1mahfkkie8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDMTQfvNmej68tmA4/A53cELEQnu2lUinnrHm164KYUX9AdeTi
	A7S6ZqJb9oW5F4rEGWDmJbjBj5ydlh+11nddGi/CeIn5ehLHFtNu
X-Google-Smtp-Source: AGHT+IHZ+CYrvvrmQ3EnjgCZuEiiFDsrR82CvffNC6GtUW3LFHdSI6lk1bq+RP4M7Wm7F7Ps69Xeow==
X-Received: by 2002:a05:6402:1d54:b0:5c2:1910:8e9 with SMTP id 4fb4d7f45d1cf-5cb8b1d4805mr3609100a12.36.1729723030569;
        Wed, 23 Oct 2024 15:37:10 -0700 (PDT)
Received: from [192.168.122.1] (93-190-140-122.hosted-by-worldstream.net. [93.190.140.122])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb6696b4easm4907816a12.12.2024.10.23.15.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 15:37:10 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Thu, 24 Oct 2024 01:36:32 +0300
Subject: [PATCH 01/12] dt-bindings: arm: cpus: Add Samsung Mongoose M3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241024-exynos9810-v1-1-ed14d0d60d08@gmail.com>
References: <20241024-exynos9810-v1-0-ed14d0d60d08@gmail.com>
In-Reply-To: <20241024-exynos9810-v1-0-ed14d0d60d08@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Tomasz Figa <tomasz.figa@gmail.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Markuss Broks <markuss.broks@gmail.com>, 
 Maksym Holovach <nergzd@nergzd723.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729723025; l=802;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=cpG1Nx29J0gY4AO1qRA6fivGN9PyoSNxFoCRX2mvL9M=;
 b=m5ysXeGvP3WFcvSyvufc5GtOAnXmpcUQhaI+zq4ak1zxFK7mGCZlwPuAqgREGIBz9XATuLsvs
 YLA1xWVCU0yCGIxbYyFJDit4Mi82TVZOPXKQXwpSMMVtI24cnw4/+jI
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=

Add the compatible for Samsung Mongoose M3 CPU core to the schema.

Co-authored-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index c54d20dd9d7efcbbfe73e5a63fd2f61d1e010d29..2fa7d3513da839ddfb2844628b1249567226a025 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -207,6 +207,7 @@ properties:
       - qcom,oryon
       - qcom,scorpion
       - samsung,mongoose-m2
+      - samsung,mongoose-m3
       - samsung,mongoose-m5
 
   enable-method:

-- 
2.46.2


