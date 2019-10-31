Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4160EB642
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2019 18:39:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728837AbfJaRj4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 31 Oct 2019 13:39:56 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43933 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728561AbfJaRjz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Oct 2019 13:39:55 -0400
Received: by mail-wr1-f66.google.com with SMTP id n1so7192759wra.10
        for <linux-gpio@vger.kernel.org>; Thu, 31 Oct 2019 10:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=LYgQR5+79HqwWacz+8ftn5/Kc591xZFZKB6Q6T4MTOY=;
        b=2O6o/yWMAeGK+u5b3CdwQITX1PuFnkJNuvfBEe4uSaxtUAOxXHJ6TI6rK+YksdL5VB
         WhVuWzH3Ebrk2YIsBaSMw43RSV4GhrkgXHDHvhOnhclVisIKMZ6bfKGtwakUxjmzPU5k
         RgzKQH1AsZI44vsQyIq5ezLEow/9ytv/fSVb7dk7mkTSW7yIPncY0jGTXToNWqiYjGd3
         tf48VabUyUI/rN7V0YdJ6H8BWwTgNxKie58S/Kx6HyT6mFpkyeNiGBgC3+/MJl2fZ+lj
         hnVDHDSCpWo76ajPYeTomMJESfyJ0Zygxzgkbh17NFxm6ViJVpwWxrNZjHgtg8R+oiRw
         hm8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=LYgQR5+79HqwWacz+8ftn5/Kc591xZFZKB6Q6T4MTOY=;
        b=aDPsHvtXK2sxp8PW3O3e1uxvAboLKbki28fuqxpqFlpWscwHo2nzLg/zKUCVE0+RKm
         iKBb5DB4JM2wlFV3XjF8vhXCo+I9Q8rprKpSqeejijBn1wNzZt3zg3HXXiEL9QbjPLhV
         gRjO3wot7+xbAcg/j63Py/ppNkGLV04kA08UA7BROpbdnQ+s+vunsUt92nwWpAiLPkZ2
         BVkopg1e1RkLxUD7wcyGtPX3jNbS8nbUrkvTr0nRZ+s7Ucjjpce+W3PeHZTE6160M10/
         PVw5GuR1ORS3xJjgaekdN3EynB6pSXJbjs/FOrzWvAVul0G/pjcYw7GIAwsSR+dmeYOA
         Q6dQ==
X-Gm-Message-State: APjAAAXq2YENEdtCZY/qhvzlGMcdLmfzBLM2TxOg67I2Il6GXLdldGaD
        YHtPFbdCf38Oa6HvIDFqYc14B1olHT+QRQ==
X-Google-Smtp-Source: APXvYqySeiD7MgWDN3/VslovWzYKJUsHIjj3z1dBQs9uc/KwBy9vHjSvvf4OY+Lc9gR94FVRu5ZrdA==
X-Received: by 2002:adf:e38f:: with SMTP id e15mr6565060wrm.218.1572543593709;
        Thu, 31 Oct 2019 10:39:53 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id p12sm5058644wrm.62.2019.10.31.10.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2019 10:39:53 -0700 (PDT)
Message-ID: <5dbb1c69.1c69fb81.1ad1a.bc9a@mx.google.com>
Date:   Thu, 31 Oct 2019 10:39:53 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.4-rc1-31-g6a41b6c5fc20
X-Kernelci-Report-Type: boot
Subject: linusw/devel boot: 43 boots: 11 failed,
 31 passed with 1 untried/unknown (v5.4-rc1-31-g6a41b6c5fc20)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel boot: 43 boots: 11 failed, 31 passed with 1 untried/unknown (v=
5.4-rc1-31-g6a41b6c5fc20)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/devel/ke=
rnel/v5.4-rc1-31-g6a41b6c5fc20/
Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.4-rc1-31-g6a41b6c5fc20/

Tree: linusw
Branch: devel
Git Describe: v5.4-rc1-31-g6a41b6c5fc20
Git Commit: 6a41b6c5fc20abced88fa0eed42ae5e5cb70b280
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 40 unique boards, 14 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          meson-g12a-sei510:
              lab-baylibre: new failure (last pass: v5.4-rc1-25-gfe12e94375=
da)
          meson-g12a-x96-max:
              lab-baylibre: new failure (last pass: v5.4-rc1-25-gfe12e94375=
da)
          meson-g12b-odroid-n2:
              lab-baylibre: new failure (last pass: v5.4-rc1-25-gfe12e94375=
da)
          meson-gxbb-p200:
              lab-baylibre: new failure (last pass: v5.4-rc1-25-gfe12e94375=
da)
          meson-gxl-s805x-libretech-ac:
              lab-baylibre: new failure (last pass: v5.4-rc1-25-gfe12e94375=
da)
          meson-gxl-s805x-p241:
              lab-baylibre: new failure (last pass: v5.4-rc1-25-gfe12e94375=
da)
          meson-gxl-s905x-libretech-cc:
              lab-baylibre: new failure (last pass: v5.4-rc1-25-gfe12e94375=
da)
          meson-gxm-khadas-vim2:
              lab-baylibre: new failure (last pass: v5.4-rc1-25-gfe12e94375=
da)
          r8a7795-salvator-x:
              lab-baylibre: new failure (last pass: v5.4-rc1-25-gfe12e94375=
da)
          r8a7796-m3ulcb:
              lab-baylibre: new failure (last pass: v5.4-rc1-25-gfe12e94375=
da)
          rk3399-puma-haikou:
              lab-theobroma-systems: new failure (last pass: v5.4-rc1-25-gf=
e12e94375da)

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            meson-g12a-sei510: 1 failed lab
            meson-g12a-x96-max: 1 failed lab
            meson-g12b-odroid-n2: 1 failed lab
            meson-gxbb-p200: 1 failed lab
            meson-gxl-s805x-libretech-ac: 1 failed lab
            meson-gxl-s805x-p241: 1 failed lab
            meson-gxl-s905x-khadas-vim: 1 failed lab
            meson-gxl-s905x-libretech-cc: 1 failed lab
            meson-gxm-khadas-vim2: 1 failed lab
            r8a7796-m3ulcb: 1 failed lab
            rk3399-puma-haikou: 1 failed lab

---
For more info write to <info@kernelci.org>
