Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1007B1E8570
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2020 19:43:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725601AbgE2Rnb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 May 2020 13:43:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726970AbgE2Rna (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 May 2020 13:43:30 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 522A6C03E969
        for <linux-gpio@vger.kernel.org>; Fri, 29 May 2020 10:43:30 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id bg4so1452155plb.3
        for <linux-gpio@vger.kernel.org>; Fri, 29 May 2020 10:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=zagCnDrR0CDfwYHEPVYkDhMZXywM3zHjgVn1zJeY3dw=;
        b=tCjz98x6s9us0JnqGRSRsc6c4B2S1OCWS6jlbzWsRAVmhguRGOADlFnkEvazxyNymI
         dxXAVLE/zACJe59C1gKpjEdnJuh01l3J+qaXvCnzZc89a4veeRj7NJoRotP20tzqNmBY
         dd60vx3F18eXmhP5XGRd4te6cw9HTFj9pA/Ephc7BmX/btUVW+qjQzhAekVDRngr/I8v
         pojecPavAIKnkmihqMiWkFGCfpACzyaQ33SEiSVITHjxLcRN6E0qhY8d1pCE7hHXvEhA
         iVkRYpbGWRi5KhXh0ftGHYvjrBt88xC/3VzW/eVnmL4F1VgDhWJzZygN5NvMuCpRHnEP
         SFNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=zagCnDrR0CDfwYHEPVYkDhMZXywM3zHjgVn1zJeY3dw=;
        b=rqOZ/TnGbnB07WpGAHhY2PmTbRPClpNfnrucLcBJbwpytOW9HWmSoq438f+rsxZhWC
         7rvCh9xDhSh14cW9+cNKIBkN3D9rQvTp5Ap01enpNQP8oumCnkN3K8VWrvCx1BFpGZSh
         owT0NnSFpqN7SGF34JGhuI/oDzAwXfRz5vhnPGSz8Qiker/iLA7/sdnWSAkjkRsSxJL1
         T3DT9N3XItlItxx3Yh3mvrJib+nx4c/ZgzySc5phRMM05gUEJDRV/Bq7gi2i7W0uyGdq
         WUgx6in/5oHUEyg2S81j2bjbc42+m7HUy7vx57r9iIqORZw4lXehSlgxfH/IXwrGVaUZ
         uNCA==
X-Gm-Message-State: AOAM531dJA7jhm/log6PVXxeQxzHODFWFpZOSAuco5DKYVmAMXtyRMuT
        hKJnaLYP9JN2/RSwr9kr+ogkmpm9wAc=
X-Google-Smtp-Source: ABdhPJy/D8uXO/e9UcI+S0gZTUMf41FotsragL3KbR8qTXg8O5gB7ilDoM5kiNXT8s+lDTTLlzeBnA==
X-Received: by 2002:a17:90a:2222:: with SMTP id c31mr8225180pje.200.1590774209567;
        Fri, 29 May 2020 10:43:29 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id k14sm81740pjm.34.2020.05.29.10.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 10:43:28 -0700 (PDT)
Message-ID: <5ed149c0.1c69fb81.569a3.1af8@mx.google.com>
Date:   Fri, 29 May 2020 10:43:28 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: fixes
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.7-rc6-9-ge9bdf7e655b9
Subject: linusw/fixes boot: 56 boots: 1 failed,
 55 passed (v5.7-rc6-9-ge9bdf7e655b9)
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
https://kernelci.org/test/job/linusw/branch/fixes/kernel/v5.7-rc6-9-ge9bdf7=
e655b9/plan/baseline/

---------------------------------------------------------------------------=
----

linusw/fixes boot: 56 boots: 1 failed, 55 passed (v5.7-rc6-9-ge9bdf7e655b9)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/fixes/ke=
rnel/v5.7-rc6-9-ge9bdf7e655b9/
Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/v=
5.7-rc6-9-ge9bdf7e655b9/

Tree: linusw
Branch: fixes
Git Describe: v5.7-rc6-9-ge9bdf7e655b9
Git Commit: e9bdf7e655b9ee81ee912fae1d59df48ce7311b6
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 49 unique boards, 14 SoC families, 2 builds out of 5

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 108 days (last pass: gpio-v5.5-4=
 - first fail: v5.6-rc1-10-ga924eae75106)

Boot Failure Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

---
For more info write to <info@kernelci.org>
