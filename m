Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC53F105211
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2019 13:08:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbfKUMIO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Nov 2019 07:08:14 -0500
Received: from mail-wr1-f50.google.com ([209.85.221.50]:42027 "EHLO
        mail-wr1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726500AbfKUMIN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Nov 2019 07:08:13 -0500
Received: by mail-wr1-f50.google.com with SMTP id a15so4071643wrf.9
        for <linux-gpio@vger.kernel.org>; Thu, 21 Nov 2019 04:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=uEa7di2Lz7VIScowZAi9LS+k/YS/AcqfHQznl3OUsqA=;
        b=qqdu0+H4S0FiK/xjklRFbp3gkQkGuwmLN7+JGA8yufsoU0/lqvBrEqV08/qY7UIt8T
         YDoc79nAgCCHICOP9wOsZS9X6jdzl0KsPFnRvek55XbGZjC+yILymjnxj9p9IZgS9K9J
         zkSog0xmVmwCXab+gvo22ec2r72iYPbOCUq7c4m+41OaIP34wONuLUd/T0/TV0srHOqr
         hhoIalFh5Tk+fFM0oEHlBsssnfA6Grs19LZ/4K4wI6+fsbgHVX6PlXduhMYZbG3BhE/8
         cKX11CVbwZwM3drpb2jYG7/ml3t2mW1ymfLC+pcI3QxMNgU6B+6RhZteeDvM+QI4lvOA
         FdYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=uEa7di2Lz7VIScowZAi9LS+k/YS/AcqfHQznl3OUsqA=;
        b=H2CxtO2U/fwEkr3hUdtRVEOdJz12CRhdtf8xKHmrZC4n3UFogpztW9h/Ghr4UVKf3p
         CWhpQJo5PBmxxdqUHxbOkyXY0pd0rmGFtjCJXr4ccvFGq7Ahx0u5kaqfDvPK47FDGxrZ
         04hS6xV66u3PPmBpX1v/m3oBUy23Ii5Szjd95Y2XUFHh/zcwU8Avh14j+eOFKFmLbaT0
         N57MAEQxonRpexfi4KpFmREilhHf2NUJJ2S3grL370dV6Fz70vE7uznxvhiJSy0hp8A3
         5EpZSAolUPXSNLlS9vJk0tlUsHX4fmefyI+STGzvsUAYQ0d4Tnbx6KzZR8o0Tb0rlo9I
         CdMw==
X-Gm-Message-State: APjAAAXCjdiwXbcIVnq9M9SGn4JWOaMKnf89MSfcJIBeYgk9X8dZHDhi
        2NZ/tbNim4e3mxFaYoJJE8z0pfwvK7Ge/w==
X-Google-Smtp-Source: APXvYqyW9CH4oz1h1Wzt47JDLdtSGT8ly7/MX8WR1L++OCCuo0FcdyKoZfxiA6Vy4YOo2c+ccVSxDg==
X-Received: by 2002:a5d:6ac9:: with SMTP id u9mr9884647wrw.383.1574338091562;
        Thu, 21 Nov 2019 04:08:11 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id u16sm3036357wrr.65.2019.11.21.04.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2019 04:08:10 -0800 (PST)
Message-ID: <5dd67e2a.1c69fb81.ce0f2.eea4@mx.google.com>
Date:   Thu, 21 Nov 2019 04:08:10 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: gpio-v5.4-5-120-gac72719b626f
Subject: linusw/for-next boot: 59 boots: 2 failed,
 57 passed (gpio-v5.4-5-120-gac72719b626f)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next boot: 59 boots: 2 failed, 57 passed (gpio-v5.4-5-120-gac727=
19b626f)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/gpio-v5.4-5-120-gac72719b626f/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/gpio-v5.4-5-120-gac72719b626f/

Tree: linusw
Branch: for-next
Git Describe: gpio-v5.4-5-120-gac72719b626f
Git Commit: ac72719b626fa213950e2f2248d5256b4218af49
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 48 unique boards, 15 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          meson-gxl-s905d-p230:
              lab-baylibre: new failure (last pass: v5.4-rc7-124-gd0d9531e3=
8a6)

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            meson-gxl-s905d-p230: 1 failed lab
            meson-gxm-q200: 1 failed lab

---
For more info write to <info@kernelci.org>
