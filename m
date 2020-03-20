Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5D9A18CBD0
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2020 11:39:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726704AbgCTKjK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Mar 2020 06:39:10 -0400
Received: from mail-pj1-f65.google.com ([209.85.216.65]:54813 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726726AbgCTKjK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Mar 2020 06:39:10 -0400
Received: by mail-pj1-f65.google.com with SMTP id np9so2287401pjb.4
        for <linux-gpio@vger.kernel.org>; Fri, 20 Mar 2020 03:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=t5gADeRaiZIbhKsmolgHh1GMd+FTeO3DGywDZywHLNk=;
        b=nYSMXks23ZB+31VEuMnK2H25UQQWvMXGvD+YdlQCl1dzn2tUtSFTZ+6xph+IiuTYVw
         JuXFvLKC+Tbgz4AHPn/XZJrhi7aBg9uhFgF0nz+pVelK0Fra8J+KgxAmx20GX8Dp9HvP
         GCMKQkxUOvtLBZZr810LjSGKvZHjIE4i6LRLxICi1ukfZdRZBPCmiyUXyFw2yr8pspaz
         w8rW31ZqsSkMfOLgnJe94VsCqeq/wzcfW6iAKjDFlSTmAADf8BOFawp9EIDNe4YI4PkG
         iGBGaVxgUCRvisH13BRYzPF6A6hnDcPTaV4+rJ/uDHE4w2yGvetAi1e2p+DZ5BCgtKa6
         /tVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=t5gADeRaiZIbhKsmolgHh1GMd+FTeO3DGywDZywHLNk=;
        b=KjUs6n6krfLQXc2dpUFkrP/BKyR3c9xkS2wU5yyBuENCdXQ5RupnVLJA65+2JPAAEP
         QDUZVZNbOgM3yBXP4rRs1ClZk+/2qZMkXxAdDrXdVgBZZhuW5bSZwUZ/uhpmq/SZiqr0
         JqMJ6zs7isIsXeCr/b7vJ189++qMt4zhRGc7756GMqZFsBe7W8DVRq64CUrB9qdnKgsV
         Sz4qzBUBHAwrBz0UQsV7iiOC4Rvwz25Oz8jfbSMAgPRJj0Jair/YduqOn6lJUx2VvXQ9
         gBsXMHjjoLyVFkEonjLXPxGD8V8JG6D4Svi+nyuitV+v3f7oy9RTlL4tUHhUrr70fN2A
         ooQQ==
X-Gm-Message-State: ANhLgQ0kVd8hUc88i97bxJPSoQnFUlpGmJSv9+/jVmYLtjqxu5edd6T9
        8v/Kokpx24yFWOzQAsDNBaczIZeYgB4=
X-Google-Smtp-Source: ADFU+vsHrFQdLZTDdjr/oIORFW8RmX7zRKRSmVjKKjFo9DnBB/cq49Qz4QqtUkCZN9POrTMvC0Elrw==
X-Received: by 2002:a17:902:5a85:: with SMTP id r5mr7874014pli.182.1584700748303;
        Fri, 20 Mar 2020 03:39:08 -0700 (PDT)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z6sm5139890pfn.212.2020.03.20.03.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2020 03:39:07 -0700 (PDT)
Message-ID: <5e749d4b.1c69fb81.4a05b.17e0@mx.google.com>
Date:   Fri, 20 Mar 2020 03:39:07 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.6-rc3-37-gef0c1aed2459
X-Kernelci-Report-Type: boot
Subject: linusw/for-next boot: 62 boots: 1 failed,
 58 passed with 3 untried/unknown (v5.6-rc3-37-gef0c1aed2459)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next boot: 62 boots: 1 failed, 58 passed with 3 untried/unknown =
(v5.6-rc3-37-gef0c1aed2459)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/v5.6-rc3-37-gef0c1aed2459/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.6-rc3-37-gef0c1aed2459/

Tree: linusw
Branch: for-next
Git Describe: v5.6-rc3-37-gef0c1aed2459
Git Commit: ef0c1aed2459f59f2aec13bcc97c68e0646ab0a2
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 54 unique boards, 15 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 37 days (last pass: gpio-v5.5-4-=
45-gd18fddff061d - first fail: v5.6-rc1-12-g612e35e76ec8)
          sun4i-a10-olinuxino-lime:
              lab-baylibre: new failure (last pass: gpio-v5.6-2-20-gee82ebf=
16ccb)

arm64:

    defconfig:
        gcc-8:
          meson-g12b-a311d-khadas-vim3:
              lab-baylibre: new failure (last pass: v5.6-rc3-27-g9cd0c5e02e=
e4)
          meson-gxl-s805x-p241:
              lab-baylibre: new failure (last pass: v5.6-rc3-27-g9cd0c5e02e=
e4)

Boot Failure Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

---
For more info write to <info@kernelci.org>
