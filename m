Return-Path: <linux-gpio+bounces-11491-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 720E89A1AEB
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 08:46:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3612C28757F
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 06:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F243192B98;
	Thu, 17 Oct 2024 06:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="blb20qXQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237D9189910
	for <linux-gpio@vger.kernel.org>; Thu, 17 Oct 2024 06:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729147575; cv=none; b=lsRXB4vPjfjXE54/FNY/D3yNkAc4IQ9+noegVLNmn3anIB0FvhmQpvf/jayNCriZl5KNlqmSVorXjKNgyMQIpk24IDUPUdV+4WuXoamRdHksaxipwVZqeaeCeBnBLaI2U2HPFOsZl2WJL+/56yhoxYQGDmFc776aLLGqLDngOQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729147575; c=relaxed/simple;
	bh=cznAp+JgrB3doCdj+5MJN1TTIwvEeqxJ1f6EYDagSAI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kLPqWdpbTwhgcwBzrfiOyl/y/qpUjADgI2hY5eL52GQoLr+XKYc+QpByrpW5of7RlJv7iapgxQR7i6OGF8dHDnZeAmycfX9rEloKR+5uH+7NMyrq5tzevnF6pUOTHgwomgtdEa1XMNfrJkadmvuM3MST38P6YOz/VeS5xoQobUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=blb20qXQ; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fb5f647538so6061621fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2024 23:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729147570; x=1729752370; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HhYL896u1DRyEX1oXIQrKsmBcAkIkCPnJlGLrVOrEVs=;
        b=blb20qXQjTbw6v0rzHyWIIV4acFTuS4In7/+8OlPXdJZzbi24qzuYkkJ/o5o/gr7j0
         3VwktJCryn+NO1aF9fFcXd7XLkk16rH/GdUXNikXIQytcramPvByi3r7Em5V//hcClLh
         WlnlBjQT7E834x/x3WFFh2cJBcO5MO3doBzdyyov5HBLvHK4fZvoWXAjB01Z4Nr9bm3G
         9a/1/fJS498T0q74cfI+5GQtb5GuK3mQs1grFPFyQQF1inR0+6uxD4081skgtlyOSMN9
         bm385RXOpbkmuP8rsdfuQ8PRfPA5AVEy8XNiNUQ4CSiEQ5OLvEkY9arHSVZrsbJYUAUO
         4QGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729147570; x=1729752370;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HhYL896u1DRyEX1oXIQrKsmBcAkIkCPnJlGLrVOrEVs=;
        b=Oo4MOsRDdtGwC+3RmwaakiEcA7LRocoqXPjE4rf6kaUcm/tbmaURa5AoyYo8LLgvGU
         w3r/UeH3+O7+1hNJVkLOwcrKpFHki9xImCpKEDVSps9yJ2TDZM7nvD08Frwvh1VnSInS
         UgyptbGDpKwvjVpoPpTquQjE4G0DV+U+nemKgzpspaC9XJ9t9T5VOkCye2L+/qZSrzHA
         127OoPROgC1TleFZ/RSLTj00K6cW/SvSUQsPsb7f0Mvr5eQ6m62eBghN832bccRzTdsF
         YGbGNAyEr6ES1th/tXYjlNTlhX8EUp7LCdT1rpy1ZTGM8/bgbuQrz5SPvgHZ/8OqQVGR
         chMg==
X-Gm-Message-State: AOJu0YwhCeqs8fIVuB6LOi0K0ydiQatCc7fqjzTgFTzheHrsCWD2mzOG
	BHI8cJXCQI6LtQt9JHtkHV/FlZPs+skXlPe2IX74tVxgEnobJomkv33uvLeCACq4ureezSmGDzg
	h
X-Google-Smtp-Source: AGHT+IGQ4xSked6ymD4hOiHmE3SzpQMpAoQ7EdxijGwAZmU15ExOznfzAr8Gmpwpc/ECs1IGV2rk3A==
X-Received: by 2002:a2e:bc26:0:b0:2fb:5034:e18d with SMTP id 38308e7fff4ca-2fb6d9c5a08mr5587401fa.1.1729147569686;
        Wed, 16 Oct 2024 23:46:09 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb5d1a7398sm6139271fa.105.2024.10.16.23.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 23:46:09 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 0/2] gpio: mmio: Support ngpios property
Date: Thu, 17 Oct 2024 08:46:07 +0200
Message-Id: <20241017-gpio-ngpios-v2-0-cecfdb38d40e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK+yEGcC/22MQQrDIBBFrxJmXYsjMUJXvUfJQoyagaJhLJISv
 HtN1t18eB/eO6B4Jl/gMRzAvlKhnDqo2wButSl6QUtnUFKNKHEScaMs0rlFSGcXbYK0RhvoxsY
 +0H7VXnPnlcon8/eKVzzf/52KQoqAkwuox2BQP9+ULOd75ghza+0HNIv7PKcAAAA=
To: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.0

I thought this generic property was already supported by the
generic MMIO bindings and code, but no.

It's a pretty obvious usecase to just use some from 0..n
of a MMIO GPIO bank, so add support for this.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v2:
- Collect Rob's ACK on patch 1
- The pdata member is called ngpio not ngpios which shows up if
  I compile the gpio-mmio driver with the *right* flags.
- Link to v1: https://lore.kernel.org/r/20241016-gpio-ngpios-v1-0-f16cf154f715@linaro.org

---
Linus Walleij (2):
      dt-bindings: gpio-mmio: Add ngpios property
      gpio: mmio: Parse ngpios property

 Documentation/devicetree/bindings/gpio/gpio-mmio.yaml | 13 ++++++++++++-
 drivers/gpio/gpio-mmio.c                              |  4 ++++
 2 files changed, 16 insertions(+), 1 deletion(-)
---
base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
change-id: 20241016-gpio-ngpios-0cad57f0a757

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


