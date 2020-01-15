Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A49BC13CC39
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2020 19:37:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729037AbgAOShi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Jan 2020 13:37:38 -0500
Received: from mail-wr1-f43.google.com ([209.85.221.43]:40514 "EHLO
        mail-wr1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728928AbgAOShh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jan 2020 13:37:37 -0500
Received: by mail-wr1-f43.google.com with SMTP id c14so16762145wrn.7
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jan 2020 10:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=0R229VBrH+MiNAnUs8eRR6ZKxqfk1X3iiWHcbAbNFts=;
        b=AcXDz7CW+rmNR0X2JbmGcA4fP0pIF2o9910FAoIZROkbu3q1Vaek/c+YbDtnHL+SvT
         yxpqyzdtwJXGUpcjc5fUreFKafHpNkVoeAvRrDIfC8Fz7+X3Q1CwCMr/LwQQVsJTxPgx
         0J7G44Y4DSdwc8RQsAHtfwSHyDEYH7BhqpHAU07gt5bIjl2XwROzj8kxqdNaTdPCFXoY
         45V8TkrWKFckhzG0dL8NdnuZua1tcTuWj0RFEGn7A3qUVLldS42INi7tfchTB2h8VCaC
         vzWp0Zza/0JJO/Z7QYLTfJ6a72cdmbQ4O9oJHSYUDPDkM6KrXpM0sDVBi9BSLTlttWER
         tL+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=0R229VBrH+MiNAnUs8eRR6ZKxqfk1X3iiWHcbAbNFts=;
        b=SBgrU2NJR7i/hQu1AxpQ9W1VTMhuiuagPLsDi0GmfnUz2948iiMpprU/m6sASYhXIh
         3gfQUXDbmHpiUjJctg/F5JTT+UW/Yv1dbFBrwsYYKDZbgBJtN62YR0YPeD0zylGpBK6U
         qG17Qhk/ivt//hHJx1/Gh2PHt2MnAwGpfqjze4Wdc1rZpQFv/vvVbrsafKBms+XVRtcZ
         iqLqKgpIfWc3Icqoay/keOjDwxsfY0tgF99Ca8uvPNx2MlQzzrRJ/NBaEsY8J0cIhNbS
         ujhesgtZI+FETS7Px64TIicY+Lds78fdzrpKtVgFrr3IsT3PgvrRYk+IJ1XIyGlf4+WX
         8Hhg==
X-Gm-Message-State: APjAAAUM8cWVyjKRf6d0eQhd8u6wo72Y6xqs0qwuDXRY5lHe05XLaF5o
        AOu240BPGa2ffoFfm6nkfPLYymVYQ/VY3A==
X-Google-Smtp-Source: APXvYqzUZgXpjcymgi5lZkKgiGm7DuVUw1W8Fw+IDiLg+pmGnRh3Q0Xpg4ZCIW1YBPcUtZ2+pcPsjA==
X-Received: by 2002:a5d:52c4:: with SMTP id r4mr31141001wrv.368.1579113455353;
        Wed, 15 Jan 2020 10:37:35 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id c5sm984148wmb.9.2020.01.15.10.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 10:37:34 -0800 (PST)
Message-ID: <5e1f5bee.1c69fb81.58e10.4d18@mx.google.com>
Date:   Wed, 15 Jan 2020 10:37:34 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.5-rc6-43-g18c24c678282
Subject: linusw/for-next build: 5 builds: 0 failed,
 5 passed (v5.5-rc6-43-g18c24c678282)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 5 builds: 0 failed, 5 passed (v5.5-rc6-43-g18c24c678=
282)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.5-rc6-43-g18c24c678282/

Tree: linusw
Branch: for-next
Git Describe: v5.5-rc6-43-g18c24c678282
Git Commit: 18c24c678282428a60ff4ebfec5a6b81c43de2f8
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Built: 5 unique architectures

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
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

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
