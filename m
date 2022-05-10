Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AE5B5222BE
	for <lists+linux-gpio@lfdr.de>; Tue, 10 May 2022 19:31:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348273AbiEJRfc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 May 2022 13:35:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348250AbiEJRfa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 May 2022 13:35:30 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D07AA41992
        for <linux-gpio@vger.kernel.org>; Tue, 10 May 2022 10:31:20 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id t16so14049103qtr.9
        for <linux-gpio@vger.kernel.org>; Tue, 10 May 2022 10:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0iY23zFExaBL60617nuIY2YUPps8RPXgyzTZFJOKDcA=;
        b=g6+UAI3/t5qZDSi024NMaSQW9L1woLMbAa8zYqN9d6WnrslvlGDfqNkkgLr3snUKtq
         5d9SMcLKaL/sqsEKckXJORH48a4ImkyIW/S4Kj6a5dEvU55+H4/0k2lIE2zwLBATCRud
         WexDhY4FRVJWO8Kk4gnubeld01Mz4LyUTAJTySPyaHuxIB2BXBwNWvnQanz01cz1wi2K
         zSzTFqibTRMbbCCK7FWBy0jVq+BU3pbfY/DYDnyhZ4GZTL1IRSb2d7ub5JyaorbYSgEP
         nJv5P65erTue4oIdoxVge8N8ts/BSe+JeEzEbvKDJCipWqe/0FoGcYZ6oKpK8ap+NF/k
         5kZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0iY23zFExaBL60617nuIY2YUPps8RPXgyzTZFJOKDcA=;
        b=QsTUgJ8Gbe+N8U22VsOLkjQCZcUeviNgXWQnd9wOtPsyxTNv8vRKhJPzKmPYNYBoTj
         qzE77mxz5m5SurZXCZfDxcMtSyJ1cy2NDjKrZSghCokj1EFkIxyj2031UN6phi+BuQkc
         lwFem4J1zCwgSl26dp5PTO1o/5RF4PJJij2rqgBdYMZi1/e8OW1PRYnm37Ehw19Jgrjr
         C7ArDbQz3r2G1zi1Ybeal0LkhH9p70rSTDvkyRb7NxNiFFCliaBGsQZsy7CE36zXaw3+
         uK9WD9uOK+p4pfxHXMAG4Pj43cEOWPAvF2LBunwC71HyGWtGFLKWNnlSX4V9Qqw6Zyg/
         h2NQ==
X-Gm-Message-State: AOAM530HmqKmNQuqndCMYG8gck/gs4y5c9SvYifhTk0oIY76yGRVeeFl
        f344aRKIm6lS7ZvNdS7Dg3158g==
X-Google-Smtp-Source: ABdhPJzIphDLwXNNwnWOU9HcLMnKXbbHnEPAd9b4DF6Hhn7oxdik8+xWMeo59u5F3o8KH4j873bs1Q==
X-Received: by 2002:a05:622a:1713:b0:2f3:dc97:eb24 with SMTP id h19-20020a05622a171300b002f3dc97eb24mr9109511qtk.547.1652203880008;
        Tue, 10 May 2022 10:31:20 -0700 (PDT)
Received: from fedora.attlocal.net (69-109-179-158.lightspeed.dybhfl.sbcglobal.net. [69.109.179.158])
        by smtp.gmail.com with ESMTPSA id i6-20020a05620a150600b0069ff8ebec64sm8490411qkk.103.2022.05.10.10.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 10:31:19 -0700 (PDT)
From:   William Breathitt Gray <william.gray@linaro.org>
To:     linux-iio@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linus.walleij@linaro.org, schnelle@linux.ibm.com,
        David.Laight@ACULAB.COM, macro@orcam.me.uk,
        William Breathitt Gray <william.gray@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH 0/8] Utilize iomap interface for PC104 and friends
Date:   Tue, 10 May 2022 13:30:52 -0400
Message-Id: <cover.1652201921.git.william.gray@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

PC104 cards and similar devices do not need to access I/O ports directly
via inb()/outb() and can instead use the more typical I/O memory
ioread8()/iowrite8() accessor calls by first calling ioport_map(). This
patchset converts the relevant PC104/ISA card drivers to do such. With
these drivers now utilizing I/O memory accessor calls, work can be done
to consolidate some similar devices (e.g. 104-idio-16, pci-idio-16,
etc.) into a unified driver in a future patchset.

This patchset spawned from a suggestion made in another thread titled
"gpio: add HAS_IOPORT dependencies":
https://lore.kernel.org/all/c3a3cdd99d4645e2bbbe082808cbb2a5@AcuMS.aculab.com/

William Breathitt Gray (8):
  counter: 104-quad-8: Utilize iomap interface
  gpio: 104-dio-48e: Utilize iomap interface
  gpio: 104-idi-48: Utilize iomap interface
  gpio: 104-idio-16: Utilize iomap interface
  gpio: gpio-mm: Utilize iomap interface
  gpio: ws16c48: Utilize iomap interface
  iio: adc: stx104: Utilize iomap interface
  iio: dac: cio-dac: Utilize iomap interface

 drivers/counter/104-quad-8.c    | 169 +++++++++++++++++---------------
 drivers/gpio/gpio-104-dio-48e.c |  63 ++++++------
 drivers/gpio/gpio-104-idi-48.c  |  27 ++---
 drivers/gpio/gpio-104-idio-16.c |  33 ++++---
 drivers/gpio/gpio-gpio-mm.c     |  43 ++++----
 drivers/gpio/gpio-ws16c48.c     |  65 ++++++------
 drivers/iio/adc/stx104.c        |  56 ++++++-----
 drivers/iio/dac/cio-dac.c       |  14 +--
 8 files changed, 248 insertions(+), 222 deletions(-)


base-commit: ce522ba9ef7e2d9fb22a39eb3371c0c64e2a433e
-- 
2.35.3

