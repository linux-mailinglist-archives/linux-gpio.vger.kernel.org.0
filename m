Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95D442DA50C
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Dec 2020 01:49:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726101AbgLOAtM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Dec 2020 19:49:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725956AbgLOAtL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Dec 2020 19:49:11 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C711EC061793
        for <linux-gpio@vger.kernel.org>; Mon, 14 Dec 2020 16:48:31 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id w5so13290064pgj.3
        for <linux-gpio@vger.kernel.org>; Mon, 14 Dec 2020 16:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=e0myrLJcQz7caqND4vbM9q9BCltIaFplPQDLKlpy3yU=;
        b=zF0syr71iuUHGNgv1mXYN17AaS8L8yV7twus9+LtwXNA77xBmjOQUqze22+ae9NQUA
         wIsaPQUCqKE8fqNOBd9jUjolzdDh9MLTmqp9V7K5glqGvQxA8AJ6rFmV6oi8wZ8QDOEw
         xEEQaKWzDOmxr48Ck6cCHJKZQjJqyLrDdXg/LoZAt8lV9GRyM+ZXanerXOaidABL71qp
         aLESCFhf+wQDoR84C/XI5UlDzCHFOSZFi9iR/ZkjFX/EFOUjZKJbJFkacuERixlREp/X
         bTLyHr314W97EknMBtEJ8ylWb+elZqbGDjf/jT/yRGOML1NhO6dV89JZ3VdjdNPaLXB9
         /h+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=e0myrLJcQz7caqND4vbM9q9BCltIaFplPQDLKlpy3yU=;
        b=GeMPS1r8u4sw3LpyogGfTBW2pURfPA6gednuf+3G1OQt4NiBhEpgklq6RVEY6PHksS
         muxJrASNN3MjDZvxe0dKQlwOge43xdfhpPBmMkd3aTwAY7CmtPdwC6RSJ1iKxvjhhuNm
         2ZUQhdptMJd14zSQLsDOuk9Zy6VY2NBKZo1R2VpKdudC44dx1BygiFzSRNRPrDHMbZGH
         rwKpEUsIFpHVOjr/RkR2jI3NpuTpwZ8dfurGlLW+b6OEibWShXuCbTwMZe9T2ubwtoLH
         Yfs9MBw75Civ9wZlQ2OA2QVrihy1FQR2j22ZaG6XyIcz8A5iJ0JkUohNrBqIIUIs+hZR
         TvDA==
X-Gm-Message-State: AOAM531fyMCQQpebEKk4fIyYZT94nmT9d7sgzmqERYK8QTnnbaDDIapG
        rsgU3BMys9G43Agt+YF/qPGdkfkZIyKs3w==
X-Google-Smtp-Source: ABdhPJypr8TLSghXnYrUHpdiP7HnvdF3Ze7lRQYBtpYBtfhR0b0ghXgTla6AP/A/PvzDUbTx0q6PnA==
X-Received: by 2002:a63:c20e:: with SMTP id b14mr7568460pgd.363.1607993311080;
        Mon, 14 Dec 2020 16:48:31 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w131sm22002221pfc.46.2020.12.14.16.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 16:48:30 -0800 (PST)
Message-ID: <5fd807de.1c69fb81.bbcf9.d91c@mx.google.com>
Date:   Mon, 14 Dec 2020 16:48:30 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.10-rc4-93-ga2e5f9277f66
X-Kernelci-Report-Type: test
Subject: linusw/for-next baseline: 74 runs,
 1 regressions (v5.10-rc4-93-ga2e5f9277f66)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next baseline: 74 runs, 1 regressions (v5.10-rc4-93-ga2e5f9277f6=
6)

Regressions Summary
-------------------

platform   | arch  | lab     | compiler | defconfig | regressions
-----------+-------+---------+----------+-----------+------------
imx8mp-evk | arm64 | lab-nxp | gcc-8    | defconfig | 1          =


  Details:  https://kernelci.org/test/job/linusw/branch/for-next/kernel/v5.=
10-rc4-93-ga2e5f9277f66/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   for-next
  Describe: v5.10-rc4-93-ga2e5f9277f66
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      a2e5f9277f66a89e2237d8d7cf0e99a819304f58 =



Test Regressions
---------------- =



platform   | arch  | lab     | compiler | defconfig | regressions
-----------+-------+---------+----------+-----------+------------
imx8mp-evk | arm64 | lab-nxp | gcc-8    | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd7fec754b3a1bca8c94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/v5.10-rc4-93-g=
a2e5f9277f66/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/v5.10-rc4-93-g=
a2e5f9277f66/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd7fec754b3a1bca8c94=
cba
        failing since 0 day (last pass: v5.10-rc6-93-gb8fbfef1595c, first f=
ail: v5.10-rc4-91-g65efb43ac94b) =

 =20
