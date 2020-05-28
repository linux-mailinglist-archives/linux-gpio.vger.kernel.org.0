Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16EDC1E6622
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2020 17:31:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404319AbgE1Pae (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 May 2020 11:30:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404272AbgE1Pad (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 May 2020 11:30:33 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66C4DC08C5C6
        for <linux-gpio@vger.kernel.org>; Thu, 28 May 2020 08:30:33 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id t8so3241421pju.3
        for <linux-gpio@vger.kernel.org>; Thu, 28 May 2020 08:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=KfCM7RrQZwqDUzjZHg37XhuuMr6EHd3YWb+sTg86QvM=;
        b=kJvMi0xvcYkynrjytlpdvsNLn9KtMGvk2L0iTwRKlzylNyDx8G6GsXNV2PMCxxU0LP
         DhZY8bJwSu6b+DFsGgXIhvUroBzbI+V+RQ70gu/iR6OgkM7inn8NUH2FIRuxclrj3CjF
         K9FMWSdDQCBCwVXGvRSPov+PQyi/ONRTfNng+BPLqT5g+M2aVutTdeZvlHreSMopRouV
         uvnCMnAiD0qtKZt0Wd+3aLnQiK21KybPCnAJvdiUTdE74MgJUGRie+XxDVyJSxTC4Z34
         UvTx6V5L5HYhTb3CiBnQiTQukZp14kHYIVv4dZRgWn+GW0J5OS4rc66/IW+ZJ4QZsxUG
         jqOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=KfCM7RrQZwqDUzjZHg37XhuuMr6EHd3YWb+sTg86QvM=;
        b=V4jbRBSueklBYsY8xuPJ5aLD9csoM8i58MDC2/sWOzB+nNzFlE0Um7aEJIcHzVgklO
         KEZ9OtcWW0afM4HcjO25UBRtL5zUeKaGLDrR1CE3TLzFpOgqPAmf8KfJh1zG1/bcY3hT
         h/UN+OfAixcLDueNDjuP+YMFiq4TBwtIW6va8prIiN9FEE0DUh8ONkNaOprptwSAvyBh
         sKgT9p4boFB3sONsU9i0o90ycKUeHps5M/Nv7FOWqRs6deWe82VZ9MyIfVfOsPepfzc6
         rHDnHzLf6kWnKAoH7+LyvWXr4SfCjmDFfnQVO2f8oSVF9iMWNcwZyMVRB2NfgYoHVKsd
         C5yA==
X-Gm-Message-State: AOAM532u6F4pg15fKx4covRb2Zq6kfviG0+OdwmeYsAigoQx+oicyRJw
        iuPfN1b2+b633YaV2uaERkrJcql1GLk=
X-Google-Smtp-Source: ABdhPJwts1K9AmqMMePg8aark4oOa0nzJdjI4zv54LisUKwZVi/hoV8n72wyR/Vs8yxzr2nrgGglVA==
X-Received: by 2002:a17:902:9a4a:: with SMTP id x10mr4080137plv.343.1590679832434;
        Thu, 28 May 2020 08:30:32 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c123sm4944429pfb.102.2020.05.28.08.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 08:30:31 -0700 (PDT)
Message-ID: <5ecfd917.1c69fb81.ee9a1.b3db@mx.google.com>
Date:   Thu, 28 May 2020 08:30:31 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: fixes
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.7-rc6-8-gad3073bcb903
Subject: linusw/fixes boot: 58 boots: 1 failed,
 57 passed (v5.7-rc6-8-gad3073bcb903)
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
https://kernelci.org/test/job/linusw/branch/fixes/kernel/v5.7-rc6-8-gad3073=
bcb903/plan/baseline/

---------------------------------------------------------------------------=
----

linusw/fixes boot: 58 boots: 1 failed, 57 passed (v5.7-rc6-8-gad3073bcb903)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/fixes/ke=
rnel/v5.7-rc6-8-gad3073bcb903/
Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/v=
5.7-rc6-8-gad3073bcb903/

Tree: linusw
Branch: fixes
Git Describe: v5.7-rc6-8-gad3073bcb903
Git Commit: ad3073bcb903674b11ba3395361f3b94806bb2b6
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 51 unique boards, 15 SoC families, 3 builds out of 5

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 107 days (last pass: gpio-v5.5-4=
 - first fail: v5.6-rc1-10-ga924eae75106)

Boot Failure Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

---
For more info write to <info@kernelci.org>
