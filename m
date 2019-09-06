Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0DBFAC164
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2019 22:28:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394415AbfIFU2n (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Sep 2019 16:28:43 -0400
Received: from mail-wm1-f49.google.com ([209.85.128.49]:55773 "EHLO
        mail-wm1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392704AbfIFU2n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Sep 2019 16:28:43 -0400
Received: by mail-wm1-f49.google.com with SMTP id g207so7736336wmg.5
        for <linux-gpio@vger.kernel.org>; Fri, 06 Sep 2019 13:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=oBGRXlnNm7JZFvJOYj841VKfUZ68DCMAhTPJZ1sqc5E=;
        b=C1y6LyK+D4CdP3c8RaXn4Q4DkwQqZQYshvMYWfpeHCOsBUquSztShXxUSP0rsxQyz7
         DtUnwQkorELYgDiU5d4+tuJNlCUoRYOMzkVgjAVeAN5SfKOluS+BfrF7Hif6pzkniWPV
         kNR9+7myNNwVGcLztSZELbBHe2/Metb8nSjQ1MdmxDkdv0c9XPLrllQlsWPZwbtBaWPV
         4zrVaCcen3WhpYcVp0gzzBGzZnlLoqWnjSX6X9yWi8dQtlTkZnVN9L43yK7T4rKlvCwu
         vUt10rguhKnnA7t5kpln3gSD6tU4Dfp6fcvh9+RmW9uC6A/tn2qgxc2QUvt0UjnYWT+t
         DbuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=oBGRXlnNm7JZFvJOYj841VKfUZ68DCMAhTPJZ1sqc5E=;
        b=WtHKgSlo2BUk/mIk9Tx/NSPrq45siYsJASfatjsuj6x/mXucDfBB6ZSRdY4GApzwpd
         rH6cJyukjZl4pi96lIgKGoCCSQJt7volJSA0dxEuG2QR2GDTzHFYvWMyPJImMIIP42Zi
         zdWHLMkuCdr6rJ/WUoznkZ7K5Dn1Ld1kTR1b5EhjNJirl0/bI3B8l0mxm/g0dkW7gnNe
         fERiZ9zdh3RoCxD8ZUi2lZHbknvBYYldsFb7kUyhKlu94wNzRAV+97XNcr4Tf+J4fP9s
         xO1iVchNMG5I4z4YW6sDRXRROb12/3xhJhT1dVvS4KrLpVHKNuGf9U/4PSXYULU0ghZw
         B4tw==
X-Gm-Message-State: APjAAAXSo0ZcUI80jwV9VBVZYw9dP94Gs/Ka3piZywjNvV3nopibbgrC
        E8for5162s0e1stIMGhi22ZIlsVqNppTMg==
X-Google-Smtp-Source: APXvYqyrAvr7zy4/Bf4ZBG5L/mhCr28utrAASxSa5VRakZMTue8TRBIUGfJL4RU5qIVkwK7oapuMsw==
X-Received: by 2002:a7b:c8d6:: with SMTP id f22mr7478520wml.67.1567801721203;
        Fri, 06 Sep 2019 13:28:41 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id d9sm6599488wrc.44.2019.09.06.13.28.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Sep 2019 13:28:40 -0700 (PDT)
Message-ID: <5d72c178.1c69fb81.817f1.edb9@mx.google.com>
Date:   Fri, 06 Sep 2019 13:28:40 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc7-68-g07dec0b44925
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: for-next
Subject: linusw/for-next boot: 67 boots: 2 failed,
 63 passed with 2 untried/unknown (v5.3-rc7-68-g07dec0b44925)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next boot: 67 boots: 2 failed, 63 passed with 2 untried/unknown =
(v5.3-rc7-68-g07dec0b44925)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/v5.3-rc7-68-g07dec0b44925/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.3-rc7-68-g07dec0b44925/

Tree: linusw
Branch: for-next
Git Describe: v5.3-rc7-68-g07dec0b44925
Git Commit: 07dec0b449253479d66c4b6b274e8ce25677d139
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 47 unique boards, 15 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          sun8i-h2-plus-orangepi-r1:
              lab-baylibre: new failure (last pass: v5.3-rc6-62-g0f40dd225a=
88)

arm64:

    defconfig:
        gcc-8:
          meson-gxl-s805x-p241:
              lab-baylibre: new failure (last pass: v5.3-rc6-62-g0f40dd225a=
88)
          meson-gxl-s905d-p230:
              lab-baylibre: failing since 2 days (last pass: v5.3-rc6-51-g1=
fc4f3c962b7 - first fail: v5.3-rc6-62-g0f40dd225a88)
          meson-gxm-khadas-vim2:
              lab-baylibre: new failure (last pass: v5.3-rc6-62-g0f40dd225a=
88)

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            meson-gxl-s905d-p230: 1 failed lab
            meson-gxm-khadas-vim2: 1 failed lab

---
For more info write to <info@kernelci.org>
