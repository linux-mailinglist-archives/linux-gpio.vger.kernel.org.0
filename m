Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C984B1F6D05
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2020 19:51:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726279AbgFKRvT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Jun 2020 13:51:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725824AbgFKRvT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Jun 2020 13:51:19 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11E35C03E96F
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2020 10:51:17 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id j1so2991423pfe.4
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2020 10:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=SNq5ZfwtiNQTXKqwcGFrifcH2eh503lrjY59WQOeTZ4=;
        b=h7jDeKxVmjbu/pob6619IBUlS7veBuEZhS+bXEEAj0/IUp5/NIsjfU4tJIoyvBxIOx
         LWCH5d62Tj4ApL8iDAzWF9Bu5FA+jNT9bqPm3UZUfbZ+o+8+j/KZpuIhTx4S5UtyMBUc
         7Kb+Uxanre1jUvnXoMrsCu9q4nXpz93Q4jroTIhoNDgjci3aHzsSsSdVy4dxLI63pi8Q
         cD0ZjoZHDtXCFTU+Cl5m4C1v/IFzUZiFSkDNoeYsgs+6gumTUCI97r5hq8Wmh9XOatDs
         dNQn7fSie3GxAGpBqfeWUYNFYaP+TG4f01czPds99yg7qCN9wN46fZlrsVaPRz3Ktpss
         UUgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=SNq5ZfwtiNQTXKqwcGFrifcH2eh503lrjY59WQOeTZ4=;
        b=HRNYl2ngT33s9N5QekVZP3+/afsbOo8nmavLD+WzF8RsgNFKZRdL7cpBywPfzcA0wE
         ybVYLo9+ZUrYWvjAtMucu7Vy7ItBn/S+kLT8OWbRIRrHNFkywULvdyx7EOuWelyXhz2e
         Kx9OZtBKA80SI5EYUNWr4ucg5NyNaN1/J9O4r+aWtLQaUaRtKbzuK06jye3ymXfGgD5O
         bJk/IPU01nx3MT7qORuBQNGUdXKu3yCIgc+UJQQBhj857MBtMLTdAQQvxXKLCK9RwFNm
         4KgjvigTOp40aEPYkNdWysoZjLgeJyW1SXocMwLL1x7bnLFphlLkYLOnKqSB0t5U34r3
         mRhg==
X-Gm-Message-State: AOAM5333IvhucO//u9KOlVEdaPqDGX7pXcbJ/DpJ1eL9OP8TDZdYWj9c
        JE84f3LE5EMrcUW5uJaKTX1lw4b6E24=
X-Google-Smtp-Source: ABdhPJwOtcjXgP4sEaMBBZNnZa+uxLVdtbpZbU4ymFAzxnI8bAKzCPIqVs4NEF3eOFBBxWZn3BwfCw==
X-Received: by 2002:a05:6a00:148c:: with SMTP id v12mr8079568pfu.171.1591897874937;
        Thu, 11 Jun 2020 10:51:14 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w5sm3676827pfn.22.2020.06.11.10.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2020 10:51:14 -0700 (PDT)
Message-ID: <5ee26f12.1c69fb81.d04ce.ad2f@mx.google.com>
Date:   Thu, 11 Jun 2020 10:51:14 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: gpio-v5.7-3-2-gcdf59728a3cd
Subject: linusw/for-next baseline: 62 runs,
 1 regressions (gpio-v5.7-3-2-gcdf59728a3cd)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next baseline: 62 runs, 1 regressions (gpio-v5.7-3-2-gcdf59728a3=
cd)

Regressions Summary
-------------------

platform                     | arch  | lab          | compiler | defconfig =
| results
-----------------------------+-------+--------------+----------+-----------=
+--------
meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig =
| 4/5    =


  Details:  https://kernelci.org/test/job/linusw/branch/for-next/kernel/gpi=
o-v5.7-3-2-gcdf59728a3cd/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   for-next
  Describe: gpio-v5.7-3-2-gcdf59728a3cd
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      cdf59728a3cdfdf59f517329d40eb2257b3fe7d0 =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
| results
-----------------------------+-------+--------------+----------+-----------=
+--------
meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig =
| 4/5    =


  Details:     https://kernelci.org/test/plan/id/5ee26c626b10a290d397bf11

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/for-next/gpio-v5.7-3-2-=
gcdf59728a3cd/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s805x-l=
ibretech-ac.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/gpio-v5.7-3-2-=
gcdf59728a3cd/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s805x-l=
ibretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5ee26c626b10a29=
0d397bf16
      new failure (last pass: v5.7-rc7-82-g74910e15ab25)
      2 lines =20
