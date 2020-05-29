Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0422F1E7554
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2020 07:26:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725355AbgE2F00 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 May 2020 01:26:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725308AbgE2F0Z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 May 2020 01:26:25 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7E67C08C5C6
        for <linux-gpio@vger.kernel.org>; Thu, 28 May 2020 22:26:25 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id e11so709802pfn.3
        for <linux-gpio@vger.kernel.org>; Thu, 28 May 2020 22:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=8NH54OZwFPj/x2T3Cu51Sh7sFTAr1gG4ZWXotEFlpI0=;
        b=qe1DjvWr8xNI9sOPeWIYD3M5ZMbdqZgEJkX5tuadwJWF1xbRr7IrOQDDYaQmGNiHMd
         bW3p7V0aO6O+f6z7ZUS+YH7bvql5XAW9iL/YIk5ekmW88Xfwh1CDN/jX7RTkAm2Ji1Aj
         5uV+TNfF3ljuZUY6ZNeOYKOI3DQ5sIHKJgWBRa9/EXMU9DTVUDY0Lcm6PlHY9Re/4rY6
         KbIXu7QnOTqixXHs66GO+/6R+ChBOC1c5VKicIaRGOp7ix8BXX50NZLSHWxpSzJtPBtb
         AkfVPgOFpRn43C9go/ri+WwYxbUGvbDWcUYv2+WQFhwBOZJaBDYnSo0ofwST1DqOEbvj
         NULA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=8NH54OZwFPj/x2T3Cu51Sh7sFTAr1gG4ZWXotEFlpI0=;
        b=qJEZoHDqu05Johafmaf3zDKM+NLQO2x73RO0qWe4KqluiiNLskNTklrPtHoygOGbrR
         CFEQUS9BCmy6iCKd29Ko9NFWiDGlfXkqTdgjP+ko63L38wa9ut3Wr2TIc3igAAwUH03/
         EM+ArPqiGXgIFsrFMCXt8cNgrT2wAxNbAjxh5YWGW92IPTik4bah7+w1MaAYe7oJ5/8k
         5mn2Gf4dFVCU55PPrcth3FZehbx2MEc8wyAFw7ufeIk8/R9GXhjQornl2CdvIgPvbX7R
         NnmKhaB/YgWF0aEONZSqI+grDpuloph4U708ZJTzPSZawxarXNsn4ugQUeLPCr5+nPgV
         1iFA==
X-Gm-Message-State: AOAM530q6oafR0A4jJfkJxEMqTq9Zuj9i6nUOO6C+rXnK5Py8Oxh+Jdx
        xhYDUyek5xLX970E3Q8tJYkAlRiCxZg=
X-Google-Smtp-Source: ABdhPJzpyU0PbAWGcCrJH1lHGp/pzJGOB8OhNgorZO+ca30VVf1ZSZBPd7KbbOhFH/6J0nzB1uoXiA==
X-Received: by 2002:a63:5d55:: with SMTP id o21mr6559313pgm.58.1590729985002;
        Thu, 28 May 2020 22:26:25 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id gg8sm6915436pjb.39.2020.05.28.22.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 22:26:24 -0700 (PDT)
Message-ID: <5ed09d00.1c69fb81.9fd25.8955@mx.google.com>
Date:   Thu, 28 May 2020 22:26:24 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: fixes
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.7-rc6-9-g44ca08d53c6b
Subject: linusw/fixes boot: 53 boots: 1 failed,
 52 passed (v5.7-rc6-9-g44ca08d53c6b)
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
https://kernelci.org/test/job/linusw/branch/fixes/kernel/v5.7-rc6-9-g44ca08=
d53c6b/plan/baseline/

---------------------------------------------------------------------------=
----

linusw/fixes boot: 53 boots: 1 failed, 52 passed (v5.7-rc6-9-g44ca08d53c6b)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/fixes/ke=
rnel/v5.7-rc6-9-g44ca08d53c6b/
Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/v=
5.7-rc6-9-g44ca08d53c6b/

Tree: linusw
Branch: fixes
Git Describe: v5.7-rc6-9-g44ca08d53c6b
Git Commit: 44ca08d53c6b0b76616050f1c44168b0f551bbb5
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 47 unique boards, 15 SoC families, 2 builds out of 5

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
