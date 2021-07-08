Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D4383BF5EF
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jul 2021 09:04:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230463AbhGHHH0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Jul 2021 03:07:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230439AbhGHHHR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Jul 2021 03:07:17 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60E9EC06175F;
        Thu,  8 Jul 2021 00:04:33 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id i8so6092288wrp.12;
        Thu, 08 Jul 2021 00:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4HdS+1zzYSfno+JUGYtOIIG/rvqs1FRcD5TOoZO7dKY=;
        b=DxQToHY/jjUbVuus5JQ98+4Hu5pqo0s/xZkPpqGPLsDg0uZcQvO19hsibk65WXbRlg
         UVz3OC8gbA4slwdgktYvLa0yMorCtIJOPD1rZCin6lLA5LPqYdylDNW+BaeiwTkSwKxH
         O9iWd8w6HhNYnU72A6f1US835R3cNkc/c2PssSZtnC1IxjzL6lLYvnRvTjNjTWs9aTqQ
         EQxipsGwV8IvcsVoa5Ls0lml3ct9PyeSR9ELg91gg81QHT4BZb80YnTmcwngVB+TpyjZ
         ldLQ3JfDl1a2Yh77MfmgiFjAoEYqPcHl4kX+XDHg332MUGwTZuiqV3Eot4V9Wg61m3cx
         blkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4HdS+1zzYSfno+JUGYtOIIG/rvqs1FRcD5TOoZO7dKY=;
        b=EC6yIuIbPQT0dbuAOjndLuSWHBu8oC+vpxey4V3yXn1QTktWaR6iEw8XozXqRD0zHD
         ng9LGREa11V3jNB5DYoArym0oIcNxe17Dtg8J0IHAmB2ZI+SE8C0aZIxnjJj33z5Beru
         i09+cqEQSIRb83LjuuacDbOsLS/lX/RwAVAuTLcz5axbjvxdJy3h6Lb17HjwGZ36tm+d
         jxJu6eFiPpfRB9q55NiZwPD/HC1b2EhFuvYLOzB6qqA30CGCgqnTboxflmIEXZDsqSXB
         ccFWAeDQEqDKYnWbLc8Gs4raowyfRssw49LxN3gT86v0W2JfeaWxAw4RjMuAVH7WcwWo
         hfAQ==
X-Gm-Message-State: AOAM532mniH0WnKx7E20CLGrgYlb/6KlYVSDiH8gtzswfb3WaOb8GBm/
        E3ioIHG/hE/RpKtdnjrPOUDAWgkWL6PIag==
X-Google-Smtp-Source: ABdhPJzXboEHaiZMOClY/FtNEt3bH9L0UZ61ea85PugeInKlRkjFtXi+kG5k0O18GcNd2uV9d4owHw==
X-Received: by 2002:a05:6000:11cf:: with SMTP id i15mr12944063wrx.212.1625727871724;
        Thu, 08 Jul 2021 00:04:31 -0700 (PDT)
Received: from localhost.localdomain (98.red-81-38-58.dynamicip.rima-tde.net. [81.38.58.98])
        by smtp.gmail.com with ESMTPSA id u15sm8093305wmq.1.2021.07.08.00.04.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Jul 2021 00:04:30 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     linus.walleij@linaro.org, gregory.0xf0@gmail.com,
        bgolaszewski@baylibre.com, f.fainelli@gmail.com,
        matthias.bgg@gmail.com, opensource@vdorst.com,
        andy.shevchenko@gmail.com, git@johnthomson.fastmail.com.au,
        neil@brown.name, hofrat@osadl.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] gpiolib: convert 'devprop_gpiochip_set_names' to support multiple gpiochip per device
Date:   Thu,  8 Jul 2021 09:04:26 +0200
Message-Id: <20210708070429.31871-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There are some unfortunate cases where the DT representation
of the device and the Linux internal representation differs.
Such drivers for devices are forced to implement a custom function
to avoid the core code 'devprop_gpiochip_set_names' to be executed
since in any other case every gpiochip inside will got repeated
names through its internal gpiochip banks. To avoid this antipattern
this changes are introduced trying to adapt core 'devprop_gpiochip_set_names'
to get a correct behaviour for every single situation.

This series introduces a new 'offset' field in the gpiochip structure
that can be used for those unfortunate drivers that must define multiple
gpiochips per device.

Drivers affected by this situation are also updated. These are
'gpio-mt7621' and 'gpio-brcmstb'.

Motivation for this series available at [0].

Thanks in advance for your feedback.

Best regards,
    Sergio Paracuellos

[0]: https://lkml.org/lkml/2021/6/26/198

Sergio Paracuellos (3):
  gpiolib: convert 'devprop_gpiochip_set_names' to support multiple
    gpiochip baks per device
  gpio: mt7621: support gpio-line-names property
  gpio: brcmstb: remove custom 'brcmstb_gpio_set_names'

 drivers/gpio/gpio-brcmstb.c | 45 +------------------------------------
 drivers/gpio/gpio-mt7621.c  |  1 +
 drivers/gpio/gpiolib.c      | 34 +++++++++++++++++++++++-----
 include/linux/gpio/driver.h |  4 ++++
 4 files changed, 34 insertions(+), 50 deletions(-)

-- 
2.25.1

