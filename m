Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3DB8132B5B
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 17:48:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728215AbgAGQsv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 11:48:51 -0500
Received: from mail-wm1-f46.google.com ([209.85.128.46]:35196 "EHLO
        mail-wm1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728173AbgAGQsu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 11:48:50 -0500
Received: by mail-wm1-f46.google.com with SMTP id p17so256940wmb.0
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jan 2020 08:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=+LdoHJvH1xWPwFqZkQmfWj6jKaF1WrHtXMDcUhcbwLQ=;
        b=XBSY/VyXxhPzhTkYLlqMbVeaepiV8HGOaCHFdgx/n1vOmqbTBxS52aL/6PFTzcrrcI
         VaCL7b+tQ3/9wnoiB+Slc97kK1Sw1R6eoLFqZBXXmKTrinvliFzdiBoaSDi05MYctY5A
         4171ORspixpH2JVBb2BhuKYaDSp7RRMcnHxLv+6wiY5mxhi2hT7w7SsIg62uXBTB5SBG
         hRRzTwArxbqixRk8RgEXI3xNiVmYfToJb9zHxNgpBFPh77/sBJgZa8FyIGMQNL8R/wkH
         TbDolNox90TVrqvR9zk8LYAwk8+0qXQVfbhqSmuvtqM7WR4G0gEONAif+VJrSql5vT/f
         tcxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=+LdoHJvH1xWPwFqZkQmfWj6jKaF1WrHtXMDcUhcbwLQ=;
        b=R0/cKZd+uK/sfiuErtJb5J9RDrqiikiGLxwYduG6lRKEaC2H7ykw4ldCEsW9PQBqv9
         YMRGccoLVvymcIEncJLJYiJXfzkV+mwghP0OZ64GxMeragdOnz6RTDGVpRLPZtiq5R30
         0iSgyGa/A5CkHcxr47Od99QRTI9ksqhgyn6MCd3IthyQCW4q7R5+gC4PCtjgxf26E5jE
         GK3Rw5D7L1KqqinmKW+sNxb1UIGwKjccIkOXzJVsoDLHIcPMivL16x+8ZbYVMOrNOn35
         7JX2yI+fZ7uGTs8DdKeR/JPNo7J/EyjBKXnl+9Q4SX8jGazlKsQ/pDRxf1IFVdI8xElH
         kWdQ==
X-Gm-Message-State: APjAAAWz36XiA08ukkTjxCcoxTUYZV1vIa0ZbNiyB93s25pY85VhxA4F
        Oox45fUuH4jtbUDxRMlV4Sis1K1Vf1FRvQ==
X-Google-Smtp-Source: APXvYqy8YjbrZjBb5DH2g1q/E04PEKwHrscKO1hBJGgmctk49A6l+vnGCq29c46jcoTqnO0LAtCegw==
X-Received: by 2002:a1c:4b0a:: with SMTP id y10mr42903556wma.78.1578415728495;
        Tue, 07 Jan 2020 08:48:48 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id z21sm232675wml.5.2020.01.07.08.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 08:48:47 -0800 (PST)
Message-ID: <5e14b66f.1c69fb81.c5500.15d7@mx.google.com>
Date:   Tue, 07 Jan 2020 08:48:47 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.5-rc1-28-g2cb81261a967
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: devel
Subject: linusw/devel boot: 55 boots: 2 failed,
 53 passed (v5.5-rc1-28-g2cb81261a967)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel boot: 55 boots: 2 failed, 53 passed (v5.5-rc1-28-g2cb81261a967)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/devel/ke=
rnel/v5.5-rc1-28-g2cb81261a967/
Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.5-rc1-28-g2cb81261a967/

Tree: linusw
Branch: devel
Git Describe: v5.5-rc1-28-g2cb81261a967
Git Commit: 2cb81261a967ee93825efc9af591d346eca51112
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 47 unique boards, 13 SoC families, 3 builds out of 5

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          meson-gxm-q200:
              lab-baylibre: new failure (last pass: v5.5-rc1-8-g6cc1d456812=
0)

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            meson-gxm-q200: 1 failed lab
            rk3399-gru-kevin: 1 failed lab

---
For more info write to <info@kernelci.org>
