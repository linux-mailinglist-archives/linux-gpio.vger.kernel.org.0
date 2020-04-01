Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C00D419A737
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2020 10:26:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728374AbgDAIZ7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Apr 2020 04:25:59 -0400
Received: from mail-pj1-f67.google.com ([209.85.216.67]:37929 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730720AbgDAIZ7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Apr 2020 04:25:59 -0400
Received: by mail-pj1-f67.google.com with SMTP id m15so2374192pje.3
        for <linux-gpio@vger.kernel.org>; Wed, 01 Apr 2020 01:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=2XXzLWKwWEaQuVn13/2OfoUh3oNiEfoA0bL8PfSsEH0=;
        b=lxihV/kD8LBwM5BOJR5n1nclxLopv5tTbAtTrUUSMM59nmv9D3/w7S4riRI9PudKjn
         3AG4SZfZFKex230WjK5vRP9UD6YHl/KC186BNonManTa6unrMV4E7L3hMtMyrmci2lAR
         apaRbAGhwXrGgWr3vJmtgPYg1UA5UOifKlFWBsw7s/NIxIQk/Y+Q6Lqrr8osrurCud8U
         9GZkPbvbPj6fLicvMltMP1qBnjoyPXzZdLeOvIXsS1l894DMPerm6fjcn4/S1Wsf4/QF
         /a5xUk6TRcshSm19Vn9yNGszOOjMvIQuB75pbCZVNkAlulZYts1aZwsNT/xOVZ0AIyyk
         IeIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=2XXzLWKwWEaQuVn13/2OfoUh3oNiEfoA0bL8PfSsEH0=;
        b=o8GVs/YsabcNHGhCF4jScs3LbreLyjvLqI9czlrqofBzO+tdvU2px6TBVhhcf7QOgA
         SoDBqmth1nAIFP/PEkBw+d9K+fbYdQRCGmy5CcLUAQSR/0Lgt6tAFOZxrVdov5ckMEtI
         1kXnPsQuIJNxlNvna4bVtShPdqosWnhphESrRQaJ0qJZ+2Lerye9FLYQu1yCHbSaJ1g7
         tMtiTso948fjE05lJEkrUXQVJil5XK8KEaIpQ/OEK60j/lQQXDUSkESfMucvBc+3wUky
         KWnz4oTjkpTn0VGguecMVdoqAnzunYIN3xmCZJIae0Jzi/8d3lXne0SmUBNGdIwcayNw
         7gHA==
X-Gm-Message-State: AGi0PubqJ2qnGJ2FoWyKyUFf6ZNzD5VoMzRNpGSKAQGXoHc0pMAChKsj
        PFG82t9rnDkj0iJ6aVLb97jqzjAoRXA=
X-Google-Smtp-Source: APiQypJK/9gFxCVkUQovK3ZIJzBVQNCTL0BXjs1mpzmv3GIRYfDzlCEy/+DIm2qeBmN5eeZh/bHhEg==
X-Received: by 2002:a17:90b:1118:: with SMTP id gi24mr3069102pjb.99.1585729556835;
        Wed, 01 Apr 2020 01:25:56 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id i189sm1025299pfc.148.2020.04.01.01.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2020 01:25:55 -0700 (PDT)
Message-ID: <5e845013.1c69fb81.7b0e5.51fc@mx.google.com>
Date:   Wed, 01 Apr 2020 01:25:55 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.6-rc7-61-g33dd88826319
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: linusw
X-Kernelci-Branch: for-next
Subject: linusw/for-next boot: 61 boots: 2 failed,
 58 passed with 1 untried/unknown (v5.6-rc7-61-g33dd88826319)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next boot: 61 boots: 2 failed, 58 passed with 1 untried/unknown =
(v5.6-rc7-61-g33dd88826319)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/v5.6-rc7-61-g33dd88826319/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.6-rc7-61-g33dd88826319/

Tree: linusw
Branch: for-next
Git Describe: v5.6-rc7-61-g33dd88826319
Git Commit: 33dd888263199676946f1c789e821d39a9a79d98
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 58 unique boards, 15 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 49 days (last pass: gpio-v5.5-4-=
45-gd18fddff061d - first fail: v5.6-rc1-12-g612e35e76ec8)
          sun8i-h2-plus-orangepi-r1:
              lab-baylibre: new failure (last pass: v5.6-rc7-60-ge45ee71ae1=
01)

arm64:

    defconfig:
        gcc-8:
          meson-g12b-a311d-khadas-vim3:
              lab-baylibre: new failure (last pass: v5.6-rc7-60-ge45ee71ae1=
01)

Boot Failures Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            meson-g12b-a311d-khadas-vim3: 1 failed lab

---
For more info write to <info@kernelci.org>
