Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45DCD2C7D2
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2019 15:36:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727428AbfE1Ng6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 May 2019 09:36:58 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34980 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727308AbfE1Ng6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 May 2019 09:36:58 -0400
Received: by mail-wr1-f66.google.com with SMTP id m3so20283662wrv.2
        for <linux-gpio@vger.kernel.org>; Tue, 28 May 2019 06:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yQpN5swIgln+h3KvcWmaxvYHMF5E8isSyunz8n1i0Vo=;
        b=in1naDrX5yVxXt0LJcbaqCAypeI4S26Kt++ybMo8wbfmcVV1iRQAX9qIaxyogyQH5r
         J4WaMvWFSGDr9yh/vYvCH3QIM2IAffribS5/z8g+rsJufUGenw0XbO1rn96Swib6gpth
         T3AOxHuViXmok4591SFZgPh0Z2K31uAffWaLNNxSJi+dhhH3ScFrPrvm55DB0GLlqpcG
         Z/EKtKJhT0BsZ1APWgyNL7HNxtKyXejjvv8Uv39bW5uGMlyhL50ACApmUOWSsg3BXwu9
         YNAVR3s7rCrp72bsqfElpQ40PXAYgTHjprZEM/f4/ESk+B13ICJfNGUeDOtl1D9DcaQG
         S2hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yQpN5swIgln+h3KvcWmaxvYHMF5E8isSyunz8n1i0Vo=;
        b=ZOm0XkFp8+1pAHNxwejNC/2UZW8ewgK9V80DX0zR0S5mGfzMws5M4Eacr7OnmswSvh
         kFIj46TMHQIn1wjgp62+PyZ5U2sQgyQ+nVeCuaI8aX8+3gsXXQI/FtUdyoD4FtB5LPTq
         5A8oYovAH81boiROjXrrdfHgCIw1EKwrVk7cCNMhyIa0RG9yYY8TvfMEsINwg7Enxi+2
         T5bjyZYgElU3y3T6TbRt5vVzGBgoxn3uc2H/mia2dl7pcdhiomvCh/fKSJgPjCkQmqF/
         f90kHOMF3/SHlb5tXvvns5CLv56T8R7SYkmWnnnfLPseLhfpTlLwjyaSqRnTAgRn/ot+
         mhrw==
X-Gm-Message-State: APjAAAX3P36fuDRy9RJjRD0tiISmJLOfeKMWBLk/rfmyzFPkxxDqXwBK
        sAFbgid79tYzhnOymjirP09rhA==
X-Google-Smtp-Source: APXvYqzf6CfyFQVhTOPIaLwja1Y5Xpt8/iP5bbGjiJVNJqRW3hhDwpM3zIPlc1xgVWCbi/I/VLDuvQ==
X-Received: by 2002:a05:6000:1285:: with SMTP id f5mr8494632wrx.112.1559050615986;
        Tue, 28 May 2019 06:36:55 -0700 (PDT)
Received: from sudo.home ([2a01:cb1d:112:6f00:c8c7:f81b:b165:1aa7])
        by smtp.gmail.com with ESMTPSA id 95sm8652668wrk.70.2019.05.28.06.36.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 06:36:54 -0700 (PDT)
From:   Ard Biesheuvel <ard.biesheuvel@linaro.org>
To:     linux-arm-kernel@lists.infradead.org
Cc:     linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Masahisa Kojima <masahisa.kojima@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Graeme Gregory <graeme.gregory@linaro.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>
Subject: [PATCH v4 0/4] synquacer: implement ACPI gpio/interrupt support
Date:   Tue, 28 May 2019 15:36:43 +0200
Message-Id: <20190528133647.3362-1-ard.biesheuvel@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Wire up the existing GPIO and interrupt controller drivers to the ACPI
subsystem so they can be used on ACPI systems for ACPI event (power
button, hardware error notification etc)

Changes since v3:
- export ACPI irq domain helper to modules
- documents its parameters
- tweak commit log of #1
- add acks to patches #1 , #3 and #4

Changes since v2:
- use helper to create hierarchical IRQ domains under ACPI instead of exposing
  the GSI domain's irqdomain pointer directly (#1)
- use has_acpi_companion() instead of ACPI_COMPANION() where possible (#4)
- add Mika's ack to #4

Changes since v1:
- Describe the EXIU controller as a separate device, which is a more accurate
  depiction of reality, and untangles the code a bit as well. Note that this
  requires the GPIO AML device to describe the EXIU interrupts explicitly.
- Add a patch to obtain the ACPI GSI irqdomain. The EXIU driver needs this
  to obtain the default parent domain, since the GIC is not modeled as an
  ACPI object in the namespace, and so the parent<->child link cannot be
  expressed in AML.
- Drop the Kconfig symbol for the GPIO controller. Just include the ACPI part
  when CONFIG_ACPI is defined.

Cc: Masahisa Kojima <masahisa.kojima@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: Graeme Gregory <graeme.gregory@linaro.org>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Len Brown <lenb@kernel.org>

Ard Biesheuvel (4):
  acpi/irq: implement helper to create hierachical domains
  irqchip/exiu: preparatory refactor for ACPI support
  irqchip/exiu: implement ACPI support
  gpio: mb86s7x: enable ACPI support

 drivers/acpi/irq.c             |  26 ++++
 drivers/gpio/gpio-mb86s7x.c    |  51 ++++++-
 drivers/irqchip/irq-sni-exiu.c | 142 +++++++++++++++-----
 include/linux/acpi.h           |   7 +
 4 files changed, 188 insertions(+), 38 deletions(-)

-- 
2.20.1

