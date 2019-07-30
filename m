Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A55D779F57
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2019 05:03:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732729AbfG3DCC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Jul 2019 23:02:02 -0400
Received: from mail-wr1-f45.google.com ([209.85.221.45]:44523 "EHLO
        mail-wr1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729498AbfG3DCB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Jul 2019 23:02:01 -0400
Received: by mail-wr1-f45.google.com with SMTP id p17so63976750wrf.11
        for <linux-gpio@vger.kernel.org>; Mon, 29 Jul 2019 20:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=rOCDwCpQZ1zM4HZhc2IaTQeL9yLCxBqdODALTfw+sKA=;
        b=Eii6ga+YYKNOAki+fUUfzNoBl0IBT/UqLcstlzO4omOSp11zHW6FuQp3WHDuKpwcHV
         eCLyApb7E7OuZsUbWwv4mIrRC+1FlGBJGO7fopAsh76FRrEk5M+JcWPnxyOAlpDGhnI2
         GXJAtiMH4PRb0ontHSIa9X1SSpXDHTdu/d2l/Q8L/KESHRcq9nIh59zGX5G6KVAC0WOH
         p4svir9NlZ1ywsgCE5WuK+N9NICrmuQfX5QZtsK/FAzqWw734MvpG+k1kMacwYl9ygip
         0liK4WnQlyz4tCzCfzeFvJmgfMKERXjxx4sZ3Dgc0LfS6/e7ca7WE6syKvxSsLVsyONo
         1zdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=rOCDwCpQZ1zM4HZhc2IaTQeL9yLCxBqdODALTfw+sKA=;
        b=kfkS2wvONR+b7Sj78+vRNDGpIU1jdKaQMY+FwFypX/WuWeLYVsXySVrxJ+B6HKZXRv
         +Ws7Vr/U4WgLsv0WdU0bnZeY3ARUr0AJAtqrzzZiLzQzz+0/9jY/+3JT7/XBe4MhZNI/
         fOj9hhGRwm2HPaWXcYeJKdtKrqsf7IFQGw1+L+bWj6X4+HOqxnYJRlBnlZfnFqoZX7LN
         Tz+iG+MB7MzcGoVHa+9ocO0zlDDC+x5K1RD6lO8ngWz+suJ0HVFzepY6mCWwqPSFt86E
         HQj3CYtxVc/q9ANBwJ+P+1RAa4FzJNh2G7ZHQRe6glclDLGRSKZZmSpD4iQj7f42q5Mx
         nnWw==
X-Gm-Message-State: APjAAAWHYkgBYUFm+hFnjUd/DYwk3ayDmF4oD5N4+GxKwfKOveR3TxVd
        yqUUYfqqhVY7WSjbhia8hgkprXCylHw=
X-Google-Smtp-Source: APXvYqx88dKXfavbvZ2bJ7I10B8uYlhrCcfhxFEB/ww18jRgwvHR8Qju3uW/fcs8AocOiVqAHvrXUg==
X-Received: by 2002:adf:9ccf:: with SMTP id h15mr108965660wre.241.1564455719502;
        Mon, 29 Jul 2019 20:01:59 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id r11sm97337472wre.14.2019.07.29.20.01.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jul 2019 20:01:59 -0700 (PDT)
Message-ID: <5d3fb327.1c69fb81.7b0a2.f960@mx.google.com>
Date:   Mon, 29 Jul 2019 20:01:59 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.3-rc1-5-ga299726da44f
X-Kernelci-Branch: devel
X-Kernelci-Report-Type: boot
Subject: linusw/devel boot: 34 boots: 1 failed,
 33 passed (v5.3-rc1-5-ga299726da44f)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel boot: 34 boots: 1 failed, 33 passed (v5.3-rc1-5-ga299726da44f)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/devel/ke=
rnel/v5.3-rc1-5-ga299726da44f/
Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.3-rc1-5-ga299726da44f/

Tree: linusw
Branch: devel
Git Describe: v5.3-rc1-5-ga299726da44f
Git Commit: a299726da44fd679ce805aa80d7d6b559bac9874
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 27 unique boards, 13 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          apq8016-sbc:
              lab-mhart: new failure (last pass: v5.2-10808-g9637d517347e)

Boot Failure Detected:

arm64:
    defconfig:
        gcc-8:
            apq8016-sbc: 1 failed lab

---
For more info write to <info@kernelci.org>
