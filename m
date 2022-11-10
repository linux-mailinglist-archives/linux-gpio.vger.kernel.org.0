Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFFA2624A61
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Nov 2022 20:13:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229777AbiKJTN3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Nov 2022 14:13:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229796AbiKJTN1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Nov 2022 14:13:27 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF567A4
        for <linux-gpio@vger.kernel.org>; Thu, 10 Nov 2022 11:13:22 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id w14so3639543wru.8
        for <linux-gpio@vger.kernel.org>; Thu, 10 Nov 2022 11:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oFoLizY5XO3vDCKZJ2dvKZV31xiR/VPrT0uieb2OjMI=;
        b=pfzusf9TSI9XoZSoEmriiSztP0uTG9xaad+QRRAJhPRTl4qBYQUEIC4h0xbNW3eonS
         6+pL4Vix8gSCZNsSvHie25tSWqdrBtyVGA+2spOVR4f/upiJTY6GTNs0IPBR2ls+hnjO
         1as6aBjhCEQEGAmRtZ5B7KWRCAuVKM89dcBixPwzxgjrLMqVNMEfyTqF+eTNZwayUGZP
         FTHctnAmcsWkkAQGR/CUStgGf/rwoYRzFZN/BuG4qFFVZzsWFM9ouwT5rNUym5eVDKgN
         dcl318gpCm4Gnyu/SG6rxG99KoqGYgrtrzc3Zoo+NbdzEp4aP0OAvDMIwvr5VzWo3bh0
         xfJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oFoLizY5XO3vDCKZJ2dvKZV31xiR/VPrT0uieb2OjMI=;
        b=8Kv+4PDTx9aT9lmH7crfknCur32gMOsCQ19zvPet5fNqtgNI6G6uuWrYJ8segSeepG
         B0w/EeLFa7lo5VUUPaILwqhqsl+ZE3mAyoXnKMbHnGSA9OQLStnuEwPrdb9qK/8K8Nsh
         pCv0et3mNggrmGnN4I/pqJYr0OPasDw5zhr4NJ1byMB6Nczj6WEAh0/TgarJAH+AhRAj
         QJYs414EnSJlw5EhT1ZR5zRjDCqbMKANM25ZHfa2grlPSSgSMAgYzLKtujQdeuwxvCoT
         Ejxhqe9pZoFzR04NM0OnngCvmSRZKpTeZC3ikUrHM5BnIFSao9cr0/2mgmeRULXWNAM2
         88ug==
X-Gm-Message-State: ACrzQf1W+aV0t2oHiRH81u6ojhmiWX8rzDJaO1qRmdhzS6YgEiwvXUtM
        Iky4YfgASrSreBkvPqtA1gd9+esSqe09Kg==
X-Google-Smtp-Source: AMsMyM6ZgRiOY9L+qS1vx4cQ6MHBBYEHs/pBN8ONOGh/1Ji/GMjUI2Jbvcc0jHxS6No5OtmRdXLvOg==
X-Received: by 2002:a5d:6688:0:b0:238:3e06:9001 with SMTP id l8-20020a5d6688000000b002383e069001mr25673879wru.308.1668107601149;
        Thu, 10 Nov 2022 11:13:21 -0800 (PST)
Received: from localhost.localdomain ([212.228.7.114])
        by smtp.gmail.com with ESMTPSA id bk28-20020a0560001d9c00b002365b759b65sm17025102wrb.86.2022.11.10.11.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 11:13:20 -0800 (PST)
From:   Niyas Sait <niyas.sait@linaro.org>
To:     linux-gpio@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, rafael@kernel.org,
        linus.walleij@linaro.org
Cc:     Niyas Sait <niyas.sait@linaro.org>
Subject: [PATCH RFC 0/3] pinctrl: add ACPI support to pin controller
Date:   Thu, 10 Nov 2022 19:12:55 +0000
Message-Id: <20221110191258.1134378-1-niyas.sait@linaro.org>
X-Mailer: git-send-email 2.25.1
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

This is a proposal for adding ACPI support to pin controller.

The patch supports following resources introduced in ACPI from v6.2

- PinFunction
- PinConfig
- PinGroupFunction
- PinGroupConfig
- PinGroup

The patch has been tested on NXP I.MX8MP Plus platform with ACPI.

Niyas Sait (3):
  pinctrl: add support for acpi PinGroup resource
  pinconf-generic: add pull up and pull down config with resistance
  pinctrl: add support for acpi pin function and config resources

 drivers/pinctrl/Makefile                |   1 +
 drivers/pinctrl/core.c                  |  19 +-
 drivers/pinctrl/core.h                  |   3 +
 drivers/pinctrl/pinctrl-acpi.c          | 450 ++++++++++++++++++++++++
 drivers/pinctrl/pinctrl-acpi.h          |  50 +++
 include/linux/pinctrl/pinconf-generic.h |   6 +
 include/linux/pinctrl/pinctrl.h         |  15 +
 7 files changed, 540 insertions(+), 4 deletions(-)
 create mode 100644 drivers/pinctrl/pinctrl-acpi.c
 create mode 100644 drivers/pinctrl/pinctrl-acpi.h

-- 
2.25.1

