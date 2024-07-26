Return-Path: <linux-gpio+bounces-8386-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FC093D1F5
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jul 2024 13:18:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 351C21C21A23
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jul 2024 11:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DC1F179201;
	Fri, 26 Jul 2024 11:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KtNCe0t8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E900614277
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jul 2024 11:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721992722; cv=none; b=Riz37HgDs2Pb7jQ5bl0hPJK4WIY3bWcHrew+uwvE5BUxVJI7muuKPIibV4EsXM7AwJi093wAmNk2s0mjZ7Ssl0gH+vQkV9hWOrPo9fkC9wrq1+MAALhHNTLLyIsYqY3SVFY8NK/TH9EHwVHUDjg0CqQN2iR/Ukgw4s68VA0h4zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721992722; c=relaxed/simple;
	bh=iPIs676Ucz0BFAPc0hUibqb4aH8rrVS00mYl6TySE0A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Cl7YTP+WpeJSuHiJr9aQqxw8n4WWfczGF6yqtRF01ZYqs7iJeeZFE7qtBjQ8MEYZ/EZQSMRrDhD0aIeu0zb3u989cI6r1wh8CI72TeF5SYc5wBY5gyGbbJ8PfWKTJNBxRxfXaAKw3JU3BSeYWWvZqYcqFbpTgUFguKMKKF8UsIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KtNCe0t8; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a77ec5d3b0dso170299766b.0
        for <linux-gpio@vger.kernel.org>; Fri, 26 Jul 2024 04:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721992719; x=1722597519; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s1uKdlL0wSEZi8PR/aafT2ubUVc/pu4j0AuCIvADTbc=;
        b=KtNCe0t8hwo/JeZ1RpiXPi6B17rEl17TzflU14ekmqAvEraiZIU0DYmoJ6+aOrSCuw
         87U9P172wvUHUT8eHxai8h+P8RNgcyHvSFvZzHMcT5EbTIiGiVl/yppzs2nSJVo21wEL
         Y2YVd6IWTVlizoztTneFcPxJ69HG/uNGZbbboEb5fkeMw0iEdpwp0AK8gmDztoN1QySS
         gOZI/LKiTE+M9I1WrH+YZlpXn98EQD4yF8S5lE+zx9QFH+47gCJMxYTqhAS1yE1stxR7
         m/d05XovuFMDBYx5sfwvOVC6HVaXQP/xfD49VmQaXTwl1N4xD1801g66/tFQZ5ebpmPp
         q1/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721992719; x=1722597519;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s1uKdlL0wSEZi8PR/aafT2ubUVc/pu4j0AuCIvADTbc=;
        b=Y3LSJApFjNaBW6fM4yFEP/FQCSm4suCqlGwrMweMrciWNL04LrxmQRx1veXw7xXQp+
         1ql06KtwcsxtdO9uSBjWZcqDho/CYtpPZCkrqx7bCcEi03vYlRmf3ir6eP0SBap99Q7J
         USLErx4/F0MoPd9Ne3Du7z4a87UNoT5sx6Hp0pFj4m8mtDbLr2/TXwxJBBTp3tmFb2IR
         uotT6oD2iNcjr4EnPDg89+bvK01NKWbfGCiCh+xQrUaAUKkeAnJY232SAJHiiVSxETwT
         j/GMILXZuTe9jaopRPg15+Ihy/UB3vr7vkay7RaLO8ECk7lU1Gzlyr+s82YzawhTMhWR
         PKTA==
X-Forwarded-Encrypted: i=1; AJvYcCXdJj0UHlsQhP6My7nKorkFHIPnLdEW4IBL0baCQYlvIkPPEvwHPbRaAvn707qAAmvL4lfuwom0G10bkHs7MNly6sY0o5rWES28kQ==
X-Gm-Message-State: AOJu0YxzVOE5QWvtV3dr3nOA/zO4IK19n2fWwzZIuvrfclwYmwvSixmE
	70EHhQk/oqrvX3tlIfpnhp3F9oFRGuhrK+beS8a3mVpoB3zsRECGJIev76i9e60=
X-Google-Smtp-Source: AGHT+IGHu6xTju0RbmaTB0Dy2P+ddiDMN8D4wOU+C0PeZvuRz87E8qSyxApkJD6EGVWwoobzF5Xq6w==
X-Received: by 2002:a17:907:2d24:b0:a7a:9d1e:3b26 with SMTP id a640c23a62f3a-a7acb549275mr421259766b.37.1721992719060;
        Fri, 26 Jul 2024 04:18:39 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acab233aasm164703166b.8.2024.07.26.04.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 04:18:38 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
