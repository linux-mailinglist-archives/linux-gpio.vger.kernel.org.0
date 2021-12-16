Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8E624773F8
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Dec 2021 15:10:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237612AbhLPOKR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Dec 2021 09:10:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237531AbhLPOKQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Dec 2021 09:10:16 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84634C061574;
        Thu, 16 Dec 2021 06:10:16 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id j140-20020a1c2392000000b003399ae48f58so1820123wmj.5;
        Thu, 16 Dec 2021 06:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l5uZzj2HREZlkQkg6V05gCWd+HHMWkzcCuOsxTkeJ70=;
        b=SVQ6qloS1jWGnBZmEWPmtFA5SUJXLoi47E4p6+gY1pTCuyQaB6Ab8SKCe19Y8HI1R8
         6E+tnF6XNff3ns0GXEiDUuYG95Rum/WOn/01PQUdwpdT5zBbksnASjuEMCh7fLtSx6gU
         9vESOtjlwh9G8FN70JJuxwecnxgWjzOXyCtLCOR2ooNylAvksgWinMdNjGQJ04Ppsc1q
         NHyWj86GUs04zU/6bg2ogAz850VwaPAstXyFQDxnific2rJpYNQUpFpj+g23JqD0WvoQ
         sL3PyEJLJJHh5xwYGtzhVtX+k2NNLNtldkrEEuaySHZ/iHq2JGkufVxUSZe1/yD/9Og7
         hoNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l5uZzj2HREZlkQkg6V05gCWd+HHMWkzcCuOsxTkeJ70=;
        b=DY92wGTNDXii7WWE38p4oe1POpvxfEEvQg9qCvkk7wF6fTKTTlbxAgS5RpndVP2uH3
         v28DWrG45xpxtFN6Ofwi1FrN6Ems7jO2+V9UlqxUN7aRGHb+5/adXNkOGE9TXzGDUudj
         /y57Qsvw4VEGM3y3ADng3z/6kHB644eLflXnoEmfhW9Ddmj7kwR9aeyYZdUAYDl4Wzw3
         D+qX54FKMFHz4PJ0Arl0ZRqKK1hncKzhvvFeClYLqDRfQSMolt1I1+O4M530O9pQOTez
         nIlP9M8PvjWZNbeoG0jUt6xXEFCOfOyKteqz9prF0Cbbiy2FSkV8YZJ0NFC7s+JsNA/R
         H18A==
X-Gm-Message-State: AOAM532TTpGwB87lA7SlevmFmoxOj1OrTEsR7hTzoh7V2mVyDU91x00M
        M1L5+4i/spVQMmBEfRV2TLE=
X-Google-Smtp-Source: ABdhPJzme2TYnUlOODJae45eozPJivlOVJi6npRdm5AzIsyCag4h2b2vQW6cZA/KSfvgWfT9wpRk4g==
X-Received: by 2002:a1c:9d55:: with SMTP id g82mr3209275wme.58.1639663815109;
        Thu, 16 Dec 2021 06:10:15 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id h4sm4930284wrf.93.2021.12.16.06.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 06:10:14 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Akhil R <akhilrajeev@nvidia.com>, linux-gpio@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 0/2] gpio: tegra186: Add support for Tegra241
Date:   Thu, 16 Dec 2021 15:10:07 +0100
Message-Id: <20211216141009.1478562-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Hi,

this is another extension of the Tegra186 GPIO driver, this time for the
upcoming Tegra241 (Grace) chip. Note that while this adds the DT binding
header, it doesn't actually define a new DT compatible string because it
is unlikely that the Tegra241 will ever boot using DT but will use ACPI
instead.

The pin definitions are still in the "DT binding" header for consistency
with previous chips. Just wanted to highlight this to preempt questions
as to why I haven't Cc'ed Rob or the devicetree mailing list.

Thierry

Akhil R (2):
  dt-bindings: gpio: Add Tegra241 support
  gpio: tegra186: Add support for Tegra241

 drivers/gpio/gpio-tegra186.c             | 52 ++++++++++++++++++++++++
 include/dt-bindings/gpio/tegra241-gpio.h | 42 +++++++++++++++++++
 2 files changed, 94 insertions(+)
 create mode 100644 include/dt-bindings/gpio/tegra241-gpio.h

-- 
2.34.1

