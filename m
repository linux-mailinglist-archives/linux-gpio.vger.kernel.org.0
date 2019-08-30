Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAFD5A3CCF
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2019 19:15:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727809AbfH3RP0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Aug 2019 13:15:26 -0400
Received: from mail-wr1-f41.google.com ([209.85.221.41]:33055 "EHLO
        mail-wr1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727434AbfH3RPZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Aug 2019 13:15:25 -0400
Received: by mail-wr1-f41.google.com with SMTP id u16so7746824wrr.0
        for <linux-gpio@vger.kernel.org>; Fri, 30 Aug 2019 10:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=n7LMHMeT4RCwsRzpYTdm75HHNF4gea+PEQh1ZGPqoSs=;
        b=iNBiL+X5OV55oZvhtQM+ssxRNgF+NrYDpk1I0LQI6+QOQUIng3My5gq/cQjno4ZTDm
         kK6U9p+kY5zSnSiy97+7f8CqT4lNh/l1tuhYwS9PSW1OAeLUBzoIdT9GjVP0I+4O2YNp
         eg+x08nTFIC7PjoCAcXhjqhKx0d7YJ6RvGwdYrZRqxd9G0ka9rtjgBc3OxHpKLToTTZu
         3AZ0eyTucf2YnWz/PtpXIQzRTUYwLzLLaN2whWfpx87QTARkA5U+8amZaTqQDqkqgw54
         +U30Lvk4J7ayfDqN21AmEawjKT/pnGtiwl0E70sr4y4e26yu/KFAZB7dzH7u+jXb3Gm8
         ZusA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=n7LMHMeT4RCwsRzpYTdm75HHNF4gea+PEQh1ZGPqoSs=;
        b=sqW45WAj9hlz15wo9X2m4Gy+xO9p0UE+CN2WPioRicy8OwZiqoHx2dHbhNS0fp1ABD
         SD57jYiBbmd+KlWG08PEZUG00a8fV3u9KgR9b+uEu2zelGE+3CxX9T3Rb1TRNKOzNQad
         bYf2Fz5q7aXYo/cCg3z5Vn52rAGVR4PumkCt5eB57yUmI+ol6sJFhnQcqbwHXrfbXFpw
         TM9gxrUlIbjSi5QRumcZt5MvR4ia40UO5SVBO8ebDwRTyLZE6buF2ZHWBzdzbBR/OBQj
         Tf1tgXwYO29+LNZ4sMHQq9unh+xmltLUqQdVUWj1pBYR47Acy0Prz/pwdA0MxseB3JJO
         4SDQ==
X-Gm-Message-State: APjAAAW4we+tMO6vDDIRQFPoLeueLsfm2LZZbUaUioykb/VANmDeU8G6
        SBe5C3VgvKx3+N4P4uRdmizRclPoZEb5Vg==
X-Google-Smtp-Source: APXvYqy0E7FFIA+sIu0u3NOZtjh/7S4iXdAHA9fzZ5b13Qm9iZUv8v0LqGeYfHUCBja13glUQYVE+A==
X-Received: by 2002:a5d:528a:: with SMTP id c10mr19103584wrv.111.1567185323496;
        Fri, 30 Aug 2019 10:15:23 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id a7sm11689787wra.43.2019.08.30.10.15.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Aug 2019 10:15:22 -0700 (PDT)
Message-ID: <5d6959aa.1c69fb81.f31d5.6e83@mx.google.com>
Date:   Fri, 30 Aug 2019 10:15:22 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc6-3-g89f2c0425cb5
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: fixes
Subject: linusw/fixes boot: 54 boots: 1 failed,
 53 passed (v5.3-rc6-3-g89f2c0425cb5)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes boot: 54 boots: 1 failed, 53 passed (v5.3-rc6-3-g89f2c0425cb5)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/fixes/ke=
rnel/v5.3-rc6-3-g89f2c0425cb5/
Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/v=
5.3-rc6-3-g89f2c0425cb5/

Tree: linusw
Branch: fixes
Git Describe: v5.3-rc6-3-g89f2c0425cb5
Git Commit: 89f2c0425cb51e38d6b39795c08d55421bec680c
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 42 unique boards, 15 SoC families, 3 builds out of 6

Boot Failure Detected:

arm64:
    defconfig:
        gcc-8:
            meson-gxm-khadas-vim2: 1 failed lab

---
For more info write to <info@kernelci.org>
