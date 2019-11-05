Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24331F0260
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 17:11:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389985AbfKEQL1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 11:11:27 -0500
Received: from mail-wr1-f52.google.com ([209.85.221.52]:38432 "EHLO
        mail-wr1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389907AbfKEQL1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 11:11:27 -0500
Received: by mail-wr1-f52.google.com with SMTP id j15so1414490wrw.5
        for <linux-gpio@vger.kernel.org>; Tue, 05 Nov 2019 08:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=cMLMqeAz7x9EPkf16t0TNblqGA9yPktREbXs2ryB5eM=;
        b=yOFMUazdAjug2PN83Mk9JHx1wUFt69vdv7rVxfrZ8yGigFeefY4Scp5dTeTwDi8a5O
         fJC8Nu4iZ0/MrLt+Xb78HDxZq1bjRXxyMMg8cm/VBiDBH/BwQhEwF52P03+yymc1/Ulw
         AZgUF//I4gxpZJQ4Y7VsJVBgjwjXDbkqGfwtXq2hJuPbJD4CvKP8x5TOkRP+zun6qQR3
         WwQQb0B81kLtC5yMTwA3obprHcEWeETGWosIlTCUYowC4V4eLR01giY0ePgntpjB21Z5
         iOEnGtZd9ihHYXx44I74CmjzAB1uUdAIFwwB3qXTwahTsEQqtDiobbxPU6YtkqDiGQNk
         +l5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=cMLMqeAz7x9EPkf16t0TNblqGA9yPktREbXs2ryB5eM=;
        b=XlQas27r4rvW4aA6yxaejj72b3xZsUjJ2MwLQzK+KT8odIPKqkJsU4maiBg8kkJvAy
         CfPWteZagbNV890bZT+FZzw3KA0gGSaMs7/zI55rL8QW6p3Yxq47IujjrtNtfNqKfmLQ
         MKhT9n13PwA9WXDL0jmGWlZIJeCLKScebyMie2R6zkXWbO1RKlDGCHoL9fCE4800/vjV
         WqsYeJV1i0FY4PdzpuFK0QUSInyautdl2L3LTKdYlSk4Z1Fr4DojJQ+/6ONHkqpJb/Ng
         quZq8ZM9tLtrXDe/7QpGff5PANzaq3NHrd7iB+/+ZGlHMP1u5cOPagistVfxQ/I8Tx7h
         kQEA==
X-Gm-Message-State: APjAAAXHOSOK0OmtLT8u+1Ou2tOfSK2KWVYD6y8AurcX/se1m3sgrkbZ
        QOdD1fij7Y7TSSsSruMlB9bMxi9NVqjUEw==
X-Google-Smtp-Source: APXvYqw2B7CQgppya6/1y7bQduxmU+al2HhL8QoJEGzyjMqLAjyiPZGoosTgoiEHem7RPMnbL2CxHw==
X-Received: by 2002:a5d:5091:: with SMTP id a17mr28019742wrt.249.1572970284750;
        Tue, 05 Nov 2019 08:11:24 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id n13sm13197962wmi.25.2019.11.05.08.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 08:11:23 -0800 (PST)
Message-ID: <5dc19f2b.1c69fb81.bf34.b59b@mx.google.com>
Date:   Tue, 05 Nov 2019 08:11:23 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-rc6-33-g504369cd6d2c
Subject: linusw/devel boot: 45 boots: 11 failed,
 34 passed (v5.4-rc6-33-g504369cd6d2c)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel boot: 45 boots: 11 failed, 34 passed (v5.4-rc6-33-g504369cd6d2=
c)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/devel/ke=
rnel/v5.4-rc6-33-g504369cd6d2c/
Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.4-rc6-33-g504369cd6d2c/

Tree: linusw
Branch: devel
Git Describe: v5.4-rc6-33-g504369cd6d2c
Git Commit: 504369cd6d2ce34c1225063071ac7e0a5a4d5e30
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 37 unique boards, 13 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          r8a7796-m3ulcb:
              lab-collabora: new failure (last pass: v5.4-rc1-31-g6a41b6c5f=
c20)
              lab-baylibre: new failure (last pass: v5.4-rc1-31-g6a41b6c5fc=
20)

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            meson-g12a-x96-max: 1 failed lab
            meson-g12b-odroid-n2: 1 failed lab
            meson-gxbb-p200: 1 failed lab
            meson-gxl-s805x-libretech-ac: 1 failed lab
            meson-gxl-s905x-khadas-vim: 1 failed lab
            meson-gxl-s905x-libretech-cc: 1 failed lab
            meson-gxm-khadas-vim2: 1 failed lab
            r8a7795-salvator-x: 1 failed lab
            r8a7796-m3ulcb: 2 failed labs
            rk3399-gru-kevin: 1 failed lab

---
For more info write to <info@kernelci.org>
