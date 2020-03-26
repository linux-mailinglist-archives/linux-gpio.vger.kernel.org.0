Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FE25193B95
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2020 10:15:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726338AbgCZJPT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 26 Mar 2020 05:15:19 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:33068 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726289AbgCZJPT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Mar 2020 05:15:19 -0400
Received: by mail-pg1-f195.google.com with SMTP id d17so2582490pgo.0
        for <linux-gpio@vger.kernel.org>; Thu, 26 Mar 2020 02:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=vJqb32WIBICYpHNkqCghgBkQNcoH9/scB5SUnUgX3N0=;
        b=owhUI38E6FA/HuOPVsREOUF/A5xBKZqOt5FGaTDKtjiqZD32XL1j4xmRZuiZxmDufk
         uMOG2HcxPchldY4kYnRxKiGttX3PdnBSHr/LyQxlSsmnUa/1Jhn562CNyOGkzXxaNMr1
         g1AFXdZ5ZpjXIRSqZFZByKHoBVhMm15YC/ubgz1lzMBC91Q5JVJWQnDaUhP+zhNOyOfS
         3RYLOxd2l1lkAFtHXLBXypADjLyQt/ZWkvNY9RrDVY95m4lTsBOvoN9ELlsrFN38DHm9
         GWYBc/9g1GBbG660NzkmXrGil/LNuxrlDy+VydxeyfbYnJ3xDkRATi/cD+MF280XYkV5
         rRNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=vJqb32WIBICYpHNkqCghgBkQNcoH9/scB5SUnUgX3N0=;
        b=pmLLoQpDrA0fDGOhezwff3wBA2I/Gi9+Q0VSTXQh3ULCDH3vK5Q2eyOnJj3oEM3OEs
         2RtNsY2dv4hziA9Z+E3NX2TUx+NkFTpZVrt3YtxOygppR8lmx25V6hIqmrc5RdYNR7l+
         xCTEx1+i8gTvfQWPf0XodB4J4QVQYxAdz9985o2I+AkDkKJd4u1Z2neqouFPMqW5W696
         vUlxY5i3EE7+/MGNTN7za59f3yiTje1IdghzIcn1HjMg5e1pRlo88NR8erlg9XQ0B8ML
         WGeGeXckroYmIJh2gK8MxdbK0esjslKNYTyWy1IVZBU++cFacm2I6Ltwv1wC9q+7Gsix
         5zBA==
X-Gm-Message-State: ANhLgQ2Pm5qR8pu9RSpEca7lLdei+ZRny7ddEU0e8jX19pSPoorU4FpJ
        B+Ru8NDj16sl0EOU+bc3D/RJ4EjucmI=
X-Google-Smtp-Source: ADFU+vu+Hr1FQwFYHkauPg6dRcx3CRPRKo8KxRNWdlxe0jBZgFZEHkcPC6JyTo9UFyFjvlZDR7oYmw==
X-Received: by 2002:aa7:9e4d:: with SMTP id z13mr8116002pfq.6.1585214117447;
        Thu, 26 Mar 2020 02:15:17 -0700 (PDT)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e187sm1142368pfe.143.2020.03.26.02.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 02:15:16 -0700 (PDT)
Message-ID: <5e7c72a4.1c69fb81.45baa.4a5e@mx.google.com>
Date:   Thu, 26 Mar 2020 02:15:16 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: gpio-v5.6-3-48-g7d52bac0fadc
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
Subject: linusw/for-next boot: 56 boots: 3 failed,
 50 passed with 3 untried/unknown (gpio-v5.6-3-48-g7d52bac0fadc)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next boot: 56 boots: 3 failed, 50 passed with 3 untried/unknown =
(gpio-v5.6-3-48-g7d52bac0fadc)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/gpio-v5.6-3-48-g7d52bac0fadc/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/gpio-v5.6-3-48-g7d52bac0fadc/

Tree: linusw
Branch: for-next
Git Describe: gpio-v5.6-3-48-g7d52bac0fadc
Git Commit: 7d52bac0fadc072655373772f4ee9455039858e4
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 49 unique boards, 14 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 43 days (last pass: gpio-v5.5-4-=
45-gd18fddff061d - first fail: v5.6-rc1-12-g612e35e76ec8)

arm64:

    defconfig:
        gcc-8:
          meson-g12b-a311d-khadas-vim3:
              lab-baylibre: new failure (last pass: v5.6-rc3-38-gb3e741a0f7=
76)
          meson-gxl-s905x-khadas-vim:
              lab-baylibre: new failure (last pass: v5.6-rc3-38-gb3e741a0f7=
76)
          meson-gxm-khadas-vim2:
              lab-baylibre: new failure (last pass: v5.6-rc3-38-gb3e741a0f7=
76)
          sun50i-a64-pine64-plus:
              lab-baylibre: new failure (last pass: v5.6-rc3-38-gb3e741a0f7=
76)
          sun50i-h5-libretech-all-h3-cc:
              lab-baylibre: new failure (last pass: v5.6-rc3-38-gb3e741a0f7=
76)

Boot Failures Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            meson-gxl-s905x-khadas-vim: 1 failed lab
            sun50i-a64-pine64-plus: 1 failed lab

---
For more info write to <info@kernelci.org>
