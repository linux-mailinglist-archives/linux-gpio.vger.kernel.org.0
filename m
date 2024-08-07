Return-Path: <linux-gpio+bounces-8601-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A846194A2CA
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 10:29:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 548A91F27454
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 08:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B7051C9ECA;
	Wed,  7 Aug 2024 08:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C4Q5Vpp4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FBC1BDAB6;
	Wed,  7 Aug 2024 08:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723019333; cv=none; b=bLUZERyFh76/VKBogVxIRppySvlB7ZZSagL73zNOwZmiLSsdbtc0kOmDWgnVaMDNTTq8s59WJQBQNCLIlK84uJynXkj9yYoJosl+o8FxAjME8JhXP4YqPluYnKfJhNf6sHulAzV9SE6EI2FKXBW2zwbLVR5D7nf//N09snelHaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723019333; c=relaxed/simple;
	bh=nZMIHVMh1+1HHhH4BiWp+XQD1nhfm0g7aT6TLqg3Abs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cHixr56ICFmEA4pP6E3+v+KmvtWHdywZWavXHkZo2rDYEU3a1L2ZnnsBgjLGz9Mwsy12U1njtmJeJe+38gQuMPFTnmj4pu5WYCmHUT0FplIxmkBQW9Pj6Q8IZS4h0SxTjA5iwWd/8LlGMaqpDRGO6rz0TI+CvMnxRyIuYYTwpi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C4Q5Vpp4; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52f01afa11cso2399859e87.0;
        Wed, 07 Aug 2024 01:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723019330; x=1723624130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1fpHuQogCgceFdtlFITdmKGvIkbU5QBuM0euZBYwH2M=;
        b=C4Q5Vpp46HlARK4M+guLmsVPVHHAMOYCU36JVFXF9WpMZidkc7ZHq+ORkbRxTi/V4z
         irZjUPfH2kwfhDfW5EynMSkJatYMc5QDGYMY5SETzrCjNdw4u29EESGb7DGVYX1jnRKb
         ZDAGYMV6NicRm0mo/KaKFTxG+vWInmRY6J9KsIQgq8Mt8iAKOLqk5GPWxK7QlEg90Z8l
         knX/CcqSJE6QNbTXf8Vc9ELB0VZHlHoEQ3rvlcuKr5DwwFUZLvZ62CobkiSbRzf15wSg
         HE+xisVp4Jig2urcSTlM8/RQ91V7G0PfbcEZ5PbcpCnh/TELQ7P1lClMH45uXGRV0NDI
         iCKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723019330; x=1723624130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1fpHuQogCgceFdtlFITdmKGvIkbU5QBuM0euZBYwH2M=;
        b=Tl9KWY6LfqiIS8p2aRVhJ9asurqjgORMph2UpA8PirPxRuG2tFrzMLUCOD3vxq3Vfs
         mAK4ELZzvz59rTjeBP4b0jNoSHR8NeRh4QN2+dqT5psRlhIhNE40WufDV6W4X3Lsfmta
         089h11uwf1GPRlZjLDQMxAMJe76R3pSPVSYjdh3+Vqm+b7SSDBgx0HgZeR1axHl0jOc5
         gQZ1yupdbA9mSBPcF6/3tC+qNXR+N1hoRyWCB4lTLPvnD2oVQKy1y5JFe2GhDPxs7szq
         RFDA4MrIIDEOMlHdpjnLJB3tAqkoitzfsGRksA2y5ukv9PHDJwSDKCY71XEp6OjSruD4
         lCIQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8pGYkiK2QpyJpRwvfHvAPvbnplCERhuB61O7aulurZwghUw/DOJBEfuxcy4qcO13wwGOzjrSq+8sGV8JciGuB6pK1y0Z93vVwRMgrsgOMDA59HnQaVK5S2ZAQOLmFTOqCdbzePI5dI37E5SPLk+qdSEZR5+YndhR+aKoKRKgCh2MDkAw=
X-Gm-Message-State: AOJu0Yw9UVVfQivSq2XVasXLpWa9d+E6iApYKfTnKiJbkKkWs+wXSszH
	Vm+CqwncPzPqdfdAsJ0L4LApewwvoQh3sQxdNEFiP4HBjk1nVAwK
X-Google-Smtp-Source: AGHT+IHGnEfCDRwGMfQ1YobZupl/oyETIdQ4zuqHDiD4by2l7T1Jene6/3o5Kg5F0hX/MZTbfLvqsA==
X-Received: by 2002:a05:6512:104a:b0:530:b7f4:3aaa with SMTP id 2adb3069b0e04-530bb3b4590mr11547596e87.52.1723019329449;
        Wed, 07 Aug 2024 01:28:49 -0700 (PDT)
Received: from ivaylo-desktop.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290579fb34sm18168505e9.14.2024.08.07.01.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 01:28:48 -0700 (PDT)
From: ivo.ivanov.ivanov1@gmail.com
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
Subject: [PATCH v1 01/10] dt-bindings: arm: cpus: Add Samsung Mongoose M2
Date: Wed,  7 Aug 2024 11:28:33 +0300
Message-Id: <20240807082843.352937-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240807082843.352937-1-ivo.ivanov.ivanov1@gmail.com>
References: <20240807082843.352937-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>

Add a compatible for the Samsung Mongoose M2, found in exynos8895.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index f308ff6c3..76df786ae 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -188,6 +188,7 @@ properties:
       - nvidia,tegra132-denver
       - nvidia,tegra186-denver
       - nvidia,tegra194-carmel
+      - samsung,mongoose-m2
       - qcom,krait
       - qcom,kryo
       - qcom,kryo240
-- 
2.34.1


