Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC09914C523
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jan 2020 05:15:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726487AbgA2EPr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jan 2020 23:15:47 -0500
Received: from mail-wr1-f44.google.com ([209.85.221.44]:42230 "EHLO
        mail-wr1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726486AbgA2EPr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jan 2020 23:15:47 -0500
Received: by mail-wr1-f44.google.com with SMTP id k11so3872916wrd.9
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jan 2020 20:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Gqd2QmDTdmA7EOrAVmwbF3W/p8c9VXVP68sO1VDkjAc=;
        b=il2/AyJzfPzH0uOhlSPowD/Ut/Wd1jJ6g0Z5fV7f1Ml4CpEmXLQIg7Kv/gOT30txZf
         fGHA5FQbERfWwQzddPuidDGm/sOdaDK2WaF7v4I9S+egKQMUoWi/pycxYrr0bALf6XrS
         dzVF/jrpd5cPma3hkWJX7YRN3SiirSUVUiOU+Ey9uWGRYLJPdIZwRF+MDmYK6znSHxEB
         VEsG2QMx/aIT95MJ+0IbEkMgYoijkdRcqEhTtb7573JVcQXM722dzh+hceyz2VJrLqr3
         Jbhf3Rljg8d1wEZF85eMsVfbQgVd7g+VmFPgT+iaeSfKCoCSJq1eVnDJRMOqsL9TKOyy
         /hoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Gqd2QmDTdmA7EOrAVmwbF3W/p8c9VXVP68sO1VDkjAc=;
        b=NT4WciLI/v+rCDA88gdp/MQLGQbB4dx7PKgHDy7+gQxto5448xDHKNNeYoILV4L6yi
         IAT5hRBN/9NaFX+jk8wCUJ1RU2/lybX3Xj5ih1dV0NNVhej03ZZe0MrcHXr2dYF2FX4Z
         betbfhN8lDuB9jSCN0ExcV51n5wHgxxwVfZ8PW7fIDlBKaBV/GvG4BMoBP8HA+Z3kEjH
         VPtF0K9cU2avxcCXf7eB5C7vdzKhVaN5c+Yvt8cO4JIcnhATQnpf4OfN5oBPytY0AbyZ
         Mb33ONV06oMaLsY/AcaJgdFDj51xwAIGFAZWlRlaPQbUM+rI0LJXpQsRiRhJuA6y+d6Z
         Ul6A==
X-Gm-Message-State: APjAAAVHG/jwrTe+OyrF85KApgFR/yOfUyEauPN2Ixnzbix3QHJ7VIvy
        8soxjVftf+N/2nqyaV2ozQed3oJWdW9+KA==
X-Google-Smtp-Source: APXvYqyojE47kMrilmkxUVFmepSV9aUFIG3n4krsEQJEcMZoQMFbAWqyw9pWrEzx0LiO5pdFGUZJOQ==
X-Received: by 2002:adf:fe50:: with SMTP id m16mr34421173wrs.217.1580271344795;
        Tue, 28 Jan 2020 20:15:44 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id y185sm762697wmg.2.2020.01.28.20.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2020 20:15:44 -0800 (PST)
Message-ID: <5e3106f0.1c69fb81.f0553.25fa@mx.google.com>
Date:   Tue, 28 Jan 2020 20:15:44 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: linusw
X-Kernelci-Branch: for-next
X-Kernelci-Kernel: gpio-v5.5-4-52-g0282c72d30d3
X-Kernelci-Report-Type: boot
Subject: linusw/for-next boot: 35 boots: 0 failed,
 34 passed with 1 untried/unknown (gpio-v5.5-4-52-g0282c72d30d3)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next boot: 35 boots: 0 failed, 34 passed with 1 untried/unknown =
(gpio-v5.5-4-52-g0282c72d30d3)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/gpio-v5.5-4-52-g0282c72d30d3/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/gpio-v5.5-4-52-g0282c72d30d3/

Tree: linusw
Branch: for-next
Git Describe: gpio-v5.5-4-52-g0282c72d30d3
Git Commit: 0282c72d30d32913d641dc81f3f38607ace98802
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 35 unique boards, 10 SoC families, 3 builds out of 5

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          meson-gxl-s805x-p241:
              lab-baylibre: failing since 10 days (last pass: v5.5-rc6-44-g=
158a4056fd63 - first fail: gpio-v5.5-4-45-gd18fddff061d)

---
For more info write to <info@kernelci.org>
