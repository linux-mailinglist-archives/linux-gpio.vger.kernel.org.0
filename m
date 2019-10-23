Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA691E22A2
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2019 20:40:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389818AbfJWSkR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Oct 2019 14:40:17 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42578 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729043AbfJWSkR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Oct 2019 14:40:17 -0400
Received: by mail-wr1-f67.google.com with SMTP id r1so13421814wrs.9
        for <linux-gpio@vger.kernel.org>; Wed, 23 Oct 2019 11:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=MJJja7fjFl5r3nyUbXqAbHjAC2sinVKAiAQMqHakSq8=;
        b=10iiEu/jThR2BmaagEcI80gpsgvgB4QLB6UyU+8YvgY/Yhhr2cEQxMgGx9FKTMkSGP
         6uP/34/taQe+cY2kuSys/zE6iJt6ZwHmnu7P7OSMUbm6ojXqfwFzEUPU8v1XcQSyZFSq
         fGwqyLlCwNxKH3X3QqgrKFrHAvM5B9iW6mr2ZIrKSCQhfkDln1JcdXBMp5EXLfwMwKPH
         QpxNIhDhjiZJvjr4FRtpZxO2M2BVPlebjnDO5szr2J0HCAXXDLRNNmcF3RLLP7znDs9h
         m3MmCi4/h0xYlGyCeb8vQNBHhORDFIEHrF3uYoL8e7SNexDpbrB1vAAHyKQllRKRBSNK
         IsuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=MJJja7fjFl5r3nyUbXqAbHjAC2sinVKAiAQMqHakSq8=;
        b=djcP1MlUOqVicpttiM3aqGF1DB1kusR74sAcadC+z/Vcgo/vjgzGNWC9VZqGJEFAFs
         SkF5HAKgVmQfm6H2MUD3mo61FsfVn+tPkowlGvq2SqWYc6svEEmaWJ384q0f+cmkZjN0
         Kl9WKCgJDNJW5Zu8mEG7f9urMmHFKxt+z+JyDbGFBnIP/i95nfbR2XH2h4VNZumNgj1c
         XAS9uVRuaBXHBi4udMOemGhI41drO/5cWSUiN1ef7bscHjoWRULyR8HQnijlxAcwLDYj
         AO0rIXUwvLmUxrgCa5uuUygZ93sZuSZnjm5CbG3WGFe7ivBdmY1QRdVeQ0DVs1neFCGl
         r4yw==
X-Gm-Message-State: APjAAAVi7bfqUEQeqk7SWrRdQyC6/HB7RZycCcphf9ATLsD5GkauiI5U
        /o1cSFjsrgfbsG7FvnVeh5xPLVBHKUC5Wg==
X-Google-Smtp-Source: APXvYqwy31RwfUqhCCW2DbfqWvWZnGdGJdtCTfpfQH7T7Om0L7ybC7n7hG92nUjycIAgugK5+hb6Eg==
X-Received: by 2002:a5d:5591:: with SMTP id i17mr129944wrv.151.1571856015308;
        Wed, 23 Oct 2019 11:40:15 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id 26sm5486wmf.20.2019.10.23.11.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2019 11:40:14 -0700 (PDT)
Message-ID: <5db09e8e.1c69fb81.dc6bc.0084@mx.google.com>
Date:   Wed, 23 Oct 2019 11:40:14 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-rc4-2-g459f7cb9a3b9
X-Kernelci-Tree: linusw
X-Kernelci-Branch: fixes
Subject: linusw/fixes boot: 39 boots: 1 failed,
 38 passed (v5.4-rc4-2-g459f7cb9a3b9)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes boot: 39 boots: 1 failed, 38 passed (v5.4-rc4-2-g459f7cb9a3b9)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/fixes/ke=
rnel/v5.4-rc4-2-g459f7cb9a3b9/
Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/v=
5.4-rc4-2-g459f7cb9a3b9/

Tree: linusw
Branch: fixes
Git Describe: v5.4-rc4-2-g459f7cb9a3b9
Git Commit: 459f7cb9a3b90b1574acc001ad1f6bf5bb748ac7
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 34 unique boards, 12 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          meson-gxl-s805x-p241:
              lab-baylibre: new failure (last pass: v5.4-rc3-6-g75e99bf5ed8=
f)

Boot Failure Detected:

arm64:
    defconfig:
        gcc-8:
            meson-gxl-s805x-p241: 1 failed lab

---
For more info write to <info@kernelci.org>
