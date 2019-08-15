Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52EA88E8EF
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Aug 2019 12:21:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730948AbfHOKVR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Aug 2019 06:21:17 -0400
Received: from mail-wr1-f51.google.com ([209.85.221.51]:34024 "EHLO
        mail-wr1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730646AbfHOKVR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Aug 2019 06:21:17 -0400
Received: by mail-wr1-f51.google.com with SMTP id s18so1009198wrn.1
        for <linux-gpio@vger.kernel.org>; Thu, 15 Aug 2019 03:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=UTZdXnrla3zS1GY/caA3BWvjWzi87t//nfk/LWER4BI=;
        b=D/7mh4zVCk4N7SVHqsHKvFeIFHEBmsvFG+tOmDzoCpfO28jZUjsyK9rAMKYbQM4qMj
         /R4H/WTp46QUxPkHDGtcCuESawVNDP2bW6MxsDsfqk2c2ASrliyxzm0zDnoHDgOKWfk1
         K2mbCdv7uQ3qTTK3tTEBQdTT5oTspB+lnXYeKlI5k/lxmXxEQ1Qk03+ymBfcqJ1+g+0p
         Kpy0f/ch3vsUKiYL1iW8gLGGQR3Wkau2ojUQOdDV/g5M/L4QiWETaPMptmV27h6Itc9n
         FV4vpRPpTcBeuwZYLGKuBfxT1ebqewNmoWWdfYUDyDf8LHMSX3WY6vlsurAhnWs59czI
         KeJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=UTZdXnrla3zS1GY/caA3BWvjWzi87t//nfk/LWER4BI=;
        b=AmI07NiNZSC2WBOOaK9wJmo8FIsEjjmKWWH9JJ8p47DqHA3P26+mdCQRzoxf4DXRTX
         OJnbqMCLAQneclJnS5Sa/S9MAcDLWOAdUxszYq4+QpOhI3VxHwRQfHbIC3vK5DTUrsEs
         7Pfx9199GsxQwO1XyfeidqAnc9aJneZQvFyz0LPrMYwnl9IKiF5moysNzmQclooixI2Q
         y0K2DqWfD92DxRWLnayZGRvXXsSgOIyJCDgU2yyfrZmUD4RSQCUpjIsYcBpquaZVd60F
         O12+4wbEapRUBufS8h1itZFTOHFhp10JooaTycHF4SRtWK662CcpKrf47XTnKQEbG1l5
         cacA==
X-Gm-Message-State: APjAAAXfknFd+zT7WQb9U8hhOK0CAqcuFSHOxUjz50fQn30SQd9R5Jwn
        LCMM3kcWPss7+CAX51+iUN7MH4c0bUQTHA==
X-Google-Smtp-Source: APXvYqxUenKXF0BTPEIJsxj55RaZNQaUFAlqtFGnNLbXNqULjRSlHULpj9KHSoKsX6z6AeCVmEh39A==
X-Received: by 2002:a5d:4211:: with SMTP id n17mr4227121wrq.137.1565864475015;
        Thu, 15 Aug 2019 03:21:15 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id h23sm1077126wml.43.2019.08.15.03.21.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Aug 2019 03:21:14 -0700 (PDT)
Message-ID: <5d55321a.1c69fb81.6ed08.5006@mx.google.com>
Date:   Thu, 15 Aug 2019 03:21:14 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc1-30-ge00fae7d82ec
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: devel
Subject: linusw/devel boot: 55 boots: 3 failed,
 52 passed (v5.3-rc1-30-ge00fae7d82ec)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel boot: 55 boots: 3 failed, 52 passed (v5.3-rc1-30-ge00fae7d82ec)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/devel/ke=
rnel/v5.3-rc1-30-ge00fae7d82ec/
Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.3-rc1-30-ge00fae7d82ec/

Tree: linusw
Branch: devel
Git Describe: v5.3-rc1-30-ge00fae7d82ec
Git Commit: e00fae7d82ec1267633fc2fc29d77c650d4a1229
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 39 unique boards, 15 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          apq8016-sbc:
              lab-mhart: failing since 16 days (last pass: v5.2-10808-g9637=
d517347e - first fail: v5.3-rc1-5-ga299726da44f)
          meson-gxbb-nanopi-k2:
              lab-baylibre: new failure (last pass: v5.3-rc1-25-g470219c619=
e9)

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8016-sbc: 1 failed lab
            meson-gxbb-nanopi-k2: 1 failed lab
            meson-gxm-khadas-vim2: 1 failed lab

---
For more info write to <info@kernelci.org>
