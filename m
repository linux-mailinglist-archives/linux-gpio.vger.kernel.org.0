Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F9507D227
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2019 02:08:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727373AbfHAAIX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Jul 2019 20:08:23 -0400
Received: from mail-wr1-f41.google.com ([209.85.221.41]:39861 "EHLO
        mail-wr1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726248AbfHAAIX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Jul 2019 20:08:23 -0400
Received: by mail-wr1-f41.google.com with SMTP id x4so18403451wrt.6
        for <linux-gpio@vger.kernel.org>; Wed, 31 Jul 2019 17:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Skq4fhLoRfpPWNQQDLC3kC9JawhIpdqYtOOan9Eg9lc=;
        b=VAPlZy3iRTOt1jetifgzdb91ve/9ca9NxXcPNjdYUEdZtJK09IHbmiIkhJ4UXW6PeA
         nP/V8qaFM7N+3m7RynmY85lub8SGoIuUUDSg82RMncuSUiPmQ13S7rebCmcm6vChnlSE
         2BYfeYms/AR3PA0s5eHAArkVSDd83Ot689FwQaVcgMKfcn1JTSrxu+kifs5huc/FP5Fp
         QVVj1cuKXVKitZpzKCpnS5CWzMkA+3cyJzQiowNj0Rz2kAUFLgvMQzho+q+DXeiJ5EYs
         zPjorXHaeAYKdnJXw6RNGs2Xx3odFhrWZOtIDQ9jAj8XqnOLeWi5q4Jki3XBk2kR5GoH
         8jHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Skq4fhLoRfpPWNQQDLC3kC9JawhIpdqYtOOan9Eg9lc=;
        b=ZWODrq/j7EMgIYX2PZAIdTAyujgjZvtk6MBkkKQIgQ3J/BekiRPIVV8HKrijcreOX+
         wLn6bSfU0nsquIe2DQ4na4ClINOD3lBOAPbGPATLm0uIqwGGs7unQGRFCR4489Elq44E
         CzgScB/UT4RtUDJUO9kxwa6c4IAtK8YKi96Kkv1ZNr5V82dx256eW3/+gXPI9BYrvsbq
         7bOd4U/7UE+El+WERb7WiDcn//0ArobrzKRhHyM18ZJxtv3YdN6+ofSgWP1cSp5mHPkz
         gO2UWsgvvcfimgymqkep1pG2EA2N6YjHth96ia0k22MHHXXI8NYZvMLO4BJTkcTZuqEB
         a7pA==
X-Gm-Message-State: APjAAAUKwFsJ7nGfWsObnSOOIsB0koQoC0KXQJtj7JDm3eVSg39RGvob
        iTox9GXulRIw4zn8zuKHOIMO9Vz7Vtw=
X-Google-Smtp-Source: APXvYqxq3yiVaDjtKDV5VISerzieq0XxK4DYA+7X6SYeGbF7RyDsgU6ihoekPgQkSsFCpMjAobZZLQ==
X-Received: by 2002:a5d:6911:: with SMTP id t17mr33762721wru.268.1564618101301;
        Wed, 31 Jul 2019 17:08:21 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id s188sm61417767wmf.40.2019.07.31.17.08.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 Jul 2019 17:08:20 -0700 (PDT)
Message-ID: <5d422d74.1c69fb81.dcdd0.f7bb@mx.google.com>
Date:   Wed, 31 Jul 2019 17:08:20 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.3-rc1-14-gc058275cfa13
X-Kernelci-Branch: for-next
X-Kernelci-Report-Type: boot
Subject: linusw/for-next boot: 44 boots: 1 failed,
 43 passed (v5.3-rc1-14-gc058275cfa13)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next boot: 44 boots: 1 failed, 43 passed (v5.3-rc1-14-gc058275cf=
a13)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/v5.3-rc1-14-gc058275cfa13/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.3-rc1-14-gc058275cfa13/

Tree: linusw
Branch: for-next
Git Describe: v5.3-rc1-14-gc058275cfa13
Git Commit: c058275cfa138773636fb944dad64fa799d6d493
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 30 unique boards, 15 SoC families, 3 builds out of 6

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
