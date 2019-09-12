Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24E43B066C
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Sep 2019 03:25:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728094AbfILBZN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Sep 2019 21:25:13 -0400
Received: from mail-wm1-f54.google.com ([209.85.128.54]:36325 "EHLO
        mail-wm1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727576AbfILBZN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Sep 2019 21:25:13 -0400
Received: by mail-wm1-f54.google.com with SMTP id t3so1513942wmj.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Sep 2019 18:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=jpXBWR2RdjD11WwfZiHB+GBQVCyldtChdWsWlI+kd/E=;
        b=U7XUBV05BIVIenUFRqhlPcaO2WxVvMdzqEQgrYsh8A2EHCjGRd0CCFBpTKcfPGYZlv
         PV+FlOK4RfysJ+lVBTSiSgs5qP036fvvjdxSq/0psS+WL62usIl+o8vu9WTrfWJTi0ix
         +aILRhVmdpiEOt7gXWK1jloeGQ7LZ5ghqAWO7ZJB741SZXAdUEPVxEVAHp6YKPQGBnX8
         Ho1xTMRvwmjmacyCsY9/FGh7SDGGC2a8WehcruLlXL6KYvV3bCq4egkKPlQfi3e7omK0
         Q7aEUeGFbB/WzcWSNEqTmWtP4Cd0+M6PSJIub08W/HlER5i/gACGQLDOCVP33WYrRLgB
         5pyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=jpXBWR2RdjD11WwfZiHB+GBQVCyldtChdWsWlI+kd/E=;
        b=S2w9rWF9xCtpKyoLhUqYDDlvb5CKYKdXiIp+EyV+MjP4qWUJVlAyL3mYG1fqCwOLjg
         ahRoD36iXAnxS88rd1YgA+biK2rvM5Wbjgpp9ZEeVcXyJpHvjUXEpLYtVrpJjkCNFEDq
         XZQGiI4Q+5LwMtiWDJaoXAnXcQMJ7M2gyZpOFlIyfkY8FndQhIkZ8I4J7QRDp5KzmOOe
         7VQuoGAPHXfXNbl/VvbSMVeBT1uXG0wa4+OfH6D33J0ANQzKEHgwFjyDcyoksZfw7MsJ
         euaW0tELhPmUfjqi/7XGewHFKW5OZlFr1WxavUjVu5JdDintVosug+uzUvwZRdg+wSXn
         wVmg==
X-Gm-Message-State: APjAAAWogsUEzY9v49dqKgNPGc1LT0IS2eBsUBOHEohmD4pSACQJIaRu
        W/mROR8QEQNjZ1d1aTv2To7kH0JJ2oh5lg==
X-Google-Smtp-Source: APXvYqyuD/hpjAwL5j9IgpBXumjiSXGPqSDcnWTrqG61g2M+uAj7rJPcWawWpm9Em3rA5pFdt+DUnQ==
X-Received: by 2002:a05:600c:29a:: with SMTP id 26mr6363026wmk.8.1568251511000;
        Wed, 11 Sep 2019 18:25:11 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id y3sm724516wmg.2.2019.09.11.18.25.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Sep 2019 18:25:10 -0700 (PDT)
Message-ID: <5d799e76.1c69fb81.763c8.331c@mx.google.com>
Date:   Wed, 11 Sep 2019 18:25:10 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc7-83-g2efc6bfadb0b
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: devel
Subject: linusw/devel boot: 53 boots: 1 failed,
 52 passed (v5.3-rc7-83-g2efc6bfadb0b)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel boot: 53 boots: 1 failed, 52 passed (v5.3-rc7-83-g2efc6bfadb0b)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/devel/ke=
rnel/v5.3-rc7-83-g2efc6bfadb0b/
Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.3-rc7-83-g2efc6bfadb0b/

Tree: linusw
Branch: devel
Git Describe: v5.3-rc7-83-g2efc6bfadb0b
Git Commit: 2efc6bfadb0b9c873e11ab8da37f4f69aa215d25
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 42 unique boards, 15 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          meson-gxbb-p200:
              lab-baylibre: new failure (last pass: v5.3-rc7-77-gab4a85534c=
3e)

Boot Failure Detected:

arm64:
    defconfig:
        gcc-8:
            meson-gxbb-p200: 1 failed lab

---
For more info write to <info@kernelci.org>
