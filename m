Return-Path: <linux-gpio+bounces-9913-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E768F9715FD
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Sep 2024 13:01:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93A081F261C3
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Sep 2024 11:01:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0CA61B5802;
	Mon,  9 Sep 2024 11:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AAQbrmSw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2647B1B6535;
	Mon,  9 Sep 2024 11:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725879658; cv=none; b=TMmgucMI38YVoZeU+U01uC/J/xs/TtmK8w3SrLlCummKTJPViLiiBWEmDo/oeB3nLjZelZT358oj50pXLi55f6K7j9e6kVeu0EaxWssO125EYs91xM7SCmu/P6BrVPhdTv/dYx7sY0svy1AZEHDRqSU4Le1+H1GCnO02iE1D6ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725879658; c=relaxed/simple;
	bh=BACZp2t3koNpk0Kx5baIyUrgPL9GxILVFw3r67ukXfA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P9nOsktfV9lJN6OngWCK5VTJ0UmAGX6tzMC9L7oFBatXK9uJFo2Ys5jCvtk5CJV64zV+ix74IpqlqJschtnH86U2y5uHWlIXcj3oRiQpecyUfQ219Z/twguvekLQsRPz3fI4bKJP9KNynCa5iC0/k/eqFEtJ3astARADLX+KiHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AAQbrmSw; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5c26815e174so4286009a12.0;
        Mon, 09 Sep 2024 04:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725879655; x=1726484455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+rRgxOmYLi2N4XWgCIbZjKsFXKXkm9CvD8Sxq31aYg=;
        b=AAQbrmSweLLe0A1w/vKiHVpZCs7C2mq6t9QCikPGXWXHYiC5XVqZzI1PlcrjCz6aXn
         AKCIXYs1tM4yCigXmI13/nH2Xai/erb6T8RbtxjgG4C58IDH7Y7+dRn8jmR5kNg/MI9o
         x9Zg6azqFI+QTD6daA9KKfrAADCmfnxAcNpEWIyXP9E0uXzkDmbnFhK98bz3nBNQcfA5
         d8QtZejIqRI1P0YEVXuAfJoR7z878EbssM9NZYVZpxNs4JpGeIalwT9qCk5ro0l0WU2I
         DS2NdUbJYTnP8zP8mXxsk1FC6xxKGjUzmw+9xgfXByt0FHOv5Wu121PGw2H+cvdlX1ti
         MFNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725879655; x=1726484455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I+rRgxOmYLi2N4XWgCIbZjKsFXKXkm9CvD8Sxq31aYg=;
        b=rlxr8tn+FNvPWmA3rle79iKCaZWnpHn+BOwaY6CmZjJqY2U208HG3Io7B0qDyzV72E
         Kflk1Qnp5MpZStsq8s1Qm6FkRXtsdUyZOWJP9qP5K9xMvabBSO4fWAM1olQuAZp3fe6Z
         Ei48PNQTcdocYVPVSSLSCtypE3ui0v0AHOOp+r19P1f/QX2uyuwCRbVWD3RzKRW51VFf
         jsIN7K4PQIqakjc60lIaVINShWzHU5+QMIwKxk9LNB0bISA+EXg0ec5xyNuvFyS0Wka8
         tzIUNFDDmzXqRP3qp5U6gCZPsWClon+IbSY3p8XSXHloe0TyjTm+yxrTtdM1xkz9kN7p
         5A+w==
X-Forwarded-Encrypted: i=1; AJvYcCVD119DsbMYBPoJhDZ2JKgsCpvCd4KzWcxXhVkEqaUj8BqyEh7TK+tg80r124vq5ku/JVgnvlWs0Vla7w==@vger.kernel.org, AJvYcCWMIa6MmaC0NuVpApFhaDT0IXRbKATIniaV0N5XqS+FJFxXb4ivdXT2iBO11A7zwtQQkQ1c5nI2YHsI@vger.kernel.org, AJvYcCWl55zDZsF3imFmztpDnt2R8vPILVBLbmWVGNi/Gusb4UAroaRKyOjR37tPLaKMuVo3q6/ZsGK2Fb8On1hl@vger.kernel.org
X-Gm-Message-State: AOJu0YyW3RdYwFfEvjC5bV52G/g1Fu022NDq7RMDuZiaQOR83gsq9Fti
	Ga0NlkQfvy6wDCwF4YEJMEeQGjnksVFhyya4dcfdX9kBd7gzmgqihJWD0Q==
X-Google-Smtp-Source: AGHT+IH1Ie6kAWymwwuiZBPFeH2PQ325SceyxPSVsFXekj70QFzxXJ0fKE4lMuD3u6SHpfqC2Y8uaA==
X-Received: by 2002:a17:906:c103:b0:a8d:571a:e863 with SMTP id a640c23a62f3a-a8d571cab77mr229940266b.25.1725879655469;
        Mon, 09 Sep 2024 04:00:55 -0700 (PDT)
Received: from ivaylo-desktop.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25d5dc74sm322649666b.208.2024.09.09.04.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 04:00:54 -0700 (PDT)
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
Subject: [PATCH v4 04/10] dt-bindings: pinctrl: samsung: Add compatible for Exynos8895 SoC
Date: Mon,  9 Sep 2024 14:00:11 +0300
Message-Id: <20240909110017.419960-5-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240909110017.419960-1-ivo.ivanov.ivanov1@gmail.com>
References: <20240909110017.419960-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatible for Exynos8895 SoC.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index 242dd13c2..a2af2c88a 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -53,6 +53,7 @@ properties:
       - samsung,exynos7-pinctrl
       - samsung,exynos7885-pinctrl
       - samsung,exynos850-pinctrl
+      - samsung,exynos8895-pinctrl
       - samsung,exynosautov9-pinctrl
       - samsung,exynosautov920-pinctrl
       - tesla,fsd-pinctrl
-- 
2.34.1


