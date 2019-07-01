Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B16FF2B331
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2019 13:27:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726600AbfE0L11 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 May 2019 07:27:27 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42613 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726175AbfE0L11 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 May 2019 07:27:27 -0400
Received: by mail-wr1-f67.google.com with SMTP id l2so16574429wrb.9
        for <linux-gpio@vger.kernel.org>; Mon, 27 May 2019 04:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9y/IH+JG6Qynh8FmtZUM9JghLzxsBV1mtWL7v5H2a4Q=;
        b=cHbav5PPQ68d4UGIDc+xzZrqmq4aIerkhnu8xmIvRGjKdNlVQUIz0jJdiPXHgVriId
         OcKZDQ+9FZJVo2826Wh7U2dJ7lrJ+4AUuddSxYw6fVe5Zp1wvzjsVw0DXONQ9+SIqPfp
         e9HK86zx6MtksU20+2u3ZEukWQQya3JLMLKuY9/tqjRKM3gdFbF+Gnl1/HiHj45XaQLp
         FgSlBgt4CPbP+769bkjaHXbdh6OuMxAqRhYz5Dt+1gsSRsV2rDfo404xPOPDEUDHMcKk
         jrGAV4/6WYF8pygNm/Q3Io2X33ESyDIfXArcPPWkAUkuu7SSToh7PZ97HXOnRaZMZPT5
         Fjgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9y/IH+JG6Qynh8FmtZUM9JghLzxsBV1mtWL7v5H2a4Q=;
        b=jeYobOLcPsbcqIlA5k3rI9z4Yc0ZBAxHxhWCLDyKJ6l6lULaILtGdV1+gFFdqrA67f
         B09ZyE28UDsXEPR46Hhf3HQTfcoOE1YB7bAXO+O5fkTkzFl86clC9YBdDmC8qdT4iFLa
         PSokvbSAudXDxnZZK3slv50Yni0aSsrWaADWin7umQFHbqLxkx9uNY4+7aTVWSJTtPDu
         wG67G1BarLANsvaofdnzgDTTlM+3J07AyK4IPTyziPrHABDMO7Kx3+HbBRNBtmzS6Rp3
         9HJHICWlit5SiEXSXLVke4SwvIiOqaIE4igwrhdcYfsG+HgklD9dJIF8lzvHBBRgfy7w
         GA1g==
X-Gm-Message-State: APjAAAUyCOYByDksRXEV1xE38LrJ1pNEQ16PLso3F8gmJxwYDKTgZ5Cs
        yumpYkII7j57lgsjLrJ0YnmE8A==
X-Google-Smtp-Source: APXvYqw6Q/+9wUrVhaGxUO4Y2xHThdWFzl7gnG7lKlZuiOqW5LExAjRfDNU8mFsL9VLv3EzN750x8w==
X-Received: by 2002:adf:a749:: with SMTP id e9mr5294854wrd.64.1558956445366;
        Mon, 27 May 2019 04:27:25 -0700 (PDT)
Received: from sudo.home ([2a01:cb1d:112:6f00:ccdd:dadc:1517:f416])
        by smtp.gmail.com with ESMTPSA id l6sm9677747wmi.24.2019.05.27.04.27.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 May 2019 04:27:24 -0700 (PDT)
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
Subject: [PATCH v3 0/4] synquacer: implement ACPI gpio/interrupt support
Date:   Mon, 27 May 2019 13:27:16 +0200
Message-Id: <20190527112720.2266-1-ard.biesheuvel@linaro.org>
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

 drivers/acpi/irq.c             |  20 +++
 drivers/gpio/gpio-mb86s7x.c    |  51 ++++++-
 drivers/irqchip/irq-sni-exiu.c | 142 +++++++++++++++-----
 include/linux/acpi.h           |   7 +
 4 files changed, 182 insertions(+), 38 deletions(-)

-- 
2.20.1

