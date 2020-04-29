Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F58B1BDC42
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2020 14:33:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727044AbgD2MdI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Apr 2020 08:33:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726686AbgD2MdI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 29 Apr 2020 08:33:08 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 365E5C03C1AD
        for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2020 05:33:08 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id d24so784820pll.8
        for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2020 05:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=51zTxEbThs7H4tIpbmr7Xe8Supd/EOnvZp7GhH16Y8I=;
        b=dg4YDhtBLBUaTqmmqTkS6Ql+RJucCHz+UvY6XhLUcTJVaEG529UDOsMjAF5bJMG2rE
         ec5yYimFbf5oPH4ZAvcyDXGr8CMRbPoCT58Vau1mMhU/JsCvmUBKKzfCZkazjqQRBqmy
         aqC+Ibm8f48HeTVe1Tosmkv8Q9OqXBsCxaHlg7+E1aqGU4lTZlWbfqELnTHXp6S32oTf
         NX9K4v0W5Ab2bNVmwAxjllJX81K89jeRF2ZovSqv6Vy4UVgPsMzF4suJLxNh4GoqWX5a
         Hq0mYzDfo7t5V+dOV0P8YpT4Wmhnh1OdhJI60WneDr+nSQQIZg1ZTFKwNxq8CwTN/jA3
         anNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=51zTxEbThs7H4tIpbmr7Xe8Supd/EOnvZp7GhH16Y8I=;
        b=pSNulwWKAShU55FK0NV/rtlkP2+5ixitfFbFiI9YRCWXckK/8ifq2HKp8TffQXVUQZ
         vgZWkvUf+WtsGuOdp0sY2y7dXBP96LF0fc0p3IqMICjUZclTO4zC+0sOFh6XJIUtot8G
         OinmXxaC4rcBU8PTzKTA8HJZk72/L1Q9z34L5N+mBG3xXKMhJQG11aG3x3xAoL0oN9Xd
         GhNu2Im/Bi2EuyHAMq3w8ASg1mH3BX9b2xVD1DP5bThZUz+arfmhIvYWcbCl9R3SguWg
         IgTVQrbVBfeER30IfkFxE6q2ZXpJbF8nXHItjO/BgOx/zrMuiJ8WUp6S1HoGKXoiMyfP
         J/Fw==
X-Gm-Message-State: AGi0PuYcQ9FfBgKmkM+O/oLCUuaVFpYQyrdRJSEuTASs51Ed21jv/uBb
        zeRvtlaIxA3SMrP/cOA92xlbUogMnJU=
X-Google-Smtp-Source: APiQypK0S/+63iKQ1QMMzan6mwveUtj3sebojONL2o2YtYkQgava13FNesDPBHmj0VbktjEClXYERQ==
X-Received: by 2002:a17:902:7687:: with SMTP id m7mr27795692pll.34.1588163587314;
        Wed, 29 Apr 2020 05:33:07 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 23sm4549074pjb.11.2020.04.29.05.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 05:33:06 -0700 (PDT)
Message-ID: <5ea97402.1c69fb81.fc5f2.f480@mx.google.com>
Date:   Wed, 29 Apr 2020 05:33:06 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.7-rc2-34-g9e581cd14663
X-Kernelci-Report-Type: boot
Subject: linusw/for-next boot: 66 boots: 2 failed,
 64 passed (v5.7-rc2-34-g9e581cd14663)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next boot: 66 boots: 2 failed, 64 passed (v5.7-rc2-34-g9e581cd14=
663)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/v5.7-rc2-34-g9e581cd14663/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.7-rc2-34-g9e581cd14663/

Tree: linusw
Branch: for-next
Git Describe: v5.7-rc2-34-g9e581cd14663
Git Commit: 9e581cd14663a665c32039acb0577f0ea2653f46
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 58 unique boards, 14 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 77 days (last pass: gpio-v5.5-4-=
45-gd18fddff061d - first fail: v5.6-rc1-12-g612e35e76ec8)

arm64:

    defconfig:
        gcc-8:
          sun50i-a64-pine64-plus:
              lab-baylibre: new failure (last pass: v5.7-rc1-20-g9f676e5313=
c1)

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            sun50i-a64-pine64-plus: 1 failed lab

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

---
For more info write to <info@kernelci.org>
