Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF422ED69C
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2019 01:21:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727733AbfKDAVr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 3 Nov 2019 19:21:47 -0500
Received: from mail-wr1-f41.google.com ([209.85.221.41]:35930 "EHLO
        mail-wr1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727689AbfKDAVr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 3 Nov 2019 19:21:47 -0500
Received: by mail-wr1-f41.google.com with SMTP id w18so15121019wrt.3
        for <linux-gpio@vger.kernel.org>; Sun, 03 Nov 2019 16:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=rcjhldl50Lke5NfhZZA9Ta/hjioREERsZ/C3JzzcxM8=;
        b=f6jzM7wM/r3zwNK2bvVoZJP/7b80SXEYg8xe21jT7s9JaSyAbe/Cl4nA9Ua2yc0ZhA
         SL9jSILBF/CQY8cUyGouPSCLIPMb/PtHeRZP0vl3s0FfBHVJKKn2vhcc46DjbN4ESRBb
         ya437BHK+wc99An/wZDoEt+bVVKTWC1slOd6v2FlbJA9jilujUI0mdSJ9XmAab2W6493
         GbeVbWX7UXO2CuogJ+B/ZpzaugJqUsycWw31fEDlE9MkC9i65ijp6TMez2czhEeeh0KB
         XXwAGpEHAMbN5odJbmAFCOg1+v1008fqJmjlR/r3PGaM6uWepX5Zz97JLDHNiXl+wCRD
         VvBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=rcjhldl50Lke5NfhZZA9Ta/hjioREERsZ/C3JzzcxM8=;
        b=pvBAa3t/+aZMmWL1X33PwoxB5bqQi0nadPpJC5byk8197GwPLorJdsUkrQhkB5wT/g
         0MnoNN2LasRQTQ8TjPaglsDGnfsHmC6RDFWzysL8TI7QdgkriLYCFqug9xvNXb/txjvO
         bX+MFroMNSLxFu5Sbyi2IckT3M66nbwUBSq2F4GpUtEKpSA36xiIYUA4ew/fgTletT6z
         b5FEnhCJx76mMlLuPpn+k/f5sHnk/P+U4hHbagBm5OcPcPDoAhXWePFFQfOgKjncCji9
         wS/3JTMOkoyR/ASt9uqjtce4flt0DIhU8TLOfASJrxEKOlp/f2VkveSbp35x9XKRiBNN
         21Kw==
X-Gm-Message-State: APjAAAXWd2oqBbwei4ljRpFAXBhfsxp0WPHqzO4etn8gELx5TYXKh0CR
        nhFb+muV1Mwwa+SsyrzFyqmQfuluhnuKaw==
X-Google-Smtp-Source: APXvYqzzljt2ALGOc0l3IrAhVZR2GesOFU0KpT321t5Qks3i0HW3XIpExgHq9YajncvXcmWgxkQ+NQ==
X-Received: by 2002:adf:fc10:: with SMTP id i16mr19683389wrr.157.1572826904859;
        Sun, 03 Nov 2019 16:21:44 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id y16sm5826759wro.25.2019.11.03.16.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2019 16:21:44 -0800 (PST)
Message-ID: <5dbf6f18.1c69fb81.b9aa8.35e4@mx.google.com>
Date:   Sun, 03 Nov 2019 16:21:44 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-rc4-34-gb0983a8bbfb4
Subject: linusw/for-next boot: 28 boots: 9 failed,
 19 passed (v5.4-rc4-34-gb0983a8bbfb4)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next boot: 28 boots: 9 failed, 19 passed (v5.4-rc4-34-gb0983a8bb=
fb4)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/v5.4-rc4-34-gb0983a8bbfb4/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.4-rc4-34-gb0983a8bbfb4/

Tree: linusw
Branch: for-next
Git Describe: v5.4-rc4-34-gb0983a8bbfb4
Git Commit: b0983a8bbfb45d16760b34c23436a3d9b5834dbf
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 28 unique boards, 9 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          meson-g12a-x96-max:
              lab-baylibre: new failure (last pass: v5.4-rc4-28-gacba5fc211=
ee)
          meson-g12b-odroid-n2:
              lab-baylibre: new failure (last pass: v5.4-rc4-28-gacba5fc211=
ee)
          meson-gxbb-p200:
              lab-baylibre: new failure (last pass: v5.4-rc4-28-gacba5fc211=
ee)
          meson-gxl-s805x-libretech-ac:
              lab-baylibre: new failure (last pass: v5.4-rc4-28-gacba5fc211=
ee)
          meson-gxl-s905x-khadas-vim:
              lab-baylibre: new failure (last pass: v5.4-rc4-28-gacba5fc211=
ee)
          meson-gxl-s905x-libretech-cc:
              lab-baylibre: new failure (last pass: v5.4-rc4-28-gacba5fc211=
ee)
          meson-gxm-khadas-vim2:
              lab-baylibre: new failure (last pass: v5.4-rc4-28-gacba5fc211=
ee)
          r8a7795-salvator-x:
              lab-baylibre: new failure (last pass: v5.4-rc4-28-gacba5fc211=
ee)
          r8a7796-m3ulcb:
              lab-baylibre: new failure (last pass: v5.4-rc4-28-gacba5fc211=
ee)

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            meson-g12a-x96-max: 1 failed lab
            meson-g12b-odroid-n2: 1 failed lab
            meson-gxbb-p200: 1 failed lab
            meson-gxl-s805x-libretech-ac: 1 failed lab
            meson-gxl-s905x-khadas-vim: 1 failed lab
            meson-gxl-s905x-libretech-cc: 1 failed lab
            meson-gxm-khadas-vim2: 1 failed lab
            r8a7795-salvator-x: 1 failed lab
            r8a7796-m3ulcb: 1 failed lab

---
For more info write to <info@kernelci.org>
