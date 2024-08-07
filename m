Return-Path: <linux-gpio+bounces-8613-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE21794A39B
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 11:09:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F7471F22C10
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 09:09:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DA611CB32F;
	Wed,  7 Aug 2024 09:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="esjxEbAv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFDD1C9DE2;
	Wed,  7 Aug 2024 09:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723021756; cv=none; b=uJQRAd+X6GgzsK9VULqyayA+DhGbhKtMuP7cmlCEpu5r3iijFywO/t6KQ3HyJKMZJScsJHstZRfJoqzRM3rtrxL9GOh29AVwg30B8XnenVnYmHoJXXEgkl67ngBVkLXENyVTvqGxqhkKYiqv+vA3Ik+psw7bnTyNfxQzH3zxC+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723021756; c=relaxed/simple;
	bh=X7Xv+DGFOrGeA8UjWg/KHhlN0fIfygeRXB0K877bKVE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=h4CdGZH3pF9a2oEXZi1FLxOE8SPl4WrEbKUEGjMAc4SrXxVI3soamX2MeByQqjb+DmkOd0IJHjSa6Jgn0kM4BrDzzEYcYwNhCCrDHcur3QHinitEc/piASqkifAvgIOXadfsz/MzMSHnSn6UYR7gdnPhzqdRVuKo3DjqU5CpwVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=esjxEbAv; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-428141be2ddso10565225e9.2;
        Wed, 07 Aug 2024 02:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723021753; x=1723626553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CMHASFFm7n1fgyIaBm3TJS/QNjIvFojbcRZtCPlVMiU=;
        b=esjxEbAveQx9wi78Vja6pLjHaJDee6xz5qSKOYHqqoUm7xtEt65q7lyI4dkEbznQ0d
         MQ20EoJs84+BcFSA3pmFTrQ7nE8uA6Sn3920DG3E/t6h2h8SFqdy5ZTnYk909/urTtjl
         PjiCzLB8L0sh9OP2hQMNEdsOvufDXXy0yuW3cBns6XKz74BW/W5sgcwcSnEZMZ5R2owd
         xpM7peU0qfzioU/xFl/3gBb5HYbyYtiJMs8oHZiXWC7JZb29oy/whWH2inKj1tHditSc
         9YlchqCkY9BExwfaabUm9k+JCF2+2QWni+fAIEbSbp2GkY/k8LbddctGcOGxKk4JQmxw
         3AVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723021753; x=1723626553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CMHASFFm7n1fgyIaBm3TJS/QNjIvFojbcRZtCPlVMiU=;
        b=S13fY4T+Hrg0GMPJb/ZwRixYCHt3qWaMkXHF7bjLM/l9MxyPoLNZObNvVUhlix1e49
         7vMsk7KxjCDHhsla6GZby9tG3dTp7w9NJE3AvYfhCHa3adWW6YvrysiIpZMtXB7PJNqN
         xMkPF+kFZs1NLfHtmA9rNAlqdYo9U8gg4K+ng/LeRp2GgJHi+2Q/Pdh00TU6oE5uXeXl
         SI7KvrCGm7V6faMyo4sGTsDgyRt8S5J/IZ3cBhx9L+FMCT7r7EL03tubx9tgCCvRumP7
         7WvAP4wbuqpd3nVBBZPEWXIv0pDgQIAcaKRefPEskR7qmItEcUwWzkuAr5hlk/y96iIU
         bk8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWNP7QX3Mlyr5+j7TBrvYzfgU1RJPR66paLv1gES6aa+rb33yfi9i8yD/L0YJHNH7iVL/XPcTSWhJOUlDCLVRTuWePrO1cv8M1ZVZjUsgZU2dCT+F8wpeGyAAGdQ3jLBwA2OTtt3jCdupTOMceyhf3+UvHDRPmlYFXQ8WWRCTvxzuExqgc=
X-Gm-Message-State: AOJu0YzTCKC/OUXw74RehVy5IYOtYFL3eU9f/eGPa7Q6ptS1siTSOx4C
	3pABSxGQhUMoy8jRjfEGdK6/1ccF76EqbIvV2OPYwk7I2yZB5hf4
X-Google-Smtp-Source: AGHT+IE2aksSyfeDNo85hEOYerr1ryMHXngXrMWc3cGK4L1JQv2P2DF6u+qdb81ofX/P/mzF6OKekw==
X-Received: by 2002:a05:600c:524c:b0:426:5ef5:bcb1 with SMTP id 5b1f17b1804b1-428e6af80aamr115901905e9.6.1723021752580;
        Wed, 07 Aug 2024 02:09:12 -0700 (PDT)
Received: from ivaylo-desktop.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42905801d37sm19860455e9.31.2024.08.07.02.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 02:09:12 -0700 (PDT)
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
Subject: [PATCH v2 01/10] dt-bindings: arm: cpus: Add Samsung Mongoose M2
Date: Wed,  7 Aug 2024 12:08:49 +0300
Message-Id: <20240807090858.356366-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240807090858.356366-1-ivo.ivanov.ivanov1@gmail.com>
References: <20240807090858.356366-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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


