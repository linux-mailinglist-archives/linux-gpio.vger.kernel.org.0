Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BFF119A661
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2020 09:38:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731870AbgDAHim (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Apr 2020 03:38:42 -0400
Received: from mail-pf1-f173.google.com ([209.85.210.173]:44569 "EHLO
        mail-pf1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731680AbgDAHim (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Apr 2020 03:38:42 -0400
Received: by mail-pf1-f173.google.com with SMTP id b72so11691746pfb.11
        for <linux-gpio@vger.kernel.org>; Wed, 01 Apr 2020 00:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=INPU3ikjcG+FiofB+fdYGczPbYsMSB4wjFZ1oKoK2wk=;
        b=P02nBJ28RLxzzk51ABq5PsSXsDaHQGJK7rN1wBA06NiFioWTGyaA5WBouL6UVpD2Ar
         Jd0lReuIyEPDQDqhaqclqpU80TjP/4ukYO8C0BqY3QG9I/mnUZ1hL1WdaqDj/NsaDVNU
         dN++XickfvMGSqKmTu0dzC+H96bZhXfZYSJKFFe798xz/q9KUoobRdJnprpYebypuKYi
         jNYR19B6c+eyxTPl/tjO1pCNzmH6UG2+YUJKL+2RuNd5nRQAYnMmVT61t5OfDrATueWx
         jEKI1HVeni+LgE0yK2bB1yaWQT5PCoFetrzsjVqE4mh4AtnlmRO2iZ/PbuAKGDl1XDDm
         qp7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=INPU3ikjcG+FiofB+fdYGczPbYsMSB4wjFZ1oKoK2wk=;
        b=aAxcocRJZUCVKGHrcLL51VznIIG8lNjgXhsb4tGS4SQswXkmBV/yoy9oH6b4I/Dz9h
         dd4g8eJXnGrK+Kg6EOBZ8M5kwRs3KO5YoQyOXV8759YRWChmlsD5I0y2QGnsIue2O1Ok
         wvH5wEwuc6PRgOWeuGHIS20m3TGp2Jr0uUo9N58F8J/MHBEpe9/hFjB2bHb6Dj7qybFR
         TvEsk28pFjc/ux4BvwBmC74tgRjCbJ1zLb9QM1+sZlSvHWxzx1mo24NVvaX3J7pLX/MB
         9PKunZaMAh49/q/uUGvsZhOh2Y2reBRgZREkMlpose0l1bWZPCNJKcC1YYxso5cGSFX9
         R/1Q==
X-Gm-Message-State: ANhLgQ29XaLcXjbCUT3AP/q9Iyu4mFdK89vh6wGtr5mhkt7ZmF7TimyG
        2eaIwWcUSyyFL6Hw+7nPXvDfB/Bek6Q=
X-Google-Smtp-Source: ADFU+vviEMjbF3vDSEBILyGlGWD0H95vFPKdZLYwDz0RNDPVUGe606rGoIaoqOv0RxZU0LMkay4+Zg==
X-Received: by 2002:a63:a052:: with SMTP id u18mr21921689pgn.210.1585726718765;
        Wed, 01 Apr 2020 00:38:38 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 15sm925675pfu.186.2020.04.01.00.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2020 00:38:38 -0700 (PDT)
Message-ID: <5e8444fe.1c69fb81.12d8c.4ad0@mx.google.com>
Date:   Wed, 01 Apr 2020 00:38:38 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.6-rc7-61-g33dd88826319
X-Kernelci-Report-Type: build
X-Kernelci-Tree: linusw
X-Kernelci-Branch: for-next
Subject: linusw/for-next build: 6 builds: 0 failed,
 6 passed (v5.6-rc7-61-g33dd88826319)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 6 builds: 0 failed, 6 passed (v5.6-rc7-61-g33dd88826=
319)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.6-rc7-61-g33dd88826319/

Tree: linusw
Branch: for-next
Git Describe: v5.6-rc7-61-g33dd88826319
Git Commit: 33dd888263199676946f1c789e821d39a9a79d98
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Built: 6 unique architectures

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---
For more info write to <info@kernelci.org>
