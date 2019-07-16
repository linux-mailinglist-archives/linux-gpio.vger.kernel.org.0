Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 484616A92D
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jul 2019 15:07:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726997AbfGPNHT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jul 2019 09:07:19 -0400
Received: from mail-wr1-f42.google.com ([209.85.221.42]:36703 "EHLO
        mail-wr1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725926AbfGPNHT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jul 2019 09:07:19 -0400
Received: by mail-wr1-f42.google.com with SMTP id n4so20926538wrs.3
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jul 2019 06:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Rz/Qx5Zqk8CIh/YXnML/sZAEpghilCBals/jLsWaOH4=;
        b=1pvYgqbUvy1nzd1vgx17FVK52RZaCYE7uBIUvyltUEyWY6t6bMnRhlreApeoekS+6b
         dt3t0skfeUJfn+0ZHT67GaArCnmtQE9Hnzosih5RfsY3TGi5uksQd7P4X2E/mjreeFxE
         f9HB9/TTG2mXm/z2+f8AVDZNOSgFt+zAz0ExbLwsYDKb9ouUBVNoxFcOhcSN69JMZA22
         8pwRlfsbrZjSgrq6Zz+Nw5i6QiteMUYxRkt0nqlKWHnTtxFhnLC/ZNOkeG3ioI1HHq8y
         2whb7t5dqUnXIVcsggrPs31kR1iNm3P42tTd2KtqOtpq9MPAVqr06/dntHNl8LszLqIM
         wsLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Rz/Qx5Zqk8CIh/YXnML/sZAEpghilCBals/jLsWaOH4=;
        b=sBhNFbcbBLTdH5l4E+1UmIoNLKdTbbDKRPgLnQ7wblfXX2KWKYZhRjbdGnNyFCsYc1
         rvmmxHjGBaBFzAmp6om1VirJzlD0icJT8923DNh2vHceNXFvlZgLUaepJSnMAGHT5z9a
         HdvgXRSt/GKbrd6j+QTqjG8loNKYh7BSOReQOeKB1To6jevb6+N+1qTSb5lQT8QIaN2W
         QunXv/JRjjuCczzGzRp3sXVoWM9sJZKHMVJYJis0FXGgBuNQq1chtXOLCDG3PS0wFfnG
         KozGocScpzzFHbthd3ZY3Mwmnd6huYyWqbFzEgCNbZ2OOrRs1EPGztmfYEpe/EZyIfhc
         vFJQ==
X-Gm-Message-State: APjAAAU1N15nUtIo2C4VtowyuZOOFQKC1cSXnxzJ+2rOpl3We1KmRnQc
        p1h6CVwB/mSIZ4t7+4+nWrEWYLrg3KY=
X-Google-Smtp-Source: APXvYqxGsA+tzQ3mXZvmXOVzng4HnpQIkniAtrjUmELs3aaNN8In7YBCCYdtd75ochf0luhb55Ab3w==
X-Received: by 2002:a5d:62c9:: with SMTP id o9mr34258579wrv.186.1563282437430;
        Tue, 16 Jul 2019 06:07:17 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id t185sm14547256wma.11.2019.07.16.06.07.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Jul 2019 06:07:16 -0700 (PDT)
Message-ID: <5d2dcc04.1c69fb81.731be.2c4b@mx.google.com>
Date:   Tue, 16 Jul 2019 06:07:16 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.2-10809-g1507704f1e98
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: linusw
X-Kernelci-Branch: devel
Subject: linusw/devel boot: 41 boots: 0 failed,
 41 passed (v5.2-10809-g1507704f1e98)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel boot: 41 boots: 0 failed, 41 passed (v5.2-10809-g1507704f1e98)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/devel/ke=
rnel/v5.2-10809-g1507704f1e98/
Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.2-10809-g1507704f1e98/

Tree: linusw
Branch: devel
Git Describe: v5.2-10809-g1507704f1e98
Git Commit: 1507704f1e980da91f3888ba35e4c6d34e2f9e16
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 28 unique boards, 15 SoC families, 3 builds out of 6

---
For more info write to <info@kernelci.org>
