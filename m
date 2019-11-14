Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17A7AFBD56
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2019 02:13:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726410AbfKNBM7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Nov 2019 20:12:59 -0500
Received: from mail-wr1-f49.google.com ([209.85.221.49]:43718 "EHLO
        mail-wr1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726409AbfKNBM7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Nov 2019 20:12:59 -0500
Received: by mail-wr1-f49.google.com with SMTP id n1so4511831wra.10
        for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2019 17:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=r1BGy1NNA5lOS6UZZYAsVC+4vAeJp0sAQrmFc7C9Eys=;
        b=wHlU0c843TTs2xa5XI4BXR9XLAlUtmOU0c33HzLygP7R6xPKVVjgeJUPosqxCxFpFP
         Y3TMZlDfg8veUltaIylASRLUGYl9/arrb65DDUTb/xb+jqdz4wiVsTKk7lFD0LjIWjRw
         /AWfAglhxcHz/QfPZtlWinD35Je6N1Dqs459sD4HPthxL294z0XARcNI59wLl8E2LJha
         ADUJYewdjmwQ7EaTLVg1yLutOHHlr6Tf4bn4gWPmiuawYm6XJNIp/8SkKi9IViFwXIyG
         sKqUp+IgQuunplhD5eJ1hmZ/aeme23ohRg4sAq8rXnwter2oz0abFbGWGHZiWd5lY+1Q
         6pnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=r1BGy1NNA5lOS6UZZYAsVC+4vAeJp0sAQrmFc7C9Eys=;
        b=bIVNOHdadkwBCY78iEYea7ODx34/qYGUTnNi3hR8gYb+LSrBO+/BSCgl+DqGqj2CVJ
         XWAIvJWcLARrPxqE25BMl94SyhjV3rn+9lHWcK2QGY1F5ev+tijDtVBiTq+Ii15rcO5y
         uI/jtP7enTZHYgb3AEncwX8iVmUPWB1NCpVEeGdcChzoxlFWPJmFwqbGiRh1txXwEJYX
         kDMMEeLjqk+zhxnHC2bk8gAldGmVk+1aXE+w6xEMlgNUaAUI2r+1Fo+JbhE+EpwFcTc8
         58vZAyoccR/t/MZvLo57fxq6dr/HR7mKijbEWEfgwEFok9R/vTCihxFQINcHUweLuh3C
         35fA==
X-Gm-Message-State: APjAAAXfU17IrCz0GDKdpmBan85egG2uZDSc+0GWLrK3UKeY/wD1bbdK
        OScND1ZNLjvWX/V5rrMrRwRGYsKt7UYShw==
X-Google-Smtp-Source: APXvYqw9Fv9cH8q6DZUa3o67wUzyVkBN8/Zq+TvZjya0oWzUuLvyyYKYp2v6BB3jy76SFzxrZ10qNw==
X-Received: by 2002:a5d:67ce:: with SMTP id n14mr5413281wrw.67.1573693975360;
        Wed, 13 Nov 2019 17:12:55 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id x9sm4934700wru.32.2019.11.13.17.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2019 17:12:54 -0800 (PST)
Message-ID: <5dccaa16.1c69fb81.685e7.820f@mx.google.com>
Date:   Wed, 13 Nov 2019 17:12:54 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: fixes
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-rc7-5-gcbdaa5e7bd90
Subject: linusw/fixes boot: 31 boots: 0 failed,
 30 passed with 1 untried/unknown (v5.4-rc7-5-gcbdaa5e7bd90)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes boot: 31 boots: 0 failed, 30 passed with 1 untried/unknown (v5=
.4-rc7-5-gcbdaa5e7bd90)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/fixes/ke=
rnel/v5.4-rc7-5-gcbdaa5e7bd90/
Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/v=
5.4-rc7-5-gcbdaa5e7bd90/

Tree: linusw
Branch: fixes
Git Describe: v5.4-rc7-5-gcbdaa5e7bd90
Git Commit: cbdaa5e7bd90db9980ff6187baea9d49fc4de960
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 31 unique boards, 10 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          am335x-boneblack:
              lab-baylibre: new failure (last pass: v5.4-rc4-2-g459f7cb9a3b=
9)

---
For more info write to <info@kernelci.org>
