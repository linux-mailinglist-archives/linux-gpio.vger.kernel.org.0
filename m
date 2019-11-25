Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4725A108F75
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Nov 2019 15:00:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727969AbfKYOAB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Nov 2019 09:00:01 -0500
Received: from mail-wr1-f47.google.com ([209.85.221.47]:46803 "EHLO
        mail-wr1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727947AbfKYOAB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Nov 2019 09:00:01 -0500
Received: by mail-wr1-f47.google.com with SMTP id z7so14727934wrl.13
        for <linux-gpio@vger.kernel.org>; Mon, 25 Nov 2019 05:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Or05peq1dlGJ0+sZ8Gq1YrTFYNKwEazvi+MrQLaQseU=;
        b=ZZhmyLvXrHj+VQSxXtTmK1+GRolwiw79RqCmTlSlyYFV78l3JvPsFeUaK9qAg2jN53
         4UioD+7ao9yFgCBipWU6ABT/3e9HO72Y8OT/mIkc1AoOTmRy5p4k8AVw48JKemXsfdpA
         oZA8Ki4P5NReFzjDDgx1xZ/Az8AtZtdGP0gOHKbBkfJNw6VeF2+13AQj1h9aMwmRbRJp
         awUBzgmivrr2Y04pllsKwt9mXiHewVjKVmN4B2AMX77Ja7pk1TIuMX0Cj9KbTbsXoOwb
         M4ABihdPB8nVW+YMyKJjeQ0axTCWytIQwKITvPxE0C8gYjb5vYDFEHZaDhP/KdDVzA6K
         gqqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Or05peq1dlGJ0+sZ8Gq1YrTFYNKwEazvi+MrQLaQseU=;
        b=rzGIneskVRUly3hIGQssgchrwGQDVnuv7mbOJdlMyfJGSH3dtDcaAnvtf4GCFBmJ2R
         geApwrHNveSFMGMfAHKSYJE8MQpAyPqXkTpEMxyKSiJSffFRgctHUykUyweOfi+5OxVy
         +yc0NKb/wHHGnPVvU9tRufrOdMBwaVG1ztDu3DUeUjZy5b4XxjgyUmClT4bcOlUGhITn
         VRtMm2Mdsa15kKCX92fvX9MBTtvkue6zsyzRgn/BwMMVK5l6u/nR+mC3SE+Mr0VQW2vs
         QI+4W/LSQBBaHdGr4Iexhbi3K72yQAJ7liPCaIKH/VTlCvkc0h6YE8B/3UETddcIgcrQ
         IPWQ==
X-Gm-Message-State: APjAAAUxMw+vpMfdJ74LD4BG1ANjinvqlIBRT1F/Ua0XADh1oYxnbgXi
        rtvsDU+FlX5W9M/dZaUTOyUMcmhiqZqR2w==
X-Google-Smtp-Source: APXvYqzD3sONVyxEs05rmLh36B6s3fq8dpvkoh2qMwTlVg4zUN6hBT2EEW0z2td/ZT3ZsPJmbVJ6LA==
X-Received: by 2002:a5d:4e0a:: with SMTP id p10mr31281594wrt.229.1574690398997;
        Mon, 25 Nov 2019 05:59:58 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id b14sm8541968wmj.18.2019.11.25.05.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 05:59:58 -0800 (PST)
Message-ID: <5ddbde5e.1c69fb81.c3f1b.b68d@mx.google.com>
Date:   Mon, 25 Nov 2019 05:59:58 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.4-rc6-133-g41c4616bb81f
X-Kernelci-Tree: linusw
X-Kernelci-Branch: devel
X-Kernelci-Report-Type: boot
Subject: linusw/devel boot: 52 boots: 0 failed,
 52 passed (v5.4-rc6-133-g41c4616bb81f)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel boot: 52 boots: 0 failed, 52 passed (v5.4-rc6-133-g41c4616bb81=
f)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/devel/ke=
rnel/v5.4-rc6-133-g41c4616bb81f/
Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.4-rc6-133-g41c4616bb81f/

Tree: linusw
Branch: devel
Git Describe: v5.4-rc6-133-g41c4616bb81f
Git Commit: 41c4616bb81ff9b2efd981453f2c5d8f57d0c0b8
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 42 unique boards, 14 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          meson-gxl-s905d-p230:
              lab-baylibre: failing since 3 days (last pass: v5.4-rc7-124-g=
d0d9531e38a6 - first fail: gpio-v5.4-5-120-gac72719b626f)

---
For more info write to <info@kernelci.org>
