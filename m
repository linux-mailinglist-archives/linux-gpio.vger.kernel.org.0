Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAC92A3CC4
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2019 19:05:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727883AbfH3RFd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Aug 2019 13:05:33 -0400
Received: from mail-wr1-f46.google.com ([209.85.221.46]:34312 "EHLO
        mail-wr1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726183AbfH3RFc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Aug 2019 13:05:32 -0400
Received: by mail-wr1-f46.google.com with SMTP id s18so7727581wrn.1
        for <linux-gpio@vger.kernel.org>; Fri, 30 Aug 2019 10:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=mwt/AjEPNqHze2klhCNKdhNgjZ92CcEAOS6C5dpni/g=;
        b=vDeTgVcDadES9FE2r9yR2lw/E+7QynhPhW3B53H/ddcv2sxDgTgKyQYsskhcQh6ynA
         ZxMqrosXtiNsJPVRRM5+f/HkkVZkRyQFebuifhbF+KHQULAXNkZoz0txCH/jzRuFvAV4
         6+Uc4GBcNvXtdf6SZfSLpU6WakxMtYn1IVd3hxA7Bm4+V1wh26KtQngXlM6t7an0Wg6O
         WMQmyfK5NIThf4P5mXq9Vtcr+QGiticohrRVh40fiCrk+5nbCpOd1g3YCSDnfNHxlA4N
         Eki66m9pkuI14wEHqonHjXttX2YZxxNNSY5FT5R/enBUHrV6SrmAlWH+xE19oD8oUS0N
         /NBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=mwt/AjEPNqHze2klhCNKdhNgjZ92CcEAOS6C5dpni/g=;
        b=EOPceU4kBYZorbqFlEZlRjzVsW1ZxqR9Q0381AgIbz970u/eJZHKDlBROywcR4F9ba
         qMXGBohTu/wj5BlG5aWpsDOAFOjeIpTEbHZepvPtYz6+96Rs36rwU7fhl5XjB13ovkm2
         pOz+RJnFrm09clznn0zCvwDMCNNeOegSAAMbwgcj3dXYQ91HaTFLK+xX2QasYEYBeAaL
         iaSH9XH3CWsM0f3bBJ3Shd5le7B50jv3+TkrjnTAxFTTe+F1D6vG3Etv0x5whwr+5fy8
         q9zklH7bRpFHqAum73dIRSZv2KI4X40jE3pU7y0rNa89rDgK5xY48j+6YhCdlxQCpnMR
         g+mg==
X-Gm-Message-State: APjAAAVJQMK40eijQzvCza0qteeA7K7RP8/4BCoGS+D/CNg/Jk8s/exL
        tu6BPioGy7bT3k20j37S9L0ejr6b8Hylsw==
X-Google-Smtp-Source: APXvYqwYIuQytkMcZuZS11/DWvEneXJFSY6dnkSzfoKMvB52otE6Fa02mIjExsg2cim7cvEgOWug0A==
X-Received: by 2002:adf:c594:: with SMTP id m20mr21112059wrg.126.1567184731039;
        Fri, 30 Aug 2019 10:05:31 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id e15sm824411wru.93.2019.08.30.10.05.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Aug 2019 10:05:30 -0700 (PDT)
Message-ID: <5d69575a.1c69fb81.7feac.3e45@mx.google.com>
Date:   Fri, 30 Aug 2019 10:05:30 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc6-51-g1fc4f3c962b7
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: for-next
Subject: linusw/for-next boot: 45 boots: 0 failed,
 45 passed (v5.3-rc6-51-g1fc4f3c962b7)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next boot: 45 boots: 0 failed, 45 passed (v5.3-rc6-51-g1fc4f3c96=
2b7)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/v5.3-rc6-51-g1fc4f3c962b7/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.3-rc6-51-g1fc4f3c962b7/

Tree: linusw
Branch: for-next
Git Describe: v5.3-rc6-51-g1fc4f3c962b7
Git Commit: 1fc4f3c962b7ecbb43ecc49f0ff6da1add83dc6c
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 38 unique boards, 15 SoC families, 3 builds out of 6

---
For more info write to <info@kernelci.org>
