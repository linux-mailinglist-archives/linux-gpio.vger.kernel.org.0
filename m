Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 695BE1EDAA0
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jun 2020 03:46:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726521AbgFDBqk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Jun 2020 21:46:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726050AbgFDBqk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Jun 2020 21:46:40 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9A00C03E96D
        for <linux-gpio@vger.kernel.org>; Wed,  3 Jun 2020 18:46:38 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id x22so2629093pfn.3
        for <linux-gpio@vger.kernel.org>; Wed, 03 Jun 2020 18:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Zz/NPiSmIF2z0AkhiQIm2HMQ7bKLpUDU4ZSfupen7sI=;
        b=o93MfR/5uFMwVHciNG6P8wSqEICSsEih5Z2i/2z12m6Nd1wDEtZik+cKBcbtEhbmyY
         RYRkaAJggdVSWrL4B0rm+TyJYssNX/JeUCp329evKV/KQ/etWby0W6Ule8N+E9mlSIgV
         vBdA2RtlXCOm53nm5NLbogCK+goRuCed044GA8BTP/oVgiLRbcxWGqL5JJYzfJDWBt96
         Fh2wQqnw82b2UzY4ItwGGR94M+XJ6LfG/JbiMc/O5kuMDEpkw8t7H4FJjOMLtPNFst+E
         HglyuPgX9q6C3X5YatYBVxxuLcYXvsiMSG1FuOWkNH6jxSl4X5q74gtUngtSlUNOHksh
         oY3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Zz/NPiSmIF2z0AkhiQIm2HMQ7bKLpUDU4ZSfupen7sI=;
        b=X73MsKBFfCSeTnvjXodM1y5mmE8UkeRMdxtAXX8yUG/Q//vtMfDmZB23O1P/zUUdrf
         dBtcpt1bRqGUpWa3djxPi9R/YBcY4APuoxyLSmZ7z2JGLTGBTTFZOk0zJmGMxkcZ7/cw
         kNOL38EU9SV5w7mO1hm/6bimQ5oz643wph4vvqbL25fTzRNtA7sh4jz6YehKsgviRz7Y
         KxOXojA/xzNEzJgla5ZUsUr1damf2c0uqT6QTLkRd4WK1NZCnrHOWHPsetXAI/96Dc41
         qIVL6BS+ui0lUZ4yV/SqTT7TmwLBdD1y88QaXB/bqRQAVW8afIunPXDrPAyunUNh3tZq
         yUmg==
X-Gm-Message-State: AOAM530Rq0pvhZE5EqcCxQMwTvwC1laGIwVhOviMlJThDiGqQAalikuG
        0f+OrBnjRs5XOvLMs6dMRy0F4MkL/CQ=
X-Google-Smtp-Source: ABdhPJyyAAqzmKBlRvmOjM9LTiTAub8TRrkPrhjjbC3kjB5ZSfMHQggVOTC/01EmWqu9E74Av3dd8w==
X-Received: by 2002:a65:5a01:: with SMTP id y1mr2111752pgs.233.1591235197980;
        Wed, 03 Jun 2020 18:46:37 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b140sm2806090pfb.119.2020.06.03.18.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 18:46:37 -0700 (PDT)
Message-ID: <5ed8527d.1c69fb81.a0975.8a45@mx.google.com>
Date:   Wed, 03 Jun 2020 18:46:37 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.7-rc7-82-g74910e15ab25
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
Subject: linusw/for-next boot: 24 boots: 0 failed,
 24 passed (v5.7-rc7-82-g74910e15ab25)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

******************************************
* WARNING: Boot tests are now deprecated *
******************************************

As kernelci.org is expanding its functional testing capabilities, the conce=
pt
of boot testing is now deprecated.  Boot results are scheduled to be droppe=
d on
*5th June 2020*.  The full schedule for boot tests deprecation is available=
 on
this GitHub issue: https://github.com/kernelci/kernelci-backend/issues/238

The new equivalent is the *baseline* test suite which also runs sanity chec=
ks
using dmesg and bootrr: https://github.com/kernelci/bootrr

See the *baseline results for this kernel revision* on this page:
https://kernelci.org/test/job/linusw/branch/for-next/kernel/v5.7-rc7-82-g74=
910e15ab25/plan/baseline/

---------------------------------------------------------------------------=
----

linusw/for-next boot: 24 boots: 0 failed, 24 passed (v5.7-rc7-82-g74910e15a=
b25)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/v5.7-rc7-82-g74910e15ab25/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.7-rc7-82-g74910e15ab25/

Tree: linusw
Branch: for-next
Git Describe: v5.7-rc7-82-g74910e15ab25
Git Commit: 74910e15ab25f95f162bc4d4a634d029186543ce
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 24 unique boards, 7 SoC families, 2 builds out of 4

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          meson-gxl-s905x-khadas-vim:
              lab-baylibre: new failure (last pass: v5.7-rc7-78-ga8173820f4=
41)

---
For more info write to <info@kernelci.org>
