Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C54171DDA6C
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2020 00:45:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730639AbgEUWpi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 May 2020 18:45:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730371AbgEUWph (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 May 2020 18:45:37 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8868C061A0E
        for <linux-gpio@vger.kernel.org>; Thu, 21 May 2020 15:45:37 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id k22so3581339pls.10
        for <linux-gpio@vger.kernel.org>; Thu, 21 May 2020 15:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=QkIcOPC0GB6oNHGWraIJ2qR/3aBZKk08Af2FtUJdpyc=;
        b=PWzPOnsnBcpb8ohNB4P1kkYn2qn97Kco0Pfpr3FSQzGX/N7GchRZQD6gNYXMqwTF5N
         zLkmAb9ezY5wjk+JCJU8+Y2lTcrcEGOKpF1L9ztLljxx97gxCMcdNT/zOLKJ1YWHI7xN
         maowLUc815/H/5y51eOXoQlLGz151F07ujFuBjpAUByxgo54RvTLD962b4CK41dL0WS2
         68qlWmreeb+WGjqexdGms15h0GEY3j12+YzG2S4/5QQxuLQrRsXTTaASNpv1XZhmgvNX
         SyYwTxn/THTBSY41ULCnR+NvgNNoCqV99uuu5eA0EEJgsP0Mk0w5ibS0VOp7NcXi568X
         GjcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=QkIcOPC0GB6oNHGWraIJ2qR/3aBZKk08Af2FtUJdpyc=;
        b=bsEmfs+XH+mXz5ft9eqyz3dNGiCG4YupkZe9dBqJxWH+eI+fxsV5/G8hd32o4p5C3O
         1I4Goe4dVPCRwCdF4xcxeOCZbB2WJDZJTZdP+d/w1DksaYVKTngTHx+GvJE8e0kwLEe5
         VKjjYLorzKIcqGPx1zBbohKVTs1ydJdmD9QrK72Fbx43eGBdYaaNnbz2IDJO9FxHzQW7
         TyjL3gHiU8hFYrSqJj8UdZL3a8u5D3gs49vzqeVdCaBzzwD+iBbxJqGX+2qAm9J+yxCB
         dgTfU5DN0NjULYss7Lz7Xk2lZUTdRTdDiA0FjaarLu/L7p9r5DqMxi08ynMTN1N93gq5
         503Q==
X-Gm-Message-State: AOAM5331CEhd6XLjpGvf3FeBnjr9lRrWZvVLJaa34lQnB/FeCh0d6Xlh
        BFWx1Rht8B139ocdUSLAgUxPb5xcU6Q=
X-Google-Smtp-Source: ABdhPJyodzUgBKfZJCQSQBwLiF9sh1pHxreQZyjnKrhJexce37VYTbRfYj7ihg7riKQb1FiGNpERog==
X-Received: by 2002:a17:90b:10f:: with SMTP id p15mr771580pjz.99.1590101136828;
        Thu, 21 May 2020 15:45:36 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z13sm5513136pfj.153.2020.05.21.15.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 15:45:36 -0700 (PDT)
Message-ID: <5ec70490.1c69fb81.e415d.bd59@mx.google.com>
Date:   Thu, 21 May 2020 15:45:36 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.7-rc6-4-ge75dfba311f4
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: fixes
Subject: linusw/fixes boot: 50 boots: 1 failed,
 49 passed (v5.7-rc6-4-ge75dfba311f4)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

******************************************
* WARNING: Boot tests are now deprecated *
******************************************

As kernelci.org is expanding its functional testing capabilities, the conce=
pt
of boot testing is now deprecated.  Boot results are scheduled to be droppe=
d on
*5th June 2020*.  The full schedule for boot tests deprecation is available=
 on
this GitHub issue: https://github.com/kernelci/kernelci-backend/issues/238

The new equivalent is the *baseline* test suite which also runs sanity chec=
ks
using dmesg and bootrr: https://github.com/kernelci/bootrr

See the *baseline results for this kernel revision* on this page:
https://kernelci.org/test/job/linusw/branch/fixes/kernel/v5.7-rc6-4-ge75dfb=
a311f4/plan/baseline/

---------------------------------------------------------------------------=
----

linusw/fixes boot: 50 boots: 1 failed, 49 passed (v5.7-rc6-4-ge75dfba311f4)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/fixes/ke=
rnel/v5.7-rc6-4-ge75dfba311f4/
Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/v=
5.7-rc6-4-ge75dfba311f4/

Tree: linusw
Branch: fixes
Git Describe: v5.7-rc6-4-ge75dfba311f4
Git Commit: e75dfba311f478f1c2bf928284e1949c20594336
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 46 unique boards, 15 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 100 days (last pass: gpio-v5.5-4=
 - first fail: v5.6-rc1-10-ga924eae75106)

Boot Failure Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

---
For more info write to <info@kernelci.org>
