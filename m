Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0484115CA25
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2020 19:19:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725781AbgBMSTI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Feb 2020 13:19:08 -0500
Received: from mail-wr1-f52.google.com ([209.85.221.52]:37370 "EHLO
        mail-wr1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727076AbgBMSTI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Feb 2020 13:19:08 -0500
Received: by mail-wr1-f52.google.com with SMTP id w15so7892740wru.4
        for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2020 10:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=gSi6wRUdjp6KRHXdnxx6s5CH8ROUdHzWcDACGN9Cd1k=;
        b=aIgoopTyZqraPAVQQdhc91S9qOf9xn2w/WSJUxFBc9dphRL1hhfi7wt0SfHiypSkzW
         hWPJHXAEiWg7HCwQuLtdMGV8hEc1QEc75PvWlBoSSXmPSCVoAr7ApC+Wqx2fHLwOQfmD
         stwbnrnHoJh3EqI/vpxGHwXlOYR9UCWq7cpyndUgSV+kTUhqTAdH9t2z7LEoTyr1w5ez
         DtOuvKpBhdwtH+QjjfcXv4/4V8XvyURW6wpmCOlrZeVb+WMj0PohzgxCu5Mtg1SRUSUy
         BGqlzd9S5iawFMzpERq1K2Z8tQWeAxhmW3+uKmmx9pDvEUk149nw9twpYqXBiPAX8jZQ
         DmVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=gSi6wRUdjp6KRHXdnxx6s5CH8ROUdHzWcDACGN9Cd1k=;
        b=P034i+vZl1LRcNrV0sw6xv4eYXR48N58/M1F6pVSsq15jyHefBy0NBamiVKAbYJZZz
         0Z4KhYpIp4qdqESOsnR5Yzbny4pxaOZSokkEY3ae1WXmeoEHFGs0yLgLIkMSQgSrHt9u
         X37CQpCaCpuvNNBNUedWloyc+VkjLrezD3xb6sRhfPII+JhuEeobIZG30E9H/u5hPTbP
         a+l0R+ER26fLuHwgV8wF6hMCSPUpNk1tZHH9UmITQ1auS63SqVE5WOvD/UzZK+2rTibx
         v/jRJLqKVRYfCdQBYXLi6QCL77B/EXpQNGuKEWqP4nxBVK1zTjL5FYYcYBzkI6WC1qao
         BO6A==
X-Gm-Message-State: APjAAAX6wiCEkCIUY6xej9vtyjchsbLxttvdX7hcYR2+j+eSsHsfj1cl
        lCnqAyTCsl+9ntQCrK3n4dbPxwu67Orrsw==
X-Google-Smtp-Source: APXvYqzxACjthCZl3Xx8jl6oc2CZHNMf/n6On385SpaE/VflhstOw1Ib6PoVyB8EhT000In0rAzXhg==
X-Received: by 2002:adf:8b54:: with SMTP id v20mr24127224wra.390.1581617945710;
        Thu, 13 Feb 2020 10:19:05 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id h2sm3994762wrt.45.2020.02.13.10.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2020 10:19:05 -0800 (PST)
Message-ID: <5e459319.1c69fb81.7dc8b.23f2@mx.google.com>
Date:   Thu, 13 Feb 2020 10:19:05 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.6-rc1-12-gb2929a9cb2fb
Subject: linusw/devel boot: 55 boots: 5 failed,
 50 passed (v5.6-rc1-12-gb2929a9cb2fb)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel boot: 55 boots: 5 failed, 50 passed (v5.6-rc1-12-gb2929a9cb2fb)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/devel/ke=
rnel/v5.6-rc1-12-gb2929a9cb2fb/
Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.6-rc1-12-gb2929a9cb2fb/

Tree: linusw
Branch: devel
Git Describe: v5.6-rc1-12-gb2929a9cb2fb
Git Commit: b2929a9cb2fbfedf30c66033a865c8135a7c2184
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 52 unique boards, 14 SoC families, 3 builds out of 5

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: new failure (last pass: gpio-v5.5-4-45-gd18fdd=
ff061d)
          exynos5800-peach-pi:
              lab-collabora: new failure (last pass: v5.5-rc1-38-g59c324683=
400)

arm64:

    defconfig:
        gcc-8:
          bcm2837-rpi-3-b:
              lab-baylibre: new failure (last pass: gpio-v5.5-4-45-gd18fddf=
f061d)
          meson-gxl-s805x-libretech-ac:
              lab-baylibre: new failure (last pass: gpio-v5.5-4-45-gd18fddf=
f061d)
          sun50i-a64-pine64-plus:
              lab-baylibre: new failure (last pass: gpio-v5.5-4-45-gd18fddf=
f061d)

Boot Failures Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            exynos5800-peach-pi: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            bcm2837-rpi-3-b: 1 failed lab
            meson-gxl-s805x-libretech-ac: 1 failed lab
            sun50i-a64-pine64-plus: 1 failed lab

---
For more info write to <info@kernelci.org>
