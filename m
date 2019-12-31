Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B58B812DA84
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Dec 2019 18:17:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726060AbfLaRR2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 Dec 2019 12:17:28 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:34616 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726720AbfLaRR2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Dec 2019 12:17:28 -0500
Received: by mail-wm1-f67.google.com with SMTP id c127so2113554wme.1
        for <linux-gpio@vger.kernel.org>; Tue, 31 Dec 2019 09:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=VDah1notuD20lTUF3GQ2+wGTaL6zGRu5lVAxnlrnQAw=;
        b=iKqXpYuunWEC/GAYiSar5IIxWPHLMW3idt4kL3i8es9qN0y1DCfqpOqvO18UmJlsC7
         FExnTHAmzvqim7XS2j70vhldOsv1RJpGucmpeFO3JFxw7xRI2Pw00m6dHjtTs18YEP7f
         xLzcF7BMmn5Q8d2LucJy7senzVkAFp17IBoyWBUcDgFe5cHNGeqs+ffQ/XyhTOV1Dj88
         vLtKdT8nuTIfDvUgabhylShWNxUNKEbrbor9yU1e4+3j1YsOVAhp2BucxhdZWJf8n727
         u1b/fnpmFsEXsoJ0qeACWghnemCV0PWZoKSu/a+2QGEpdFrNkZyKj4PQ5OS4TIPruuFJ
         +tCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=VDah1notuD20lTUF3GQ2+wGTaL6zGRu5lVAxnlrnQAw=;
        b=Q28+BmtMpENdQAzPKocad0QL3H76mRt7LVFZWbItMRm4WYCAX1/uD6oIe8VfXkTPef
         sMPpJOYI80c9VNGU/Vfu+1dVEVqY/WQzPUGLt55eVYDOJUrRDiI1Idemdpuqt+r+tCpw
         l5gn3NGx0Uwdgn2vqlFIyic4BabXdSxNbYgJDE6aOy2onZtLUmvbO304m7HE+lrKf26B
         eyDjUOwNKh87zegUuXUh6qQxrl776zNq65dP2UJycbndJPXca8cD0ZKA8BKk02CpYlif
         uDIifrPeglpAeuQ3LRLsWzuDZFJ+opSCdlk+U2n+o8SgMnVWXU2juTOVAmEyUsDAHY+/
         1q1A==
X-Gm-Message-State: APjAAAWi4WV4y6rRa+eSTFF/FIzHwAHzV/dIpJrnLDVMRAAjHRPSnXPO
        t0caavEdjXjkEls5LnhoBQ0Cd+D/JSZvrg==
X-Google-Smtp-Source: APXvYqxC8td0ztm03Est5PO4jHJQI6XEHP9xEUuyLLipYLkTUqKNhv+ZAbmqVJoAuMfgWKs0vdySeg==
X-Received: by 2002:a1c:4e10:: with SMTP id g16mr5161654wmh.94.1577812644941;
        Tue, 31 Dec 2019 09:17:24 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id 4sm2978008wmg.22.2019.12.31.09.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2019 09:17:24 -0800 (PST)
Message-ID: <5e0b82a4.1c69fb81.b0e74.d8ca@mx.google.com>
Date:   Tue, 31 Dec 2019 09:17:24 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.5-rc4-9-g331d7ae3fa15
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: for-next
Subject: linusw/for-next boot: 56 boots: 1 failed,
 55 passed (v5.5-rc4-9-g331d7ae3fa15)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next boot: 56 boots: 1 failed, 55 passed (v5.5-rc4-9-g331d7ae3fa=
15)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/v5.5-rc4-9-g331d7ae3fa15/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.5-rc4-9-g331d7ae3fa15/

Tree: linusw
Branch: for-next
Git Describe: v5.5-rc4-9-g331d7ae3fa15
Git Commit: 331d7ae3fa15f36a25fa83590d4bfcfc0e37a73c
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 48 unique boards, 14 SoC families, 3 builds out of 5

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          rk3288-rock2-square:
              lab-collabora: new failure (last pass: v5.5-rc1-20-g06c4fc5ed=
a6b)

Boot Failure Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            rk3288-rock2-square: 1 failed lab

---
For more info write to <info@kernelci.org>
