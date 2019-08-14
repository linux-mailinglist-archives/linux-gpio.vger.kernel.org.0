Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31CB78D1BA
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Aug 2019 13:08:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725800AbfHNLIZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Aug 2019 07:08:25 -0400
Received: from mail-wr1-f52.google.com ([209.85.221.52]:34101 "EHLO
        mail-wr1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726126AbfHNLIZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Aug 2019 07:08:25 -0400
Received: by mail-wr1-f52.google.com with SMTP id 31so110728304wrm.1
        for <linux-gpio@vger.kernel.org>; Wed, 14 Aug 2019 04:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=d7k9a97CD2xdy8bODDT6643LXYmCdrHGadw3grEHwl0=;
        b=FS/NbLZt/Cu1XAeOGPOQEOO9P6xZeLb0mrLDdTetD+0pcLMqmQmNT6Ta+ujiTOZZGF
         mjkQcv+S/gDjSy/WLvspw7UyptMjcm7LtFwCTlPeC2Jz12n2cm+8g60V6X5/oUurOuJA
         IpIodUHHEdUaVpbL8/OdiTv3deBUQsPH51QoZ/sA3IlW6ggv52Y9omHpyui7FuhmmPnd
         KMVJZ45ctORyCowoe21ELceQOhhE883zpqiSpRLIGUJWGbHuFFLnO7fBVpERJm8Wk73l
         KkPWMaIx5g6djovKo4zicAPrWKnkuAQBZ4LXn6aPpEKo6sbud8Kgr8obTlnDiEqN88hk
         nZow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=d7k9a97CD2xdy8bODDT6643LXYmCdrHGadw3grEHwl0=;
        b=D9VRRPRZ1ot2SlGKL/7zpFiVLCI1RjNtOsFZYdGdk/HIyK43DueXJfPC7rdyW26Rsr
         rWEDTDIHxwnF1zIykdhAYxWFPVdM5YcqyqKfmQ1dWgwZQPI0nixWETp6amF03jsTMeiM
         tiKW1SJj/NLTKndlYPVvBwHZa4OdUAod/i6yOMTLlIuxUxibZnsG17td1jARHPWUk6Ng
         82NuolVml8qfVVd/ItObW37TvK7USeRsSsne+SD0wDTW8gFJg7o3UyULKRE9Tx9AEJO2
         ewRHTt+atlSMKv6nboAop4HeuvURjNsPgXPisDF6uvZdHOAhRYh5x2Cs3gWHkHEOp/IX
         jbmQ==
X-Gm-Message-State: APjAAAXvLw9IZQE5l9xtwqZ/VsQfMaoCqQbupl27IDB9eFo/GFDSd/NP
        JF8llBAInN94TDRk+T2pgG6er/Hr40UP6Q==
X-Google-Smtp-Source: APXvYqyhcHAVOV0JItVcdjUvg/qQgT6BT2x8k9dGpBYT4KeOB1Y0B6MnHINQRrjJpQEMp5qZ1tT6VQ==
X-Received: by 2002:a5d:50cb:: with SMTP id f11mr30327659wrt.277.1565780902802;
        Wed, 14 Aug 2019 04:08:22 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id k13sm29601754wro.97.2019.08.14.04.08.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Aug 2019 04:08:22 -0700 (PDT)
Message-ID: <5d53eba6.1c69fb81.324d6.9f3d@mx.google.com>
Date:   Wed, 14 Aug 2019 04:08:22 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc4-2-g68e03b85474a
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: fixes
Subject: linusw/fixes boot: 59 boots: 1 failed,
 56 passed with 2 untried/unknown (v5.3-rc4-2-g68e03b85474a)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes boot: 59 boots: 1 failed, 56 passed with 2 untried/unknown (v5=
.3-rc4-2-g68e03b85474a)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/fixes/ke=
rnel/v5.3-rc4-2-g68e03b85474a/
Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/v=
5.3-rc4-2-g68e03b85474a/

Tree: linusw
Branch: fixes
Git Describe: v5.3-rc4-2-g68e03b85474a
Git Commit: 68e03b85474a51ec1921b4d13204782594ef7223
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 41 unique boards, 14 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          meson-gxbb-nanopi-k2:
              lab-baylibre: new failure (last pass: gpio-v5.3-3-1-g29c778ca=
612b)

Boot Failure Detected:

arm64:
    defconfig:
        gcc-8:
            meson-gxbb-nanopi-k2: 1 failed lab

---
For more info write to <info@kernelci.org>
