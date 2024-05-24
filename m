Return-Path: <linux-gpio+bounces-6614-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A83B98CECF9
	for <lists+linux-gpio@lfdr.de>; Sat, 25 May 2024 01:37:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 41340B21C40
	for <lists+linux-gpio@lfdr.de>; Fri, 24 May 2024 23:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 981A5158867;
	Fri, 24 May 2024 23:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p62/M8bq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB91C84FB0
	for <linux-gpio@vger.kernel.org>; Fri, 24 May 2024 23:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716593854; cv=none; b=D5GQyBaEuJMkTM6wJrk05HI/TLs7yaPMqERyj2SB8nVeX/H05Sac8QBBP3QY5J8XAKnHQRG2cvGd13r3T2iS5BTm5+cHrXcOOVeSFTay5gwE7hxBP8SswvnpOFJl99v+psGMVXP46XV+dUjnTj49FxP9PelONMu2JgJcGohD6+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716593854; c=relaxed/simple;
	bh=JflTLH918455b/UulNgm7hAclN0c2bENLU63KxD2kD4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TBjcMeMFU1TRK5uOFXLJLOmhUKKrxe8hn0mkS11O2MOygx6R/cLgTM/jBw6Uy92MbMz7SM8pp+H0tAYdXR85VaahDp+rA3YIaay1Nhso0jovb1r/ImBVzRJMtNhYqPwwB1Ub7YUXJpAv99WZaeJia7BXrC50ioVEJW5ZdRX/IwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p62/M8bq; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-354de97586cso4352177f8f.0
        for <linux-gpio@vger.kernel.org>; Fri, 24 May 2024 16:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716593851; x=1717198651; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NlfoWRsou0FGSAU+bRIZe3/8khkmJp6TNl2qzTYp4WU=;
        b=p62/M8bqiw+FXFtETOXYMWxqhn+VKlEzbEsETO9q+07ilVpgspvlRPV1iFfttI8u1f
         48KCp3n0B3ULuUI6FCra9hw72pNmSvWmqFNEwsmaZ5z8UpUvp8POJ3/7kdBzcyP85ovS
         W137+bADq5MiZWzn5W9DdnEO8zr1aYem9Wk7FIYuwumaeLCu3/3SB0yX6o3OYCPYWRmT
         l4zMTpmG2FBkPHuTdIFpJGGWbuqkRuVk8s/LXpTIW32duR85R+obGlaeuGzFIr7poBHQ
         T8CGm4sO0wP6yFDhwFbgQWfq0MhytDp/wI6rjuPsVIpcokAYANu0FB9FWChOB867BBSO
         1xJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716593851; x=1717198651;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NlfoWRsou0FGSAU+bRIZe3/8khkmJp6TNl2qzTYp4WU=;
        b=HUHmnxyC8Ly0pX3scQB6mSAAjm96l5zCGDnHzltY8djAdX6aeagLupNzX3ySezwjfX
         Xy5v04CHOnNr02XYex2xU1ZU7a9DO5Un+z+0278dMRhFXddjraSL4IJODxbnCLEL4ekR
         s62yt+BnVKgHadbPeMzaU+NIMGhHjELDkqo2DAEsBzqNbHpU6E6J+/ZucYk/R1U06FEB
         ROGrlATDKmw9InPUJyZLrex5t5VK4pTHG2eR6Iy6fbQFTclLEdxGCBVED0o89L7kEVyj
         wWaoj7jER8nSgunf3c7hOs2Qy7HPfqxbKdR32ymgjPIFW8+nIWjUNrisDmfKPqV9pdoK
         c+yg==
X-Forwarded-Encrypted: i=1; AJvYcCXlc/WOiUS4cb6FdC7FZKwpUpsB7HlraF0DzeYBHAt7MmC5TPh/WBmuPaqKxyIoQ2Y+VZCC7Ee5/BjfFtj+WFjq0j+MTCzkUWyK2A==
X-Gm-Message-State: AOJu0YwTxKF9bdHd9vW6OVtrCNALtx8EPXlztX/JORakiUILbHV6BIjK
	xxqAgBPJSjKACR4zxqjR6u8Vft305pHe8La6arQIJyfOQuH2n2Cv6sk/RAP+540=
X-Google-Smtp-Source: AGHT+IHp/7fVQoSDDRZK62VLrQPVjXx7HLE+bPisvOuROu6qqrD/CTxst4QM9J4x5BskJua1Fbqmjw==
X-Received: by 2002:a5d:504d:0:b0:354:f168:9862 with SMTP id ffacd0b85a97d-355221273fbmr2746662f8f.0.1716593851065;
        Fri, 24 May 2024 16:37:31 -0700 (PDT)
Received: from [127.0.1.1] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626c938815sm189475466b.78.2024.05.24.16.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 16:37:30 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v2 0/2] PMC8380 PMIC pinctrl
Date: Sat, 25 May 2024 01:37:27 +0200
Message-Id: <20240525-topic-pmc8380_gpio-v2-0-2de50cb28ac1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALckUWYC/32NQQrCMBBFr1JmbSSZakxdeQ8pEtppOqBJSEpRS
 u5u7AFcvgf//Q0yJaYM12aDRCtnDr4CHhoYZusdCR4rA0o8yTOiWELkQcTXYFojHy5yEKTHVhq
 tJqMR6jAmmvi9R+995ZnzEtJn/1jVz/7NrUpIccHO2Ml2pIy6PdnbFI4hOehLKV/QwKoTtQAAA
 A==
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14-dev

nothing special, just some boilerplate

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Changes in v2:
- Restrict # of GPIO line names (bindings)
- Link to v1: https://lore.kernel.org/r/20240522-topic-pmc8380_gpio-v1-0-7298afa9e181@linaro.org

---
Konrad Dybcio (2):
      dt-bindings: pinctrl: qcom,pmic-gpio: Document PMC8380
      pinctrl: qcom: spmi: Add PMC8380

 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml | 2 ++
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c                      | 1 +
 2 files changed, 3 insertions(+)
---
base-commit: 8314289a8d50a4e05d8ece1ae0445a3b57bb4d3b
change-id: 20240522-topic-pmc8380_gpio-e6d30861f862

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>


