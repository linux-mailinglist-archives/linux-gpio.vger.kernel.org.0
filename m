Return-Path: <linux-gpio+bounces-17325-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B6DA5823B
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Mar 2025 09:49:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D1027A5325
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Mar 2025 08:48:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD3BE1B0F14;
	Sun,  9 Mar 2025 08:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aVLzi7PK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5831AE863;
	Sun,  9 Mar 2025 08:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741510123; cv=none; b=HpbLbAR7XnsWAwQPSmTYZqm+pveTSnCa8yuJyqKqYIkNQ/tuSQQ5P7TnxIz0W67S8M/SkUPOzDUt8k4nbVeK171QRc/YP0JrNKjMGQNyE1mCdGXrW+MHzJmHFt/juFjqSVlmUHNolPTkxD0PPqg3PV3+emkFGLX2mBU7rLrulbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741510123; c=relaxed/simple;
	bh=ANWQWoRfpwfrNfunB2uoB5OyyjdD2i2V6N7Y100R4W4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YSRMIMBqMb9AGHfpgmZGQnY0RKXZ24pkRYrXyEC1cgtm2eVACgrFK7WvSe87lzW8XhGnCMTnqi5uOTtDSYwrlpCRy9Dozf/lWe0zcjQYPU4BwwI+oK0KZod2kPKWsMm4amFjSPE9OpkRgeXl4LaW8Prw0uUorGG1f4zGzt2gU1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aVLzi7PK; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac298c8fa50so17063766b.1;
        Sun, 09 Mar 2025 00:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741510120; x=1742114920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=77ZQnV/idoKQSJwHe+JyKu0EB24gfw5+CVNFL3AarEo=;
        b=aVLzi7PKa7WsAG5bonIWEigUqClPt3WdVjTSDYO6yWpVg7sEciqfoswNR/hFTwzqL8
         pUONbCv+LC5chyIrmTzc7c441gNW4DSIwbC6F27jtZwNVXFkg039596g019at2/xwIGR
         tCj85Jyr0rVlcnZkJu04Vmb2f9ACc3C12pJcyIudtA9UeaYyjDY4gmzxyqxBOmN/+AI+
         ck/wqXNHW3033blmFIyhHbD/EIhcsWwkAN7hcD5Z3J/dN3lbITMe+ZaSuEJYH4XRaWGA
         MZy4Vvjm66te1M1zr/YPZNXjarGDMQzQwrRWcmsH+htG2AUQPLxToUElSLkkiqurxRFB
         wOwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741510120; x=1742114920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=77ZQnV/idoKQSJwHe+JyKu0EB24gfw5+CVNFL3AarEo=;
        b=we5y3xB54o3zPsIvo17GOOTRKz3DWnjJXb9lMB50GXsaejL1Je43ZLOWjOfPJ58zyl
         96OGbCJPHOIoFawGoO+mPDOe5HA9PiuRErkixevK89VdDguhnoqoqiPpsuD7e98wMREm
         rTJ24LepjHJOWAhBZfB2ug4zg0DqhzWirH5ZZmDYyEwmnzSMoVT6SZKcD79XjIWqhfYC
         89XoQ00Dd46SmyxJNF1oXQQX0Odh+1JSlVHDtmCpq1XagmwTBkzJiIrG/CNG4YAfQ1Ma
         /ZJ5aM2KTouTj3A2wuVRiNcB0Jj2f9Fd2wvOwPMbW3K693q52rGxenihnBJ3yiN9vQKS
         ihuw==
X-Forwarded-Encrypted: i=1; AJvYcCVZLGlD4bpN145+bhCtg5rsBfqJXhQy+WIZwdiAO6qWJEqUq8sXlaHyABFnaHDWWCDcLXfZATHs138ahw0=@vger.kernel.org, AJvYcCWowP7THiefV5ZxSWVvYfm0sdvfMHMVHYFBQsmIDaUmChP035hL7T/EINdOrSH4G75jY48/Qa8yjPbj@vger.kernel.org, AJvYcCX5s1qBMAVbd6QF1cqg8Hq6dWn+KPbFjCL+MHc651qUpwtG9EgEU9oe6fnJ84xH44FbhCcCuff7VqI0sSvb@vger.kernel.org, AJvYcCXiSeyVVb/fhnihWo4NWBejQqcTQg+Lef8M5JagXomBH2jOp8lXHRg0J/ojXXf4KaEonC45L5oR5UnPIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkBCMJowAqHqT7S4a38Pgt9s6Xln3WwycAB0yq0x3lRt0Q99Kq
	HwNaK8/OV2S3wcGH+E2qrW//qvIoNP+DssjrIXBzYAcL3su3f/M2
X-Gm-Gg: ASbGncuE7HmjIkZszqv5WOB4AlC5am51ww3kzDNXFYi3YReHfboAE3lFoYr2t3OsWvV
	aDKfzHT9NB+U63Xck9/c4hUP7xZaOcySwAo1vrJzoWeUO7C9nDHFYDJmXiLXlXBPkYlmjVXpz3m
	l3OrlA1823Wzyr3+6nlsZ+LWL3kPamiJ5XVyPuHACIIU8wjBOBW/JKe19Udfgdoz7zCI7U4Ardj
	2COCZAaE41PIAs9WE19Nsd8Oc8Pj1fQwBRCq4IeV53aeI43RSXjSAsCdSRtNCeHm8851VNJyHkx
	lRWP1b6FWV3mgrRcZP2dLTk/bojmvZAl8x4AyXwz6+yfwHUe92ICVPbfei1M1CKDxrP5
X-Google-Smtp-Source: AGHT+IG0K1+lHlFBOdHDt8tr0ZKEi9pxD/wAXNM/pWihzP5DjPiNDmSdaUAc5wV4ZJZ+UdarW2Vo1Q==
X-Received: by 2002:a05:6402:35c7:b0:5e5:c010:e67e with SMTP id 4fb4d7f45d1cf-5e5e24bd6bemr20287512a12.31.1741510119914;
        Sun, 09 Mar 2025 00:48:39 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239736153sm566347466b.108.2025.03.09.00.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 00:48:38 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
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
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Taniya Das <quic_tdas@quicinc.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Eric Biggers <ebiggers@google.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Ross Burton <ross.burton@arm.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [RFC PATCH v2 05/16] dt-bindings: media: i2c: max96717: add support for MAX9295A
Date: Sun,  9 Mar 2025 10:47:57 +0200
Message-ID: <20250309084814.3114794-6-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309084814.3114794-1-demonsingur@gmail.com>
References: <20250309084814.3114794-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MAX9295A is an older variant of the MAX96717 which does not support
tunnel mode.

Document the compatibility.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../devicetree/bindings/media/i2c/maxim,max96717.yaml          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 0a43582168a8..31fb62debdc7 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -24,11 +24,14 @@ description:
 
   The GMSL2 serial link operates at a fixed rate of 3Gbps or 6Gbps in the
   forward direction and 187.5Mbps in the reverse direction.
+
   MAX96717F only supports a fixed rate of 3Gbps in the forward direction.
+  MAX9295A only supports pixel mode.
 
 properties:
   compatible:
     oneOf:
+      - const: maxim,max9295a
       - const: maxim,max96717f
       - items:
           - enum:
-- 
2.48.1


