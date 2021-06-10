Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0400B3A2B28
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jun 2021 14:10:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230289AbhFJMM3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Jun 2021 08:12:29 -0400
Received: from mail-pf1-f181.google.com ([209.85.210.181]:41499 "EHLO
        mail-pf1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229935AbhFJMM3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Jun 2021 08:12:29 -0400
Received: by mail-pf1-f181.google.com with SMTP id x73so1439390pfc.8
        for <linux-gpio@vger.kernel.org>; Thu, 10 Jun 2021 05:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b8nZP+Gapaq0m2CiyXSp+UoYpv4V40nbqCx5vZWy2So=;
        b=qNpHGLbzx8OhyV03T1XQBAEOd4lRjyRCU0fJwWQZM9z8cmhPoAFi+GDxkHRMRhazLH
         R0nsMAtnYe96LshwmR/TMRPVGoU8ytMBoxbmB53R8tZYrcmwEFY8HlHAn44TpYb0pzTh
         qmB77sFVrdZyAyBI4G19njPnorLQYKYdmRF092cSd0Ei7zqUxCPk/1jsa5KnX0YhIvk1
         SzFP1/gawTAr5K0/RmkjYDxzJD37wlU3JNFPy+LzxoihOhSyx3ZJ+C93QrVboF34Xv0n
         Li/GbaMZV6qI7CbrdPL5RJ9aq7yt+bgyv+rUCOxswMYCURW7p2jiiOGrkgPqjecyRGWA
         0TTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b8nZP+Gapaq0m2CiyXSp+UoYpv4V40nbqCx5vZWy2So=;
        b=LJi80220b1FW2fLuPWrIHJE54X/zPo/13Eyue634qIErzdQ3C51hQH1D4ZQCyaniT1
         tT2gA3EpzCMMN97Tz9tscreze4rAx4I/YhNv9QlitpDNRPDBWqIxZt1WkV4WZT4kQaBK
         Qpyn4KbNpT8oOlFF/mmHKMzb+/487HB/4II74nQm3mu9cLdPxdPm6syUz02R3GVlba6Q
         gnEe+DiGS1h2f62Y7FrcNqQLvQL+dmHr+2a1mAxYSkW/cSjw6a3GEdlt7XsFFrgchk+t
         r3x4JUz7oopsyA35xuC6RwGUvqKhu83cGBnLX0eMnpg3qSxkLoWTUvczxxWz+HcMARcS
         4y5Q==
X-Gm-Message-State: AOAM532zCDLIuzLMz0DGH+wh7TZi/ki3xvlKwEo/VT6/qlp6Ao7OwadL
        I69JVFnNYYkqr2DPRDRFfFAvAg==
X-Google-Smtp-Source: ABdhPJwSp9xuwNSizzHp3uvbFX+DHZygMqXvOaYSXbJZdQ1gOs84CgFHQge7IuxwbzYsh3V0+5Vtug==
X-Received: by 2002:a62:ab16:0:b029:2ed:8599:7df8 with SMTP id p22-20020a62ab160000b02902ed85997df8mr2772433pff.31.1623326957801;
        Thu, 10 Jun 2021 05:09:17 -0700 (PDT)
Received: from localhost ([136.185.169.128])
        by smtp.gmail.com with ESMTPSA id v67sm2423802pfb.193.2021.06.10.05.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 05:09:17 -0700 (PDT)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Jason Wang <jasowang@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Viresh Kumar <vireshk@kernel.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stefan Hajnoczi <stefanha@redhat.com>,
        "Stefano Garzarella --cc virtualization @ lists . linux-foundation . org" 
        <sgarzare@redhat.com>, virtualization@lists.linux-foundation.org
Subject: [PATCH V3 0/3] gpio: Add virtio based driver
Date:   Thu, 10 Jun 2021 17:39:05 +0530
Message-Id: <cover.1623326176.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

This adds a virtio based GPIO driver based on the proposed specification [1].

The first two versions [2] were sent by Enrico earlier and here is a newer version.
I have retained the authorship of the work done by Enrico (1st patch) to make
sure we don't loose his credits.

I have tested all basic operations of the patchset (with Qemu guest) with the
libgpiod utility. I have also tested the handling of interrupts on the guest
side. All works as expected.

I will now be working towards a Rust based hypervisor agnostic backend to
provide a generic solution for that.

This should be merged only after the specifications are merged, I will keep
everyone posted for the same.

I am not adding a version history here as a lot of changes have been made, from
protocol to code and this really needs a full review from scratch.

--
Viresh

[1] https://lists.oasis-open.org/archives/virtio-comment/202106/msg00022.html
[2] https://lore.kernel.org/linux-gpio/20201203191135.21576-2-info@metux.net/

Enrico Weigelt, metux IT consult (1):
  gpio: Add virtio-gpio driver

Viresh Kumar (2):
  gpio: virtio: Add IRQ support
  MAINTAINERS: Add entry for Virtio-gpio

 MAINTAINERS                      |   7 +
 drivers/gpio/Kconfig             |   9 +
 drivers/gpio/Makefile            |   1 +
 drivers/gpio/gpio-virtio.c       | 566 +++++++++++++++++++++++++++++++
 include/uapi/linux/virtio_gpio.h |  56 +++
 include/uapi/linux/virtio_ids.h  |   1 +
 6 files changed, 640 insertions(+)
 create mode 100644 drivers/gpio/gpio-virtio.c
 create mode 100644 include/uapi/linux/virtio_gpio.h

-- 
2.31.1.272.g89b43f80a514

