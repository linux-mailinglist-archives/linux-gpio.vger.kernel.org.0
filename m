Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27EBB19A336
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2020 03:16:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731699AbgDABQh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 Mar 2020 21:16:37 -0400
Received: from mail-pf1-f182.google.com ([209.85.210.182]:38207 "EHLO
        mail-pf1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731470AbgDABQh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Mar 2020 21:16:37 -0400
Received: by mail-pf1-f182.google.com with SMTP id c21so10588361pfo.5
        for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2020 18:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=kM/r9m5uOkg+BBNNCeOMLC+O3qYBEcg4ujnI0KYijLs=;
        b=EbALiqS3uY6qiDKufIiPikRkHOGOw/DCt9Il453qHwVG6UAfmnfiMT4XnEbjaJonA5
         nGFh48v65/ZcAYUGlZjfRWJL9qdwPnq5IeyotUX3laADz2iOfffWRmFguHiJV0yNZ3Lf
         7MMxV0gfb/dEUg+1pNG6jVG9mSOo9b97M+zxqZP2lrkGHd+IgKm9Y41ZvjMVVLuVH5L8
         Glb+peKv3tCrMvuGRlrpmGQ/YnBEexbYXa+TNwKPHRHDFnIRgsfqNOemdBN6S+1iTvpU
         puoVqJNztAdfodD8KdtUEbNIkJI5UHA6Z6JhFaWkQihM1aeZN+B7TmwRL/rx7eUq2odo
         5F1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=kM/r9m5uOkg+BBNNCeOMLC+O3qYBEcg4ujnI0KYijLs=;
        b=MFQwAvn0NAHLQgZjuwrIKSkmmFq/di/D1qJIMFVvbmHvDUkGXg87eXLyrpb13EX1lj
         QO6HhmQ1tmkrzk9c4KZZd5CO5avUhMVO8T/1nkjAH9kCPntRmGcBReZmyZzGCe0MZhxD
         9tiDDbO2bvs7/ZsOh1fDvGdp2kNnS4/OUySQSrUfd9tqp+NPuu4/p9ZhrH4gQmQVYdg6
         FZ7U6nmzLYdFbMImAGLaGbO3RoR2VmfnMAArJTlye3qm+b0d8hD2O2CFu5+F+nUgZy0g
         gFvwXYMYsAT+fyIw5hrjTtFv7V6X0rUpLF1labISzxm1SfjtPPMqg2f9FDAyL5oLQGOy
         XmBQ==
X-Gm-Message-State: AGi0PuYEzIRIpCTL/L9DHM1D2orwNxURnvaSrxeRwY3x8rxf3s7+RFnP
        iWTqXCKd0SJxYh99UhFQHoSca9huCcM=
X-Google-Smtp-Source: APiQypKEpRz2FhK8YhHAaQfLBjAEVg3HAc6+BqUI47v/2l3l4XJbQYUDlzfZ0pML8NvkLU1vwKWNMA==
X-Received: by 2002:a63:134e:: with SMTP id 14mr13368723pgt.380.1585703795868;
        Tue, 31 Mar 2020 18:16:35 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 63sm290391pfx.132.2020.03.31.18.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 18:16:35 -0700 (PDT)
Message-ID: <5e83eb73.1c69fb81.afc27.1c5b@mx.google.com>
Date:   Tue, 31 Mar 2020 18:16:35 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.6-rc7-60-ge45ee71ae101
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: linusw
X-Kernelci-Branch: for-next
Subject: linusw/for-next boot: 54 boots: 0 failed,
 54 passed (v5.6-rc7-60-ge45ee71ae101)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next boot: 54 boots: 0 failed, 54 passed (v5.6-rc7-60-ge45ee71ae=
101)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/v5.6-rc7-60-ge45ee71ae101/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.6-rc7-60-ge45ee71ae101/

Tree: linusw
Branch: for-next
Git Describe: v5.6-rc7-60-ge45ee71ae101
Git Commit: e45ee71ae101bd271c3cd951cf66341dc8f504a0
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 48 unique boards, 13 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          am335x-boneblack:
              lab-baylibre: new failure (last pass: v5.6-rc7-58-g89ad556b7f=
96)

arm64:

    defconfig:
        gcc-8:
          meson-gxl-s805x-libretech-ac:
              lab-baylibre: new failure (last pass: v5.6-rc7-58-g89ad556b7f=
96)

---
For more info write to <info@kernelci.org>
