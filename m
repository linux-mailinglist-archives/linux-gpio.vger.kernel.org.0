Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1721A1956E7
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2020 13:14:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbgC0MO0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Mar 2020 08:14:26 -0400
Received: from mail-pl1-f182.google.com ([209.85.214.182]:37185 "EHLO
        mail-pl1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726379AbgC0MO0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Mar 2020 08:14:26 -0400
Received: by mail-pl1-f182.google.com with SMTP id x1so3385993plm.4
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2020 05:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=KLTlRoEH0CuOQS2LExETrPHh3D3S9E7CS2LaWmIntTo=;
        b=bHJNFULjX7kcMHUlXdXh5J5fvb5G/evcxBDgC0d2cfofOsTU77StWapFD2my94QAU/
         WH8Ga3Bhg3WYUETH2HOu9cAsSOd4a3INYHdwhGtcTzNKgl9EshIYd3DS9oerNMno5E9T
         xZWa5+twtDVTO25Rvn6dEhZ/ucAlcwIkMyqBcUQAsNv4PGDXXgBop1jw2dOtT+jBlFpt
         VFz6oyJ/L4KQYfKeu0SlU+bJ/oFD6eAKcxyQ55oAIY+0uzo1sNvjpl/kMPUJlyXmT9s6
         41jVu/jRsfOEJS/fdgFFURFj2qh+fugTxk0EXaRhLQ7yMRFGokNCl79XLgUnbN9Iw5UB
         gbtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=KLTlRoEH0CuOQS2LExETrPHh3D3S9E7CS2LaWmIntTo=;
        b=dEj5ktwAJ1NCvIVfYiy1ng3g1u9/JbGp0tqGUA0+88jVsVYoHgltfOS+utwPzscrIc
         EqHSt5f7k+xwNAY5IIH2X7lLRiv6ZhziRGvyznUDddTylLKfK2aBH3ZSvmY/tpINfId/
         D0GgDEipwtZQVjTpBiuki4xRNwb92gxuydS/4FrXaCoUIm0+z5He6EpT6IXLdyWoinnQ
         DBvL1bam3SGfsvG5CznJwoArQPGZXumV3lEBYXyWSxNmB35lFUHp62Mfoijs9qGqDaOy
         6L7QbmxtvkMo4MXRKsqc8SYSmRerN+AJ0g3G1A2Rq7k63A3Ba7asb3m2ByhQhMiUpp+j
         PAJw==
X-Gm-Message-State: ANhLgQ0n/bnSQ0BcR1mfH4q7Lv2vJry5BidgAlfszygSA/f0njaP36dU
        otrkNiZT8IuOEYOcWPPhotQR1CgNz2Y=
X-Google-Smtp-Source: ADFU+vsyKl0+EnJwQyYWx/28TMzXjjJA7N2vUUlxUqPORRm5q9xOWbUFjNwEBy2clDZ8NcD+kwZwCA==
X-Received: by 2002:a17:902:107:: with SMTP id 7mr12634437plb.302.1585311264844;
        Fri, 27 Mar 2020 05:14:24 -0700 (PDT)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 185sm3957426pfz.119.2020.03.27.05.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 05:14:24 -0700 (PDT)
Message-ID: <5e7dee20.1c69fb81.ac326.0867@mx.google.com>
Date:   Fri, 27 Mar 2020 05:14:24 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.6-rc1-51-gffa91e7ca142
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
Subject: linusw/devel boot: 43 boots: 0 failed,
 43 passed (v5.6-rc1-51-gffa91e7ca142)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel boot: 43 boots: 0 failed, 43 passed (v5.6-rc1-51-gffa91e7ca142)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/devel/ke=
rnel/v5.6-rc1-51-gffa91e7ca142/
Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.6-rc1-51-gffa91e7ca142/

Tree: linusw
Branch: devel
Git Describe: v5.6-rc1-51-gffa91e7ca142
Git Commit: ffa91e7ca1426a89eec1b3101286d82785760767
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 43 unique boards, 12 SoC families, 3 builds out of 6

---
For more info write to <info@kernelci.org>
