Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E557385255
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2019 19:49:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388461AbfHGRtB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Aug 2019 13:49:01 -0400
Received: from mail-wr1-f48.google.com ([209.85.221.48]:45129 "EHLO
        mail-wr1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387999AbfHGRtB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Aug 2019 13:49:01 -0400
Received: by mail-wr1-f48.google.com with SMTP id q12so1965707wrj.12
        for <linux-gpio@vger.kernel.org>; Wed, 07 Aug 2019 10:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=gImaQby3yoH3gy/TjxICqeBf48PaHvN2W+2XPmqngt0=;
        b=XCWn2KFajmVRdapezDUVDATPTWNRUyssJljmErEDsBtZVpGtOKbg+6WVUIy7J9JZcU
         1i62r0F+W2CfdF31Z8WqHXCewwtJMOW5JmNb01QdpkgotfEjtdxAtrvDZJnWZBQVAjwc
         7gZyltkStY2AEoGgG+qJHnSYc0M0+M+quTYWpd6M49lD3cBYuxiriMhudKGW3OoeXt6l
         +ACU8kYE0/eB9wAqRzlO9ffFVYCEdJIdJUsVOFTIj7G+q6TDPtya29fNpB2JnGmHyucv
         6T01O1/rsTWPbW9tn4IU03D0W7ZAG8fRkKH8jr+mKvZZjeYqi+0V6cXkj6Cu9m4iEOr1
         uerw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=gImaQby3yoH3gy/TjxICqeBf48PaHvN2W+2XPmqngt0=;
        b=fIcweOm7VboNKMEu8GYLYLfFBLLOsJra6WELrBsV4SEl76dGjH8jhcH7za2d6nH/xG
         u840EGXtV4eGjWZPBZ8Q5/bLz1p1G0pW3Jm4hyxdtnLVAq40/jXYXmi9/NxiQPL2Bwvu
         +GGfbmC16mJKdpfxlQr+qrZfAoiXdmWT9Od0ZGyx+Eqp8oEEyX/dtPXnvppEvkZbV/aS
         5+OWJRT08iTXqk8kkaZMrKFhHpx7oVRUpw3CYAgIaA4H4c5/XcRyqjanUd+n5IvaSEe/
         PyT0Srop5+ckHvTerIDgeIYWT5UooGZcSsZ9s1gP26kbFNw3WgDO0IPPdPa734dhNvTg
         6CnQ==
X-Gm-Message-State: APjAAAU0ZRfjkzPzDki3r9ug9b99/mKr7pzErmhGqtYFA04QDRTjYe5N
        F24hYsGpWAEcfCUzbPrpMQg3sqaJjmYptw==
X-Google-Smtp-Source: APXvYqxrZcdnlVr+d7AySDJypIMifr1mQAfcr0k6wdcsOknT+o4R/fgQjD/nOi4Muu54XoJMnhIh9Q==
X-Received: by 2002:adf:fd08:: with SMTP id e8mr12734327wrr.147.1565200138622;
        Wed, 07 Aug 2019 10:48:58 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id c78sm1348469wmd.16.2019.08.07.10.48.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Aug 2019 10:48:57 -0700 (PDT)
Message-ID: <5d4b0f09.1c69fb81.37eaa.7c18@mx.google.com>
Date:   Wed, 07 Aug 2019 10:48:57 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: gpio-v5.3-3-20-g6926e30f09db
X-Kernelci-Branch: for-next
X-Kernelci-Report-Type: boot
Subject: linusw/for-next boot: 45 boots: 1 failed,
 44 passed (gpio-v5.3-3-20-g6926e30f09db)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next boot: 45 boots: 1 failed, 44 passed (gpio-v5.3-3-20-g6926e3=
0f09db)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/gpio-v5.3-3-20-g6926e30f09db/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/gpio-v5.3-3-20-g6926e30f09db/

Tree: linusw
Branch: for-next
Git Describe: gpio-v5.3-3-20-g6926e30f09db
Git Commit: 6926e30f09db0b77f5a3689c662d96ff85ef1a2a
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 35 unique boards, 14 SoC families, 2 builds out of 5

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          apq8016-sbc:
              lab-mhart: failing since 8 days (last pass: v5.2-10813-g88785=
b7fa74a - first fail: v5.3-rc1-10-gd2a561ae1961)

Boot Failure Detected:

arm64:
    defconfig:
        gcc-8:
            apq8016-sbc: 1 failed lab

---
For more info write to <info@kernelci.org>
