Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3AE47B768
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2019 03:08:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727171AbfGaBIE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jul 2019 21:08:04 -0400
Received: from mail-wm1-f42.google.com ([209.85.128.42]:55888 "EHLO
        mail-wm1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727136AbfGaBID (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jul 2019 21:08:03 -0400
Received: by mail-wm1-f42.google.com with SMTP id a15so58950335wmj.5
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jul 2019 18:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=43AiGz4AMJzetbprrGdLTZpd6ANNZt9nzEbCTt85zxo=;
        b=QWr18Oge80os7Bqc8NGGK2C8dJCqS5gOZazQZSi2oJTm3Bms9KpMKVcwxTJbnvEb1d
         rkOUPOIHJQky8hQvv29Sh4jDen8M58ZRkHGr/kknrie6G2SCu3YV1LMZWL10hbfVa/iE
         k9b8i+1taPfL+bX3G9bhFZ/MJPnOBF5nIVooOXmmPnYJSNjYU+yfrW6hphcuNXRCOwHc
         tZV2Xgp+ohV04fRAUYJTEFF7nc9HRrmelOL0ZrWjXbPgkiK6tvImG60Z9vMwEY4u3Nve
         4mSTUYr+hz9BYuz0aoQy/97n4eRHzpr4/tDx03hbTPkdCtemfEWcp76WWgu1DrDYQ45k
         9r3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=43AiGz4AMJzetbprrGdLTZpd6ANNZt9nzEbCTt85zxo=;
        b=tCkusjQBZkrcIsAUnqHbYKoHKcRRrCGc64izykymyy4nhVuwovtk+SdlxBi9rEneAv
         iMQej4jmRzJmTKjv1klbUiLZVPokya3RKmXS3GbUeWeTZRHd5ygw+FWygsw0/AWJH9Ce
         OUDEav4JG36L+Vj0I9+v/SCx7p5NJq/9g/vvcHwzCObErIxTes9+wm5TjBcFFu+Qtlgv
         QUETGXdDkszyJ2HfCzQ3SqS589HfeqTUXtbtRoxcoAPI/OZIk9QG9k1bOlt6jMpJKRUu
         l9I8osJBDLVjMjAmkvl3z1C4jvwGdSLav3Ton2iR0XuiLuGxYx2XsI2urNtZacrgaTWn
         UsBQ==
X-Gm-Message-State: APjAAAVg8wLSudbOvCx2fgo06/bR8rQGo43r1ZRlb9bGPnYgcobkwThz
        CHKbht/bZFMFOMYywZpAbQBLiJTzbLM=
X-Google-Smtp-Source: APXvYqw5tHicBs3n1Fw4Du/kEQM9cpSBeVmfOld6yzFOT3NAFl9a4FrUUWTdWq3IzeI9XCp8l7TYMA==
X-Received: by 2002:a05:600c:2245:: with SMTP id a5mr106695666wmm.121.1564535281952;
        Tue, 30 Jul 2019 18:08:01 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id v204sm71307026wma.20.2019.07.30.18.08.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Jul 2019 18:08:01 -0700 (PDT)
Message-ID: <5d40e9f1.1c69fb81.d637e.d06f@mx.google.com>
Date:   Tue, 30 Jul 2019 18:08:01 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.3-rc1-13-gfb9152b494a9
X-Kernelci-Branch: for-next
X-Kernelci-Report-Type: boot
Subject: linusw/for-next boot: 42 boots: 1 failed,
 41 passed (v5.3-rc1-13-gfb9152b494a9)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next boot: 42 boots: 1 failed, 41 passed (v5.3-rc1-13-gfb9152b49=
4a9)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/v5.3-rc1-13-gfb9152b494a9/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.3-rc1-13-gfb9152b494a9/

Tree: linusw
Branch: for-next
Git Describe: v5.3-rc1-13-gfb9152b494a9
Git Commit: fb9152b494a9bf9beec11a64b1f796d4e8755d07
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 31 unique boards, 14 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          apq8016-sbc:
              lab-mhart: failing since 1 day (last pass: v5.2-10813-g88785b=
7fa74a - first fail: v5.3-rc1-10-gd2a561ae1961)

Boot Failure Detected:

arm64:
    defconfig:
        gcc-8:
            apq8016-sbc: 1 failed lab

---
For more info write to <info@kernelci.org>
