Return-Path: <linux-gpio+bounces-26849-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB1EBBFFFC
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Oct 2025 04:04:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A1E2189B313
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Oct 2025 02:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B89820FAAB;
	Tue,  7 Oct 2025 02:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dTrVQHHi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EC4207A32
	for <linux-gpio@vger.kernel.org>; Tue,  7 Oct 2025 02:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759802623; cv=none; b=c1/3lFWhc4Sj0Hx31+jEEZxrhRbOViHBde7ksaQ3Xcd4uUsbQF3eNRQjQjJQVOECvDGHRDwDqWBKJuAlXeEy0zpfBD7AogCs3irASg790zNE/fKjLaZhHHX8RTolPqB5FsyK0zIwpHUT43KPyZQ6FWPE+voOyOxjPLoJH5Sd7V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759802623; c=relaxed/simple;
	bh=VXDNFmwIX3pmm1RNqu8UxbDnHVOaIoAOH+SdXHl9U1Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rseXurHpgh7zyo4dtVA8BTaswm1uNSkdUg8yiSoJMZQXuv/MBRs/nKiw2NW/oPmROTKKByvN7cThUIMG4aIe31GIvPdpvSjwLHM/Fo2ep5TudeNwulitce6D41xI2nFp4niDV+AKD99F3r1vOkjTnVkZ3s3lQqKIlWAblwnhqGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dTrVQHHi; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-57edfeaa05aso6765788e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 06 Oct 2025 19:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759802620; x=1760407420; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UvT/TglfcrWJfggrZckfEyOiFactKbMJClmt0smjuQk=;
        b=dTrVQHHiskmU1+WanWHVh0yrdEMpONRRJqppy9QgL+HHJ2c7GbPffxHtKcpVyir89u
         jUVgH07ehuiCGxHsp4prwU+Qpdrp8SRiJHcXYSSfJ4N4YgeOsbKvQV/0q8oTRpM8Qsdn
         9IAKEvFLWVZFcBbcd3YQ7QqZ5/xGzBryVbdBo+AUAkZ61TYDt1nbBT0Y+pdvlORCWfX/
         hkFShCUSvasyWZW3aFR/jYV1kw2p5DbRLT9wl/ZfiCbvlMj404mVWPSOG2hFlDoDy3vg
         Je6IL6wEv11fzvBph9ia1QM3WduLo1XibdeYXSd9ZbXklRFu1JfPflqHnjFnEQSi0qQ3
         r1og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759802620; x=1760407420;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UvT/TglfcrWJfggrZckfEyOiFactKbMJClmt0smjuQk=;
        b=nBKNAT0ATj5d6MS5p1j5vrXszcI9pE4NNSDloOXcf6GvMzqrS6ADAc2WXYzemQzxUS
         GCQqYiGolMBzrNBG4lLRwDaab5VxkfcBPEtNHwjsAWpqnFo4lCAYh+G+upAofqIYwEbK
         16DZJD2Iiaw5lZn4WbAILnz8CQEb1HCkPzt5SqjPTVVMIe67PBhTKpH43sFDMmGFrX1/
         lSrMK4tKz+LpMkyRj7vOPsOoK02NSKFVLGtEaEzCemk9JEvgPGpb+UkHIY3e+dasBKeX
         gw4AKsFtT+fYI0sC6XOWerBn9n64P5L0bzsrcpjpQxVMQ9yfE97PdE7365t6tHR8bs8P
         V/Jw==
X-Forwarded-Encrypted: i=1; AJvYcCWAkMhKtO8NmeIrMjy9XmypxocTC8qfy0mHSYj1QZtIVukWaVj035kybMZS67rFF8NbV4TPx1M43t3S@vger.kernel.org
X-Gm-Message-State: AOJu0YxfB81mQIfSRzsYOsfUqPZUkc9EDPoe8b9drl9tS4lTh7ShqAeY
	ctI52Z2EPaTLt0TCrZw3iOpyNPJChW61hnz9nj40hgWDqNsnibFFh3Dah2FnjVtL7vw=
X-Gm-Gg: ASbGncspXNGWyPtfa4otChK3XdvwU38FEYxyW9ekkr8FtaQ9XiL/tPn2eD1GIzcS8nW
	/wny0YtIUx+gjBHh5c3BlNqN5xsxd7qWVl2+ysDUQDLCQ0TUybivUMtvvBW3G0/WXsKaQtLiooE
	QVRaF3r7UpDXlirTjUOnN3k7fmM4F+iNl3ilc5PXX8hqBh9FuMDJ0oLDF5wrvwtx85lfkUD+OO3
	1QOyqOKZWFGukbxHy+Mwei6GhyIYzY+blekJazQAo9IM7PLcMbbm5Bc05KJRHpzhxn0G1L3/RsO
	Ae42ox22+QUyaXImR4lgXV+EZrsUW0rvt+Eo9hUAtkHe4d+2oW0a2fVTtgAu2UZjdxhvXPEfPeK
	9MQ9VEzz6RXF0FTyiNFHGB2CnOxDxEFvcr9BFGUf4Ob4epjUmXPX05zTqywZr9rgomg8=
X-Google-Smtp-Source: AGHT+IE6kE+08lGifMlbSFxL63V0GVp/y1UlrRZI3ChDCaIR4Mc4TOIHRtBHsz2zClThQzzpsuDRMQ==
X-Received: by 2002:a05:651c:1992:b0:372:9992:1b0 with SMTP id 38308e7fff4ca-374c3823058mr35559001fa.31.1759802619600;
        Mon, 06 Oct 2025 19:03:39 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7259:a00:22ae:baa0:7d1a:8c1f])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-375f3b81e45sm5150391fa.46.2025.10.06.19.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 19:03:38 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Tue, 07 Oct 2025 03:03:29 +0100
Subject: [PATCH v2 1/4] dt-bindings: pinctrl: qcom,sm6115-lpass-lpi: add
 QCM2290 compatible
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-rb1_hdmi_audio-v2-1-821b6a705e4c@linaro.org>
References: <20251007-rb1_hdmi_audio-v2-0-821b6a705e4c@linaro.org>
In-Reply-To: <20251007-rb1_hdmi_audio-v2-0-821b6a705e4c@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.2

Add a compatible for the LPASS LPI pin controller on QCM2290. It seems
to be compatible with sm6115 LPASS pinctrl.

Cc: Konrad Dybcio <konradybcio@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 .../bindings/pinctrl/qcom,sm6115-lpass-lpi-pinctrl.yaml           | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-lpass-lpi-pinctrl.yaml
index f4cf2ce86fcd425b7522918442de25c836bf24f0..ec1cd684753ad22050ae349a2e7acbb2545a9070 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-lpass-lpi-pinctrl.yaml
@@ -16,7 +16,13 @@ description:
 
 properties:
   compatible:
-    const: qcom,sm6115-lpass-lpi-pinctrl
+    oneOf:
+      - enum:
+          - qcom,sm6115-lpass-lpi-pinctrl
+      - items:
+          - enum:
+              - qcom,qcm2290-lpass-lpi-pinctrl
+          - const: qcom,sm6115-lpass-lpi-pinctrl
 
   reg:
     items:

-- 
2.47.3


