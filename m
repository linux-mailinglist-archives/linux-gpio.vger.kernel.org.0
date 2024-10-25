Return-Path: <linux-gpio+bounces-12073-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBC99B0134
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 13:26:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FB911C220E4
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 11:26:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95CD7204F9E;
	Fri, 25 Oct 2024 11:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XsGu0M4P"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512D2204088;
	Fri, 25 Oct 2024 11:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729855520; cv=none; b=rmkNYtIJEs9gSOW7UExriplkPszCsGNnmtl6WYTNm+zMmitsqp7cPpJ59IHZzOvYT4aWU6pjISRVk5kLmeNZsSblvqmBc3869TqHu7CoS0JfsFXJ9L63WeIJjQxOqjhExxIxfK6njZ6p7XIkrsNo8mUTC6vSDC2p7sQ2kpdUeE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729855520; c=relaxed/simple;
	bh=xkm6m1i7s0SD+Mojc2S/i0Db8Qi+817SjtThULB3wpo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OKsyJ4/VeYzd4c5SrIL7RTaLlLApcGe1NuNm1joGugKcsAdOQhalMShix+2EBDVQYuRYRv2A5k6MwWsPZhZt74hG/E2UxN9fRJPkEAgsBZM4U4SMbIHnn6pp9r3eZHPTMpmn3j3DW9Bs9B6p7uN0BMsJ9ZAekcHCso5kL3O2v2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XsGu0M4P; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53a007743e7so2363350e87.1;
        Fri, 25 Oct 2024 04:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729855515; x=1730460315; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TSabGdTbzEgQbgybkjpgFSAHGH2meyPUW5UiWyeG4/s=;
        b=XsGu0M4PrBAGs9DBk/o3KtqhPgJZp11UVDfKriDb7y+onN/3/Ms5FB95mEvo0yduMD
         lwEyPnTupXOUAorvVZCmp0NIPBouH2tEJeIgY01OUqvi8Opd3hJVIFb+LjTClWCnFJ2E
         9TNrZ2kSNfCggfJ25bgjunsnH8Il1DR6JnwxoyEih9IkKWPhaVm3Xj57Gg6WJn2iLJfN
         X5t9fou20MLq7Gul8k4jPgJDCIXEK3mG9O0Ak9P0G5QcVKZjqtSjArA7DCR9/L8tIjhW
         G1YPeWeF/dxqbP6TdykDztGsGRpy0xZaBoJFjir6H3vElF5JZvpfQRp5HQ8Cyns9LXd2
         kN/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729855515; x=1730460315;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TSabGdTbzEgQbgybkjpgFSAHGH2meyPUW5UiWyeG4/s=;
        b=fYBAnzePsVm0VPFSConFo0elkGE/TuAvjKHVViQxh6M12Byo6gjGWPBNqfRMUYBY4i
         /Kfg6iVH/zjy/cUO2TNqjCHs9X0oJo6L9gBii1Iu3lQxK9+Sh5Vyho7LE5aRKwLwikg1
         H0O2m08G+gxU80wpSkRb7c/Xus+MdOF9yRqE7Golg1bxnvNrHtBrzT1wFN9AmcO8O8Nb
         zPFG3W1+F0gsjTGEws79xiH/brVx2tvKbGRybz4Vs2oLTge583neoUmIDJCbrxaDpiUH
         UuYM0gII1Y1bXapkZ1bO83jFqmYzfk+0zp9VHU9iwahbCLcdR2+/m9M4jgAjdk3ZsSNi
         SDrg==
X-Forwarded-Encrypted: i=1; AJvYcCUPMDdmdoE7flAXA5cXdd74u6GPA+YGZMYg4iJj3pyvliLfayBRWi7Rd4ozWPU6gbbZyIarnZno23F3SAVb@vger.kernel.org, AJvYcCVr5hVbS5C16AQrZdM2Gy/txAQ0oSLCaF8e1JppRAV6CCEPZp1L2xjCp9ngec7+sMxBP0VQ0v2K52iv@vger.kernel.org, AJvYcCXsUwVcR0GSJPE2EQaTFPFs3oLON0ZK544UVQZMO6TmCLrXBN/ksEB7A82Lpavw619xBBldP0a3TGzoVbGjwgxc3/U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNShGs+bX6uBiOci3X3wjtLL1aaAkdTxBvV98FXCT9AquGkagG
	1LFEI0tLuLaj2yO5UWwKQwrI30XwgQuayT+A+vQT02/l9jpl2r4bvuwlGg==
X-Google-Smtp-Source: AGHT+IFHcY7K1d4XSIRST6P1VbBbCeEZWecXl3lY04vcFn99wdvMSzSEVua+IVJCLBhrwEA8tjlE6w==
X-Received: by 2002:a05:6512:3c98:b0:539:ee04:2321 with SMTP id 2adb3069b0e04-53b1a34901amr4980825e87.33.1729855514959;
        Fri, 25 Oct 2024 04:25:14 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c90c0sm144028e87.189.2024.10.25.04.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 04:25:14 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Fri, 25 Oct 2024 14:24:52 +0300
Subject: [PATCH v2 05/12] dt-bindings: soc: samsung: exynos-pmu: Add
 exynos9810 compatible
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-exynos9810-v2-5-99ca3f316e21@gmail.com>
References: <20241025-exynos9810-v2-0-99ca3f316e21@gmail.com>
In-Reply-To: <20241025-exynos9810-v2-0-99ca3f316e21@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729855507; l=1024;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=xkm6m1i7s0SD+Mojc2S/i0Db8Qi+817SjtThULB3wpo=;
 b=21f+huUrG9w9oknHmtiwK3XoY/Q6yrjyTsZrvrrSb7fEVgnOXWWtlAJUmguq/tyDNYfKUO/tm
 /V5LCY7q/7sDSLXDv18ab3ubQ3hTZNIN0YkuNT0LNXZLwe98t7KIA66
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=

Add compatible for Samsung Exynos9810 PMU to the schema.

Co-developed-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Maksym Holovach <nergzd@nergzd723.xyz>

Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 5c4ba6c65e6926467ff0e90142ad62fbd0b9e1e8..6cdfe7e059a3556dfb872818f1b2649ab6b0e8af 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -54,6 +54,7 @@ properties:
           - enum:
               - samsung,exynos7885-pmu
               - samsung,exynos8895-pmu
+              - samsung,exynos9810-pmu
               - samsung,exynosautov9-pmu
               - samsung,exynosautov920-pmu
               - tesla,fsd-pmu

-- 
2.46.2


