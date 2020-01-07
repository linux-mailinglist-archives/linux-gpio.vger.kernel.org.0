Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39D23132A34
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 16:41:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728236AbgAGPlw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 10:41:52 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:36647 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727559AbgAGPlw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 10:41:52 -0500
Received: by mail-wm1-f67.google.com with SMTP id p17so19920379wma.1
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jan 2020 07:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=gr1iA0/TBZ/QFTvEWn+3NK1Dh8kAJeL44ZHu7UMd2tA=;
        b=DTlSGriXGiVY4BpKCgmpP6x+QnjWrqckb54AWbbLn3Egas4f2qP9hcXujyErYWnc+M
         Feuw+gSk1zU+fZBn1DhJznGx6wZgMJm3U3fSIv4OByulJBlqUc074eVVHIhFLS5f9aQG
         Y4GTtw0w5/okI7UBTinmR34UljyeMNcz8eCOkCqgeMBbxGn9rOAakcaV9NZ2yRebM90s
         xrMdK7eMImykXRuntlugceRYCJxt+zSITroGe/zYsdUR+E1HR05O/wtjMwWXB6tLFxiB
         EXgHQnJAjK5Fy1DSdtsuKAslVEmnS5C7R9A5uzFyoj8WULNulKTHBBY6t0a87qhfoeYg
         Sjeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=gr1iA0/TBZ/QFTvEWn+3NK1Dh8kAJeL44ZHu7UMd2tA=;
        b=aKQU8j5BViGVb6Q6fbmdbMG7banhVK8SbwEBkBIHFdf7dLqyTjqDG1DlDcV6K1ykMq
         +Su18ahLuEC4BnjVrkqm/csuuapfYNa7WL9w9R+/QDUOJ5NructMJmChblDkRBVSs+HJ
         WeNAkvBTk7+EI9CpAX8PUSNip7xcuwk/qE9QEIaxujXXWYI3GQnLH4gdPDNjmR//tPI5
         r4Fngp/9IGZb44w9JRqMONVqAeYJQJWChXncr3kgN00J/uJC5QLuNkr3riJQUOAeX91c
         Kh5NTy3dyTHF1W51plCkOzg4kSnajAE2abngxc7hC4uxDLE8tb4cin0VLm/ajDoYvpeL
         ahjQ==
X-Gm-Message-State: APjAAAWnGi96IxdmNuBGzVmw44Fr/zq3NZONxHcKbN/ytJYgwZbL0H6r
        OqjGkL+5roUsIw104jmpXwDO3G1XjwaPtw==
X-Google-Smtp-Source: APXvYqxdB1gZ8XhNdox29P78r7dliyb+qKVKBskzNB5RdXC/VDeaUECLxCq8d5ySDTnmR14qcwffFA==
X-Received: by 2002:a7b:c407:: with SMTP id k7mr41800150wmi.46.1578411710418;
        Tue, 07 Jan 2020 07:41:50 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id b21sm278wmd.37.2020.01.07.07.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 07:41:49 -0800 (PST)
Message-ID: <5e14a6bd.1c69fb81.963ca.0002@mx.google.com>
Date:   Tue, 07 Jan 2020 07:41:49 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.5-rc4-6-gaa23ca3d98f7
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: fixes
Subject: linusw/fixes boot: 55 boots: 1 failed,
 51 passed with 3 untried/unknown (v5.5-rc4-6-gaa23ca3d98f7)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes boot: 55 boots: 1 failed, 51 passed with 3 untried/unknown (v5=
.5-rc4-6-gaa23ca3d98f7)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/fixes/ke=
rnel/v5.5-rc4-6-gaa23ca3d98f7/
Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/v=
5.5-rc4-6-gaa23ca3d98f7/

Tree: linusw
Branch: fixes
Git Describe: v5.5-rc4-6-gaa23ca3d98f7
Git Commit: aa23ca3d98f756d5b1e503fb140665fb24a41a38
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 47 unique boards, 13 SoC families, 3 builds out of 5

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          rk3288-rock2-square:
              lab-collabora: failing since 6 days (last pass: gpio-v5.5-1-2=
-gd196292990fc - first fail: v5.5-rc4)

arm64:

    defconfig:
        gcc-8:
          meson-gxbb-p200:
              lab-baylibre: new failure (last pass: v5.5-rc4)
          meson-gxl-s905d-p230:
              lab-baylibre: new failure (last pass: v5.5-rc4)
          meson-gxl-s905x-khadas-vim:
              lab-baylibre: new failure (last pass: v5.5-rc4)

Boot Failure Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            rk3288-rock2-square: 1 failed lab

---
For more info write to <info@kernelci.org>
