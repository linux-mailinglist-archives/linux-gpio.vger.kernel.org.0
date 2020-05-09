Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F7C81CBC15
	for <lists+linux-gpio@lfdr.de>; Sat,  9 May 2020 03:18:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728470AbgEIBSK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 May 2020 21:18:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728165AbgEIBSK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 May 2020 21:18:10 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 432D5C061A0C
        for <linux-gpio@vger.kernel.org>; Fri,  8 May 2020 18:18:09 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id ms17so5080295pjb.0
        for <linux-gpio@vger.kernel.org>; Fri, 08 May 2020 18:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=pMLSSrW9E+CfLINQhS++NsUAz415FsIH4uNxPCtivJw=;
        b=0xwMTN5lEROyV36/5ez0ndz32b9b7+xqddpvwenEdyLW6HPrKYcmpojmXO44nauyYR
         CVeAW9Oc1GWwEIUXwqjlGbaFh7Jj1roynPEE9z6rWuBwHG5B7p0B64N6tvZfVks6Qbs0
         DNXFww/5/vBqdoEcuXGxLIkWABiAq1qlWEevvkvy04mY+a5OGmDLDVYEkcOyj1IJHZiV
         Nku2c8UIcuQtIPJ8inOOIaA/Y+HJujJTHCGFuLYLixCU2j3G0XI/0sccJPnqtPezjZZq
         yPnR3ouwfMt9qhXiuTo/ODPbyFQiLgyelKBp/ZEggrvwq0JcR9Q/P7ZgT+IaH2MO/SKy
         UGlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=pMLSSrW9E+CfLINQhS++NsUAz415FsIH4uNxPCtivJw=;
        b=bR91JssbrOlU+8Ts8hvXQQR08Vdi7+hgai46qTkfPehqVDDe3usCdj45/NDPR9Px/E
         J9z2smwsdqcVSTnEiggknRmV04/UHgn6sNIEBDGypdvx5WFB95P6EFYr3BkJYKaB7Dcy
         0ei83mXvDrChSZoxDUl54md460jTNDfsb35xyljwIEkr1+FNW3bzLeQ0bT2bPDTIToDj
         KC6CrkLW1EO2laKHNM4vmzWrvw6riO2nbVl8z4JyjpxlpPO84IkLLFBEpIwr1YQX2wYs
         4Zw3GuYxNVZm0ISWNjOcSnLcI270GtTcCJBGBDKv7cSDdARJfDNX9yxcxkj9/lperi+p
         Pgsw==
X-Gm-Message-State: AGi0PuYqZnkY4rQ/VMCx6nfjBSJIQ33JEiG+TRPh+bWSVtyqNou3Pswt
        IRFSp7oAb8PdM9McMlztYvpvSl2FusE=
X-Google-Smtp-Source: APiQypIl+153tqyaoH1jeaW4+gn0lKGK0X6T+0TZfdyDfF3NnFmBegUdc+So42hS0J2thyRuTcWywg==
X-Received: by 2002:a17:90a:d909:: with SMTP id c9mr3347772pjv.217.1588987088448;
        Fri, 08 May 2020 18:18:08 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id o1sm3433864pjs.39.2020.05.08.18.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2020 18:18:07 -0700 (PDT)
Message-ID: <5eb604cf.1c69fb81.f5c9d.d075@mx.google.com>
Date:   Fri, 08 May 2020 18:18:07 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.7-rc2-50-gaa0334bd4c82
X-Kernelci-Report-Type: boot
Subject: linusw/for-next boot: 45 boots: 0 failed,
 45 passed (v5.7-rc2-50-gaa0334bd4c82)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next boot: 45 boots: 0 failed, 45 passed (v5.7-rc2-50-gaa0334bd4=
c82)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/v5.7-rc2-50-gaa0334bd4c82/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.7-rc2-50-gaa0334bd4c82/

Tree: linusw
Branch: for-next
Git Describe: v5.7-rc2-50-gaa0334bd4c82
Git Commit: aa0334bd4c82739553e96a60c732279e4bc643c5
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 45 unique boards, 11 SoC families, 3 builds out of 6

---
For more info write to <info@kernelci.org>
