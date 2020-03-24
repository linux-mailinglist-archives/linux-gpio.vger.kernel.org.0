Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 458F6191C47
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2020 22:53:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727088AbgCXVv2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Mar 2020 17:51:28 -0400
Received: from mail-pj1-f67.google.com ([209.85.216.67]:54312 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727270AbgCXVv1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Mar 2020 17:51:27 -0400
Received: by mail-pj1-f67.google.com with SMTP id np9so117735pjb.4
        for <linux-gpio@vger.kernel.org>; Tue, 24 Mar 2020 14:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=f8ifmLm2PBzOvFo+acPnWP/PHXxW2mGmMaHLPW1Q20Q=;
        b=wQSnSYaFHPD4S9laXI72VKDKUv9NDqaPWKPI7KajFp8n1tUHmOQPLHBLApgCLFW1cn
         xMq8ZDgtfGdaqH+hv5NsInddshE6VxZoAai4+7ZtEqkSNPMjksI8yvEUQSIYUXxT6PWl
         Y3EYGhOcp74VDWxz7UaepZHVXpT0Z0F9chEJMxBmtD5g5+kYAdSyrnVSoSBVOKoGeGAN
         UWuAtfQk3Ny1IiulTcZiT+MxvxfgwYZ/T/W/7dxphIEQVvmYD/kkg49BUv8+Q3biGN63
         eU9FxEN491KHO/kYDFnAHq5kE6X/1vhNR8mx60zWpfCeCVc90jI8hJo5vmiDMhARXU/h
         OdXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=f8ifmLm2PBzOvFo+acPnWP/PHXxW2mGmMaHLPW1Q20Q=;
        b=OfI9kKi0LHGgcv1dIkElTZHl/0NU4+8B8kCJPohMzjnBBGDEcgSoL8Qendv/Fc8rAE
         cjyH0BUhZqjxk8ZOV3qC4IfDoK0xQIa2jL3YJQJ2FX1ivw9INa2r179LcIU9yjBx6X+6
         BIXDMMjy75GFy4kqLmwLPHU8Wa1J3tBinIlvsZx5MqXn/G73juLgWa6+87sNRBN4wu80
         8x83CT3GRhANNRqYvjnVi/TjGHJx/ihxlkz5AaI/KSW72QNT0jJ420AwD83VKxR/fEHF
         Huw7DbA+NJiriFDl9czhq0dD3yW7uMJaMZjORtmyNik/bQ/ol3oVsUh07Zo3z0gjd9hD
         7/jw==
X-Gm-Message-State: ANhLgQ0e/TMCmFf4xZMpIUZSClcTSVEQ8EaPFzDNmEvPbjjljJZTXIgB
        eeA0oi29Mz9Ra061Y3gkdeyYFZAFWBE=
X-Google-Smtp-Source: ADFU+vuwtZ9CsECb5HeHp1fZf2gaDrcy5XnQHYAn8iC5WeH984mxIXNxY5iW5RkjnHznTMxsodVQEQ==
X-Received: by 2002:a17:90a:a005:: with SMTP id q5mr7961084pjp.33.1585086686309;
        Tue, 24 Mar 2020 14:51:26 -0700 (PDT)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u3sm3059349pjv.32.2020.03.24.14.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 14:51:25 -0700 (PDT)
Message-ID: <5e7a80dd.1c69fb81.6b19.d2d5@mx.google.com>
Date:   Tue, 24 Mar 2020 14:51:25 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: fixes
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.6-rc3-5-g0c625ccfe6f7
X-Kernelci-Report-Type: boot
Subject: linusw/fixes boot: 63 boots: 2 failed,
 61 passed (v5.6-rc3-5-g0c625ccfe6f7)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes boot: 63 boots: 2 failed, 61 passed (v5.6-rc3-5-g0c625ccfe6f7)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/fixes/ke=
rnel/v5.6-rc3-5-g0c625ccfe6f7/
Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/v=
5.6-rc3-5-g0c625ccfe6f7/

Tree: linusw
Branch: fixes
Git Describe: v5.6-rc3-5-g0c625ccfe6f7
Git Commit: 0c625ccfe6f754d0896b8881f5c85bcb81699f1f
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 55 unique boards, 14 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 42 days (last pass: gpio-v5.5-4 =
- first fail: v5.6-rc1-10-ga924eae75106)

arm64:

    defconfig:
        gcc-8:
          sun50i-a64-pine64-plus:
              lab-baylibre: new failure (last pass: v5.6-rc3-5-g1b26f3ba611=
7)

Boot Failures Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            sun50i-a64-pine64-plus: 1 failed lab

---
For more info write to <info@kernelci.org>
