Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB23BA77E9
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2019 02:43:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726009AbfIDAnW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Sep 2019 20:43:22 -0400
Received: from mail-wr1-f41.google.com ([209.85.221.41]:33507 "EHLO
        mail-wr1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725882AbfIDAnW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Sep 2019 20:43:22 -0400
Received: by mail-wr1-f41.google.com with SMTP id u16so19328044wrr.0
        for <linux-gpio@vger.kernel.org>; Tue, 03 Sep 2019 17:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=NRw+DbwGKc5//DtM7Xy0VHucHaNTLEGvBho4ZJAcNbY=;
        b=LvfM/QYWKFi6HM/rLC5m/aege3UNT0b6BjQmwKpj5ELUlFgQRiCVatR5mhpRtxsHOD
         tb8SFA6Dt5DwNG9Kf8RStiv8EvT8P7YiwtD19KqrlOUMA8VPPpaPrPsOm9N1aVeGDaZw
         3+3Wig7KyvXFeOdAQhtvQlIL+JbVkPieAFvs+fw2EKw00inKnfMREfYpl5nMalkZ3fOD
         Sh8Qwi0hudj17DTRwKDqGIaadq9aqh7DEGdbXnS9bLRqRZhVDCXabmVfZL7y2+IHThz1
         3PHI20M1G8H+EASdflVBkktfeGjmJv0qc6ZA2kIJVzqeuu74VRsRX9M2Vbdnfqlwx7ZD
         Ve+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=NRw+DbwGKc5//DtM7Xy0VHucHaNTLEGvBho4ZJAcNbY=;
        b=WUnqe8B8NE9DFLanVs7u7qnVYXVAdO/KT0P145ohdv1sP8emI+bIC+EfBEuKf7B65Q
         5YtYmEmqv0boCtl27AViAr3f+pTMtF6CoSXDxB+0oD8nqz5+nmPhHFsO7kTAMl2MbCO/
         PCpm1AaIm6yBtRf6PNb8TfpViBq9LUAL9mOhXB2rb2ZrNpuGIjde8JARcW4R9o/ANiZ/
         PE/HJhbeQiFb2LjBmu/HHA2NjC0VTI1wuNdUaYcR+MWCchg3dpDgNKPn6hAsk3UC8msZ
         Gw20QB10h/WMds0k8xKQgqvvVkrnZKDyR6y4G0/GQJ1mkeFeX8IixurmxqDsJSZ5Ud3p
         Xw5w==
X-Gm-Message-State: APjAAAWBiy8XNecAuUG7YOKOEOa6Vy7wl/vc2MybzuyWD+d8S/v9TGVL
        o4hNzsPEpCcaCLQMRbmqLm3+JzvxHpdIDw==
X-Google-Smtp-Source: APXvYqwxgw0haY21SrqovXe7M0hxUKEBCFNG6fhhRp5blwXs7CSlngIMjQIpniHvuOrl6PwE/vXWiQ==
X-Received: by 2002:adf:9b9d:: with SMTP id d29mr27022099wrc.132.1567557800347;
        Tue, 03 Sep 2019 17:43:20 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id j9sm18380663wrx.66.2019.09.03.17.43.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Sep 2019 17:43:19 -0700 (PDT)
Message-ID: <5d6f08a7.1c69fb81.38aa9.f7bf@mx.google.com>
Date:   Tue, 03 Sep 2019 17:43:19 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc6-62-g0f40dd225a88
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: for-next
Subject: linusw/for-next boot: 60 boots: 2 failed,
 58 passed (v5.3-rc6-62-g0f40dd225a88)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next boot: 60 boots: 2 failed, 58 passed (v5.3-rc6-62-g0f40dd225=
a88)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/v5.3-rc6-62-g0f40dd225a88/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.3-rc6-62-g0f40dd225a88/

Tree: linusw
Branch: for-next
Git Describe: v5.3-rc6-62-g0f40dd225a88
Git Commit: 0f40dd225a8823102f558bc9f0b663e8bb4be32d
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 45 unique boards, 14 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          meson-gxl-s805x-libretech-ac:
              lab-baylibre: new failure (last pass: v5.3-rc6-51-g1fc4f3c962=
b7)
          meson-gxl-s905d-p230:
              lab-baylibre: new failure (last pass: v5.3-rc6-51-g1fc4f3c962=
b7)

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            meson-gxl-s805x-libretech-ac: 1 failed lab
            meson-gxl-s905d-p230: 1 failed lab

---
For more info write to <info@kernelci.org>
