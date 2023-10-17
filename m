Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79F407CC6FD
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 17:06:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344258AbjJQPG3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 11:06:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235097AbjJQPGQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 11:06:16 -0400
Received: from mail-lf1-x163.google.com (mail-lf1-x163.google.com [IPv6:2a00:1450:4864:20::163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9388427761
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 07:56:25 -0700 (PDT)
Received: by mail-lf1-x163.google.com with SMTP id 2adb3069b0e04-507973f3b65so6821727e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 07:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gadgetoid.com; s=google; t=1697554584; x=1698159384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UilswDwlvBkabuCwvX6yKYehmGuxJHWmDtUkDRSp1wc=;
        b=VA/cvoewPm9MSNOKZ71Ux/V9aC4hJbSJ0F1msAvHLuZqwiPW3mpbKbi1NS7KxOaFEF
         r1t6SmQm2DyfNgArA9AiYeioVtXsTXGqrAFF4QviNaJ4M43oRG7BA5wdmzcKHqL3eQHV
         DL5Lx+GI/7FvAwtoXmo73I6itoVL5SrZjsTEBya+MP1De61X1Pa4jRv4kXf4wy3atXol
         ofCRhDxBlHjiJyYRJBSlVCIBFqHsGtH5rRuU4mW1WSmYQDcqcrlMwUArzM95y/r7loSp
         iNRp9bCYIEqioEkE3B0frFXS1HZ9i3aDLGY5ABaTTcWwQrEWEzo6CaxZTQkpTCOuZSOG
         5QVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697554584; x=1698159384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UilswDwlvBkabuCwvX6yKYehmGuxJHWmDtUkDRSp1wc=;
        b=LrBC3lGkYw21ow/Ff4wwuVzCXqUXgwuQSKEIElOsvRWhNcUr+DaB6t9MABFIALhqwZ
         SydObndDFYcT80DwBckMN0dsNoLcv9F7nNGM90+Ppo6Y6yDAkAwJ6/zORBKB0WTTni3x
         LZ93DGmROYjpeJtkQoD+D/eapfndEyAMMPUtb9O8OAUoKwFdtivF+0HWqEg2VL86J3BG
         W72cM/45KQ4QfErWyEb6gLYt00/afGHyI8pYREcMdFDzDug7TPpKCb7n0iAK1ppHBJz4
         tdu+/VLrucMpEkNPvFQRgv3WrJnq1wqz8WxqiirW8HULZsYz0meIlEeEn8y6pOGyrbAM
         Fk1w==
X-Gm-Message-State: AOJu0YxkzZJgURLXvmyEVa6hq08j3OK6Wg4uVOd6e1SjeEmvVVft+Mvj
        ftWPMbf2cw7yUBhzT8ygDaicJ57KK8rIOkr/p9/9gvqFJvR8hg==
X-Google-Smtp-Source: AGHT+IGZaiRX1PGAr4TFtJNBLOJogNpk8raJRxIEBWitv/qMvY78TPwrJkm6PrpHLUEELFRfqQnHYS3Pd4+Q
X-Received: by 2002:ac2:4282:0:b0:507:9a55:c463 with SMTP id m2-20020ac24282000000b005079a55c463mr1951843lfh.9.1697554583456;
        Tue, 17 Oct 2023 07:56:23 -0700 (PDT)
Received: from pop-os.. (cpc91242-cmbg18-2-0-cust972.5-4.cable.virginm.net. [82.8.131.205])
        by smtp-relay.gmail.com with ESMTPS id y9-20020ac255a9000000b0050338aa1da7sm305798lfg.41.2023.10.17.07.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 07:56:23 -0700 (PDT)
X-Relaying-Domain: gadgetoid.com
From:   Phil Howard <phil@gadgetoid.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org, Phil Howard <phil@gadgetoid.com>
Subject: [libgpiod][PATCH 0/1] bindings: python: move long_description into README.md
Date:   Tue, 17 Oct 2023 15:55:48 +0100
Message-Id: <20231017145549.179355-1-phil@gadgetoid.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Move the long_description text from setup.py (which appears as the
description on pypi) into a separate README.md and include it in the
project.

This README assumes that "bindings: python: optionally include module in
sdist" has been applied and that the pypi package will be uploaded to
"gpiod", replacing the unofficial pure-Python bindings that currently live
there.

It also includes some very basic usage examples.

Phil Howard (1):
  bindings: python: move long_description into README.md

 bindings/python/MANIFEST.in |   1 +
 bindings/python/README.md   | 104 ++++++++++++++++++++++++++++++++++++
 bindings/python/setup.py    |   4 +-
 3 files changed, 107 insertions(+), 2 deletions(-)
 create mode 100644 bindings/python/README.md

-- 
2.34.1

