Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C411C19634B
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Mar 2020 04:12:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbgC1DMR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Mar 2020 23:12:17 -0400
Received: from mail-pj1-f43.google.com ([209.85.216.43]:53302 "EHLO
        mail-pj1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726291AbgC1DMR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Mar 2020 23:12:17 -0400
Received: by mail-pj1-f43.google.com with SMTP id l36so4699817pjb.3
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2020 20:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=MdyJkWViKjI+47awD6F9L8Z7pkqpNIEISfx/RqYWim0=;
        b=myTzqeE7b70SXZgQXcnHp3l0LuKG3oVIUGR1D0H/XoPM9W/cJyJ190rcbKPG59aJ9e
         9wHnnlm0vgYta5f3X0hcVYIW6tqsVTRVUrzEqRc+JhjBJwrSIuMbQums39Xqtpy7hIhq
         saqjuj+KmRwFNDwb5ASrbTmsgzjj6QUlTotK7JSorc9/11vgfPCU4ZFz2nv5LlDEP5Ss
         sruPcjmx6dW6DHKsg3pWgINOLrZ/e/1FjvcAeo8HR188eRlDUpN42FFCffsUF4HWZaYK
         Aq2CR7gAAcoEPJ28HKsHShf8pYwbJS3x6DDhq8Ogp6lQkaa5E01kwvL1NBcx5ynDI0Vk
         KQJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=MdyJkWViKjI+47awD6F9L8Z7pkqpNIEISfx/RqYWim0=;
        b=Z/eQZhgdfnAqLz2emLiY7+/YSO1skzgdcMyBji660i1EFvqD03cinPPzlXbbySIcUw
         PZ4mVbgIO8ptyfDRmm0dwnkfGdsuF+ZbWtVS5iwonHUJ8FGUAuJcnJ0ptC1jS01NoYOj
         DBYmVCK+jNYPX81qUc8ICJjdeiVyZZBsSegRYv8Xs5eGh1s37P3T+IIZFVPTkqq/rDck
         wHLIkqFUy5e/aCrFh7ibTuRFTA28HboBo1AnLfZGBOm+8aT/uvVzT0Y7gnbC/bGhfh7E
         dp2VAliCq9wocbejSgOThas/WtE4nE51ChrAhihF60Mt1YJF+fU7EXRQCwSZp+VlQv3r
         vfaA==
X-Gm-Message-State: ANhLgQ2DaC6bhwNJCBMIs/Ny4QJkSzn7q0jP6X+qFB2zFTfY+akP/Brl
        KyMxSKscgA+j/+Ri4FLu7kdIOJwSXno=
X-Google-Smtp-Source: ADFU+vuuuHjh9mG98XNiUd2ADTj0l6XXG1o1Ip0RF8OgKr6WGfK0VJ3loz2awtz3Do+sAcMZs+n2Fg==
X-Received: by 2002:a17:902:76c4:: with SMTP id j4mr1963209plt.187.1585365136217;
        Fri, 27 Mar 2020 20:12:16 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y131sm5143051pfg.25.2020.03.27.20.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 20:12:15 -0700 (PDT)
Message-ID: <5e7ec08f.1c69fb81.5fe9b.6d92@mx.google.com>
Date:   Fri, 27 Mar 2020 20:12:15 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.6-rc7-57-g5f4bf171ca03
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
Subject: linusw/devel boot: 64 boots: 2 failed,
 62 passed (v5.6-rc7-57-g5f4bf171ca03)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel boot: 64 boots: 2 failed, 62 passed (v5.6-rc7-57-g5f4bf171ca03)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/devel/ke=
rnel/v5.6-rc7-57-g5f4bf171ca03/
Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.6-rc7-57-g5f4bf171ca03/

Tree: linusw
Branch: devel
Git Describe: v5.6-rc7-57-g5f4bf171ca03
Git Commit: 5f4bf171ca03b79f0ed7a17216fd854e50955617
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 56 unique boards, 15 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 43 days (last pass: gpio-v5.5-4-=
45-gd18fddff061d - first fail: v5.6-rc1-12-gb2929a9cb2fb)

arm64:

    defconfig:
        gcc-8:
          meson-gxm-q200:
              lab-baylibre: new failure (last pass: v5.6-rc1-51-gffa91e7ca1=
42)

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
