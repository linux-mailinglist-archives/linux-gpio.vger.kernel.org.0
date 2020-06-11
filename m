Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AA831F6C7B
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2020 18:57:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726542AbgFKQ5x (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Jun 2020 12:57:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725782AbgFKQ5x (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Jun 2020 12:57:53 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F062EC08C5C1
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2020 09:57:51 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id u5so2783406pgn.5
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2020 09:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=6tZI0fxKdKnGXlKIsQkeUYvt26KK9qYuM4CeHOrqtuw=;
        b=q/2iM4Pt7ZKXCFUI0vrF7H7uFk/oQyPZVP+ctdLSqVlz2spWpfQ2LkmLmeE2jKart4
         3lknjkMmPLSWfp04lmnMbJirr1ID7q9k1JBd3pA1tbsEbx/+BBiObUxfbTgJsFsfaQ4Y
         4r5A2iWruRhsK+hlpz3hDR5XOzlDq+WIGHhGUNKCzU4VOjPWhfpkDuJC0VGjUfFuDKty
         7MRsD++isVBRse3YP7p0BHgnPL+UyZGMtEi1ujr1mSxGp3PPIajbRDlsgP/hpogh2wH1
         PAuFsJ3EHPS17gjAWG7UuObNk8fKd19cRHNfa4B+Cf5cMnn7a+VTPEQQguJzuxqUP/bd
         RPhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=6tZI0fxKdKnGXlKIsQkeUYvt26KK9qYuM4CeHOrqtuw=;
        b=RFRNb7EivmKnFgdzD+Uds8XuhS0KRYvXP1qsB3vtzOw+wbqGxZ9nvES2gSoU5f8ZfY
         zrcxN4iGy0oCRCgaNVJ6u7F4HnD7XQ2k6GwUmQN5l2mfdTQhO/rIPPwCWJTqn4Ypg2Ir
         +eXwgRLycvtJ4ly/MlcY79V/9QwBQkpB500ahuKOiSS85lesHDQqe1rAgzUou5n4iJ8x
         BfSXRdXdNhuSetyy1oo3Gc90oI+HxVknrI6x2IGByfMoK6g0ZvCsDF2PCGneh5s2d7tF
         ger1GEBjie8wjPmOWN6Cge/Ti8vMXXo/ofr/EeqQMoeYt5tvKCYQcgsNhMB4eitsHKc2
         BBQg==
X-Gm-Message-State: AOAM530XJax4rdTzEN2l+qyyrpvTc9RY/fBBIjt4W8tg69/R3X9UAIeQ
        D+E3UkIdYG5MGOiVS+anYzKhkNP42Sk=
X-Google-Smtp-Source: ABdhPJzNFq160FBTWX6/KG70oKMB2CQAUL83wLiTQKB1kp14pSsCbqrUxOjbACXpBSeJPixhLSCsBQ==
X-Received: by 2002:a63:e54d:: with SMTP id z13mr7262848pgj.78.1591894670462;
        Thu, 11 Jun 2020 09:57:50 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g19sm3570587pfo.209.2020.06.11.09.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2020 09:57:49 -0700 (PDT)
Message-ID: <5ee2628d.1c69fb81.df0c9.9c3a@mx.google.com>
Date:   Thu, 11 Jun 2020 09:57:49 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: gpio-v5.8-1-1-gf6d984418ffd
Subject: linusw/devel baseline: 63 runs,
 1 regressions (gpio-v5.8-1-1-gf6d984418ffd)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel baseline: 63 runs, 1 regressions (gpio-v5.8-1-1-gf6d984418ffd)

Regressions Summary
-------------------

platform        | arch  | lab          | compiler | defconfig | results
----------------+-------+--------------+----------+-----------+--------
bcm2837-rpi-3-b | arm64 | lab-baylibre | gcc-8    | defconfig | 4/5    =


  Details:  https://kernelci.org/test/job/linusw/branch/devel/kernel/gpio-v=
5.8-1-1-gf6d984418ffd/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   devel
  Describe: gpio-v5.8-1-1-gf6d984418ffd
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      f6d984418ffde19322fd149105200224ac2bc089 =



Test Regressions
---------------- =



platform        | arch  | lab          | compiler | defconfig | results
----------------+-------+--------------+----------+-----------+--------
bcm2837-rpi-3-b | arm64 | lab-baylibre | gcc-8    | defconfig | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5ee257c67c447acfd297bf0f

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/gpio-v5.8-1-1-gf6=
d984418ffd/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/gpio-v5.8-1-1-gf6=
d984418ffd/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5ee257c67c447acf=
d297bf12
      failing since 7 days (last pass: v5.7-rc7-78-ga8173820f441, first fai=
l: v5.7-rc7-82-g74910e15ab25)
      3 lines =20
