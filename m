Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65C569F9C8
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2019 07:24:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726192AbfH1FYr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Aug 2019 01:24:47 -0400
Received: from mail-wm1-f51.google.com ([209.85.128.51]:54524 "EHLO
        mail-wm1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725951AbfH1FYr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Aug 2019 01:24:47 -0400
Received: by mail-wm1-f51.google.com with SMTP id t6so1295874wmj.4
        for <linux-gpio@vger.kernel.org>; Tue, 27 Aug 2019 22:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=bnb22byfh1TStWpZXmkGJorkRVI4Ainq1hvG5ZILo5M=;
        b=BV0ppBDMg964O9/BVjAB7u9AK00A5xXJWHvV4qVT+3Hqyn8tjXAZlpsxQmd/SOJ+v9
         ZLoxSc6ZhScPPAGbVsAo/2gGjWGW4pGpejOvzPpdO4OLURLUFhI8eWVsyOX5GfTNdnWZ
         TIFlkLBBfOj0sMSuMscGoycNlxxSdIzyOwg8I0fHQpU4APipltEe2NXd961PGckC/pox
         56XImp+kXIku90UU94GS81VBFM9Zr1/iCAIVEwBDpsLZ71Tyzv6iIaQyx318yxSpeBUv
         6A6E9il+r8qyRdiRBeh/tkqMB7MBUaWsgO7HNRnUFObY7eLLcyvi0fwTt7Bgup5G66J0
         Y5Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=bnb22byfh1TStWpZXmkGJorkRVI4Ainq1hvG5ZILo5M=;
        b=qeZyFkKBmUSV9E0G4M8rRY/Ha/chuYZMTQYBDaxkF8lmezQiUwtS/ikt1WjfCUwqZO
         D84hDHkqj336184qyOp9dBoE0iF76sslz7R/2ki+LGkkR92Kx9z0oWM2RWqbTKMjFGNt
         16nzzZMSUCTOqgtTFT6yQ1gbbUQJUj2les3BZON/LGVnzQ4UuC8meZPbWgAPOKf/duxq
         bHuz3d1ndkAWzAdA8oLj+IamFVdW65tf+P51YEXbTWdmIfwYeuO7RKDnn26AgHakcYo+
         gmBtY+u4HMRxbQu3whL4ePAhFjKobxn/dBOjHKoZMJ6syIAbW60CSUfyO648cmFdcrwl
         uWQw==
X-Gm-Message-State: APjAAAVVBXDZpN9DAyHnKh06Rb4xk5Y1PAKrOTdK4+yBkZVnfhxrQcUo
        KfC3xkf/TqyPZSLd681pl4lmSBKevEOCDw==
X-Google-Smtp-Source: APXvYqxWNUOruGb2TvX83S2fUWGAdVR1ewhwn/5QBPwZeVkIA8pOSru6JlTeEqK6zJbvlR5rtNJTtg==
X-Received: by 2002:a05:600c:2056:: with SMTP id p22mr2248859wmg.155.1566969884982;
        Tue, 27 Aug 2019 22:24:44 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id r4sm412279wrn.79.2019.08.27.22.24.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Aug 2019 22:24:44 -0700 (PDT)
Message-ID: <5d66101c.1c69fb81.ab2ea.1be7@mx.google.com>
Date:   Tue, 27 Aug 2019 22:24:44 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc6
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: fixes
Subject: linusw/fixes boot: 52 boots: 1 failed, 51 passed (v5.3-rc6)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes boot: 52 boots: 1 failed, 51 passed (v5.3-rc6)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/fixes/ke=
rnel/v5.3-rc6/
Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/v=
5.3-rc6/

Tree: linusw
Branch: fixes
Git Describe: v5.3-rc6
Git Commit: a55aa89aab90fae7c815b0551b07be37db359d76
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 37 unique boards, 15 SoC families, 3 builds out of 6

Boot Failure Detected:

arm64:
    defconfig:
        gcc-8:
            meson-gxm-khadas-vim2: 1 failed lab

---
For more info write to <info@kernelci.org>
