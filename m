Return-Path: <linux-gpio+bounces-26887-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8141DBC3983
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Oct 2025 09:32:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B92B3B7FD1
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Oct 2025 07:32:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36E342C0260;
	Wed,  8 Oct 2025 07:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HC63w0IV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA2E2F28EC
	for <linux-gpio@vger.kernel.org>; Wed,  8 Oct 2025 07:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759908682; cv=none; b=VGP5CtpKxLS2vP6q2VTTbzTlMFNWrn1e7l1JmB1QNm12N18j0zU6+2G4xuKBQXX4rFTHvGx8ABFx8wyBTpaBilV4JFuevbFaVMTSxDoHbfanOyofJwI9DooE3QvLW1ECqMsLJt0Rr1lLHcyiQi87h9KUa7Xu6PnTo8hWI7Prx4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759908682; c=relaxed/simple;
	bh=7dAHRT2r7ftPVN1rS5b3fLL9XXBwlAPnHlEMfM9TlgA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WSpGwlZF6DaoLNZqN6WCcN3eCeN/++xzxrwFv50sP9Lg8Iaap56i5Y9pUXa4UrUp8IRbDl7WZ2bZAuY5c/0Je6Fa5tyEa49h8dGyQE3gkvj/OEG6ILnxJY7gGC1MUkKjzEVWia/vzkoPOwcduAskoYPmf2v0JBB8geLuIJd96d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HC63w0IV; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5797c8612b4so9430824e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 08 Oct 2025 00:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759908679; x=1760513479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C/43znEe061f/mLeX5mGh0JaDqN09K9lxSSjlK2dh/Q=;
        b=HC63w0IVEJO2+Ai2+MASIXbe41FALbGsbXtwYzpJUnPkTN/8g2eo2XBI6cAuDZrSNL
         y0txA+GPYvQ7IOmHGFicDeHhJEYZHAhWsIpplNM4iwbSI1nYd+UShSk1H9WO2cP4xcAF
         XI0I6HcCsBa0ekR1JA3lYg8xBfqAtO5wPZJABB89b9NMwnHixRgsDoJlhuz1VSDPnDWZ
         O5PgD7h0jWjNsDfo0j6AlorU38qVcOovkdXKPgF3ZJx8Ys8TfybM4lOfBYQ+cmlTcf1n
         tUWXbB/+yVoB8NAis0s74TCL2ASxBorVzbmRgQlW/PfQU4uHZr1UlP1RH4ogxMNxd63f
         b0PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759908679; x=1760513479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C/43znEe061f/mLeX5mGh0JaDqN09K9lxSSjlK2dh/Q=;
        b=vMPWRlpIgVbniYxnHCe2d10EWbPgHgP/8RDMNHVGiqKZVPSw8aOW47kllvjon5aueP
         9DzMrPqakDpi7BaRUBxLX5stttBx56gYtxvEOr4qvhC9x5vTrsoP0RYAHFRNkiMGnwjB
         /DP+ChMLJfQXktHW+Wo5ZMSFy4vt4vu0HFapz95Jk0bc8w47ScuBn6Nvr8RrmvEa8KyO
         u5oNSGLqipAvZrNCXYoU01xzq/V/xK5OcBMWh4PvJ4yp3Owduybv1DMxcn6DvuhBU9yj
         rxM0ehj9Yc20Ya42DeUc6VFpEX40eaIAAIPrh1oTwVTlPm4lHz1YhOYHxBH5QNw5eWGh
         76lQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJ0SVrpbSrlUfgb3UHfb050+rzU3BbEleZockz0eawRZtTEx84s+uvQItvNNwlIjtfEnAKagOxZB/v@vger.kernel.org
X-Gm-Message-State: AOJu0YwosB4M9FfkgNzru71CvFG4bWDy6rX03D8ArE9X7zKkJOV7iP4j
	26oWlaozQXiEzj1hqMYW5J9xLEyI5EwVtzsNf4ebxBfdJSDZ8DbfcxH1
X-Gm-Gg: ASbGnctiVaHxz4TYm+aUgkeRXVoZx5j0P8EuAZH+zAYV9mxoRxTFFvWsDtrHkIoAnG5
	Mo+k8iTXTR0Pi3IhyDJWOn8rwDPp3IHkWaXEwyhq0erTvFXoexz6MFXmsiN4th0u2o2fv3Fyx08
	xZLpc4T98r5k3tHe3eftaSVvEBq3bI3Xe14fWW496dxduX/HenOU4euvWk5hBooLuq/f3Akx2mH
	TNypjZeu8lN9fhI4UdZxVKH70oqZae2BCq90X5ybtEACJ9DY+9bXoE+kC7LNUHI4BdtLrxT/biw
	wIG6GBREvC8iK2eI3ahxYylVftLdz/Jb7b5uBIg8BRNQUsK6ewxyI/JcGmVLf88uNV+lnTERpcD
	JouyPkPfES9VpFvAn8qrIYfyOkOwvJSrHHq8Vug==
X-Google-Smtp-Source: AGHT+IH6yVzn596rSyB3yJ9XBLWXz7u+miIMTSdihRGfwsNDTc+rfVY8kk2V15qCy1XHoAjhkBFITg==
X-Received: by 2002:a05:6512:3daa:b0:585:c51e:e99d with SMTP id 2adb3069b0e04-5906d896bc4mr657722e87.3.1759908678413;
        Wed, 08 Oct 2025 00:31:18 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:31:18 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v4 03/24] dt-bindings: clock: tegra30: Add IDs for CSI pad clocks
Date: Wed,  8 Oct 2025 10:30:25 +0300
Message-ID: <20251008073046.23231-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251008073046.23231-1-clamor95@gmail.com>
References: <20251008073046.23231-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tegra30 has CSI pad clock enable bits embedded into PLLD/PLLD2 registers.
Add ids for these clocks. Additionally, move TEGRA30_CLK_CLK_MAX into
clk-tegra30 source.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/tegra/clk-tegra30.c         | 1 +
 include/dt-bindings/clock/tegra30-car.h | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index ca367184e185..ca738bc64615 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -53,6 +53,7 @@
 #define SYSTEM_CLK_RATE 0x030
 
 #define TEGRA30_CLK_PERIPH_BANKS	5
+#define TEGRA30_CLK_CLK_MAX		311
 
 #define PLLC_BASE 0x80
 #define PLLC_MISC 0x8c
diff --git a/include/dt-bindings/clock/tegra30-car.h b/include/dt-bindings/clock/tegra30-car.h
index f193663e6f28..763b81f80908 100644
--- a/include/dt-bindings/clock/tegra30-car.h
+++ b/include/dt-bindings/clock/tegra30-car.h
@@ -271,6 +271,7 @@
 #define TEGRA30_CLK_AUDIO3_MUX 306
 #define TEGRA30_CLK_AUDIO4_MUX 307
 #define TEGRA30_CLK_SPDIF_MUX 308
-#define TEGRA30_CLK_CLK_MAX 309
+#define TEGRA30_CLK_CSIA_PAD 309
+#define TEGRA30_CLK_CSIB_PAD 310
 
 #endif	/* _DT_BINDINGS_CLOCK_TEGRA30_CAR_H */
-- 
2.48.1


