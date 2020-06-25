Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65245209762
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2020 02:10:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388674AbgFYAKr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Jun 2020 20:10:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388665AbgFYAKp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Jun 2020 20:10:45 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 254A0C061573
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2020 17:10:44 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id k1so1919359pls.2
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2020 17:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=8GLNFmLwFxRxFkvvXf3GIeFQ0kp75ljQGaNoPkL6Oeg=;
        b=KB67FIscqsRKXoeF58Qep71/a//XbC0Lu9YseXcCAMKyeeeTnqctqHHll3EfluNzeo
         00LLvyXVTJ4H5dP+yl9r6RlvQoJI0T/KMYDjoT1aAWtTfTSGS+biJ5GMhyf7u9zcIu8q
         e0/Qx4LHVkf/1AUlRVQ9TbzVz7OFHmN+fRyN2gGTn/gusJU+l6FcRXC3gudJ1VEeGs8h
         P5k5qiTZEdQnbdFuroCZLxeoSk5iXG+/aG1LdlDA8aNJ+F294VFnMjqcce7JGb5GPgax
         zvREaBKkfqWf5mdiuZVMRGrRUkaRm0hUsFm9n/Jn1CIUMTULFVi5a/Q30cAxvzvlmZHE
         iEGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=8GLNFmLwFxRxFkvvXf3GIeFQ0kp75ljQGaNoPkL6Oeg=;
        b=hqYY3Je5kn5gp8+JkSRv0k1eSOxE2NjVL+5ZRd6UJ1qHZpI5+dpQAV3VDLUiLS3/P8
         mhlLNxt5sHysiBHxz31vBix0xX5tL2F8kfqu4HeTelt9EDXhoTBE/OlYjmPY4ZReEUUc
         uY6tMKpShL8zUewuFaIZrA3DrKPq0NP4WwC9/DNyWV3dSikqSBbGG+v06nr3/InQ3xXu
         0AzsV3vLzOzqZLA19hCK/7SS/GCKD78K6q9r9wX7v9P5ir2MwifCs5MNCdHeQ/Z9Xpw1
         0KIiB0L1YeL1bOg4CI4Tj4BRT18nH7mtLJI6Jn9OsaoSK+d6be7oOtwF6jr4QEi17H+/
         GX6A==
X-Gm-Message-State: AOAM530fT5fsUMK40UCfNs7QijR1uybFscys8e0Y7KrhKFwdOFVQzHKA
        BJZhWsL0aopRZ3EmOVEWmiQezQ==
X-Google-Smtp-Source: ABdhPJw5Ki+S7Ajanat5/ntyPcc1LAiikavEw9WMNgz9BOuejIKmBlFOlrRc/VFYWeblhHFU/nIYPg==
X-Received: by 2002:a17:902:ed14:: with SMTP id b20mr4448393pld.25.1593043843209;
        Wed, 24 Jun 2020 17:10:43 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id n19sm17458671pgb.0.2020.06.24.17.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 17:10:42 -0700 (PDT)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Saravana Kannan <saravanak@google.com>,
        Todd Kjos <tkjos@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-gpio@vger.kernel.org
Subject: [PATCH v2 0/5] Allow for qcom-pdc, pinctrl-msm and qcom-scm drivers to be loadable as modules
Date:   Thu, 25 Jun 2020 00:10:34 +0000
Message-Id: <20200625001039.56174-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch series provides exports and config tweaks to allow
the qcom-pdc, pinctrl-msm and qcom-scm drivers to be able to be
configured as permement modules (particularlly useful for the
Android Generic Kernel Image efforts).

Feedback would be appreciated!

New in v2:
* Fix up MSM_PINCTRL Kconfig dependency logic so we match
  QCOM_SCM.
* Minor tweaks and corrections suggested by Bjorn and Maulik


thanks
-john

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Lina Iyer <ilina@codeaurora.org>
Cc: Maulik Shah <mkshah@codeaurora.org>
Cc: Saravana Kannan <saravanak@google.com>
Cc: Todd Kjos <tkjos@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: iommu@lists.linux-foundation.org
Cc: linux-gpio@vger.kernel.org


John Stultz (5):
  irq: irqdomain: Export irq_domain_update_bus_token
  irq: irqchip: Export irq_chip_retrigger_hierarchy and
    irq_chip_set_vcpu_affinity_parent
  irqchip: Allow QCOM_PDC to be loadable as a permanent module
  pinctrl: qcom: Allow pinctrl-msm code to be loadable as a module
  firmware: QCOM_SCM: Allow qcom_scm driver to be loadable as a
    permenent module

 drivers/firmware/Kconfig           |  2 +-
 drivers/firmware/Makefile          |  3 ++-
 drivers/firmware/qcom_scm.c        |  4 ++++
 drivers/iommu/Kconfig              |  2 ++
 drivers/irqchip/Kconfig            |  2 +-
 drivers/irqchip/qcom-pdc.c         | 31 ++++++++++++++++++++++++++++++
 drivers/pinctrl/qcom/Kconfig       | 24 ++++++++++++++++++++++-
 drivers/pinctrl/qcom/pinctrl-msm.c |  2 ++
 kernel/irq/chip.c                  |  3 ++-
 kernel/irq/irqdomain.c             |  1 +
 10 files changed, 69 insertions(+), 5 deletions(-)

-- 
2.17.1

