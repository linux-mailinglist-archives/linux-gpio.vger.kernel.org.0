Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DD1E2F618D
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Jan 2021 14:09:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727163AbhANNJR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 Jan 2021 08:09:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725878AbhANNJQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Jan 2021 08:09:16 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11012C061575
        for <linux-gpio@vger.kernel.org>; Thu, 14 Jan 2021 05:08:36 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id 190so4491213wmz.0
        for <linux-gpio@vger.kernel.org>; Thu, 14 Jan 2021 05:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=0UQRlGRhhSQJUPHlxgxTpsKu4P5pHgiDZAobJpjj98k=;
        b=w3IpJEMVrZPsx6nj67HQr8PDvGDpWvmLaCLJtTVWQx8dBxE+RVjmAP1eKF9lJDxmBV
         9C1libXZoFPdGkhU5kEeIg5i5L9PzVdGt5EmLJrWK3tG7QsTP41fZ+KGOelHHTbPXlXd
         066I7/aZNXaQ5XtuG2jRTCjFgcAHM+azwE58l/dhe5JSPGb/5fCC398XTqO0MVKRVsMg
         798pXN84iFu9EoX63N4XRMXihkUQ9VOp8hFmlrEjc9qDdeAQtJ9aiv00XfltdkA+IfL7
         TOae3FoqJNHEISCb+PZzISwuARpU8i59etrbPNOsB46WCt9VUM3/ec6fNVodHwFN9MgB
         gaKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=0UQRlGRhhSQJUPHlxgxTpsKu4P5pHgiDZAobJpjj98k=;
        b=fU4CtoINxFFTbpqdVflkpyIVrzkmUgr1nfFzK6Yk/LvDz61ox7/IlqCEtlh9uml4O8
         zZi58/lFkG4B1RVOgn9+/wTCLBk5x5ZAzQ43/8gWkywMmBL7oCuUv4BBX0sJbo7KOdlF
         sDMZJLkbwVz6qCiymlPe8Ac+GjhwL9hwQdtYdUstCxrbZY2b4E42V59j8p+oNv/FR6WJ
         RDQdy7cSR1fqOYJCLNUXAzS1n4zGoWeRUqb8oNh5iWCRF2heT4FWZ34gxlTRoC2leiD0
         9B9szdzPygOeELE9Y8Atu18GVtioGdSofxBicLlaXJwxbIkm83GOFNvVMM6Yz79amq0A
         DVNQ==
X-Gm-Message-State: AOAM531MKju5DgOtOs4BZFWfHUjpjzt8WEgG9ZSJcIajZ763arxzVAwF
        eMo+BbkQCME2BUX0oxp/kFgr+g==
X-Google-Smtp-Source: ABdhPJxTqpOe445AStxMq1sXCYuysKWIFDo2jXYOHdrcsgHHpNXw6/X8isquvbn1QYgauumWGeUnDQ==
X-Received: by 2002:a05:600c:3510:: with SMTP id h16mr3848418wmq.156.1610629714637;
        Thu, 14 Jan 2021 05:08:34 -0800 (PST)
Received: from dell ([91.110.221.178])
        by smtp.gmail.com with ESMTPSA id z130sm8490671wmb.33.2021.01.14.05.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 05:08:33 -0800 (PST)
Date:   Thu, 14 Jan 2021 13:08:31 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     marek.vasut+renesas@gmail.com, matti.vaittinen@fi.rohmeurope.com,
        lgirdwood@gmail.com, broonie@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, khiem.nguyen.xt@renesas.com,
        linux-power@fi.rohmeurope.com, linux-gpio@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] Immutable branch between MFD, GPIO and Regulator due for
 the v5.12 merge window
Message-ID: <20210114130831.GU3975472@dell>
References: <1610442067-7446-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1610442067-7446-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Enjoy!

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-gpio-regulator-v5.12

for you to fetch changes up to b2548da647bb04737196ffd945505d47a166239b:

  mfd: bd9571mwv: Add support for BD9574MWF (2021-01-14 13:05:55 +0000)

----------------------------------------------------------------
Immutable branch between MFD, GPIO and Regulator due for the v5.12 merge window

----------------------------------------------------------------
Khiem Nguyen (2):
      mfd: bd9571mwv: Make the driver more generic
      mfd: bd9571mwv: Add support for BD9574MWF

Yoshihiro Shimoda (10):
      mfd: bd9571mwv: Use devm_mfd_add_devices()
      dt-bindings: mfd: bd9571mwv: Document BD9574MWF
      mfd: rohm-generic: Add BD9571 and BD9574
      regulator: bd9571mwv: rid of using struct bd9571mwv
      regulator: bd9571mwv: Add BD9574MWF support
      gpio: bd9571mwv: Use the SPDX license identifier
      gpio: bd9571mwv: rid of using struct bd9571mwv
      gpio: bd9571mwv: Add BD9574MWF support
      mfd: bd9571mwv: Use the SPDX license identifier
      mfd: bd9571mwv: Use devm_regmap_add_irq_chip()

 .../devicetree/bindings/mfd/bd9571mwv.txt          |   4 +-
 drivers/gpio/gpio-bd9571mwv.c                      |  35 ++--
 drivers/mfd/bd9571mwv.c                            | 178 ++++++++++++++-------
 drivers/regulator/bd9571mwv-regulator.c            |  59 ++++---
 include/linux/mfd/bd9571mwv.h                      |  45 ++----
 include/linux/mfd/rohm-generic.h                   |   2 +
 6 files changed, 186 insertions(+), 137 deletions(-)

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
