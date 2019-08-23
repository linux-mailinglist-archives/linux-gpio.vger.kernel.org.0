Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2407C9B8A5
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Aug 2019 00:56:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726591AbfHWW4s (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Aug 2019 18:56:48 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:52700 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726384AbfHWW4s (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Aug 2019 18:56:48 -0400
Received: by mail-wm1-f67.google.com with SMTP id o4so10214988wmh.2
        for <linux-gpio@vger.kernel.org>; Fri, 23 Aug 2019 15:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=bS2ji97JoJg6dAXpX6rPVpkPw0TD5lXzgCB97/j+hs8=;
        b=Xz1tP8su7C70SAtI/hVbYNr8R4VlmNFPxIM7gPYrTjbXOzqNEhTmATNhq/91RZm+Lu
         KWtiH/N0Qt+yFX0izjzGoUEKdoPL6HvdPSsBOrCmdrCYCvWTU6IX2avs9qvGd3HNV9qi
         i0gD68uuzB/SdQnbwxdpjKzVf5ray8qgYBSGMu98HZZBxIEEUYbhbkBogW67CwAsSoqJ
         tZPUtfkIl58PXJv0l/tUfbD9InYU2lsa5ywWE7tpVYUzNxbiuLjr3HD1iWEvCglX9oM5
         K0A6ezSHtP9fJG+6w2lrmxwEYuSaZn0DOUC3YiCDvfRv3E6idobMSYBkaYBUbyP08Vpx
         zAbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=bS2ji97JoJg6dAXpX6rPVpkPw0TD5lXzgCB97/j+hs8=;
        b=Fn6KjneIdwwu0n9aAsR6PBSTVwl2E/+4ISqB6wa9tli90indBA4uTADbRBj7Ut0TzU
         WKo44VBOP72rc7+TQ8Dps1t+8/rBOz/lMeEpYTTHXVoEqVZ+DqsQtgundD6GIAR2e56p
         49F0KjgwPy8wxSbDZzA9s0FyZmza7uQHX5jxdzyknJXN695TVgjxsV+b+FLykl7S250R
         v3zWGphWTqttLfoU/hOlvI3JyFr3pQV45c9n3qtMvx5ybasomepiq0NsSM7PnHcbEVcp
         nyFsNiAJ925hj7z0FrYv2WDkKsE6dcrnoPtTOl7StmRJQRtATZKKbfS+KSaINyK5ImcT
         F0Jw==
X-Gm-Message-State: APjAAAV0dWGoxzSslCtxYFMvnqvGEjni6DK6/rtoInc9pfrrgnnBNVEn
        GXkO4c+wu5VKIkqzKSOi7WPqDvN13Efi+Q==
X-Google-Smtp-Source: APXvYqykvwTXJ5o5/esVjCgM9zU0J6NJs3GM7E+EiZnNkhCVKGzlDuMVoNmdXUao8lnw6wdZMlbZSQ==
X-Received: by 2002:a05:600c:225a:: with SMTP id a26mr7978681wmm.81.1566601006319;
        Fri, 23 Aug 2019 15:56:46 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id a19sm11979727wra.2.2019.08.23.15.56.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Aug 2019 15:56:45 -0700 (PDT)
Message-ID: <5d606f2d.1c69fb81.1472e.6333@mx.google.com>
Date:   Fri, 23 Aug 2019 15:56:45 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc1-46-gf4e9bcc05f4e
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: devel
Subject: linusw/devel boot: 54 boots: 2 failed,
 51 passed with 1 untried/unknown (v5.3-rc1-46-gf4e9bcc05f4e)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel boot: 54 boots: 2 failed, 51 passed with 1 untried/unknown (v5=
.3-rc1-46-gf4e9bcc05f4e)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/devel/ke=
rnel/v5.3-rc1-46-gf4e9bcc05f4e/
Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.3-rc1-46-gf4e9bcc05f4e/

Tree: linusw
Branch: devel
Git Describe: v5.3-rc1-46-gf4e9bcc05f4e
Git Commit: f4e9bcc05f4e8d543afbfc0ca1fd4435a2204776
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 36 unique boards, 15 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          omap3-beagle-xm:
              lab-baylibre: new failure (last pass: v5.3-rc1-25-g470219c619=
e9)

arm64:

    defconfig:
        gcc-8:
          apq8016-sbc:
              lab-mhart: failing since 24 days (last pass: v5.2-10808-g9637=
d517347e - first fail: v5.3-rc1-5-ga299726da44f)
          r8a7795-salvator-x:
              lab-baylibre: new failure (last pass: v5.3-rc1-35-ga7e4214292=
6f)

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8016-sbc: 1 failed lab

arm:
    multi_v7_defconfig:
        gcc-8:
            omap3-beagle-xm: 1 failed lab

---
For more info write to <info@kernelci.org>
