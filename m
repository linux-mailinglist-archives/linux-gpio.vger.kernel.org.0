Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72BFE7D9F8
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2019 13:04:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728095AbfHALEj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Aug 2019 07:04:39 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:34983 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727498AbfHALEj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Aug 2019 07:04:39 -0400
Received: by mail-wm1-f65.google.com with SMTP id l2so62761165wmg.0
        for <linux-gpio@vger.kernel.org>; Thu, 01 Aug 2019 04:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=mKrjLrpSDmbXhQez083rwu5I2rW4+QNZZR0+EOr1Xo0=;
        b=N+KGrb6EVBtLeqFIH65huDKnJdSiuIuCkKQiCn3B02SRRe+sJuG+Ibe7v5vyZ2xD55
         yBHUfHfLCtdbFqItRFSTxtRe6Jz0Z3V3SFfZwF+/9cnNz/FPkmy6G8YK2GZZW5GV4KRe
         vJxqdqRiccjvMu2dIiueCiPgsvvhF0D0HR4m0mKs7iAZetW/IZBd5+x9R8Kc58ilbxGq
         z66KNtunJw81Ejrqtbh9LithxquPkjhJgfHKcphVua46k1QJJhA18LoPfNHiLRKA4/iD
         tUAg20rglQr0HJVGcmJuqyxmAbH42nLGS54KXKM9G58tVtzpRRzDb6nnlMOibPVOreSD
         FL+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=mKrjLrpSDmbXhQez083rwu5I2rW4+QNZZR0+EOr1Xo0=;
        b=GOtJR7+B88I3JQTM3HhDU8zoWl3WwI8baYlbs2DCyCilUbY44pSbXT2+UE3JUqYagU
         bPNcrnfLK3SUV+SiOAfYpZ4qQq+4e6OBJGLbF4SE5Wl0s1nZlAuBZJv5pklHsqhsYZpb
         pquNvvvcEnmdQSf2S1mMvcVjmRbs4Z4wIJY7iYWeeoHtNwPwbqAzYo44lY6OLAtPBtHg
         YuiL9fAIEOu89koPHQ/wu1Y2gmzNcQ/XgV6VjahjMnyhlKnxSXAO5U6isb5ekLw4+Hta
         rqo8Gw43IiEptmDEIyLyMbdPjIbB3Fpjex8CMqS+kL9PhFl2NCW3wHFxgivCfSyXpdLF
         iehA==
X-Gm-Message-State: APjAAAVgdyBTwFxKu2wA7nppc4/FQdAXdA2PBlMAaHs7FHg18Kv3oQYr
        FIcs6h2uKPvDJbhTyamlpOeGdaHnDsI=
X-Google-Smtp-Source: APXvYqxmid0sCv4YkLQlIFOlPqCVCKuE+XVYvqW0xEOzH71E5CL/mRW4JRTwe4fZoeEwldetrX8l+Q==
X-Received: by 2002:a1c:770d:: with SMTP id t13mr42555158wmi.79.1564657477293;
        Thu, 01 Aug 2019 04:04:37 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id t63sm66293462wmt.6.2019.08.01.04.04.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Aug 2019 04:04:36 -0700 (PDT)
Message-ID: <5d42c744.1c69fb81.4e1ae.8fb7@mx.google.com>
Date:   Thu, 01 Aug 2019 04:04:36 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.3-rc1-9-g49281a222ac4
X-Kernelci-Branch: devel
X-Kernelci-Report-Type: boot
Subject: linusw/devel boot: 39 boots: 1 failed,
 37 passed with 1 untried/unknown (v5.3-rc1-9-g49281a222ac4)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel boot: 39 boots: 1 failed, 37 passed with 1 untried/unknown (v5=
.3-rc1-9-g49281a222ac4)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/devel/ke=
rnel/v5.3-rc1-9-g49281a222ac4/
Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.3-rc1-9-g49281a222ac4/

Tree: linusw
Branch: devel
Git Describe: v5.3-rc1-9-g49281a222ac4
Git Commit: 49281a222ac42724b94f6c874f43a284ec58d37e
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 27 unique boards, 14 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          apq8016-sbc:
              lab-mhart: failing since 2 days (last pass: v5.2-10808-g9637d=
517347e - first fail: v5.3-rc1-5-ga299726da44f)

Boot Failure Detected:

arm64:
    defconfig:
        gcc-8:
            apq8016-sbc: 1 failed lab

---
For more info write to <info@kernelci.org>
