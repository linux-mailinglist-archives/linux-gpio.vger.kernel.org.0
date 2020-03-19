Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25AFE18B35B
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2020 13:27:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726892AbgCSM1s (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Mar 2020 08:27:48 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:33949 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726663AbgCSM1s (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Mar 2020 08:27:48 -0400
Received: by mail-wm1-f68.google.com with SMTP id 26so442301wmk.1;
        Thu, 19 Mar 2020 05:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b7AstH4RVRArlkmKFsRrW5134Y5Npt9uRP3ITsEwLgU=;
        b=piLX4sSoeqELt0rk5nYHdsAjyU7XTXJmZ8XmH9nfb1XN6xSClqAcrGW/u84DG4Uh4O
         GXF8jVdRt7RmEdr+QrwBZOiY8BX6/E5Mt+wHjBumBd2wwDazyLALQCAjrmKhtYrwZiDj
         jsF7UnmU8AytM2LszvHvdJY9JsnvKqhup35y0ovV1f5kSliU2VgFdrXdkqvcwjHLHvo/
         gRn6+qEm3AmfnRImVhIKJlerzIgzuN+UdrcpvLyTfwxlFTvFfzupH9cvaMT7rP8VXQ/4
         slkxCtmtpdearSjbvmpxI4iHJMj3VTbRi7b8LCGwaF+FKeCLi5asHYvLf+CPbd+ZmPXL
         5rNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b7AstH4RVRArlkmKFsRrW5134Y5Npt9uRP3ITsEwLgU=;
        b=kCNvmwjP3FuN7HOz75fTbwrhgTLH2hfa7iDTHxhmqI5UmHCBtw6HYqeGDgQyKE+css
         eW50kcrKtyv2uantbtxoAfZS8dirMy1XussmNfWNtUsH39VnfovixUxVeOslz/+P86hH
         /Lcw+awdjFO7OwAqqFieVU7jiLMRME9CHV6TCzvBM0TRpbBL8hORDld1p3edy2Q0gfMX
         MLeQf/D6BbBB+oyvH+JVg3bvzM265WHE/7ksYRbHAYHK1/+fpn1SKELKoxpOXdDX2Cu/
         BuYNr6NBf61iI+aZoPsC/y4vseOk5tUvUVjx7ftKFI1Nb1LiAU0AAfS79lpWmOvTiPy4
         Mx+g==
X-Gm-Message-State: ANhLgQ22tY7H5CtxCVB06Rtw+meGihjBmfrdzvL8NIoIGRFC2ML9DA5V
        GGwp4F9Xmw7q/dfFG0YIZ2M=
X-Google-Smtp-Source: ADFU+vvuF206IFaKmZIue7dND9zkn2kmFNaovVlWd+WE8Xfa86Qh2FmySXYeNjkiWc21QKZ6KydnCw==
X-Received: by 2002:a05:600c:22d9:: with SMTP id 25mr3576930wmg.41.1584620864624;
        Thu, 19 Mar 2020 05:27:44 -0700 (PDT)
Received: from localhost (pD9E51CDC.dip0.t-ipconnect.de. [217.229.28.220])
        by smtp.gmail.com with ESMTPSA id p16sm2908760wmg.22.2020.03.19.05.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2020 05:27:43 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, Vidya Sagar <vidyas@nvidia.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 0/9] pinctrl: tegra: Support SFIO/GPIO programming
Date:   Thu, 19 Mar 2020 13:27:28 +0100
Message-Id: <20200319122737.3063291-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Hi,

NVIDIA Tegra186 and later have a bit in the pin controller that defines
whether a pin is used in special function (SFIO) mode or in general
purpose (GPIO) mode. On early Tegra SoC generations, this bit was part
of the GPIO controller.

The pin configuration on Tegra186 and later (and partially on Tegra210)
is typically static, so there is little need to reconfigure these pins.
However, there's a special case on Tegra194 where the PCIe CLKREQ and
RST pins for controller 5 may need to be reprogrammed in the kernel,
depending on whether the controller runs in endpoint mode or in root
port mode.

This series of patches establishes the mapping of these two pins to
their GPIO equivalents and implements the code necessary to switch
between SFIO and GPIO modes when the kernel requests or releases the
GPIOs, respectively.

Thierry

Thierry Reding (9):
  gpio: Support GPIO controllers without pin-ranges
  gpio: tegra186: Add support for pin ranges
  gpio: tegra186: Add Tegra194 pin ranges for GG.0 and GG.1
  pinctrl: tegra: Fix whitespace issues for improved readability
  pinctrl: tegra: Fix "Scmitt" -> "Schmitt" typo
  pinctrl: tegra: Pass struct tegra_pmx for pin range check
  pinctrl: tegra: Do not add default pin range on Tegra194
  pinctrl: tegra: Renumber the GG.0 and GG.1 pins
  pinctrl: tegra: Add SFIO/GPIO programming on Tegra194

 drivers/gpio/gpio-tegra186.c             | 64 ++++++++++++++++++++++++
 drivers/gpio/gpiolib.c                   |  5 +-
 drivers/pinctrl/tegra/pinctrl-tegra.c    | 52 +++++++++++++++++--
 drivers/pinctrl/tegra/pinctrl-tegra.h    |  5 +-
 drivers/pinctrl/tegra/pinctrl-tegra194.c | 47 +++++++++--------
 5 files changed, 144 insertions(+), 29 deletions(-)

-- 
2.24.1

