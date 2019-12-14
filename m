Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55D0811F026
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Dec 2019 04:26:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726736AbfLND0q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Dec 2019 22:26:46 -0500
Received: from mail-wr1-f41.google.com ([209.85.221.41]:34004 "EHLO
        mail-wr1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726683AbfLND0q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Dec 2019 22:26:46 -0500
Received: by mail-wr1-f41.google.com with SMTP id t2so880302wrr.1
        for <linux-gpio@vger.kernel.org>; Fri, 13 Dec 2019 19:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=zl0l32LLwHpe8wwuSCYuAMC5eZ3MsLnrRsERXYSqEMs=;
        b=gGY6YsEEHkLkAwjzEjp4moSEPNi5xaiwKSU7OYr7bi5NML4ckT4+wz0Zd/nkQuXJOD
         6sb3xGpKzOc1JigUSOUxHuI50nlGAMLxfhR7+YZwfAIahHJdUX0aXIIXKVQH0NTagLLs
         luEj4c6hdxnJNN6EVQB8eJo9yGorIrT2kEfw21pLoHZYg6NRtzICV61AhNTVojVO9OOs
         QcGGk1yv3oZQVN2TaLp9wuHWkSRUhe9RYprxdhoOG+WGog3EykBLyVpX/2L2sAGs7NIG
         +X0Q7DzegPXX8SmFvm1G7XYwRb/9m11U6eSp4uLshYbPzCalBjNZSZEwN29eMzVH61FU
         p91Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=zl0l32LLwHpe8wwuSCYuAMC5eZ3MsLnrRsERXYSqEMs=;
        b=ZJDuYZS7SrIS0Wzu9mNeisUbmffwBM+zy6GctFwLE+fMZKuoByTfd8qaTWkB2Ure+6
         8xMClhRPvLEimvV511herh2c+Ya3S4vqwtHs15mHfkSyRFeNF8hizhQx0Y74uIFQ1hMQ
         /T/xw/QZWtkvybjQx0/vpFuZbLz58jxmb/W3DHqMWwRreg67hlNNpLebhU9zP9n5Qp/a
         boImcv+ZYF6gV2HZozIsFuckE+CYYwGgqcMcvKNdpgPjIRFRIvIJeMGzc2x9Tf/Nv5VQ
         Xw9OWnyLF4OLdHwXvZ6PINhp6lJL7ZjBvXm5/Lh3s30GDzy3tG0u2/ckk7k/c3d/cdSj
         v/4g==
X-Gm-Message-State: APjAAAXJh793FMt5f61Oxtwa+TNrGOy/6I4FxFuRIpfpVusd3lH7Kb0w
        mTwMVgK5jvgtEHV9s8RDJ0eeR9GyVqgw0A==
X-Google-Smtp-Source: APXvYqzRxqZiyeS2P/Fkozlu88K6GmIPaFyRMXu/erwLz6bbdFraf5PMjjzZmAxbb/lTA7v32ZjKRw==
X-Received: by 2002:adf:de84:: with SMTP id w4mr15586753wrl.97.1576294004481;
        Fri, 13 Dec 2019 19:26:44 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id i11sm12479840wrs.10.2019.12.13.19.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2019 19:26:44 -0800 (PST)
Message-ID: <5df45674.1c69fb81.86837.0bea@mx.google.com>
Date:   Fri, 13 Dec 2019 19:26:44 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.5-rc1-10-g279b1fed09ea
X-Kernelci-Tree: linusw
X-Kernelci-Branch: fixes
Subject: linusw/fixes boot: 42 boots: 0 failed,
 42 passed (v5.5-rc1-10-g279b1fed09ea)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes boot: 42 boots: 0 failed, 42 passed (v5.5-rc1-10-g279b1fed09ea)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/fixes/ke=
rnel/v5.5-rc1-10-g279b1fed09ea/
Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/v=
5.5-rc1-10-g279b1fed09ea/

Tree: linusw
Branch: fixes
Git Describe: v5.5-rc1-10-g279b1fed09ea
Git Commit: 279b1fed09eaa921379c6f1e3347e4161ef5f76a
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 42 unique boards, 13 SoC families, 3 builds out of 5

---
For more info write to <info@kernelci.org>
