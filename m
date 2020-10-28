Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AADD29D847
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Oct 2020 23:31:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387821AbgJ1WbE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Oct 2020 18:31:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387840AbgJ1WbD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Oct 2020 18:31:03 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B791C0613CF
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2020 15:31:03 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id 13so654422pfy.4
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2020 15:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=IlGjamNZJQlb+bNbaicIlbYxcxVb5e3NoEjkDtwYOsM=;
        b=GppF06XedzrMfmOa9p+EK8X7nn68I4wU8ciN4C90I197JntYCLxV8oT0OKod2DTPSs
         PlwvWgpiF9GfA/IjZnrfjMFomonbyG8OUlK8yxmU/iyGKn5mMZTrHxj2pqtGI0yA/3uO
         V9JT0YNO+UtcWohLxaFHoZRZ4Z/skFZTAGOeEcwE6cDqRcdRIjx7ZSFlXjn/Dzk8VHTg
         Hi5vES1j/CtPNO67QAbzf7pRld8JxaeY7rqkLUfiZqcr3wHHfgt6LGnfhuhBgpax2Qwk
         luTDE/HJXHfq3/uur9U5xwgqPru+SrxzFmfpFoKCcptvcuLNsTpoU9vh+l5jJDG3PBxv
         rM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=IlGjamNZJQlb+bNbaicIlbYxcxVb5e3NoEjkDtwYOsM=;
        b=qHlHlnSbPBlX1YMP/uhd8L+MGkiF2tu//8aLIETuzgolLJJHSDEKc8UKkQGPIA+dOG
         v3qhtGdEJZHPbcA0GCoTTzXGBXVcQ6bePIVXX1tYiqB7/gGF5haxiWKGrJDD3EKbXBXn
         be+0udkjTQf07H+fmq85Exowb/9dvh/TIGIylE9MhjbJPzjCVJNT+il4IbV/Sc+4nXG4
         PprP5UUrIBSs6o5wpBW7XP4GrqkPCuqd/41QoaXC0xQTAEzEsKHDMKhS5nnVreigojkx
         mNPBh4sdyM3v3vHl82Ev8ho0G0zs0rflROgW34rvpIyiqyYkQvNhsgpyg92A2pnl3wvJ
         q1tQ==
X-Gm-Message-State: AOAM531aryAjrKB2wApo/6zRnfDAk7D83NfSad361VO+mzjERaE3xBiz
        gTIJLaIqJoeZ0HMyjxwgT2V6H1I6wjIPOA==
X-Google-Smtp-Source: ABdhPJwYK1XCiCnKmGoca3JQHNNSMjAzPEsjv5SAKoINhlK7cRjeKbGdlXoVslqo80WHP1EDkLSnsA==
X-Received: by 2002:a62:2ec7:0:b029:164:4811:e1d6 with SMTP id u190-20020a622ec70000b02901644811e1d6mr579204pfu.12.1603910601791;
        Wed, 28 Oct 2020 11:43:21 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j15sm97686pgn.32.2020.10.28.11.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 11:43:21 -0700 (PDT)
Message-ID: <5f99bbc9.1c69fb81.27557.045b@mx.google.com>
Date:   Wed, 28 Oct 2020 11:43:21 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.10-rc1-4-g8aa163350506
X-Kernelci-Report-Type: test
X-Kernelci-Tree: linusw
X-Kernelci-Branch: devel
Subject: linusw/devel baseline: 116 runs,
 1 regressions (v5.10-rc1-4-g8aa163350506)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel baseline: 116 runs, 1 regressions (v5.10-rc1-4-g8aa163350506)

Regressions Summary
-------------------

platform | arch | lab           | compiler | defconfig          | regressio=
ns
---------+------+---------------+----------+--------------------+----------=
--
panda    | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | 1        =
  =


  Details:  https://kernelci.org/test/job/linusw/branch/devel/kernel/v5.10-=
rc1-4-g8aa163350506/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   devel
  Describe: v5.10-rc1-4-g8aa163350506
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      8aa16335050663357281fb1f1b0483ab91b4d8de =



Test Regressions
---------------- =



platform | arch | lab           | compiler | defconfig          | regressio=
ns
---------+------+---------------+----------+--------------------+----------=
--
panda    | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | 1        =
  =


  Details:     https://kernelci.org/test/plan/id/5f99b440c8617f188a38103c

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.10-rc1-4-g8aa1=
63350506/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.10-rc1-4-g8aa1=
63350506/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f99b440c8617f1=
88a381042
        failing since 61 days (last pass: gpio-v5.8-2-103-g22cc422070d9, fi=
rst fail: v5.9-rc1-10-gfeeaefd378ca)
        60 lines

    2020-10-28 18:11:07.202000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper/0  pfn:9c802
    2020-10-28 18:11:07.207000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper/0  pfn:9c803
    2020-10-28 18:11:07.213000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper/0  pfn:9c804
    2020-10-28 18:11:07.219000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper/0  pfn:9c805
    2020-10-28 18:11:07.225000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper/0  pfn:9c806
    2020-10-28 18:11:07.231000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper/0  pfn:9c807
    2020-10-28 18:11:07.237000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper/0  pfn:9c808
    2020-10-28 18:11:07.243000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper/0  pfn:9c809
    2020-10-28 18:11:07.249000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper/0  pfn:9c80a
    2020-10-28 18:11:07.255000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper/0  pfn:9c80b =

    ... (49 line(s) more)  =

 =20
