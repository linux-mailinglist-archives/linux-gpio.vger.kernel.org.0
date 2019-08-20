Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A83FF95C82
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2019 12:46:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729707AbfHTKpv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Aug 2019 06:45:51 -0400
Received: from mail-wm1-f53.google.com ([209.85.128.53]:53198 "EHLO
        mail-wm1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728414AbfHTKpv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Aug 2019 06:45:51 -0400
Received: by mail-wm1-f53.google.com with SMTP id o4so2192514wmh.2
        for <linux-gpio@vger.kernel.org>; Tue, 20 Aug 2019 03:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=yns2qq9RtKg1Il6feChU/hRb2zBFsBDmnbaF4Xw1VCI=;
        b=DPiD7zZI5uuL50y2iWEWCCH8JBVzhIFBEQYGBh8YuMrMbok7fewVoqtTJUf9GhAJWP
         78Yq4LwOe9vhd5R98q6hxkJ5D9OD+zev4OpvvkEEo9cBhOBhT5X+5u1AIsOg2jSDac7k
         NOiag0dsD0SR/UV+s82fbVKJE/hGXMAvCEjqTVq1I6tIM095Bg4mRIw7Ah6NA0fyJiHY
         pP4OdKYUFTHscZhCInRLVNJoc/y+TMz+lHexXK8Hx3A51xD+5BkwOW85PWcXBxM4tkIG
         HJ0PjNPB+oVfANoMUTcmboPhtZ5S2+zoO/GuT3rQmt1cJT/9YiucZDIGcF9aKB0XQfYx
         kFZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=yns2qq9RtKg1Il6feChU/hRb2zBFsBDmnbaF4Xw1VCI=;
        b=LHU4t2zpAE1spzyY5gdvHDf1kwHKKmZac6ljjHXGOFIYFxe84e2XdZrBVJlMxEWVOe
         6DgdqvBzjoK9CcxabwVp4lBQE4+6hUDzUk3FjuAWaZjw7qM2vFlPXNuU3mURYAggnB4/
         PxX59QwzmlW9F4/Fmya7WsQDtYq49Eb0WDLbRhqD6VQDlGKshd1+nSv09To8Lnwxd5ll
         tCzL3gku0MiVF0BO91dvadEX8YICCdZQ7VTZABQyXHvUgf/2GTaUMaa6T5cHh44I25x9
         +bboUz4bg+V6u9y+1wDyGF60chFoWa+gFSzbvwDqyotlhpOi9Con3BqKVL/BjCc4M7fW
         GnFw==
X-Gm-Message-State: APjAAAWHxTiFhkNWJgX//2BuGdw8MoYAsbo2JWvCltTJHGtL17LEWnlK
        wTMwDkdKURWaCwQTi9xkTqsvnvKVORrWrA==
X-Google-Smtp-Source: APXvYqy7bQhYBo3A8Cz57JdoOd1s0sUzfmgw8m1SiwYR3hb6RbhPZxeKFco3HqDbFM6kxlXYfM3rTQ==
X-Received: by 2002:a1c:5f06:: with SMTP id t6mr23377749wmb.60.1566297949073;
        Tue, 20 Aug 2019 03:45:49 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id d16sm14682976wrv.55.2019.08.20.03.45.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Aug 2019 03:45:48 -0700 (PDT)
Message-ID: <5d5bcf5c.1c69fb81.e5187.4939@mx.google.com>
Date:   Tue, 20 Aug 2019 03:45:48 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc4-40-g67d5826a3303
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: for-next
Subject: linusw/for-next boot: 51 boots: 1 failed,
 50 passed (v5.3-rc4-40-g67d5826a3303)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next boot: 51 boots: 1 failed, 50 passed (v5.3-rc4-40-g67d5826a3=
303)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/v5.3-rc4-40-g67d5826a3303/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.3-rc4-40-g67d5826a3303/

Tree: linusw
Branch: for-next
Git Describe: v5.3-rc4-40-g67d5826a3303
Git Commit: 67d5826a3303594c16292293ffe7b180f8a87352
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 35 unique boards, 15 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          meson-gxm-khadas-vim2:
              lab-baylibre: new failure (last pass: v5.3-rc4-35-g984078b264=
20)

Boot Failure Detected:

arm64:
    defconfig:
        gcc-8:
            meson-gxm-khadas-vim2: 1 failed lab

---
For more info write to <info@kernelci.org>
