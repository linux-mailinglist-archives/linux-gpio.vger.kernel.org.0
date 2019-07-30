Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E607879F7D
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2019 05:19:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726327AbfG3DTU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Jul 2019 23:19:20 -0400
Received: from mail-wm1-f48.google.com ([209.85.128.48]:35699 "EHLO
        mail-wm1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726208AbfG3DTT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Jul 2019 23:19:19 -0400
Received: by mail-wm1-f48.google.com with SMTP id l2so55210426wmg.0
        for <linux-gpio@vger.kernel.org>; Mon, 29 Jul 2019 20:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=56Le+MRlQJAhCFwYzK1pywCt7N1/PTdA6+X8HYtkANo=;
        b=qSy7xtQ9tknhrWVEJyLCC9aIMFi69MKd+tw7ynXzw96gujQn2o51/9KLidkLztL3CQ
         OGV+ERdLTqRNCq3XH+tzdd5MoPEb5h3KGDnd3DvaopxdmOhVGQ7a24UGMriXcX1fHEhJ
         1SDH/NxM/GFe221eFk+fV2loEIXSeYOXUjJbwRjbyoVgsRvp2+HMC01cwlZ0TIF0nCZt
         N8CyOz4H2ZElSA06IlQ+Fm9pZTgBpkiGIq2JfKDkVjf0F1FLL5cj8upQx5Pew3ZVBGl3
         8o6KliIN3FluJ4d8odxjru4GZwMpHTyOmU6dkftofViCCZG8fPkmjSV3ICAL1mRZRlXu
         KLag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=56Le+MRlQJAhCFwYzK1pywCt7N1/PTdA6+X8HYtkANo=;
        b=TCR4fM9Fh5py2efnAR7l4xPxrqIZ4v4YJKrgJgxtSqcYR3d5qwXY0h+8F5dS838vFz
         vPJJlnSKunudRylw7kbdWmDEnDI5BDFq/o9+uA18jwqQ2bn6/3vYhZoik29sDvhEIDd5
         xVQCojhymPsI8OFM+VRC/rzn3+j/pQsmsbIJ73VZ0vCoDTlopHynoukKNJmnsEbKj/7H
         JqdEf6Bl/ErxKB/xJBmbT8lF8NEIFY35rPPZt25d4lggKmQap7WKGNZZVhLwr5ct8lJg
         QB8yd/dUSDRP84gTvUtdsJC8t7WIVfrgqrne1p1zjiBu1AZ5IvH7flZ9/bcJgHq0rB3S
         Ty3Q==
X-Gm-Message-State: APjAAAVWj3rUhX8IU3l9/yNHLXTH2GqeA6gs/+3gFiCVMKEDOQ6HN5iD
        WX79BOZlmReMb/XiXS7O827OaHkv5U8=
X-Google-Smtp-Source: APXvYqy0RjwqrHGHIU8e50mzVF/vagGYoHBFWwfiEh002H27oO35KFskfJBTV7EMJg+0dMWe4k/5WA==
X-Received: by 2002:a1c:1d08:: with SMTP id d8mr99128335wmd.22.1564456757805;
        Mon, 29 Jul 2019 20:19:17 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id y16sm138468660wrg.85.2019.07.29.20.19.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jul 2019 20:19:17 -0700 (PDT)
Message-ID: <5d3fb735.1c69fb81.39b2e.863c@mx.google.com>
Date:   Mon, 29 Jul 2019 20:19:17 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.3-rc1-10-gd2a561ae1961
X-Kernelci-Branch: for-next
X-Kernelci-Report-Type: boot
Subject: linusw/for-next boot: 37 boots: 2 failed,
 35 passed (v5.3-rc1-10-gd2a561ae1961)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next boot: 37 boots: 2 failed, 35 passed (v5.3-rc1-10-gd2a561ae1=
961)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/v5.3-rc1-10-gd2a561ae1961/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.3-rc1-10-gd2a561ae1961/

Tree: linusw
Branch: for-next
Git Describe: v5.3-rc1-10-gd2a561ae1961
Git Commit: d2a561ae19613c14bfbc437bc9dbdb2c9d1d1b95
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 27 unique boards, 13 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          apq8016-sbc:
              lab-mhart: new failure (last pass: v5.2-10813-g88785b7fa74a)
          meson-gxm-khadas-vim2:
              lab-baylibre: new failure (last pass: v5.2-rc2-89-g9b3b623804=
a6)

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8016-sbc: 1 failed lab
            meson-gxm-khadas-vim2: 1 failed lab

---
For more info write to <info@kernelci.org>
