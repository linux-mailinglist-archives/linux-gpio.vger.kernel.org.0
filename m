Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADA98DA80F
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2019 11:10:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408409AbfJQJKq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Oct 2019 05:10:46 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:45153 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404200AbfJQJKq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Oct 2019 05:10:46 -0400
Received: by mail-wr1-f67.google.com with SMTP id r5so1400371wrm.12
        for <linux-gpio@vger.kernel.org>; Thu, 17 Oct 2019 02:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Eu0uY1oIXp7q4qeZOD+L8Xt2CaqB5EWAOWoRz7reVqE=;
        b=i2wZCnEkBvJjroo0mSdo6IOaxlguFIfsgVqYuayp4OHOnwLm9v77kMNgS9X8gE3IEG
         pL3Oh8VgVozk9AElo49HRpemxX6Ol5yMHJ6QFAkgJhRI+7ZVdH5XD04kceCXCNGCMN2l
         J2sP40miPNn7/JL/JuPqOxP6cJR73Ohg3je4/ijSM2YgqbFQXS5EgInNDQLYS4qHATpG
         2cGntI/lY8QxQaSacCGdyEnLN0xSjL32ocIkFJBOJUGfjipTu+a/vgFMJMtdI1+TXTv2
         7m73shm2hr8SJB9/0DrQYN8QEfvsYpWIAKiiie2vGa67ZH9nxAa6MpVfvuuXVtQKsfCi
         RCyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Eu0uY1oIXp7q4qeZOD+L8Xt2CaqB5EWAOWoRz7reVqE=;
        b=g3zL0sde46AgFOwZrLwMFFMFwANeIsfJ04SXSdYkVgtMRhXtCzsKg5itihx8qc7EYW
         ndhquXOJJ2xmB+LwUHAYNZLVn9Jh4nEY3e/AsWLKDWR4Hw4k9d0PSd8s3S71OwjNh93f
         A5oHRo5qY0RYIdDv88RQtFpVcBh04lSlN5W/9OGu0s8vHS2Bd6fJjmhzfOoHZu30w7oD
         HPV1PBjMgY8CGsacMhfwg1GfBgbE3xpvmijUuFSlvaxh9Vca7CUI8hNkp2GE6RP//fOj
         OSFp/q/qEg0W6nzr4p5zDNbumxPKLs3i/IBMEOefXeT1VqIGqbLBfhsbiwcwYvpwaa7r
         VEgQ==
X-Gm-Message-State: APjAAAUfTqeZH2b8jLXvtW5kxyBSr9PX/cNkJnfQrU5TtNeAu1+Jh83M
        hePgdI2cX3HoHf5TG85iwnhnmLs70qA=
X-Google-Smtp-Source: APXvYqw9jYPIm8U7RttNDs4Yn1Nf/bOMwU8xAJjs0jQzTr+RJJnHKI8arIbG3tuvIkMHvJFsMB2hnQ==
X-Received: by 2002:adf:a48c:: with SMTP id g12mr1934535wrb.212.1571303443833;
        Thu, 17 Oct 2019 02:10:43 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id y19sm1507514wmi.13.2019.10.17.02.10.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Oct 2019 02:10:43 -0700 (PDT)
Message-ID: <5da83013.1c69fb81.ecd6b.72db@mx.google.com>
Date:   Thu, 17 Oct 2019 02:10:43 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-rc1-12-g698b8eeaed72
Subject: linusw/devel boot: 41 boots: 0 failed,
 41 passed (v5.4-rc1-12-g698b8eeaed72)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel boot: 41 boots: 0 failed, 41 passed (v5.4-rc1-12-g698b8eeaed72)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/devel/ke=
rnel/v5.4-rc1-12-g698b8eeaed72/
Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.4-rc1-12-g698b8eeaed72/

Tree: linusw
Branch: devel
Git Describe: v5.4-rc1-12-g698b8eeaed72
Git Commit: 698b8eeaed7287970fc2b6d322618850fd1b1e6c
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 39 unique boards, 12 SoC families, 3 builds out of 6

---
For more info write to <info@kernelci.org>
