Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7209199F3C
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2020 21:38:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727852AbgCaTiW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 Mar 2020 15:38:22 -0400
Received: from mail-pf1-f169.google.com ([209.85.210.169]:34678 "EHLO
        mail-pf1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726290AbgCaTiV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Mar 2020 15:38:21 -0400
Received: by mail-pf1-f169.google.com with SMTP id 23so10850326pfj.1
        for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2020 12:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=5GEfiixGuQQhbkhZWdsKGvZtTBgC0GXv4eOFi5XscKw=;
        b=kzvEm5IjoNC1ScFpzNg21wjdJUBKAlH0Np4VojWxIotT9zA34Q4zXb0ZGJ1aFb83QZ
         dFDrBh8MeMbe0e9i8a3DNrRWS5369JtSmxHaoIaZG9C3pqIgGI/xjawnnxOzeb8Y5FBY
         jYBcJ0gHLZ1yDWyd16FtiF0leSvKBDDUNz8KrkN0XJHvt+xtVkxXJNjANs89Cizx3vfN
         L0sNF9GfxtGoTiGxU06CBkHO7JseE0CwWAw40iSQHBOKt1tk+qwlY4GMVi1IavVIEVm+
         34TKC+DzKvEfjxwNJtDLiNtUQIfyjm1sllRJf2pp3mqNXzD7bdSTjBpFthIw69qBielI
         R/OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=5GEfiixGuQQhbkhZWdsKGvZtTBgC0GXv4eOFi5XscKw=;
        b=m1jzP2ehXzCwjpMFB4XlRhV7ODrSHD++noQT6fB4SzLRuyVk0InXAkTDtS2+sD0X3p
         5g6htFRbLgdMZpI7HCYHNdTcc2LeHr0p4Sa9b8cXunilH/4XeQLXU8d187CHHmHsSghz
         bvBXF4SzOy8FzIAgLZrd6rb+OQBjuyGsPempWct/tW2g7DKQbF4S8S5q9Pgc4JReNu3X
         hq5J6ruI9VXRDDESMXFLsOO5NDoQqi4mfl9mELnbzx4eLKnpt0rMfpBNXpWGvEmGXrsF
         w5lAUHPUkNXCmtXGF6QrV+ikAwmWPvGyy96rXB5ZfFA5csHLfwpYX6ou42bOMxHjLQtl
         fvjA==
X-Gm-Message-State: ANhLgQ3/3AIKXpYRG/Pc5H4L+24eoa0jBuKZMb+/o6840HdMrhgrieq5
        FptN/vgNfdCXjcewmvRBxCI0GRCaTRs=
X-Google-Smtp-Source: ADFU+vtDOEsHxdG9sFzbWjaHvkkBR2poptbVU/+iooQJal3P6TguEAlMqksg9fh3X6Dhx36t5osauQ==
X-Received: by 2002:aa7:9ec7:: with SMTP id r7mr20013051pfq.191.1585683500103;
        Tue, 31 Mar 2020 12:38:20 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s98sm2527112pjb.46.2020.03.31.12.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 12:38:19 -0700 (PDT)
Message-ID: <5e839c2b.1c69fb81.52f0a.a346@mx.google.com>
Date:   Tue, 31 Mar 2020 12:38:19 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.6-rc7-58-g89ad556b7f96
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: linusw
X-Kernelci-Branch: devel
Subject: linusw/devel boot: 54 boots: 2 failed,
 52 passed (v5.6-rc7-58-g89ad556b7f96)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel boot: 54 boots: 2 failed, 52 passed (v5.6-rc7-58-g89ad556b7f96)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/devel/ke=
rnel/v5.6-rc7-58-g89ad556b7f96/
Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.6-rc7-58-g89ad556b7f96/

Tree: linusw
Branch: devel
Git Describe: v5.6-rc7-58-g89ad556b7f96
Git Commit: 89ad556b7f96af54ae6762f561f0a09269265741
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 51 unique boards, 14 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 47 days (last pass: gpio-v5.5-4-=
45-gd18fddff061d - first fail: v5.6-rc1-12-gb2929a9cb2fb)

arm64:

    defconfig:
        gcc-8:
          meson-gxl-s905d-p230:
              lab-baylibre: new failure (last pass: v5.6-rc7-57-g5f4bf171ca=
03)

Boot Failures Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            meson-gxl-s905d-p230: 1 failed lab

---
For more info write to <info@kernelci.org>
