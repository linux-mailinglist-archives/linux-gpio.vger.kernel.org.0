Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E50B419A335
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2020 03:16:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731577AbgDABQg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 Mar 2020 21:16:36 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:43315 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731470AbgDABQg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Mar 2020 21:16:36 -0400
Received: by mail-pl1-f196.google.com with SMTP id v23so8863317ply.10
        for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2020 18:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=slpcWniaKgjKO2xNBYPsvEZXz3PauxhVaCb4zo1hcbI=;
        b=Ko5ehZrYL9L7xCWWUZb10h4Snp3Hs2Xb5luN7vIFf/3RzTRH/HGHepbtUx6jtyF5UT
         z51yTll9h8tsIj23NS9sctb8cPCFEyfTf1hKom3xrAmGOQug0TCeaFcpcNzFWaL1hZmo
         YVP9XH+OntJaJ2Xct9uX2R3UMDy2+Lorufc6FqNKKenJmGQZPuh92lZrLuGml1iyXFD9
         qACe9+W15V/0g+ehjouNyo6uzBhQjYkE19dlodeeMmHCK831AgXK0sJ3Nj78yFpoDOzm
         OVwBdBKr8JEoNaKbfrPTZEWGDpjlK1/Dnl+vc/aT+McGfkst140hKSByw5wD7URX1qPZ
         iU1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=slpcWniaKgjKO2xNBYPsvEZXz3PauxhVaCb4zo1hcbI=;
        b=a7eXez5gqWACPLz8nJsL6BT+YfNY/vVUenUFdW/PrrHSK0lw5OF80zocZp6tuHYMrR
         1k2gNCvcG66vHJKvsoz1jJ6pqf2kTUhJ5Wjf4bLn4yFIP+wQA2vQGibxqL/Mn9i/TogN
         eHUjoiVzs+9M5oQXQZxZcSQbmmsaVC2MfmsrarDCq9Lt05/2Vc2DsWoHvOBSfVyhrD3u
         RHNj4W6z/jbkN3nZDi4PfnIFVuf41dipfXGdID2F0P8ECr4bdO9V5Anp4y4ACKU9cOIJ
         nVHdhzq7DXeGm1HLvMOb0EitqZXU0NQ+nSCqJL1RSKIsQJz5zh+CHZitIkf60Od9mRJS
         zyUQ==
X-Gm-Message-State: ANhLgQ0sTKDxep8N8LhNc4gHPclXvhR3Zcyv+RGsvI+le9PMp/3jyMAl
        SLp2b2yatnEsWOY1WDqXooNjDYTNcog=
X-Google-Smtp-Source: ADFU+vtpO24IjS8IMVIej8skiDW4ZsYSn2zVE5Pbl1CktZk/DtGDjKgYgcf0V988COtwBfsGCUNPcg==
X-Received: by 2002:a17:902:c193:: with SMTP id d19mr20385210pld.327.1585703794562;
        Tue, 31 Mar 2020 18:16:34 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d3sm273318pjz.2.2020.03.31.18.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 18:16:33 -0700 (PDT)
Message-ID: <5e83eb71.1c69fb81.30517.18b9@mx.google.com>
Date:   Tue, 31 Mar 2020 18:16:33 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.6-rc7-60-ge45ee71ae101
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: linusw
X-Kernelci-Branch: devel
Subject: linusw/devel boot: 55 boots: 1 failed,
 53 passed with 1 untried/unknown (v5.6-rc7-60-ge45ee71ae101)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel boot: 55 boots: 1 failed, 53 passed with 1 untried/unknown (v5=
.6-rc7-60-ge45ee71ae101)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/devel/ke=
rnel/v5.6-rc7-60-ge45ee71ae101/
Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.6-rc7-60-ge45ee71ae101/

Tree: linusw
Branch: devel
Git Describe: v5.6-rc7-60-ge45ee71ae101
Git Commit: e45ee71ae101bd271c3cd951cf66341dc8f504a0
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 48 unique boards, 14 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          am335x-boneblack:
              lab-baylibre: new failure (last pass: v5.6-rc7-58-g89ad556b7f=
96)

arm64:

    defconfig:
        gcc-8:
          meson-gxl-s805x-libretech-ac:
              lab-baylibre: new failure (last pass: v5.6-rc7-58-g89ad556b7f=
96)

Boot Failure Detected:

arm64:
    defconfig:
        gcc-8:
            meson-gxl-s805x-libretech-ac: 1 failed lab

---
For more info write to <info@kernelci.org>
