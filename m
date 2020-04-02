Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7CDE19C734
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Apr 2020 18:38:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388583AbgDBQiW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Apr 2020 12:38:22 -0400
Received: from mail-pj1-f65.google.com ([209.85.216.65]:51476 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388555AbgDBQiV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Apr 2020 12:38:21 -0400
Received: by mail-pj1-f65.google.com with SMTP id w9so1756957pjh.1
        for <linux-gpio@vger.kernel.org>; Thu, 02 Apr 2020 09:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=r5O7UEmfnZtrAuxXcKavwdV1Sb1/BVp0w4gCfF/w900=;
        b=YWoOniMZWlfCg0lA2Hxov1VFMuozL+54L+6+P/QozwMHcwpMhlEa1e+HXv0j2et8lG
         D1zoZusLux+8TfDD+jSNdJ5ci1MeskOprbZQmhP82DJjD+gj8ccdHRpyB7snQzXTJfia
         poKYSII0Q3dCEFHJMkw7irWffyQglXJLGBLV+aPonbj3TnNawfb2XOIUw0eVC/JF6sUv
         LF5B7/9Ks/SHZgraFhKCy4vVPgKRhYLNFUVQXwHH+9q66AJFcT/D62ffZnvfbIe9Whpj
         +5Bz2ymIKjzRcD4kLhKnJ8SG0maom+nTsmBXv6PynKy2Fnb2TA27nq94VUJVcmSnZE03
         j2QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=r5O7UEmfnZtrAuxXcKavwdV1Sb1/BVp0w4gCfF/w900=;
        b=bKaiircPwUXY/FfZy2dubKF+gnOfxkJGW57+S69RqBCxk20o8trVawsKHuaiozTo2I
         d94x/D+conNWsdbpCWDQzc43y2MAZtUYNGHbv3mUnCbvehJDy8shzdefQV1/v9GoenSS
         lBdOgFAJJKiVyOdeJJl3p08hBaoxeNSuhIzZIVxtkp3j7KVF7RkSWrmZYjhuMBkluORP
         SaGFsYeSrKdlLO5KOh9imQCT7BbEt+qA6rBwL8jfKhK0feMT9U+CGooNqfAbVkCwsZev
         EVZ8EVwmLVuPhHzIiPNZYPDCP4NozBMx3TF0jJ1WA+yxfOIBC2oyltq1TWwA5L+ymbwl
         wMlQ==
X-Gm-Message-State: AGi0PuZ0JEkNWoxkCMsOAsZm0oa0fV22I/uLiwru74F9pG6LlFtrGjpN
        mqg5ZFpd4+LKQqfwpExYqDS4XlXKAq0=
X-Google-Smtp-Source: APiQypKxPgv7hv1ldG0f4SdODPNOvG8HpLHwuHfG6bDBlaHBdaQEEAubQCTdjR+ZiJZS4fQoGW4eSQ==
X-Received: by 2002:a17:90a:e387:: with SMTP id b7mr2586929pjz.93.1585845500176;
        Thu, 02 Apr 2020 09:38:20 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z6sm3723537pgg.39.2020.04.02.09.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2020 09:38:19 -0700 (PDT)
Message-ID: <5e8614fb.1c69fb81.543bf.0fa4@mx.google.com>
Date:   Thu, 02 Apr 2020 09:38:19 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.6-rc7-64-g4ed7d7dd4890
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: linusw
X-Kernelci-Branch: for-next
Subject: linusw/for-next boot: 63 boots: 1 failed,
 62 passed (v5.6-rc7-64-g4ed7d7dd4890)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next boot: 63 boots: 1 failed, 62 passed (v5.6-rc7-64-g4ed7d7dd4=
890)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/v5.6-rc7-64-g4ed7d7dd4890/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.6-rc7-64-g4ed7d7dd4890/

Tree: linusw
Branch: for-next
Git Describe: v5.6-rc7-64-g4ed7d7dd4890
Git Commit: 4ed7d7dd4890bb8120a3e77c16191a695fdfcc5a
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 55 unique boards, 14 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 51 days (last pass: gpio-v5.5-4-=
45-gd18fddff061d - first fail: v5.6-rc1-12-g612e35e76ec8)

Boot Failure Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

---
For more info write to <info@kernelci.org>
