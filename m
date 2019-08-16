Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 984F28F7CF
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Aug 2019 02:07:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726047AbfHPAHE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Aug 2019 20:07:04 -0400
Received: from mail-wm1-f46.google.com ([209.85.128.46]:50909 "EHLO
        mail-wm1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726032AbfHPAHD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Aug 2019 20:07:03 -0400
Received: by mail-wm1-f46.google.com with SMTP id v15so2657525wml.0
        for <linux-gpio@vger.kernel.org>; Thu, 15 Aug 2019 17:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=t8AF/XT3LcygNjEK3yLK5EZsiamXYhYJ5X6d9ZXrQvw=;
        b=BDoL/H2QMZScAd6+9QVnjH6sBzlE/GvIhw08yjR/42Ri3Et92xOXLbe2RmLM9V81Js
         Xgwso6vLvdB5caDLcng1Zh8untNqpyXS67bGBOO+c/JdYabamcBiKGCUbqIwwt/wDYjX
         ASHSqLfxVE1fI6cYRbq6PSzZ3Ri1eZ+ruduMSEnnMMRAvOqxBmXNkkgO/CE36iLSPd4Z
         7Bmka1P38XLEbxTA0VyjSdsLcAEuFPzWEHP2D1wbSi2ybgnmapSCXlBJOpwbX1Q7DdlX
         GuPVxAQUFSDG+4bbKYyQibOWTvJ3Gz56zo1R1VXgPWScGgtyipDBRmqBgJNkcihVya6n
         yQ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=t8AF/XT3LcygNjEK3yLK5EZsiamXYhYJ5X6d9ZXrQvw=;
        b=W8lQ63X25xbQoiVNWI8P/xfvSWk3D8+7Kr5jvgzgREmHRin2lnlZ738nS88DnvYKbj
         LlZZ/XcfYDawffYSs4CiFHTlHm1rxqhwo8NuUH8D3i1rDUCliWkwjQT2zFpGvh3Eu01R
         IN+jvNKedDWk2TeuTlWBroPQZnlzgaQAu7dFVZBD1Q8sdx6ATVIDL9qBa0mT4eZDQX8o
         l87LTNRACEoo5Y8Zv4slh9ziOYS/cyk7Ja0B1bBjkDlsJNrEDoHGs6RdxCmKT3sOcy7N
         NzNmZ5yijj93UBINnwJsONB+diPw8dFkobWwZg4PpV6U4D0NWESrWxHs+XvOOrVYJ9QH
         XsEQ==
X-Gm-Message-State: APjAAAVmMvstvtnl8jdEXxseDRtHGRrKRXkvPzPECM41vYYfwqgtwhFT
        fSUmkHoS4ExLLnPxfFwNhHkJZGl2cPIlOA==
X-Google-Smtp-Source: APXvYqxN7bawrIFyaEJehgm9Nr0BmygxGiwBfasx1l80G2EQqo8Q+gM23fQy7W2dhgZQi6j+VsejHQ==
X-Received: by 2002:a1c:f914:: with SMTP id x20mr185065wmh.142.1565914021691;
        Thu, 15 Aug 2019 17:07:01 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id n12sm2247870wmc.24.2019.08.15.17.07.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Aug 2019 17:07:01 -0700 (PDT)
Message-ID: <5d55f3a5.1c69fb81.ea3b2.b55f@mx.google.com>
Date:   Thu, 15 Aug 2019 17:07:01 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc4-33-g02c05fd1775c
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: for-next
Subject: linusw/for-next boot: 55 boots: 0 failed,
 55 passed (v5.3-rc4-33-g02c05fd1775c)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next boot: 55 boots: 0 failed, 55 passed (v5.3-rc4-33-g02c05fd17=
75c)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/v5.3-rc4-33-g02c05fd1775c/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.3-rc4-33-g02c05fd1775c/

Tree: linusw
Branch: for-next
Git Describe: v5.3-rc4-33-g02c05fd1775c
Git Commit: 02c05fd1775c1c2e2a5be4ec3eec352e6538e3fa
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 39 unique boards, 15 SoC families, 3 builds out of 6

---
For more info write to <info@kernelci.org>
