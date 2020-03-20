Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 499B918CBD3
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2020 11:40:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726767AbgCTKkf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Mar 2020 06:40:35 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:43110 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726726AbgCTKkf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Mar 2020 06:40:35 -0400
Received: by mail-pf1-f196.google.com with SMTP id f206so3015760pfa.10
        for <linux-gpio@vger.kernel.org>; Fri, 20 Mar 2020 03:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=QiUxZWwPtf0NrSQG68BSjngMWDwYoz/5nYA8c1c7deA=;
        b=xeMYdxpYLD+2MdWcDJg4uGVbjufKf1nYTuS08AJ8UUJdYg+wnMH2xdJIYqHIS7qd8R
         B+vOd5oRF12g+f6aR22K0xhheRwlxviYfE7xN/x1HodkdWNJ8bMFjrg/qbm2Z4tN76rU
         HZiypHPBbWuqZcqSOo4Pu7UzHAUGC7Ysldk5tsy8nARfZTo5XgiSpJYE5K0H/YFckFP3
         fe1VpKI52esVgIbO+CVfOa85KfM0jDFvhFr4t0nYnWGwcumpM5Htc+Px/VgzGmzempdk
         KNGzx3SYa7Re4mfcktEb23usBQLoYmuhFUBM+Ux2cFNGA6i3BqACS/4lqNUxEPNRTXLo
         1BwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=QiUxZWwPtf0NrSQG68BSjngMWDwYoz/5nYA8c1c7deA=;
        b=ctW7W/AHSmDpwiTD7IYYkd90mlR1CXApRlNhwl5QJq3R++MP5c4w+xE/OkFwTsbmat
         bLyofQ6+TDVwq0yRBTXDVclu3XBKELiKSiULQvVQH9yfW+40INPycq6qo96AtZuIXf7K
         m1KP4UQfRdsEtrA6DAp9UIE/bFpuKwqHS6d0Xi+a0kEDnxcDPGdm2b7txB1EWXit7XVN
         rwTaiwVj0TE9OLNv170p6RIoXHKtthQ71xwxW4RRjmwClDC6iVt3pRsGxBFBY8oD0LNF
         8g/Mq35BuQ9PhFqo51baWbTSkJn/bkh32mAJPh5xSZI7huorAqXc2dtukwqzYQuz0ldz
         PDtg==
X-Gm-Message-State: ANhLgQ3wnxrP5hazxEkYdgT+QfIqadnXF97j6lo8uhtCBJIsfCIHvHpl
        EpdXY1e7IrwOB1I1KzJqcRYm/2Mt3vc=
X-Google-Smtp-Source: ADFU+vtmDGg0VI1U7gNxUs9IhxpaIDJdoYxXqw6lRm24K9Z9uyPPv92CF27JEjb12RDdgKrxJT9AOA==
X-Received: by 2002:a63:5d04:: with SMTP id r4mr7845440pgb.241.1584700833873;
        Fri, 20 Mar 2020 03:40:33 -0700 (PDT)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h15sm4833951pgd.19.2020.03.20.03.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2020 03:40:33 -0700 (PDT)
Message-ID: <5e749da1.1c69fb81.2bc41.0c54@mx.google.com>
Date:   Fri, 20 Mar 2020 03:40:33 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.6-rc1-31-g347ae6e29145
X-Kernelci-Report-Type: boot
Subject: linusw/devel boot: 64 boots: 2 failed,
 61 passed with 1 untried/unknown (v5.6-rc1-31-g347ae6e29145)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel boot: 64 boots: 2 failed, 61 passed with 1 untried/unknown (v5=
.6-rc1-31-g347ae6e29145)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/devel/ke=
rnel/v5.6-rc1-31-g347ae6e29145/
Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.6-rc1-31-g347ae6e29145/

Tree: linusw
Branch: devel
Git Describe: v5.6-rc1-31-g347ae6e29145
Git Commit: 347ae6e29145077469838f3bb66939ec8ee8956a
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 56 unique boards, 15 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 35 days (last pass: gpio-v5.5-4-=
45-gd18fddff061d - first fail: v5.6-rc1-12-gb2929a9cb2fb)

arm64:

    defconfig:
        gcc-8:
          meson-gxm-q200:
              lab-baylibre: new failure (last pass: v5.6-rc1-26-g5779925c23=
e1)
          sun50i-a64-pine64-plus:
              lab-baylibre: new failure (last pass: v5.6-rc1-26-g5779925c23=
e1)

Boot Failures Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            meson-gxm-q200: 1 failed lab

---
For more info write to <info@kernelci.org>
