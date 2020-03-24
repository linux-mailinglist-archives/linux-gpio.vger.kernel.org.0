Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60302191C76
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2020 23:05:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728320AbgCXWFn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Mar 2020 18:05:43 -0400
Received: from mail-pj1-f68.google.com ([209.85.216.68]:39224 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727753AbgCXWFn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Mar 2020 18:05:43 -0400
Received: by mail-pj1-f68.google.com with SMTP id ck23so133213pjb.4
        for <linux-gpio@vger.kernel.org>; Tue, 24 Mar 2020 15:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ah4gT06pf2hg/Re4n9D0n3ZjwB/DU3z1tx7QNX2BZC4=;
        b=FwbEy3goBr3Yasdrr/S7b1FGVHGl6imCzqUNzrTSiqRkxosxaLLmFj1cQnd2UpKUTk
         TySeKab6gpR0NAPTNxBKZe+ZOl2tgcRSaSVzdYfZrNvUhj68+IYFCDofUMogTVYOYsz1
         dOa2k7rCr89RAFIt/OZ31Q+IqUojDkknZugOM3fGQ2PIbrgua1Aq5aVwrmU2DrkStnPg
         bldvM5cyme26BoyT0lagwm8DYS7+xRTrRoemby8TK/zSKYqhFB3PxWgM//T58ghEV5dm
         URAvduP4FBbk07Qp51LDVQQbNa0fFF+YMGaLF/dPb9FIbKjF0LW2I4DHdbp9uwh1P/ZA
         1VHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ah4gT06pf2hg/Re4n9D0n3ZjwB/DU3z1tx7QNX2BZC4=;
        b=nX996brlJ6S4+IEvb0HbJCaZLrVizfn89nz/61HK5a5TFAN7bxV1zzvFFgqygqmny1
         mZSEunxbrW0H7jLRl97iI4ijVtkbZLOCzAbRNUM+rhVLKKdcq51xI8G5RmYajIrAXVmB
         TuGaoTygb5autAdUc0kUcEs1sGmbtAcQPZntzbncFIj5Ez0CHfZXmON0U2+WkpgP0mHr
         sAvYiX66Tll9BVD8QS0DdgTun64aGdB12SsR5uDNW82tXrPO2my+E4oYVkgf6rCfgVa6
         WI7/DQAeQdHPJYyMNn5CgIuh64h8mS9rrmYGOH55LfobE+X8sLpcCgUnY/3gKvFIBN/o
         VxKQ==
X-Gm-Message-State: ANhLgQ3ovGMywAmDMusTM+LH0LIuGqDAch1f/6sMEUXS5/I1Er9Mm2ZS
        856VzPQZyFtttTVr+Y+f4zbInP8/fB8=
X-Google-Smtp-Source: ADFU+vsxmWAw4p4KSZrG3GK93kSp6+rD9YcQ5Y7Gn+ScaCxH9pBRNxUQ6aM5EYIvzEj1AloIA8kW1A==
X-Received: by 2002:a17:902:ac85:: with SMTP id h5mr164272plr.76.1585087541646;
        Tue, 24 Mar 2020 15:05:41 -0700 (PDT)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d26sm3345207pfo.37.2020.03.24.15.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 15:05:41 -0700 (PDT)
Message-ID: <5e7a8435.1c69fb81.1961a.e4c3@mx.google.com>
Date:   Tue, 24 Mar 2020 15:05:41 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.6-rc1-32-ga28e1c0505a0
X-Kernelci-Report-Type: boot
Subject: linusw/devel boot: 61 boots: 2 failed,
 58 passed with 1 untried/unknown (v5.6-rc1-32-ga28e1c0505a0)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel boot: 61 boots: 2 failed, 58 passed with 1 untried/unknown (v5=
.6-rc1-32-ga28e1c0505a0)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/devel/ke=
rnel/v5.6-rc1-32-ga28e1c0505a0/
Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.6-rc1-32-ga28e1c0505a0/

Tree: linusw
Branch: devel
Git Describe: v5.6-rc1-32-ga28e1c0505a0
Git Commit: a28e1c0505a09c3a2d81fed1c8453ac2d8d02b3a
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 53 unique boards, 14 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 40 days (last pass: gpio-v5.5-4-=
45-gd18fddff061d - first fail: v5.6-rc1-12-gb2929a9cb2fb)

arm64:

    defconfig:
        gcc-8:
          bcm2837-rpi-3-b:
              lab-baylibre: new failure (last pass: v5.6-rc1-31-g347ae6e291=
45)
          sun50i-a64-pine64-plus:
              lab-baylibre: failing since 4 days (last pass: v5.6-rc1-26-g5=
779925c23e1 - first fail: v5.6-rc1-31-g347ae6e29145)

Boot Failures Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            bcm2837-rpi-3-b: 1 failed lab

---
For more info write to <info@kernelci.org>
