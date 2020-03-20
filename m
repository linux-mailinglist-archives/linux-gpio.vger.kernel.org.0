Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CD9F18CBA0
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2020 11:30:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726631AbgCTKaP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Mar 2020 06:30:15 -0400
Received: from mail-pj1-f41.google.com ([209.85.216.41]:33951 "EHLO
        mail-pj1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726657AbgCTKaO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Mar 2020 06:30:14 -0400
Received: by mail-pj1-f41.google.com with SMTP id q16so3330433pje.1
        for <linux-gpio@vger.kernel.org>; Fri, 20 Mar 2020 03:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=CsMSBDDCZJ8NaYdqATbyzeDM453ODmlX3XZumBZQRwg=;
        b=R/hfhcfyg7uNCku2R0MIOLwJxV/Z1SJPnV4NAFot5i/PdUsd+2SPXk2olRiRUumisd
         XjdVm6/kyLzyZpxfb4UwffrEiVA03sNbk21rER3fCkn0O9Na5l0j69BUu+70GpQl+PuU
         A+75ye7dUJyynqeuSVQIRG1Q6PsiPcRwKIFkCAjAXUCrgyYQzu/0ScgcLfJRlgyMcMXh
         G/FUSqQb3wW9bZvH0X7UlGV/ATWmRGjNy9DisnTknRxE627aEw63Ua2PiTbnvA1e8GSs
         1Hw1PSrMytVMjrZDb0lHG1Pl7gE0jeMT51psI3EF7GXSZYBDsyiJ+yryBzEi/Qhj69f7
         eZ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=CsMSBDDCZJ8NaYdqATbyzeDM453ODmlX3XZumBZQRwg=;
        b=TUZnnyx0e3kSQv00txRgZk4P03gGne8cn4MXsknHKAxzN49b9OkD45Gcg2hbowIySJ
         WadDsYaWhtX8Xhv2np+80mWi651EYMKBpJpnWuRr3LEANCNPaNbhD2qTFfOPLOIpZEmr
         IRNZ2zXWPZWHeAJmupI0UYivARqu5MXQoAQXDSdEKm0tfzJjznD++PrLdI4/G9aZaen8
         lVCbRS/usWQkbScyggWvxQ17BvvT80jKbu+mEnFumz9ue/e3eBDAfaoL/0bVdAk99xm2
         7wH93Elb++86nftbkKMSFEEDQhVAeburVvzDu/7wpWLDgK+UuL7SlNnPGZPSU3ie0rAX
         3Ktg==
X-Gm-Message-State: ANhLgQ358SY71V6k45CZSR4bvhO97jYVsewi7aT7XfrGan+pyOlWKFZ1
        SKHVFd8G5LN1Z+RG72rtTiMxrp3OY+8=
X-Google-Smtp-Source: ADFU+vvEmNXxd1D/R+ueUfTMgA9fV/nxij+VNNjdyJ/80NhR1wgFbi61io9H32EJxlIDN0j1kru27g==
X-Received: by 2002:a17:90b:3789:: with SMTP id mz9mr8603563pjb.43.1584700213563;
        Fri, 20 Mar 2020 03:30:13 -0700 (PDT)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w127sm5116330pfb.70.2020.03.20.03.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2020 03:30:12 -0700 (PDT)
Message-ID: <5e749b34.1c69fb81.9ed7e.1c37@mx.google.com>
Date:   Fri, 20 Mar 2020 03:30:12 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: fixes
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.6-rc3-5-g1b26f3ba6117
X-Kernelci-Report-Type: boot
Subject: linusw/fixes boot: 64 boots: 2 failed,
 62 passed (v5.6-rc3-5-g1b26f3ba6117)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes boot: 64 boots: 2 failed, 62 passed (v5.6-rc3-5-g1b26f3ba6117)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/fixes/ke=
rnel/v5.6-rc3-5-g1b26f3ba6117/
Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/v=
5.6-rc3-5-g1b26f3ba6117/

Tree: linusw
Branch: fixes
Git Describe: v5.6-rc3-5-g1b26f3ba6117
Git Commit: 1b26f3ba611774c897d29228e4ba28919e0fbfd0
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 56 unique boards, 15 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 37 days (last pass: gpio-v5.5-4 =
- first fail: v5.6-rc1-10-ga924eae75106)

arm64:

    defconfig:
        gcc-8:
          meson-gxl-s905x-khadas-vim:
              lab-baylibre: new failure (last pass: v5.6-rc3)

Boot Failures Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            meson-gxl-s905x-khadas-vim: 1 failed lab

---
For more info write to <info@kernelci.org>
