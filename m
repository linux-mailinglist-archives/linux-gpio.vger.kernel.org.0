Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B0DC15C992
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2020 18:39:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728122AbgBMRjt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Feb 2020 12:39:49 -0500
Received: from mail-wr1-f52.google.com ([209.85.221.52]:42518 "EHLO
        mail-wr1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727966AbgBMRjt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Feb 2020 12:39:49 -0500
Received: by mail-wr1-f52.google.com with SMTP id k11so7730777wrd.9
        for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2020 09:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=4uPjJJCRp+SB0pozAFRGdWFgxk0Vn/KKHhu8gk6Ht+w=;
        b=ixBGFwsO4Woj33a09OOScMxghG92yY418eBTKbumt+f33H8uQ37jUkN3FLfLzvDXuz
         VnOYlSdUcZ6aHq1QO/002twWsO6ueKPMFTA0/f84E+LjQH9vz9sIjrHQA5kUC/UDT4Gm
         X1CDTwCWUQxxE9Z1RrwdeqDKK9FQVp0Y816qLtCoxjsmRd53600CrovjIu/xS3QqVGcz
         O7BEt4vqMJew9sIsXBG/JgaP3uioy79emZs1fipk4saFxaf8JBbVAW4LHAS5Wz6zHATn
         ThC5hQi/gVqqvm7vIeWsIyhmVXqoAiFWiMbKZypiqvIl8jX8c7SmJsnhftG7YY3pEwTS
         /NuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=4uPjJJCRp+SB0pozAFRGdWFgxk0Vn/KKHhu8gk6Ht+w=;
        b=Za+SQiq+VzohonTKfZqzJ0qYQBYRa07lUi/2/ObDTttKBqjtSObzIoMtil2ox3xops
         utZ0KggVhd6vzbkK5KeZf1Adcdqq7uXr1SSaBaDEXiV8xCFp8deiHLUMKCAtPd88Cd/C
         ZeTpeUo8b4lSwDCkHns6rZ4+g4axZ66yILHSZYx/OJJS1I/OIEieWIYxVuyjmO4qZu8D
         6Xjn9X6CsU47R8jfTy/kxTZhcBsBrdujo90/6WxiForBaBCYqB0zA2BCCcheZ2TApP44
         NsvAJt7HkTOIhUgMri/ZAw09hXI21SSYTrP8MOfFLuMc56wsAlc+d31qbCPhxxGrgcEC
         XuLw==
X-Gm-Message-State: APjAAAWge5CX7nV2a5nUjB+QtOET0jUbVzjl6zkcbueEWbMS0j8fokYq
        xjg1Xvnk/c8mMYQGWLxwKPKfQvrpm/z2UA==
X-Google-Smtp-Source: APXvYqwcVj/MC2jRc86T2JbDNwZPU8IOwjte0g00TXYRYSmBbjYBJzyUYB9J/gIRednHT6MPuW4Pqg==
X-Received: by 2002:a5d:6082:: with SMTP id w2mr22900886wrt.300.1581615586600;
        Thu, 13 Feb 2020 09:39:46 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id l132sm3986190wmf.16.2020.02.13.09.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2020 09:39:46 -0800 (PST)
Message-ID: <5e4589e2.1c69fb81.126f6.1962@mx.google.com>
Date:   Thu, 13 Feb 2020 09:39:46 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: gpio-v5.6-2-13-g53803ecac78b
Subject: linusw/for-next build: 5 builds: 0 failed,
 5 passed (gpio-v5.6-2-13-g53803ecac78b)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 5 builds: 0 failed, 5 passed (gpio-v5.6-2-13-g53803e=
cac78b)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/gpio-v5.6-2-13-g53803ecac78b/

Tree: linusw
Branch: for-next
Git Describe: gpio-v5.6-2-13-g53803ecac78b
Git Commit: 53803ecac78bbabfdd65f5cb789e46660fa63900
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
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
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
