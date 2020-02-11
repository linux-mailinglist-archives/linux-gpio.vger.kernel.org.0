Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 763C2158E8B
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2020 13:34:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728021AbgBKMeM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Feb 2020 07:34:12 -0500
Received: from mail-wm1-f51.google.com ([209.85.128.51]:54581 "EHLO
        mail-wm1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728001AbgBKMeM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Feb 2020 07:34:12 -0500
Received: by mail-wm1-f51.google.com with SMTP id g1so3306392wmh.4
        for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2020 04:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=xeN5oS+QmuGBXmcw3pScgHuHW0beiscDD9+eutDxlKs=;
        b=iUd9LHO9I07utTYsFNSuwa6NMz0B48g+bZIpLciz/rlxUT2/Iofgcmsxf5dVg9woIa
         NYAZ0eGH6LGJNn4o2zsan5SajRxferbpUZFIkcfVkpvcTCeurKT+clyHQEPDmuxh52xV
         brDcsMyeffuyYfySQBaAJJ7ZQjdaw+334i85W7BM1nUuGTVuwomUhPFfVRu+YIeRm5A0
         KEyGOPXrFHoUpbflXJAOVriT0OwxEStLAnMS3Vq4hx220dlU2nOt8Sh3i4oz/0gbyipZ
         XEPuz+h44ekbfo0cIX1qK2tKCoTr0p2frsUw5Msq9Sr246IVTASsKVJaagjPnflVU8FG
         FTIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=xeN5oS+QmuGBXmcw3pScgHuHW0beiscDD9+eutDxlKs=;
        b=iOzRfT+t+VpcDQ4pWkoson9H1qlZexUfY2osFwJLMdoUcr1YJnhxIdx6WEEtra5MZJ
         NjgdvZqy2xQO4gX7ik26C1RDYWvrMHR7bUn8QR4GSI6omE6E1wLpyULVp7X59AGJvv60
         ecMD8uqt1w2F1rZbVUrvU78maPjeGRvste+xsV4a3a8Rad1vG9/CM1YQVXhVA+YIIloJ
         zAogWTdZuvfl4544LzupvvwtjPBPLPQ83bQAz7tMBAODUmLCkVizmqbDk7LQVrFcr8oy
         8TqwjMbKz+9oPBQGmZfLAx1271ySP5cR/3Np+nS3KfQy/dlZdNP1S4TgeLMrNWfVvj9k
         IUFQ==
X-Gm-Message-State: APjAAAXInw8yjkVtGxdtVLnXuivYdzemkicQdrPid5w5YvifUsG9Q224
        uyGZwOKudMILdy9C37ILDoVEspsC/5CVCA==
X-Google-Smtp-Source: APXvYqzDOcaD5G8x/Ec/fzoB0+2VJDusXYSSay1Ml8GoIzqwbX2OSe/+0wPINvKFgEkU50mnQL09sA==
X-Received: by 2002:a1c:6085:: with SMTP id u127mr5718478wmb.144.1581424450016;
        Tue, 11 Feb 2020 04:34:10 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id x7sm5235945wrq.41.2020.02.11.04.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2020 04:34:09 -0800 (PST)
Message-ID: <5e429f41.1c69fb81.62487.9485@mx.google.com>
Date:   Tue, 11 Feb 2020 04:34:09 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: fixes
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.6-rc1-10-ga924eae75106
Subject: linusw/fixes boot: 53 boots: 4 failed,
 49 passed (v5.6-rc1-10-ga924eae75106)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes boot: 53 boots: 4 failed, 49 passed (v5.6-rc1-10-ga924eae75106)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/fixes/ke=
rnel/v5.6-rc1-10-ga924eae75106/
Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/v=
5.6-rc1-10-ga924eae75106/

Tree: linusw
Branch: fixes
Git Describe: v5.6-rc1-10-ga924eae75106
Git Commit: a924eae75106258c0797706a0578c5af499c9ff5
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 50 unique boards, 14 SoC families, 3 builds out of 5

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: new failure (last pass: gpio-v5.5-4)
          omap3-beagle-xm:
              lab-baylibre: new failure (last pass: gpio-v5.5-4)

arm64:

    defconfig:
        gcc-8:
          bcm2837-rpi-3-b:
              lab-baylibre: new failure (last pass: gpio-v5.5-4)
          sun50i-a64-pine64-plus:
              lab-baylibre: new failure (last pass: gpio-v5.5-4)

Boot Failures Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            omap3-beagle-xm: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            bcm2837-rpi-3-b: 1 failed lab
            sun50i-a64-pine64-plus: 1 failed lab

---
For more info write to <info@kernelci.org>
