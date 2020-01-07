Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CAB55132714
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 14:09:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727903AbgAGNJG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 08:09:06 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43173 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727834AbgAGNJF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 08:09:05 -0500
Received: by mail-wr1-f66.google.com with SMTP id d16so53840190wre.10
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jan 2020 05:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Iz352BxuGbNcIztke1mPgtWeM92kMtEgll1IObizsfo=;
        b=mh0np/XSsz+h4CoB38HETauJmkbz8BR6FmKGypqqOtcnNzw7u0JHU+rG8g+IuVrB3T
         YC0UU4aDQQE8m3zagVnJMXDnO18NcI3ySxEPagHAkbOXr+KyYC9WKn9l3vgnk9fLoGBt
         yYXzfW2u6rTKVa6Ii0nqRHruIC+8JiV2NMBGtxPwop0glq3FlMPTyxSMCAs8Plk3M6Y8
         huiqjx2dS3pSH3+pU86kwN7yGkKjVGVG3U773NeU3HIBSzEm1U7OEkfhV+P/Q/KnZ3IG
         Vb+h3q5bop0U7ImfGrNvU5pQV40e/N7CvKVRsBkpEa4pQaQa+CQX+ONTFykH/UylPIYM
         xCMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Iz352BxuGbNcIztke1mPgtWeM92kMtEgll1IObizsfo=;
        b=Gdx+eREVTrfjt+A/mHoKKZVYSz0oc93x8oNcwXyqWsWVXfC/FNqJZYNUzvF9dshpeS
         CDAzLwS8HZRzsdbl4a1xcwpUn7JUmcGtZPGFucBeKPVuL9+MsFjje3hXat+g6e8o8xZ7
         dvPqsq/xYJuB1/ua2SV9oq9XWRTK7swhvFeUYedYtmlcItsCC/86IHI5NrHfglXxv1K6
         hPGSGk9a6ChDAGItH6vnvODKf3JaP6GWP4UROwpbtOqvjBPOZniBQdD9WfWgLet+DBrC
         ZWGNvy77+YsLzZsdnzzEyDhrLLpJ7eDpi6JnvfFFjkRcr0s8W4KIm5WgbtLC/e9Ch7E/
         scIg==
X-Gm-Message-State: APjAAAVfKppHaFAfMKApAdkmpLFBMh282ouY7kqlMCP3Hvfd6I4Kw8Y2
        EoCgqZjYV9I/lo2HC6tL8z+inw==
X-Google-Smtp-Source: APXvYqzva1xlPiPPlyDupp/or7rh5j3PKMzL2qSijT1KHNdr4CPcPjMT6cjFSkIdDmHoOWHjWka4iQ==
X-Received: by 2002:adf:d0c1:: with SMTP id z1mr112621130wrh.371.1578402544210;
        Tue, 07 Jan 2020 05:09:04 -0800 (PST)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id b18sm7287035wru.50.2020.01.07.05.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 05:09:03 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Cc:     robh@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, spapothi@codeaurora.org,
        bgoswami@codeaurora.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v7 0/2] gpio: wcd934x: Add support to wcd934x gpio controller
Date:   Tue,  7 Jan 2020 13:08:42 +0000
Message-Id: <20200107130844.20763-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patchset adds support to gpio controller found in Qualcomm
WCD9340/WCD9341 Codec.
This two patches are split of bigger patch series at https://lwn.net/Articles/807737/
Audio codec is already merged as part of ASoC tree. 
There is no compile time dependency on this series, can go via gpio tree.

Thanks,
srini

Changes since v6:
- Removed dependency on GPIO_GENERIC as suggested by Linus W.
- added support to get_direction()

Srinivas Kandagatla (2):
  dt-bindings: gpio: wcd934x: Add bindings for gpio
  gpio: wcd934x: Add support to wcd934x gpio controller

 .../bindings/gpio/qcom,wcd934x-gpio.yaml      |  47 +++++++
 drivers/gpio/Kconfig                          |   7 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-wcd934x.c                   | 121 ++++++++++++++++++
 4 files changed, 176 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/qcom,wcd934x-gpio.yaml
 create mode 100644 drivers/gpio/gpio-wcd934x.c

-- 
2.21.0

