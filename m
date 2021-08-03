Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B2E63DEC2E
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Aug 2021 13:37:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235666AbhHCLhe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Aug 2021 07:37:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235842AbhHCLhW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Aug 2021 07:37:22 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 253E8C0613D5
        for <linux-gpio@vger.kernel.org>; Tue,  3 Aug 2021 04:37:12 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id pj14-20020a17090b4f4eb029017786cf98f9so4271009pjb.2
        for <linux-gpio@vger.kernel.org>; Tue, 03 Aug 2021 04:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lx8aY+/yDtRv3FLOutHx5ZS4iEMyIdYBOMCpO0cyw18=;
        b=BUOS8Ggwq+VCAPWWigjVP6z8eL2qBxxXXQBzAIuTNLlNZXZxPG4jPoV/9pRshmmPte
         gdH/a/PdZt30r1WZkEoC+6upgD9f6cwEtXdpNuhy0qY08oNZlxyYLMPfb18zMZPmljTc
         3cDhZ3vYl3qbrLYPUjkmv54kKQyMdH5yBLC20skpM3bXCbOFTTgAHbWUqn8OPDGin1MB
         KOvd+xRYIi+k8vyURRBTnFR5+8q5NpLedWzLZx0hXEOzdeTtZJWK5Cumwh4BSnUcaVMe
         7/OWuyQr0QVSOq/aLUQyLSZNCaWBAMGGzuca90NABo62tyJ0KZytiDXryJ0BAf73yI7V
         gtmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lx8aY+/yDtRv3FLOutHx5ZS4iEMyIdYBOMCpO0cyw18=;
        b=R9NbvKmdFowpaUZpi74e1sUq9IuCnOrTUDTTMmu+51z4UzceLIybxXIXrQLqf3EAdG
         yFPfNmoVPBSEVHJCHh2Ce9ud63/A4f+w/URdLNw5rwQ+VEh8/Puu144dgaQbN3rTJo8y
         POdj3UMNCjMu3jkS9qe9Vx5DpZKzak/F3K7zE223LwVNadSLGfWj4lGQ0fVk2kzli4KA
         ndMLF18g7V1LpVRCA7w6x2KjR8rDhLE2CNtuMkVrhTEB1wzF7z5FGNIFzIcalW7WhKms
         5R4LE65N/ZtYjxqPJdM89AEzJ6iFufqPBBkcTQGDlmphA34KC9b3ZhJDSV9u0FbJE7YH
         ojEQ==
X-Gm-Message-State: AOAM532v2MtL/1u5Od+we4s/9x/Mljm0bgV0f//qlcgO+yGbtrZD3aOF
        EwjLOEWFRIge2Ajnj77V9hG2Eg==
X-Google-Smtp-Source: ABdhPJza6By/DI7WFRBuWNKSnUEnJyrqLv1g7UqN9TlFDao7Pbvy0JReR7BuPUrsYAZVWyN05p6Fiw==
X-Received: by 2002:a63:120e:: with SMTP id h14mr647881pgl.215.1627990631637;
        Tue, 03 Aug 2021 04:37:11 -0700 (PDT)
Received: from localhost ([122.172.201.85])
        by smtp.gmail.com with ESMTPSA id s36sm17710157pgk.64.2021.08.03.04.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Aug 2021 04:37:11 -0700 (PDT)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Arnd Bergmann <arnd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Jason Wang <jasowang@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Viresh Kumar <vireshk@kernel.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Cornelia Huck <cohuck@redhat.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        stratos-dev@op-lists.linaro.org, linux-kernel@vger.kernel.org,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>, linux-gpio@vger.kernel.org,
        virtualization@lists.linux-foundation.org
Subject: [PATCH V4 0/2] gpio: Add virtio based driver
Date:   Tue,  3 Aug 2021 17:06:54 +0530
Message-Id: <cover.1627989586.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

This adds Virtio GPIO driver based on the proposed specification [1].

The specification for basic GPIO operations is already reviewed by Linus and
Arnd, while the IRQ stuff is still under discussion and not finalized.

I am sharing the code, so everyone gets more clarity on how it will work
eventually in Linux.

I have tested this patchset with Qemu guest with help of the libgpiod utility.
I have also tested basic handling of interrupts on the guest side. It works as
expected.

The host side virtio-backend isn't ready yet and my tests only tested the flow
control between guest and host, but didn't play with real GPIO pins.  That will
be done once I have a working backend in place (WIP).

V3->V4:
- Lots of changes, as the specification changed too much. Better forget
  everything we have done until now :)

--
Viresh

[1] https://lists.oasis-open.org/archives/virtio-dev/202107/msg00232.html

Viresh Kumar (2):
  gpio: Add virtio-gpio driver
  gpio: virtio: Add IRQ support

 MAINTAINERS                      |   7 +
 drivers/gpio/Kconfig             |  10 +
 drivers/gpio/Makefile            |   1 +
 drivers/gpio/gpio-virtio.c       | 648 +++++++++++++++++++++++++++++++
 include/uapi/linux/virtio_gpio.h |  72 ++++
 5 files changed, 738 insertions(+)
 create mode 100644 drivers/gpio/gpio-virtio.c
 create mode 100644 include/uapi/linux/virtio_gpio.h

-- 
2.31.1.272.g89b43f80a514

