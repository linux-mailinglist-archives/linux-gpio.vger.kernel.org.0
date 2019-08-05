Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 867B681A25
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2019 15:02:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726693AbfHENCM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Aug 2019 09:02:12 -0400
Received: from mail-wm1-f49.google.com ([209.85.128.49]:40725 "EHLO
        mail-wm1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726508AbfHENCL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Aug 2019 09:02:11 -0400
Received: by mail-wm1-f49.google.com with SMTP id v19so72947836wmj.5
        for <linux-gpio@vger.kernel.org>; Mon, 05 Aug 2019 06:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Ak/wlkgErtj57KG2gWrlU3VJ6IdLo9WgzYvhOM78kYY=;
        b=mgjNY8Sk6rr+qUbQp0GDc+jRLgO8+YUvoaJkwz3BZ+sahiLC8iLWqSZdn+sGfbxyPj
         X1cm+2uB3KPlOlfN1G7LJ0cIQNpLzyyJwx+qFIDaHMSVb4Af/VAtNiYQ49VlBQiz/epN
         Pc4cdsvWOAMkdCEvUx8eMy58HuBT+bzPc9d8xxpJRJYaAf/qsHyPRWMfB8csWARvVufH
         V8wFEBMQEBndxPICq2t3j4BVBAPbK1poAB0PDkCHV2N8ZVa4sSAU+ai77HRhUETMW5D3
         7xtfFItYf4pk9nX69JhcEs8rcfEl41YbBx1jZVZgF5TD+sBAyLAz91XOJSHZl+6B7tEk
         w89g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Ak/wlkgErtj57KG2gWrlU3VJ6IdLo9WgzYvhOM78kYY=;
        b=ArcGHzgsqaphI9WVMRf73fDG9sbeAwfEMYUTyYzl8BXc1ucSPDX7lDqX1bDA8LLdgK
         5EvSs+khBjEVDnPDP+5swCVZ8z8LsOdMelm220i30FT5VpCqUw8nb4owMXhuh09wSy7g
         /7kqAls2MR0qWH75N4NhsYRkzQCb57UOXX3QCHfjELYIqSJmG+qZSfz61VcjQbaQrg2U
         Ne9euTxxDY74b1Q6prb626ko2CZXCIMSb3Aen/FM2DX8wyrCHVyCB6iHzHnS/gwrWlZu
         J4ZN7SpHGnSST0x+ymaXpdMB4b4CgiKDTR7KXSmpiKB52G5LjMdOgQAoshNyXPJ+KpPO
         5lBA==
X-Gm-Message-State: APjAAAWkeQmsmX4uV1nUh8zj3zxtZ/vPTfU7MPxLSptv5DH36nwS7C+x
        Lms2DLq29MxiHtXzhaknZ3TjLyK+kS2/ZA==
X-Google-Smtp-Source: APXvYqyqXT5YSQQvgRhypBHbZ73TxmefymxxQPwr5LiBVaBqWSVvt6MyGIwzpidUFWpiBmhiFeHdgg==
X-Received: by 2002:a1c:9c4d:: with SMTP id f74mr18509065wme.156.1565010129728;
        Mon, 05 Aug 2019 06:02:09 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id c65sm86502247wma.44.2019.08.05.06.02.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Aug 2019 06:02:09 -0700 (PDT)
Message-ID: <5d4828d1.1c69fb81.faf79.e5fc@mx.google.com>
Date:   Mon, 05 Aug 2019 06:02:09 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.3-rc1-17-g15bddb7d787a
X-Kernelci-Branch: devel
X-Kernelci-Report-Type: boot
Subject: linusw/devel boot: 43 boots: 1 failed,
 42 passed (v5.3-rc1-17-g15bddb7d787a)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel boot: 43 boots: 1 failed, 42 passed (v5.3-rc1-17-g15bddb7d787a)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/devel/ke=
rnel/v5.3-rc1-17-g15bddb7d787a/
Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.3-rc1-17-g15bddb7d787a/

Tree: linusw
Branch: devel
Git Describe: v5.3-rc1-17-g15bddb7d787a
Git Commit: 15bddb7d787aebc837912cecf107b7eaccf03913
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 30 unique boards, 12 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          apq8016-sbc:
              lab-mhart: failing since 6 days (last pass: v5.2-10808-g9637d=
517347e - first fail: v5.3-rc1-5-ga299726da44f)

Boot Failure Detected:

arm64:
    defconfig:
        gcc-8:
            apq8016-sbc: 1 failed lab

---
For more info write to <info@kernelci.org>