X-Google-Original-From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH 0/3] Update Konrad Dybcio's email addresses
Date: Fri, 26 Jul 2024 13:18:22 +0200
Message-Id: <20240726-topic-konrad_email-v1-0-f94665da2919@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP6Fo2YC/x3MQQqAIBBA0avErBNMo6SrRITaVEOloRFBePek5
 Vv8/0LEQBihK14IeFMk7zKqsgC7arcgoykbBBc1b0XDLn+SZZt3QU8jHpp2priyjeTGGqkhh2f
 AmZ5/2g8pfQKYJ6pkAAAA
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-pm@vger.kernel.org, iommu@lists.linux.dev, linux-gpio@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721992717; l=2541;
 i=konradybcio@kernel.org; s=20230215; h=from:subject:message-id;
 bh=iPIs676Ucz0BFAPc0hUibqb4aH8rrVS00mYl6TySE0A=;
 b=y37EdpPnKb8Uuo1vP3UyO10uS4Yy5aBrR7It7aQ9tbVd9QdazQPQ5o2NGj8MGWFoSa4MRnPPc
 DnUX7Yunj3PCdZV2CImioEtUcYA9dZXN1FNJa0bSpthvfs1q3b+CGmz
X-Developer-Key: i=konradybcio@kernel.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Patch 3 should probably go straight to Rob's dt-bindings tree

Signed-off-by: Konrad Dybcio <konradybcio@kernel.org>
---
Konrad Dybcio (3):
      mailmap: Add an entry for Konrad Dybcio
      MAINTAINERS: Update Konrad Dybcio's email address
      dt-bindings: Batch-update Konrad Dybcio's email

 .mailmap                                                            | 2 ++
 Documentation/devicetree/bindings/clock/qcom,dispcc-sm6350.yaml     | 2 +-
 Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml       | 2 +-
 Documentation/devicetree/bindings/clock/qcom,gcc-sm6125.yaml        | 2 +-
 Documentation/devicetree/bindings/clock/qcom,gcc-sm6350.yaml        | 2 +-
 Documentation/devicetree/bindings/clock/qcom,sm6115-gpucc.yaml      | 2 +-
 Documentation/devicetree/bindings/clock/qcom,sm6125-gpucc.yaml      | 2 +-
 Documentation/devicetree/bindings/clock/qcom,sm6350-camcc.yaml      | 2 +-
 Documentation/devicetree/bindings/clock/qcom,sm6375-dispcc.yaml     | 2 +-
 Documentation/devicetree/bindings/clock/qcom,sm6375-gcc.yaml        | 2 +-
 Documentation/devicetree/bindings/clock/qcom,sm6375-gpucc.yaml      | 2 +-
 Documentation/devicetree/bindings/clock/qcom,sm8350-videocc.yaml    | 2 +-
 Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml      | 2 +-
 Documentation/devicetree/bindings/display/msm/qcom,sm6375-mdss.yaml | 2 +-
 .../devicetree/bindings/display/panel/asus,z00t-tm5p5-nt35596.yaml  | 2 +-
 .../devicetree/bindings/display/panel/sony,td4353-jdi.yaml          | 2 +-
 .../devicetree/bindings/interconnect/qcom,sc7280-rpmh.yaml          | 2 +-
 .../devicetree/bindings/interconnect/qcom,sc8280xp-rpmh.yaml        | 2 +-
 .../devicetree/bindings/interconnect/qcom,sm8450-rpmh.yaml          | 2 +-
 Documentation/devicetree/bindings/iommu/qcom,iommu.yaml             | 2 +-
 Documentation/devicetree/bindings/pinctrl/qcom,mdm9607-tlmm.yaml    | 2 +-
 Documentation/devicetree/bindings/pinctrl/qcom,sm6350-tlmm.yaml     | 2 +-
 Documentation/devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml     | 2 +-
 Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.yaml     | 2 +-
 .../devicetree/bindings/soc/qcom/qcom,rpm-master-stats.yaml         | 2 +-
 MAINTAINERS                                                         | 6 +++---
 26 files changed, 29 insertions(+), 27 deletions(-)
---
base-commit: 2347b4c79f5e6cd3f4996e80c2d3c15f53006bf5
change-id: 20240726-topic-konrad_email-808c630bcb3a

Best regards,
-- 
Konrad Dybcio <konradybcio@kernel.org>


