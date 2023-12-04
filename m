Return-Path: <linux-gpio+bounces-997-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC22803FD1
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 21:36:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA14D28124C
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 20:36:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5DA035EFF;
	Mon,  4 Dec 2023 20:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hefring-com.20230601.gappssmtp.com header.i=@hefring-com.20230601.gappssmtp.com header.b="KHFAu1tq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 921673849
	for <linux-gpio@vger.kernel.org>; Mon,  4 Dec 2023 12:35:36 -0800 (PST)
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-677fba00a49so41514896d6.1
        for <linux-gpio@vger.kernel.org>; Mon, 04 Dec 2023 12:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hefring-com.20230601.gappssmtp.com; s=20230601; t=1701722135; x=1702326935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DyOt6WNJoyGPyyAGB/bMPPXRQGKI15oaDucC2U+fr/M=;
        b=KHFAu1tqEjUF818xvyy2DPCcHiLL60PxQAUJW6qaDAdQ2Q7R96QliiQrEajn5P0MOB
         8mhH03+0zJt0HNlN/FDzTGxHPM2wD4cBVLqyiicYpbM9vqEHpWUSMuGmwzcLdIi6E38p
         hTsh1rzrMSwXqNKLbZZaE6alC4yQPtNNE7GaXeC6ksZucFIZCzc/tvj+N1GhZff7cU2j
         fcSFU7VHFxVKCye85uQ9AkicYxi2APKZ/QB0Q3LdQ75qzJobrHo4HbNvapWYh5JHmnqp
         8zdY0HPOUDZwsYzzdMqele1oy9x5nDawgBlwhaxjEc6WtHP+hRyi5aO+rOU43YMdIOg3
         ZPvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701722135; x=1702326935;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DyOt6WNJoyGPyyAGB/bMPPXRQGKI15oaDucC2U+fr/M=;
        b=PgfEuBNgZD026E5bMkzVL4K4sI2mpdy9BVrd0PD+iqOXfgAPVz7ocdUSGxBv7eBqkN
         swkjctYX/sSzYWAI0jMpw5crBe+k0SSK5gSif/RxpnLzCiGs57SkuBllUvRR6lveBzvn
         SO2S1A8jBUcIznMCJzZSHhBzQpw+wGA8qPkAZEabYSYnO3FXRt8rBnc8hLngiYymNYVG
         gP1moqhqueyyTBLwZv4w8/X0ZbMCFWMuJgcEdV+x7EssfUvyt78Cl1/3mGG6E94JO4AK
         UjGDOgNE/8a+ORYbWUtrnmd/RGlteJmUf8vAHPqrgBf2LlCMZjhLtEq4mjecKvjl+eg7
         BNJA==
X-Gm-Message-State: AOJu0YxNdPShcCpXIFujknoJN1Lv0CPDSJgPIXJX21MYGDLbYqxMcLMJ
	RWaFx2tFfD3nwEftVdYzh10c+Q==
X-Google-Smtp-Source: AGHT+IHQVPJUpnF0jpAxRYOUbhikG4xN8M9TPSoPIYVN8gwSA7y9CB1MpGu7A2cRrqTvvdjC++88Hg==
X-Received: by 2002:a05:6214:519d:b0:67a:5815:9996 with SMTP id kl29-20020a056214519d00b0067a58159996mr217380qvb.6.1701722135213;
        Mon, 04 Dec 2023 12:35:35 -0800 (PST)
Received: from localhost.localdomain ([50.212.55.89])
        by smtp.gmail.com with ESMTPSA id jo23-20020a056214501700b0067ac930d17asm1123469qvb.141.2023.12.04.12.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 12:35:34 -0800 (PST)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
To: linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Ben Wolsieffer <ben.wolsieffer@hefring.com>
Subject: [PATCH 0/2] stm32: fix GPIO level interrupts
Date: Mon,  4 Dec 2023 15:33:55 -0500
Message-ID: <20231204203357.2897008-1-ben.wolsieffer@hefring.com>
X-Mailer: git-send-email 2.42.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GPIO level interrupts on the STM32 were behaving like edge interrupts.
The STM32 lacks hardware support for GPIO level interrupts, therefore
the pinctrl driver contains code to emulate them using edge interrupts,
but this was not working.

First, the STM32 EXTI interrupt controller driver lacked support for
retriggering interrupts, and second, the wrong IRQ handler was being
used because the parent interrupt was an edge interrupt.

Ben Wolsieffer (2):
  irqchip/stm32-exti: support retriggering on STM32 MCUs
  pinctrl: stm32: fix GPIO level interrupts

 drivers/irqchip/irq-stm32-exti.c      | 13 +++++++++++++
 drivers/pinctrl/stm32/pinctrl-stm32.c |  3 +++
 2 files changed, 16 insertions(+)

-- 
2.42.1


