Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61C632D0665
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Dec 2020 18:47:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726318AbgLFRrM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 6 Dec 2020 12:47:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726043AbgLFRrM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 6 Dec 2020 12:47:12 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EE81C0613D0
        for <linux-gpio@vger.kernel.org>; Sun,  6 Dec 2020 09:46:32 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id o4so6880027pgj.0
        for <linux-gpio@vger.kernel.org>; Sun, 06 Dec 2020 09:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=WzqST/Q+DPOIQ4k6RBpbfbD7tkMJajn7BDxYKkHb83k=;
        b=k/+j6KlpSBgISRkMFEnPXbACt11vwx5FzGa9IcqG/njTDwPGgSQDzZuo+vZVXXfu1X
         kTBed0ZAObwXYpiLgLfHwPxPtzywe5AhNLaHrHbgs65Kw/wjMfFcN6s3rIiIqM43YXgs
         6b1acU+x6k0ClfKi6pO8lgqbnL2BiFiLJGGRHll2fF3FibNXMpriw+cckaL5roO+nP/1
         3VtVaRBub7hPqyS503E9W16dkHL3S7ma2Cy4ETjBnbxPs39VX+Ka7mCk2LTPuSrr7pqU
         wdAqyZ0gWMkmYNXFBa3K3lYw5vJKv/g8bXlu4uP2H9k93/P5J8Z87ot8rXXQJy6hfc4J
         wNRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=WzqST/Q+DPOIQ4k6RBpbfbD7tkMJajn7BDxYKkHb83k=;
        b=BMMWGZ7kgpRrMqEedIsLXdoHh7hfJaaOkJPNb2KiOULKxmiG0sjlFDEucLm9fvg7eA
         a5YTn+QOehwd6lfVjHChAcsVh3nsfZCbIgZ3OEK1LoDaFqw1GjMy40c8uUWYiaFFJZTT
         s6Ic3G+c768KthgXOkBu/mXb7eZ+a8e5Rfy02AhscOhgonbkv6liZKz9mwMHKtcIgBIu
         rDAfZmWM3FYRVCgQ7rTmxH/gGnN/uTcmUAlHGeKipU1wos9YkjMNebHv1rbRFozgrIMN
         5GFYYGYHtajimlRE/FFjRrqFUHQLl62ys3HTWPlh8GEMmlpdrimISmBq/pd2uaiDTn/K
         NClQ==
X-Gm-Message-State: AOAM5300mR+GSlTr1Ej3giJLmbh30u4x7CAxv9dKha/EI1YcqLNCUFOr
        2awJpzK/i7+7rFyxg/zy0JUVtCQR8qoxCQ==
X-Google-Smtp-Source: ABdhPJzPGQGu7HHYy1ZPKUQh4njJ3CKVYJHK8xqdTdZD4Yxpgz9VJAz7/2Gm1DQafZjpF+STEGb/Tg==
X-Received: by 2002:a63:181b:: with SMTP id y27mr15483698pgl.408.1607276791563;
        Sun, 06 Dec 2020 09:46:31 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id cu4sm7982603pjb.18.2020.12.06.09.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Dec 2020 09:46:30 -0800 (PST)
Message-ID: <5fcd18f6.1c69fb81.2a194.280d@mx.google.com>
Date:   Sun, 06 Dec 2020 09:46:30 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.10-rc6-55-g0f8d9ac8978b
X-Kernelci-Report-Type: test
Subject: linusw/for-next baseline: 125 runs,
 1 regressions (v5.10-rc6-55-g0f8d9ac8978b)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next baseline: 125 runs, 1 regressions (v5.10-rc6-55-g0f8d9ac897=
8b)

Regressions Summary
-------------------

platform   | arch  | lab     | compiler | defconfig | regressions
-----------+-------+---------+----------+-----------+------------
imx8mp-evk | arm64 | lab-nxp | gcc-8    | defconfig | 1          =


  Details:  https://kernelci.org/test/job/linusw/branch/for-next/kernel/v5.=
10-rc6-55-g0f8d9ac8978b/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   for-next
  Describe: v5.10-rc6-55-g0f8d9ac8978b
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      0f8d9ac8978bc4b12ef523c4fc1732226c7ddbdf =



Test Regressions
---------------- =



platform   | arch  | lab     | compiler | defconfig | regressions
-----------+-------+---------+----------+-----------+------------
imx8mp-evk | arm64 | lab-nxp | gcc-8    | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/5fcd10a8e0fa68a433c94cc3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/v5.10-rc6-55-g=
0f8d9ac8978b/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/v5.10-rc6-55-g=
0f8d9ac8978b/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fcd10a8e0fa68a433c94=
cc4
        failing since 4 days (last pass: v5.10-rc4-36-g6c33287665e0, first =
fail: v5.10-rc4-34-g0f2c7af45d7e) =

 =20
