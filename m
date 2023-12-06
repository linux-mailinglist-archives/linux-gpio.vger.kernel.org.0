Return-Path: <linux-gpio+bounces-1042-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A84CF806453
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Dec 2023 02:46:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D995D1C20862
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Dec 2023 01:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22E421FD6;
	Wed,  6 Dec 2023 01:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="afLkwm+E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E23A10CC;
	Tue,  5 Dec 2023 17:46:11 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6cb749044a2so6692243b3a.0;
        Tue, 05 Dec 2023 17:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701827171; x=1702431971; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AqnaYhpCrvu4j/R7wQBWuZ3sMmDCeUlCefM7DEmKBhI=;
        b=afLkwm+EpvJdIVFUtVPDC+a0ui7Xlc2vRkaSZ3TLXU6blcs5H2pLsWIxIQtpmGrA4I
         DLV4EWAVA2C1TMhY2/Na7z0C7waW4mPkP/qV/T4M8DtMtN2IYQ9UDj3cOZaeYPJuXbdH
         xGDz/cSaw+WB6klTL/DX8qxWdefUlcM90bz4TwLz1VsMgU3ZnmONVkq7jKFHMqM/6uJX
         H2wwH7EzFIuzEZUVvnESLO7uivHgBeyKZ/7sbz9296lwLrK2vpwewUxVKkr7sMPidkhS
         QskAeUMeXzeG4JPs+9AcsxBZj+WQEP9f/m+tfJAgFPFQ3f8vlcSdDLLiiNaACG1UQ2rN
         SXJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701827171; x=1702431971;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AqnaYhpCrvu4j/R7wQBWuZ3sMmDCeUlCefM7DEmKBhI=;
        b=PKjkjMcEqAW7+g/lJ0mOskPKJ8FQVkgUhrlnpsb6sT7G/zr3ICmGsRITKpYoYW53Ok
         +1wliHQ1KwLm32FTD9w9d3CN3w4DYNUCJfJG+FlQz1qMhiAQNnXzZ4+Eu0qR5CCjZjIR
         uGGc0QEM2F0mR4wbfV9GLuxqb7dBk++68eWehMOX/jZiWK6EfgFHEBC4gIMUm2MyIevc
         mb5VdPn5xSQEi9JdIhXkzwhq6MdhCbjtjYCdAWwZRf+un0soo4fGQnOV71JdVEOa3/BM
         jOKMcCaJxyniUs4z576RbGwtzlfV/N3dnD32dqG4IOJ5xLg6V8BY+meIlAz32nxmKXuf
         0P1Q==
X-Gm-Message-State: AOJu0YzOZNmiuu0/tf+pR3hI4lWqRUmr2Tz6p3W9E2llrqLR4aqUP4HS
	jFVB/ZR6KIa4uHbfEMONnEg=
X-Google-Smtp-Source: AGHT+IE4OEO6AuDf+OS54EW0+E56+iiZ+R9SGm3qCf4t5dLhN0MKFbtRXY+ezoGotQNnhg6g1OocqQ==
X-Received: by 2002:a05:6a20:7484:b0:18f:97c:8a1c with SMTP id p4-20020a056a20748400b0018f097c8a1cmr145930pzd.71.1701827170873;
        Tue, 05 Dec 2023 17:46:10 -0800 (PST)
Received: from localhost.localdomain ([112.78.94.69])
        by smtp.gmail.com with ESMTPSA id g24-20020aa78758000000b006ce781f6f85sm1250956pfo.43.2023.12.05.17.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 17:46:10 -0800 (PST)
From: Jim Liu <jim.t90615@gmail.com>
To: JJLIU0@nuvoton.com,
	krzysztof.kozlowski+dt@linaro.org,
	linus.walleij@linaro.org,
	andy@kernel.org,
	robh+dt@kernel.org,
	conor+dt@kernel.org,
	KWLIU@nuvoton.com,
	jim.t90615@gmail.com
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH v8 0/3] Add Nuvoton NPCM SGPIO feature
Date: Wed,  6 Dec 2023 09:45:27 +0800
Message-Id: <20231206014530.1600151-1-jim.t90615@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This SGPIO controller is for NUVOTON NPCM7xx and NPCM8xx SoC.
Nuvoton NPCM SGPIO module is combine serial to parallel IC (HC595)
and parallel to serial IC (HC165), and use APB3 clock to control it.
This interface has 4 pins  (D_out , D_in, S_CLK, LDSH).
NPCM7xx/NPCM8xx have two sgpio module each module can support up
to 64 output pins,and up to 64 input pin, the pin is only for GPI or GPO.
GPIO pins have sequential, First half is GPO and second half is GPI.

Jim Liu (3):
  dt-bindings: gpio: add NPCM sgpio driver bindings
  arm: dts: nuvoton: npcm: Add sgpio feature
  gpio: nuvoton: Add Nuvoton NPCM sgpio driver

 .../bindings/gpio/nuvoton,sgpio.yaml          |  86 +++
 .../dts/nuvoton/nuvoton-common-npcm7xx.dtsi   |  24 +
 drivers/gpio/Kconfig                          |   7 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-npcm-sgpio.c                | 637 ++++++++++++++++++
 5 files changed, 755 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml
 create mode 100644 drivers/gpio/gpio-npcm-sgpio.c

-- 
2.25.1


