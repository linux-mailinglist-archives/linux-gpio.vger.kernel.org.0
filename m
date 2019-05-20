Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14EA023A7E
	for <lists+linux-gpio@lfdr.de>; Mon, 20 May 2019 16:41:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733099AbfETOlW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 May 2019 10:41:22 -0400
Received: from mail-wr1-f45.google.com ([209.85.221.45]:44331 "EHLO
        mail-wr1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730632AbfETOlW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 May 2019 10:41:22 -0400
Received: by mail-wr1-f45.google.com with SMTP id w13so4162678wru.11
        for <linux-gpio@vger.kernel.org>; Mon, 20 May 2019 07:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1IcjIbQ8PHaq6VYvuNKdHBqkf9lRmX2qSNld7AdUH8Y=;
        b=lXqccuzPhOCSd0eAXFGQDmHVBo+Zq2t8h9b00w19EFmdsu1I3XhrW/tBLWjVyqiEqD
         NYNMGgTHkhQ8gv0kYOE8VK+4fdR122C0zkAs0bptbu7m0KoK8FhXjvNtPvTHvCmmqpeE
         HtsYRP6brrOcEjwOmTgixshcqRtzUQhYfvslxCUYWo+pzYXmu90z3KCAKhhNkGXAcJM3
         RUkeh5fMkvUUrlbcwSpUbxN8cxSnu6yrfaSJ6aXbt8FpsgiHxIm8aSUd+lwwlSneFKQp
         h5R5W0veH4EcdwjhYGFpkkJ/d7hj1LiWKpmRWUejw+G60jPTpe0LyyVS3VH5XRiAwdHl
         uqxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1IcjIbQ8PHaq6VYvuNKdHBqkf9lRmX2qSNld7AdUH8Y=;
        b=Ox2uASIZoxxIuuXP6O/u2bSv3omoXNt7v2XHmQU4y9avJ/ymu3SxV8QpcCXNLR/WOI
         KYT93kBH60X1vutHqEhtNDCCSf8QH+gO1SgWCRBZEO2T1Psrsx4oTgxpgV1/GnBeBzq1
         EE8hxqQBMcCk9nKs6qEaQOag1wEWbygRjNA5sU0WOzItYkuSS/rP+euz1L3LwOsuQXvA
         jDyPGQTSc86enRFFrdDWz+VL6Xv5HCeGU3Ez/YIlzgH3mrcY9H+9xQwnelJseebGTKCY
         lEiUQPCuI3YVsZHiAZgNrzisTMDuwWT/sYMG1outnuTGJn1Ne2is+csORNZAfi8t7Tqf
         lJfw==
X-Gm-Message-State: APjAAAU8tPj2rlB5a1mbfuiXWHnCUySJo6EvG+406QDij5tmn3dRiuxR
        TxD1rqGbmx2YVmrl2NnlxIjGGg==
X-Google-Smtp-Source: APXvYqzJrbDLhKYgrYJFKpMvydjk+z5fNJ4UI9UtYfEjiy5zXI97tUynBoSZwSPBPAr8FOXTlstiXA==
X-Received: by 2002:adf:f208:: with SMTP id p8mr26008555wro.160.1558363280342;
        Mon, 20 May 2019 07:41:20 -0700 (PDT)
Received: from bender.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id w3sm6743679wrv.25.2019.05.20.07.41.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 20 May 2019 07:41:19 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 0/5] pinctrl: meson: gpio: update with SPDX Licence identifier
Date:   Mon, 20 May 2019 16:41:03 +0200
Message-Id: <20190520144108.3787-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Update the SPDX Licence identifier for the Amlogic Pinctrl drivers and
the corresponding GPIO dt-bindings headers.

Neil Armstrong (5):
  pinctrl: meson: update with SPDX Licence identifier
  dt-bindings: gpio: meson-gxbb-gpio: update with SPDX Licence
    identifier
  dt-bindings: gpio: meson-gxl-gpio: update with SPDX Licence identifier
  dt-bindings: gpio: meson8-gpio: update with SPDX Licence identifier
  dt-bindings: gpio: meson8b-gpio: update with SPDX Licence identifier

 drivers/pinctrl/meson/pinctrl-meson-gxbb.c | 8 +-------
 drivers/pinctrl/meson/pinctrl-meson-gxl.c  | 8 +-------
 drivers/pinctrl/meson/pinctrl-meson.c      | 8 +-------
 drivers/pinctrl/meson/pinctrl-meson.h      | 8 +-------
 drivers/pinctrl/meson/pinctrl-meson8-pmx.c | 8 +-------
 drivers/pinctrl/meson/pinctrl-meson8-pmx.h | 8 +-------
 drivers/pinctrl/meson/pinctrl-meson8.c     | 8 +-------
 drivers/pinctrl/meson/pinctrl-meson8b.c    | 8 +-------
 include/dt-bindings/gpio/meson-gxbb-gpio.h | 8 +-------
 include/dt-bindings/gpio/meson-gxl-gpio.h  | 8 +-------
 include/dt-bindings/gpio/meson8-gpio.h     | 8 +-------
 include/dt-bindings/gpio/meson8b-gpio.h    | 8 +-------
 12 files changed, 12 insertions(+), 84 deletions(-)

-- 
2.21.0

