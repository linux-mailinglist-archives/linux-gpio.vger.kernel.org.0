Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAC9C19C72D
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Apr 2020 18:36:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388760AbgDBQgz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Apr 2020 12:36:55 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:39375 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388555AbgDBQgy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Apr 2020 12:36:54 -0400
Received: by mail-pl1-f193.google.com with SMTP id k18so1536795pll.6
        for <linux-gpio@vger.kernel.org>; Thu, 02 Apr 2020 09:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=TJOMjjniMSWTO/xOdxWa4/dFJrpRBJpkrgfdUZs8ePE=;
        b=jU3NOMVIJCJTrCuVuyPKYJmq5L6aNbBaR2jP/rIoXDnLPd3itYovMYbPRIwFKePQGz
         FP78o/Hg0lnfzyj4jYUiyiZwsQxxThy8CQMTkIwASub9IAoU2C++i+D/pDIYAObiP4WY
         xpY6RnoalRp4gAGSskwMLpLUcSguyG6uaAssiUHpCRu+a6f2o1xyXbb1k2+VT9n+Oug6
         zwBa5bSiYIOik76Pq0Z0ygIB0FdPItmg1xCbxUnwj2Uqt14qViMcs5veeSG8MVGmOTDa
         qfSFa4JuckNDb5zvhdirINs6pQzCoUCmDjAbcY3g+CeU3rGecCtObl8e1f+TnOqG7UMi
         kRWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=TJOMjjniMSWTO/xOdxWa4/dFJrpRBJpkrgfdUZs8ePE=;
        b=JpJOZ238RflHWFckGEjJzn17LLCa2VENFRXV4qOYvcvTGOBr6aL3PuKaXBQ0/b1nT+
         YmEAfYSINxYPafhTX2HokIdSdmLUUO7oEdgbEosoqxIQO5y9p9kuFnCpe4Z+bD5eYCbP
         zwCorYE4In6veVPacBAXZ/YW5jDK6+s6iyJXoyQ52USPPjlvDFBjOecEKJsiR7ck8f+b
         HK83/Eb+UThRe99xFGzSp8x5ELHj4h1wbxKxKrrc96TRr5FtJVsia+ahG4FKd9P3vs7L
         Qr2iXJdKDhTFw1YFjTVfGfwdnZXsSgCSd1+DCg6X6cMe+BKTDQU6hsQ3aOkBMrAS2Yat
         JHHw==
X-Gm-Message-State: AGi0PuZp/XRDjiN4o3Vsw/Zhaqb17lvQJZd0pGXdR3PubzoQSihLukgz
        LkbMjG6ZHx3Jx+NkH9yCukM0O6La+qI=
X-Google-Smtp-Source: APiQypI0k8N+mhqzKBwdNhxcorT0eVYFn2gjuu2goV829+AFTDGXY9XFRomi17VLQX8ZTnkPfOu88A==
X-Received: by 2002:a17:90a:8908:: with SMTP id u8mr4973930pjn.66.1585845413351;
        Thu, 02 Apr 2020 09:36:53 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 13sm4099174pfn.131.2020.04.02.09.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2020 09:36:52 -0700 (PDT)
Message-ID: <5e8614a4.1c69fb81.4309d.3b8c@mx.google.com>
Date:   Thu, 02 Apr 2020 09:36:52 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.6-rc7-64-g4ed7d7dd4890
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: linusw
X-Kernelci-Branch: devel
Subject: linusw/devel boot: 65 boots: 1 failed,
 64 passed (v5.6-rc7-64-g4ed7d7dd4890)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel boot: 65 boots: 1 failed, 64 passed (v5.6-rc7-64-g4ed7d7dd4890)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/devel/ke=
rnel/v5.6-rc7-64-g4ed7d7dd4890/
Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.6-rc7-64-g4ed7d7dd4890/

Tree: linusw
Branch: devel
Git Describe: v5.6-rc7-64-g4ed7d7dd4890
Git Commit: 4ed7d7dd4890bb8120a3e77c16191a695fdfcc5a
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 57 unique boards, 14 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 51 days (last pass: gpio-v5.5-4-=
45-gd18fddff061d - first fail: v5.6-rc1-12-g612e35e76ec8)

Boot Failure Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

---
For more info write to <info@kernelci.org>
