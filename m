Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 735953E5841
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Aug 2021 12:25:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230243AbhHJKZw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Aug 2021 06:25:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229743AbhHJKZs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Aug 2021 06:25:48 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF3DFC0613D3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Aug 2021 03:25:26 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id pj14-20020a17090b4f4eb029017786cf98f9so4569648pjb.2
        for <linux-gpio@vger.kernel.org>; Tue, 10 Aug 2021 03:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZdCiYC9u4FnuS70bUd9/octYWkdJG1zK6Pj5AbL4FKs=;
        b=cQctpUWGgS8XavHH49A7V07HpxQh3UZrgT0rpm6Xo7pjORT+h6V/gpJmAk/K9q82l0
         BXpx2fSycKX07osBbPOk/myawlvQA2W1M+F/f8oOsBLdfuRqo6JaTriVSznwdhJadbrP
         2kKOFPWUDPXnGnLFu5FFweje7fwSYSsPE36n/iipqP85ti4NnpCTiS+XjRlVk1MFh/nE
         Bfno9U2KlR96Faike7CAHkTU3WBSWpIlTIaEY9yC7TQ4/ZJvYmj0aashV0IlkVQFkRi2
         JFkacqTJxlS3oqGOYl77XZRvrIPSD6kp9q20EvRFTryUlmnBhYmsbKQadXdFz8Cur9No
         0ccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZdCiYC9u4FnuS70bUd9/octYWkdJG1zK6Pj5AbL4FKs=;
        b=cn4HffdbgItoBSFgyOdP9SSypXI+sZbt9YRhFm98nDAInbQHUcnOlSmicUyQ31Ls5A
         bY69oAWyEXPmszdHwGGPsRUs5tPWHZ0ue6H5am9BogW8IiOKvPkjeDOFLnL2OfJ/MKGN
         y9psx2QtkXs7duKdt6NUSEyoGV2HUsYMJPYfMSJsafzO44FkHpay4tRh9x9yNkCWnqth
         xDMr9fhyqd/9bVPD4xY5zncu7omzIPQjm2PHWi+qg4YZmZKFZ+m93eEt0y+7GGYlF0cw
         6F777A8QiO21p3dFLN5MQ1/M0h5QXuGGwF15UbLVqGvuAPY0TmFycUlZWh7MRPAdDNSc
         YHQg==
X-Gm-Message-State: AOAM532AUDSu2Tt7VQDXzjS0aMRQOfTUW1Nj3DAAA/SbxoaaZoDtI5HJ
        S5erahFvFBCPKLBEc7Szw6jglQ==
X-Google-Smtp-Source: ABdhPJwfe8truRga+QTqCjf8OWZq0lELLcSbl5CksIhnr3YftGvX2WA1G7Yb3PcGGaa9QKuM2Hs74w==
X-Received: by 2002:a65:450c:: with SMTP id n12mr312121pgq.316.1628591126406;
        Tue, 10 Aug 2021 03:25:26 -0700 (PDT)
Received: from localhost ([122.172.201.85])
        by smtp.gmail.com with ESMTPSA id a11sm27981920pgj.75.2021.08.10.03.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 03:25:25 -0700 (PDT)
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
Subject: [PATCH V5 0/2] gpio: Add virtio based driver
Date:   Tue, 10 Aug 2021 15:55:14 +0530
Message-Id: <cover.1628590591.git.viresh.kumar@linaro.org>
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

V4->V5:
- Use ____cacheline_aligned for buffers.
- Proper locking in place, which avoids the use of work-item for processing
  interrupts.
- Separate callbacks for enable/disable of irqs.
- The irq is disabled at the host only for enable/disable now, instead of
  mask/unmask.
- mask/unmask only control the queuing of buffers now.
- Use handle_level_irq() instead of handle_fasteoi_irq().
- Other minor changes.

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
 drivers/gpio/gpio-virtio.c       | 668 +++++++++++++++++++++++++++++++
 include/uapi/linux/virtio_gpio.h |  72 ++++
 5 files changed, 758 insertions(+)
 create mode 100644 drivers/gpio/gpio-virtio.c
 create mode 100644 include/uapi/linux/virtio_gpio.h

-- 
2.31.1.272.g89b43f80a514

