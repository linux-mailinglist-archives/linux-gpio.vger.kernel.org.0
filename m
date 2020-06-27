Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E79720BDFD
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Jun 2020 05:44:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725832AbgF0Doj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Jun 2020 23:44:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbgF0Doj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Jun 2020 23:44:39 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B11EC03E979
        for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2020 20:44:39 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id b16so5475809pfi.13
        for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2020 20:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=tcnnDWyK43pj+ztcfOLQeBiqHNFyHaSSTf1LCm1lNyc=;
        b=1c18YpUWIV0cIsmg+I82VvftglrQIElUhwyBwyztvD0wV6ZgypMzQR/L+5ZmQqJUzf
         FDdrnIr51/xT5MdiWIip8gVQJBll3Nfgq4XWJ7LwfzRvaaC0J+o34CVjt5Vt4Wfi+nWH
         DUT5H6Z+3kmy6zBoK5E5rkvDUeTIM8Rpg27GXMV3WfGvw2T9m3I9Oc83aMl+nJxBJblK
         mzxmsxrwfz+C4hjX56pCTipDGQcYLc+vUzfdmN+oYvG9zRcc26otslWGbPl0RkvRQO9Q
         47cdHU8sHLwiypRKTPT0hUchW8PF2Au5zPCxxKXnH6wFqXouSESnFM1VOgHgg0bhyAPy
         5t+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=tcnnDWyK43pj+ztcfOLQeBiqHNFyHaSSTf1LCm1lNyc=;
        b=OeStz2tIYEqGKfN2oYVXvl5ktH3sSn5Dw84HdtcgRT3Xk8JN/J6V6MCPwJIio3WRfz
         C37EdfhN31rhgDJoR5gXMI5ilkZi6Yp8/2j8IgI+cxuM4iMVbeMxtPCSdt3zLuQwW9B5
         6w3g/WbJchKNLYwN9dOYLioF6vCUAhpNVUkwpyoggFBHGEhUOSvntEN+T1lzAncL2DuM
         zLZ/sJpWTi1TdM52K5DgmzDbIV8E/HgcmoTK5qXWOr2AMLJEbF5bl2nMR+nHLyl/L/Lq
         87jk+7wwvDNuo8iCu+++kYFaWNF2LIss9LEqp84s+36ya7zqbg7dRqhZNODqQEjmqweH
         4xsA==
X-Gm-Message-State: AOAM532ICivzBDYHcL24l6RfN/LM8usUC5UIPbbRGq9LCA1p/whYhHXW
        jpsZfmEoVtVezVl1U5bXocxOO8PHNpY=
X-Google-Smtp-Source: ABdhPJyrK03L5dfoaKMRnDyRtzaDahQkJvtPk0H7FMSYXCn04XuRJO2n95SfFd1CqvYjH7gzaUX7bg==
X-Received: by 2002:a62:a510:: with SMTP id v16mr5761881pfm.154.1593229477807;
        Fri, 26 Jun 2020 20:44:37 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id k26sm23540716pgt.90.2020.06.26.20.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 20:44:37 -0700 (PDT)
Message-ID: <5ef6c0a5.1c69fb81.bbc2d.689b@mx.google.com>
Date:   Fri, 26 Jun 2020 20:44:37 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.8-rc1-8-g93e0272a4395
X-Kernelci-Report-Type: test
X-Kernelci-Tree: linusw
X-Kernelci-Branch: fixes
Subject: linusw/fixes baseline: 79 runs,
 1 regressions (v5.8-rc1-8-g93e0272a4395)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes baseline: 79 runs, 1 regressions (v5.8-rc1-8-g93e0272a4395)

Regressions Summary
-------------------

platform             | arch  | lab          | compiler | defconfig | results
---------------------+-------+--------------+----------+-----------+--------
hifive-unleashed-a00 | riscv | lab-baylibre | gcc-8    | defconfig | 0/1    =


  Details:  https://kernelci.org/test/job/linusw/branch/fixes/kernel/v5.8-r=
c1-8-g93e0272a4395/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   fixes
  Describe: v5.8-rc1-8-g93e0272a4395
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      93e0272a4395819d51c7501b3cde771863ccecd2 =



Test Regressions
---------------- =



platform             | arch  | lab          | compiler | defconfig | results
---------------------+-------+--------------+----------+-----------+--------
hifive-unleashed-a00 | riscv | lab-baylibre | gcc-8    | defconfig | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5ef6b42b0099f50f4f85bb26

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/fixes/v5.8-rc1-8-g93e02=
72a4395/riscv/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//linusw/fixes/v5.8-rc1-8-g93e02=
72a4395/riscv/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/riscv/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5ef6b42b0099f50f4f85b=
b27
      failing since 10 days (last pass: gpio-v5.7-3-2-gcdf59728a3cd, first =
fail: v5.8-rc1-2-g861254d82649) =20
