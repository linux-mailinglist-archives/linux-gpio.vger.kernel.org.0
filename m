Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B730F11FA49
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Dec 2019 19:08:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726148AbfLOSIy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 15 Dec 2019 13:08:54 -0500
Received: from mail-wr1-f41.google.com ([209.85.221.41]:45016 "EHLO
        mail-wr1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726219AbfLOSIy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 15 Dec 2019 13:08:54 -0500
Received: by mail-wr1-f41.google.com with SMTP id q10so4455073wrm.11
        for <linux-gpio@vger.kernel.org>; Sun, 15 Dec 2019 10:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=s56OtyTK5QaV7tTuEIqSWARZQn6dLi8Kx252y19u4Rg=;
        b=r/qHeqn5BG1XSg3yI+wDJvQoM/bTdjeTokluwTjT6rHdmPnuAI9nhhHdy7BaIjtKt5
         1gQV57Z002w+pUqSSo8u6zdDLQ2OahWLCmNKeHsUEzQaLlhfQgPglghV6WuLwslnk+PE
         sUHyTZU9AYGwBfcILRqBfXtkcmvk2A76CVTbF4OVV2XpJjqRozRqpQF7vdWsYymBNW1C
         TxpLjBMCcVQRFH6SWJWCuGClscbHZbyWMlO5T8uKSsytQmY/X/uCoxY2jSkS6PPt/vYE
         D0QpAHF3UOG+beAW5q47YkBo5uG2txQXoSzKEq2fpXqXmvx9k+Z9Knsb26gV+GmFkJLx
         JY1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=s56OtyTK5QaV7tTuEIqSWARZQn6dLi8Kx252y19u4Rg=;
        b=MVAvq2YP1E1AabcGbLkBJZrbhgwkh6E2/wIYJbxXNks216w7+oMXOkexAOzYke3Do7
         53PBomMaL3Q3Nq5qessy0nSQ4iq68ZAPlDOMCdXEUFeh172M16QDeEv4JCp+jZDxCzab
         SIPubdLr9PLOct9bMKvJpbIoPuZq+JfqTX6pYRubbonLxynseThPLOeTC3dGB4REIpCd
         5uBZfRnAPsDTlRcEIKUw1iD5eTofNQKpLOi+KdBMVzcRY/NfzGSe9ltSsNCZpM8cVQzo
         9bQzATD6+6rzZSiGRN3o7NheiPEt7o3y0z13bIE8yNILRypqIR9aq3TuOHMmAAIWZFAY
         KF+A==
X-Gm-Message-State: APjAAAWSA/k56yx8emH+LdHw32m37JyYa0vuGVHhBYpzyFmZC1vAPrEG
        aZVp5CcjTnJvPbl0tYlzqRpr5dn+MVk=
X-Google-Smtp-Source: APXvYqzBUzjOgTkWKS2NbbN33E7n3Wki6F3g5SaJcSxiL19ZCxqCppNar5wB//kDMTEPo2XN1RYgPA==
X-Received: by 2002:a5d:44cd:: with SMTP id z13mr25930258wrr.104.1576433332409;
        Sun, 15 Dec 2019 10:08:52 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id c17sm18146429wrr.87.2019.12.15.10.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2019 10:08:51 -0800 (PST)
Message-ID: <5df676b3.1c69fb81.2e3a0.f381@mx.google.com>
Date:   Sun, 15 Dec 2019 10:08:51 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.5-rc1-18-g65115d1733b4
X-Kernelci-Tree: linusw
X-Kernelci-Branch: for-next
Subject: linusw/for-next boot: 38 boots: 1 failed,
 37 passed (v5.5-rc1-18-g65115d1733b4)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next boot: 38 boots: 1 failed, 37 passed (v5.5-rc1-18-g65115d173=
3b4)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/v5.5-rc1-18-g65115d1733b4/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.5-rc1-18-g65115d1733b4/

Tree: linusw
Branch: for-next
Git Describe: v5.5-rc1-18-g65115d1733b4
Git Commit: 65115d1733b469fc7026115b319541b8887b12b5
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 38 unique boards, 10 SoC families, 3 builds out of 5

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          meson-gxbb-p200:
              lab-baylibre: new failure (last pass: v5.4-rc6-133-g41c4616bb=
81f)

Boot Failure Detected:

arm64:
    defconfig:
        gcc-8:
            meson-gxbb-p200: 1 failed lab

---
For more info write to <info@kernelci.org>
