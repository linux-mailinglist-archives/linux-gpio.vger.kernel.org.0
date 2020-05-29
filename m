Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A8EF1E745C
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2020 06:12:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727826AbgE2EMA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 May 2020 00:12:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725936AbgE2EL7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 May 2020 00:11:59 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CE7DC08C5C6
        for <linux-gpio@vger.kernel.org>; Thu, 28 May 2020 21:11:58 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id fs4so593540pjb.5
        for <linux-gpio@vger.kernel.org>; Thu, 28 May 2020 21:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=J7ImRl7Vs3JtPj07EcmPRil5eE/57gLS85fyWRQc6QQ=;
        b=ogY93o5sWs+eycYwKB4hglBTYrf12Dn/5RM80xy1bOsZswGeu4rZ5FnVQ43ohkEG9W
         UGR/I+66xryVZhSBLi7YP4J5tXLyFDEuHf4Jzc3LWoRICVQW3rEmgNHZGD2S6DZIi0Qv
         t/FxOj20HQ8w1naciU9o9NQ6R4rWVp1cjNwM+CsohjH0HFzC11yN+vJk9/enuSJzs/+P
         ygebn3hicn3bo4frhulJHryslm4emjwB5OcDDGQELN6QDAIfdtDARZrHEgzab7NuXkFE
         sK8FYgaIqHbVpTzJCZuRKuJnIlWqvjE2mpXE7ErI8D5NLsIgFZSSKq272tpFt3AEcqVl
         E8yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=J7ImRl7Vs3JtPj07EcmPRil5eE/57gLS85fyWRQc6QQ=;
        b=HSBAv0ScI+atV+0JYU/ufaCB3qbHLk1DniO3vjmSZuMqKlPSEATTq3obBFxu1nWxaO
         nSO9tZ5wPBrUAsVYqOq4oYviJJC2F1lWnly8DdV6xpDqCcgModPpdI9TYgKh6FN9vPW3
         Itzv26ctbKtvyKxNrUc3MPVBk7VASJ7mp7F7qeJzM4eoR2H9j9B0iSKBTx20BIKZYwn4
         hFCaXLD2N+pW+i70KEtrpgrf286igt3XSrBlorcnk3lABbqXwGYrX6aFTwCKfohoN0ze
         LSQfk8pCo3/tafxKRPG2cIf2XZD6bxac77wDGALFOQtwS39uJEtpb9hij9O5VzEVfdJg
         7K0w==
X-Gm-Message-State: AOAM532Ru+nLIhVbGvAEXwSi/JxNpIS5yEAGgIHBgaYBvITgCGZ7RZRf
        9hkqqnL14FhdAyiE+j52f2DtvTG5cIE=
X-Google-Smtp-Source: ABdhPJwzofbe2G0wn3CtHIkWNnMODEDqNzxJWbHuLx4J7FOxeVgmoGCNbV5ULZtqFQVXB01xDRB7dA==
X-Received: by 2002:a17:902:d883:: with SMTP id b3mr6949815plz.133.1590725517608;
        Thu, 28 May 2020 21:11:57 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id m43sm6322104pje.16.2020.05.28.21.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 21:11:56 -0700 (PDT)
Message-ID: <5ed08b8c.1c69fb81.7d13.37e7@mx.google.com>
Date:   Thu, 28 May 2020 21:11:56 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.7-rc7-88-gc193ca5188d4
Subject: linusw/for-next boot: 55 boots: 1 failed,
 54 passed (v5.7-rc7-88-gc193ca5188d4)
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
https://kernelci.org/test/job/linusw/branch/for-next/kernel/v5.7-rc7-88-gc1=
93ca5188d4/plan/baseline/

---------------------------------------------------------------------------=
----

linusw/for-next boot: 55 boots: 1 failed, 54 passed (v5.7-rc7-88-gc193ca518=
8d4)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/v5.7-rc7-88-gc193ca5188d4/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.7-rc7-88-gc193ca5188d4/

Tree: linusw
Branch: for-next
Git Describe: v5.7-rc7-88-gc193ca5188d4
Git Commit: c193ca5188d4691abb51b3026502f4074b727de7
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 48 unique boards, 15 SoC families, 3 builds out of 5

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 107 days (last pass: gpio-v5.5-4=
-45-gd18fddff061d - first fail: v5.6-rc1-12-g612e35e76ec8)

Boot Failure Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

---
For more info write to <info@kernelci.org>
