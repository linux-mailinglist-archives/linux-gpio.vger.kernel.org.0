Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A592DF2B6D
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Nov 2019 10:51:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733267AbfKGJvd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Nov 2019 04:51:33 -0500
Received: from mail-wm1-f49.google.com ([209.85.128.49]:55595 "EHLO
        mail-wm1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726734AbfKGJvd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Nov 2019 04:51:33 -0500
Received: by mail-wm1-f49.google.com with SMTP id b11so1716150wmb.5
        for <linux-gpio@vger.kernel.org>; Thu, 07 Nov 2019 01:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Oy7CcMTVSwMDzW9n/HXCttc97JDGwNK+xSWH0rJWBXk=;
        b=Khq6LSHK0QP++3cfnD8hbxn9ku3T1qiLFS95re4DwnvzwCUCEUlkIfhdbLeKDjpL5n
         wLh1ETzl5lDSnC2rBUgYb3hzOuV9ICMY+JC8v5+ggLTCPhbKIsQywjaO2du0R+qyQune
         NtWeRAfXU4Z+y7u16KqfWlQ4fbm7Tk/b1vjqWDH5+UbfG2X6lusZHV48K8pe0mwJ5IwH
         dOozjMRX2zG/JB/+dwvvFa2DE0kZiJeLEIe4bIKgMfjTjqwVN6pM0TBeGLRmUiCjIwMM
         gX9Q2HVNuGfxO/rtdHkWLTFQ0f8DtX8WZlGfyDHA8caLz4VUpNVhUU9eCiCVU2Ij/sTB
         Ln7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Oy7CcMTVSwMDzW9n/HXCttc97JDGwNK+xSWH0rJWBXk=;
        b=hJARz0czLwE5yq+fC1YT3gDX15m2L+Sk7Ly9ucmgv9b3e8PwRZQzFS6nfKjoxC4S8B
         /9HjRxyE7ZLD7QQE5YWNFplkz3WNBSapM1+hCrHQYAiq0NeY4ZxJ1qn0LKO34yiLSvVp
         KbMbdNPE1NaQQE9OuHTXbf4H4X6Tp4jKcbVC0yP4qWtfzHtlQrhOrM7zP9jBKcNf6iMV
         d99EfAJ2180TkISWXedyzzdXxG5t4ZcH1YsD6tUZj+6xq3Z6uFQFQUCogSgQyYDemsb/
         RXL45ojrnrxMfSMmigODcq9noXmyKo+Zdw5eZNlIy4TDQh8Z8nxfp0Me3cs+G0tZzDBb
         tFhw==
X-Gm-Message-State: APjAAAWg2OFpLWnoVMBdV2OZ5fybdtcEXaFJrLyqeBnEioo0CH5hA0Cv
        kZ/I4M5f0lEnP2sZDovsJJr45SufTRec2w==
X-Google-Smtp-Source: APXvYqz87+y1R3qLKH53vFIopSBV4kb6VEXFnUVc7eP+guJuiqpMNj+m8ZUds3Pqgb59v2UzoBmnoQ==
X-Received: by 2002:a1c:152:: with SMTP id 79mr1909544wmb.70.1573120291413;
        Thu, 07 Nov 2019 01:51:31 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id w132sm3092247wma.6.2019.11.07.01.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 01:51:30 -0800 (PST)
Message-ID: <5dc3e922.1c69fb81.cb92a.fc33@mx.google.com>
Date:   Thu, 07 Nov 2019 01:51:30 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-rc6-34-g5d682fa3d894
Subject: linusw/devel boot: 36 boots: 0 failed,
 36 passed (v5.4-rc6-34-g5d682fa3d894)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel boot: 36 boots: 0 failed, 36 passed (v5.4-rc6-34-g5d682fa3d894)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/devel/ke=
rnel/v5.4-rc6-34-g5d682fa3d894/
Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.4-rc6-34-g5d682fa3d894/

Tree: linusw
Branch: devel
Git Describe: v5.4-rc6-34-g5d682fa3d894
Git Commit: 5d682fa3d8943c19a632ebeaf70e8b9e41c78a5b
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 35 unique boards, 13 SoC families, 3 builds out of 6

---
For more info write to <info@kernelci.org>
