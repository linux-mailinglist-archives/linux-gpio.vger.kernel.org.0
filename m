Return-Path: <linux-gpio+bounces-8614-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 491C494A39F
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 11:09:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 798EA1C21374
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 09:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A66981CCB4A;
	Wed,  7 Aug 2024 09:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AYGO9jln"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFEC1CB317;
	Wed,  7 Aug 2024 09:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723021757; cv=none; b=fJac3Eeco713BfkzEa14AC9Izq3++vss2ZClSkdEeNF5yQHDhPXiCm5tvJ55NlOknb6qpAHYP2+q9NcOk0U4mVCtXgFkZadEhMGox/5UUUtu+rA49wOQ6sSsuQU/Ds6PEjOA0SjiFqdTClRF/p9YQCHv5lt+M3FctE6cTSutc8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723021757; c=relaxed/simple;
	bh=jZ0OlPFzndEtCjjw+ok1vNdnwb3hzi1iDyj0FdTNykc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JsV2u/2aTu9oxN58uhWlHMPk4g75D0cBdjdiUFmvDL1XxMa1n76fuTLMBetyvoRMgHrS9aXAjmhnGlyXM7a3N3ExwwRfUoboIaUQOQhm+mdR74Ro0EBYWwMHcSO8G5OqYfwFWCFU1wFY5VHcUCTOn3tw5Kj7HRRZdIK5Hy7mMSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AYGO9jln; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4257d5fc9b7so14757665e9.2;
        Wed, 07 Aug 2024 02:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723021754; x=1723626554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CgddiJuAJeHLG6VgSnhOl+X5C5KvFbVs0eJ2zYji8yM=;
        b=AYGO9jlnHCiGb52oEIDYitisfK3UPcYiMUTz/bbtgxWMRNurp5YrS8DvwTad3QoLJE
         F/YAtGrH41M0dxS46VpTJ1PASc81+Pj7wuVLeLromn8tOqOy0QFVZXFz2fu8LLbSSiYN
         p/wgRXvi+n08WCAW8H6NGu9R4SZJkhfm+vAdPdBBUHd8pgfN+PM8IDQSXSiasSiQrtoZ
         pug7AZa50JSf3xzor/NIs/efl8xIpCPS3nY1mRlKn9VvYfsLmx+vsZjRh/OISW7UQW8g
         TssUfXN/k6kIsTeJlgwsoeHMmKMuagghogw6qwCysnLQ7bOX42QOJjGAKx1ddI+7e6MR
         p4HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723021754; x=1723626554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CgddiJuAJeHLG6VgSnhOl+X5C5KvFbVs0eJ2zYji8yM=;
        b=ulmaUUmffdfQVt7fA9R0E4iUEERg9ltEQGZ0+jBrOvmwkJkTvxECNlmP4BdBoIwntp
         05UvukX5n6THxjvDAsurvOXQ/hKY0oqgWlxS7qyvGOExwQywR5viUfsORmJn37hcxzLU
         h5EjW03/bsb12VPmDZC5zCXmVvhO3XCktSGNnb2/1O62eWYTtNsV5/ns5f5+QLZSbxEE
         gA2VdReNwPRiwhk64MYa6xsgFPgfRytkoseMewUhKSFj0QdGXGmz82QbKj5e6Y093a9q
         nzLNyaN1GLIt7BjCHgk4nwL4ecJk8jdoPl/DXuGrD+tSppvuMdI65Cg6mvJHnzhjQU9T
         nozw==
X-Forwarded-Encrypted: i=1; AJvYcCVmdIDy8XFTLi/FY38qIaEabFawIEzke+2yGZsctv1mCkBtJPfWc4nDNLBN+PilMX+8a3wahvUwgHdZQ4ofZd95azfx2iAZmFZXq/MKGLLxT7MtGTUVpM6b2bc9t+xtJrGBVJiZKGHO+P9SSo6dSFAaFgcAb8XKB8yCiReNHPZJqlS0kWs=
X-Gm-Message-State: AOJu0YzAbXx+aVtr4UNJjMGPsoTy0rdyuQ0oeyDgEYYrFyn21t3qWwl8
	ILIyuhuRNFO9UN0KbcGuMjo0n1xvyjWUkmsTJuU3xUPYTaMmqQGe
X-Google-Smtp-Source: AGHT+IFY5kYptyvuicJFawuvjdp5LpaWIq8c1XNuH9hPIkJQejmu932/4A2W2hohPcvL8V8qxYN3zw==
X-Received: by 2002:a05:600c:154c:b0:426:62c5:4731 with SMTP id 5b1f17b1804b1-428e6b7ea40mr162786115e9.29.1723021754104;
        Wed, 07 Aug 2024 02:09:14 -0700 (PDT)
Received: from ivaylo-desktop.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42905801d37sm19860455e9.31.2024.08.07.02.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 02:09:13 -0700 (PDT)
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
Subject: [PATCH v2 02/10] dt-bindings: hwinfo: samsung,exynos-chipid: add exynos8895 compatible
Date: Wed,  7 Aug 2024 12:08:50 +0300
Message-Id: <20240807090858.356366-3-ivo.ivanov.ivanov1@gmail.com>
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

Add "samsung,exynos8895-chipid" compatible string to binding document.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
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


