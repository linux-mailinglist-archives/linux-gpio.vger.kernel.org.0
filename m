Return-Path: <linux-gpio+bounces-9645-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B487969E25
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 14:46:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBC58280EC8
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 12:46:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADAE23DAC1A;
	Tue,  3 Sep 2024 12:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RrlCaRBX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF93F21C18B;
	Tue,  3 Sep 2024 12:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725367485; cv=none; b=nxLbDfeB1QUmVrQNXIK4bSirvYpdJz/R6V0zfVkaCfhtLpp3oQj7to3t7fPkzby3t/UfslWm2mM6jRczH5UR2UQacgdVgtS0aqHszBX+MmIT/jNpK7hCmLn625PokWjZnEaVHAxInDHX7jpvi9Too9CtgDECL8FBn+fJbj1AiFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725367485; c=relaxed/simple;
	bh=yMd5DLIFL4KIeheK3HmX082PFerBBz9EYOrbqW0N5mE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fhcqGysusYlI5gD9H38W1GrSqDiSu96uY4tl3rVVj9PO/4tj+SsFwBrb+zrhvilbdJMwyJufeAaztIWiX04tIYAtMysnYPClSC4ErleNpZf76dvmrppkStki3K4kQPbZIPTc24x5x0WCO7AOxwDoGKtytkKpYUU873E+B3xJwo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RrlCaRBX; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5c24ebaa427so3476521a12.1;
        Tue, 03 Sep 2024 05:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725367482; x=1725972282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qPlQaV17FO9rLqzivtvGzpDMjb4IPNY2uj/S533b4BY=;
        b=RrlCaRBXgh9L4TdSNeDqwF/CFosfuCn79CQWfi/MzlfqQQKD6mVZTliGuinMVbIfXo
         yUCnwwKHIg247YsE1O6NjwiN1LeyMLYQ9rNwWVfEnC1qM0b/pGxIRD/xlO+b4kkZupd7
         3PPkhj16rh34UJzZumh8rbvZQ6kdKMdjmBjcxE1xJcDt4s8L7QUaoo7rTsqMDlnj+EGK
         FG1ETsejwff/0/1LGVqksWPeBdixYo10V5p7X+EwdH9Ab7wz2mQh+0dpdY+vStQFMo4r
         PFtKtpuOkB/G+hxxqdIgjbS9bGqbk+jHxdo47ZAqixAG/tgyvlILFMWw92jkVhEetpib
         NGtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725367482; x=1725972282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qPlQaV17FO9rLqzivtvGzpDMjb4IPNY2uj/S533b4BY=;
        b=okVrT5taOGGxj/Z7FmL5DNU9jrp8uACrZnGKP2f9Icv819A7jWDT2bMxeYxOdYU190
         r/H0T8QRYltIthq+zKg8hye/mwDAV+9r+XZ2X58g2OfMzn9COc+eAck1e6vxz87aYbAN
         7rbJT2b/gwDYh8mGEUh2Ic7QXDB0J325WM6QQI/OHfYMYPCLIPFSd0D2XZ//Js/fuZuu
         HlYCehfQL0maj/Ptfvf86cqbh2hDY3DApvN8zDuRG+uGqRyHsL0NXT8HbDKqRM20SMZU
         yLx2sXgerIhrUx6e3p71hfq8JIoW3BNGoLhiw9JOqBlgAvGxm0S+YKmEUj43RhZ5MzYn
         RXPQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3790t+/dzIVFJWGYsaD6hbZXN+l4epR7BFh+9Lnnw3rAt/en7Z9IxdicX6hb49J2+1UAr6dhl0md39g==@vger.kernel.org, AJvYcCV62Ww71Mw3ONsckrf+0ibuNA8avD0R7qtHjINBWRbbaJCRpKJzhhDC3dnXWDFVz3eqrcut4kmKydHz1d5/@vger.kernel.org, AJvYcCWX61BUwi7nZbPcIlVm4A8HvpoDZ8GxyvyV6+AnAl5FUxNUI7Zx1OF6UsKE46FgAKLiWZuBncswF0DF@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+FgWPnLV1WagRHVNu+nWEBVxaZYwnA4t0glVvF/pZWHbvR9Iq
	cu4lF22ZhkE+GO7iSFO6dZwP3vmWj9TBDcvsuo3K0x+RWYneTiRg
X-Google-Smtp-Source: AGHT+IHrIE/cTWvhr/2/6vY//0TDgUXD9vtzjFKo8Wsi4lJqMPelBlmr47ctpMp5L1ihba+UNi7YIQ==
X-Received: by 2002:a17:907:d867:b0:a7a:a4cf:4f93 with SMTP id a640c23a62f3a-a89a29f6270mr1364210366b.32.1725367482112;
        Tue, 03 Sep 2024 05:44:42 -0700 (PDT)
Received: from ivaylo-desktop.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8989223199sm678461566b.219.2024.09.03.05.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 05:44:41 -0700 (PDT)
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
Subject: [PATCH v3 06/10] dt-bindings: pinctrl: samsung: add exynos8895-wakeup-eint compatible
Date: Tue,  3 Sep 2024 15:44:25 +0300
Message-Id: <20240903124429.107076-7-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240903124429.107076-1-ivo.ivanov.ivanov1@gmail.com>
References: <20240903124429.107076-1-ivo.ivanov.ivanov1@gmail.com>
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


