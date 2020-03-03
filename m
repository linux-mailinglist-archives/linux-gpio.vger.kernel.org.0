Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FB20177BD6
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Mar 2020 17:26:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730150AbgCCQ0l (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Mar 2020 11:26:41 -0500
Received: from mail-pl1-f181.google.com ([209.85.214.181]:37240 "EHLO
        mail-pl1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729438AbgCCQ0l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Mar 2020 11:26:41 -0500
Received: by mail-pl1-f181.google.com with SMTP id b8so40477plx.4
        for <linux-gpio@vger.kernel.org>; Tue, 03 Mar 2020 08:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=06QIyXPS56HKb1Smrkw992prWdLMrZW65C1iPlpp8IY=;
        b=XLtMWKl8/FmMFU+Hgk+cHZ9AkjF1BtJwPyUa+WvhHvK12IvPaBIdwYgQ5KFZPS29AS
         0ATlURoS7NutSR5bvaK3fbywJFkRk0MWltVNuLTLFsyOL41kcG7Y9AJRHwIuKpXCOO/x
         TePQ2XTs394tlLKezA00OUEbPJwM6JEBz8CEJiMKMRxjgOWyLyCGoNbEhrguEnGIYYms
         P6b4NJyy+qrIsIspaOTPrm5lu9Jni5uM+i7vZHVFARJcfcGBoYJOqozak9p4SYzDTe6r
         GUmHQBhJRG9yH2lgzU9mKzcSTddHw5ZA19x/+6GZUrUgMJiJL3QHsXWzyhfhEvsQ26xO
         gQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=06QIyXPS56HKb1Smrkw992prWdLMrZW65C1iPlpp8IY=;
        b=pbPLL74+bCCDOcq/44ktn5QeL/lhArcPdWhtWDZjOkzd0datMb0zlTRHbEh8GfAnV9
         wkIx+MnCoPAZRk6+1Nfnv1gJGr1uX6k5vszpuTiRtLqMVz3rQnQhQhqB43BIe3I653aO
         KQ7x/WSD439r6nXnjveYf1oSCdkdc7ffaVQOHCjUQsDJGhm981RjI8rLFjjZSU9UChJn
         JH0tbU86b5a7Eg6uxV/kC4jhFrIAQzpKG7saI+/IjqxJBakokYZBvb/eJKbSCDILuV6W
         FNz5gYiFGFEX+FbF0dRHOT2qdDwTLDom7KOwOzOTaK92yGhLsp1LLe7WGW/ipPGZcqe8
         +fbw==
X-Gm-Message-State: ANhLgQ3hCL3WEZGhsygQtuwI8nkgYp6QeN9c0CMIelhdpzIohysxvjfc
        VHtCMv9K/oWowzvK7PryZefkATrxYFY=
X-Google-Smtp-Source: ADFU+vutG73ZwvLdy2P5qlWTfFjUeVbS0m1rGhf4QSuoVX3FwV2dPe3e9WmWAoJb2JwEdInFCGJZBg==
X-Received: by 2002:a17:902:aa05:: with SMTP id be5mr4731584plb.142.1583252798198;
        Tue, 03 Mar 2020 08:26:38 -0800 (PST)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id r8sm3000788pjo.22.2020.03.03.08.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 08:26:37 -0800 (PST)
Message-ID: <5e5e853d.1c69fb81.28cdc.736a@mx.google.com>
Date:   Tue, 03 Mar 2020 08:26:37 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: devel
X-Kernelci-Kernel: v5.6-rc1-26-g5779925c23e1
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: linusw
Subject: linusw/devel boot: 32 boots: 1 failed,
 31 passed (v5.6-rc1-26-g5779925c23e1)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel boot: 32 boots: 1 failed, 31 passed (v5.6-rc1-26-g5779925c23e1)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/devel/ke=
rnel/v5.6-rc1-26-g5779925c23e1/
Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.6-rc1-26-g5779925c23e1/

Tree: linusw
Branch: devel
Git Describe: v5.6-rc1-26-g5779925c23e1
Git Commit: 5779925c23e1b9cc4cffb6dafe0b70a47beb364d
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 29 unique boards, 8 SoC families, 2 builds out of 6

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          meson-gxl-s805x-libretech-ac:
              lab-baylibre: new failure (last pass: v5.6-rc1-20-g869233f813=
37)

Boot Failure Detected:

arm64:
    defconfig:
        gcc-8:
            meson-gxl-s805x-libretech-ac: 1 failed lab

---
For more info write to <info@kernelci.org>
