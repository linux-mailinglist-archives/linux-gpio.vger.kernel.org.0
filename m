Return-Path: <linux-gpio+bounces-19993-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AC5AB465C
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 23:33:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F37583A47A0
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 21:33:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D1C229E058;
	Mon, 12 May 2025 21:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jI9E6poa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CF729E052;
	Mon, 12 May 2025 21:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747085378; cv=none; b=n8Wngrn5Qj5gGMoedLFtiRuCCFJX+83CQyQ8U8sIFUox3LUfcdQmOcW4M4g+cvS4hz3kOjGiJwspAl7s0NdYwU76AtSIMQP+rAfDkVHnugpeir0gfmprmtaDC9VngSGNTo2qgQq65OxltdH9/iK/4V0vNGI38Yi47tw3ZXyi0w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747085378; c=relaxed/simple;
	bh=JnE6XYfviXuKDsxNfXJuEWgWM5BjaHUVzzw4UaLBJls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e5+WCvof5PsiCJPvmQsa4Zc6lifluikNOQ+yW2Aiqo4E0Ui1Dl2l1W/blmzftsIauM/mWstJcZVp8AhKddo9LZAuWb3nOZrIXu500dvZaIetLdlYuhsaSvguFFYiIzzAGyCVMMIGByA1lynSpe/XbDa2HSHTNl4mSk3u2d5Grpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jI9E6poa; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ad2216ef31cso554409966b.1;
        Mon, 12 May 2025 14:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747085374; x=1747690174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aj0AjGJjQ6DzFsBm21JwuZJt1umVaV7A/rQDK4jKmt8=;
        b=jI9E6poazbqc4iY9fJews1GVYcline+MnHK9leHmlZWG79lVvxNFTDLsKMCABJiqUa
         D6RDck2/xT48lbm6bCSZJ8zO/T6Trn+A1rpHbaLN7Pv7+qxciP4fGpSzLA7gU/hutSod
         oFrHP4CVm8w1kTxeELxcdBo3hVDDnXb8MGjy52ZGjJwA0wP++v/8Fx1GjxH4cG6M4gVS
         EkgIWZhhKWQUBOnvCtAFehiJNVJfILXvRfyxgKD3zV3gsA6AO3rdYiH3RYrqW8yOE7bG
         nCgIwo4HEXMELx1jk92fMKy3DOYzWpsVIsifzd7Af47CBnYOQ0CqBAYnqa5T19MEilG9
         /2Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747085374; x=1747690174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aj0AjGJjQ6DzFsBm21JwuZJt1umVaV7A/rQDK4jKmt8=;
        b=mMWN0DhSYqP/4zVsDbNh0mPRNtSSNz2Mvxk3bwK0EcQtrNqIZL+qEp7IoRM9f4zDqZ
         jhKt+Oq78xnRBLKb8xBP16nxiSSHwENod/1UnrNQBldGQLNnTaWo9EDnX67EpaTVkdpJ
         XBOdP2CtjglR3qUvejalC97/kwFwUqpGXPCQyjq/R3M5kS8+TXY2ZoQbpXMFMNnRMoN2
         g79iF2a7GYm6k/jyflgk4biSbIRGwwzsmPTGff0cB4SPRIZ0fazfQhiBGX3Jzn6ed70e
         miRVXoyqQhiRw2w41Q3lVp/g8GSzxTdZAhLf3NXNbzJYsZVmICvYsUFR3xnPJt/aeZdT
         UrGw==
X-Forwarded-Encrypted: i=1; AJvYcCUSkvvLdY4Yd5Kyn7xTC39bh0iPKxbekw/BhOO3xgnV0xSVtt/80WWczKsE59qYZ5ir1BJATTxVlH6u7GEt@vger.kernel.org, AJvYcCUzpIlU66JhwWc/h0JNsur/wcyHKh4lnab/17i3YzAVEOvpz7ZlrA3h/LCJertfeFt1YmA6ynW2AEyu@vger.kernel.org, AJvYcCVc4bmdLgO1RhZmMdQ6wX1K0HKJSUaGcY0jlGkINIn5J6asBS8StB+8WsKJKEl9kutUlZZ2PW/azC/D/WM=@vger.kernel.org, AJvYcCXiW7JIVyS2gdNaOFm8s84ypzrNMMPM71km0FCaKlXntM9/cfpXbqVTvhK2EXufxvA0bD6BmL5ar502+g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9/CMn7piKHpldrej05ihVmYi4ad9fpdx4MH5jNjWV9zLA+tAh
	ZgdQW2qx2w93JdoneIdPrp50liP6Y90RuAb9YqeX2U5kqtFAsKNn
X-Gm-Gg: ASbGnctYnPP/Fa9wjqhRQ9DC8gHiDphee1GnrAxv/bunx682S8IhvBjHie9nMvD3P8d
	fSFSbOKT2uuLh5/gomz4n5ayiXi61S1owd/YXESH25EaA+WL0tYY3ta+buw/DCdAC1SUdYsakLZ
	7LIVnVLWu7UlZ9VaX/iEIbp7MqEHYN868/FuK9brDC0ngzrrheUsxN4LePntTG1yU03Uw6Ar9Wl
	EQ2BZ/1uofnJKL0NXuSafzV4g130J1ym7dQKPV50LjCu5e+XGTjmfCVR9ckxo/lm/nDd3fHakFf
	nNUhCa41OyAgmjIBHmBT2Fv3vOnkqH0itmVtVpbBFQVUTp67gF78lQGd71ewsMo=
X-Google-Smtp-Source: AGHT+IF60+t2YYCvPtwjwNRfGqKY0KHkmhKRyLDewu+gGn5Xa385417TgpoSalLWHueRIccWcIUMMg==
X-Received: by 2002:a17:907:a0ca:b0:ac2:cdcb:6a85 with SMTP id a640c23a62f3a-ad218fef297mr1289068366b.22.1747085374466;
        Mon, 12 May 2025 14:29:34 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad23a5552a6sm472861466b.30.2025.05.12.14.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 14:29:34 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Liu Ying <victor.liu@nxp.com>,
	Ross Burton <ross.burton@arm.com>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Eric Biggers <ebiggers@google.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v3 16/19] arm64: defconfig: disable deprecated MAX96712 driver
Date: Tue, 13 May 2025 00:28:25 +0300
Message-ID: <20250512212832.3674722-17-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512212832.3674722-1-demonsingur@gmail.com>
References: <20250512212832.3674722-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The staging MAX96712 driver will be removed as its functionality has
been moved to the MAX96724 driver which makes use of the Maxim
GMSL2/3 deserializer framework.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 arch/arm64/configs/defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index cb7da4415599..6e9bd9072d11 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1272,7 +1272,6 @@ CONFIG_XEN_GNTDEV=y
 CONFIG_XEN_GRANT_DEV_ALLOC=y
 CONFIG_STAGING=y
 CONFIG_STAGING_MEDIA=y
-CONFIG_VIDEO_MAX96712=m
 CONFIG_VIDEO_MESON_VDEC=m
 CONFIG_SND_BCM2835=m
 CONFIG_CHROME_PLATFORMS=y
-- 
2.49.0


