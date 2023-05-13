Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCB3A701AC1
	for <lists+linux-gpio@lfdr.de>; Sun, 14 May 2023 01:02:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231256AbjEMXCx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 13 May 2023 19:02:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjEMXCw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 13 May 2023 19:02:52 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99CA31709
        for <linux-gpio@vger.kernel.org>; Sat, 13 May 2023 16:02:51 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-52c759b7d45so10340067a12.3
        for <linux-gpio@vger.kernel.org>; Sat, 13 May 2023 16:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1684018971; x=1686610971;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=P4nK/BFbusA16dLC3DCT0Mu8hGReSfqxIJM8XEd0hXQ=;
        b=c1QhS+z42hG4k8GVJDMOB+LDCfL5D3pd7Wvi2qAZm59brVUIZlIoOnywfl/BvSpHmQ
         oadix4VowB6gF0G86NfqeHXWstEFMwsW640IVHbMcSL7a59jdDwe8xldNSgG+bKep/uo
         6i5ViZ47mcdpMaKNDTsWKJ2/v8q1syRKJGika1p44jcrgtDEeR6tTlQqRbStG4gsUgp9
         jaymmXTZ+WAluEplJwMIm4nYwPRsJu60U7vSnjBmJy9O9LMpXgciomJI5lEcJM4FdsAN
         SdlrZsgbL/B0IKvcvW9rfiyzfiCcGuz44qv5Tsbxrx8I1RSLuSdvY9aIXu8IceCIaxRs
         ttfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684018971; x=1686610971;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P4nK/BFbusA16dLC3DCT0Mu8hGReSfqxIJM8XEd0hXQ=;
        b=buBTHocbnI5Dkkl47T16TGAm2Y4ZBgw4HjNweg1IhTrWWh6buung+uzZGZYieWNukw
         tU2ymjlh04MEfCOkK4cY2TpEMo6pSme0hntBk2BxtroLRLo5HT7U16BmEo1Q4q8788oQ
         lYKIPqlcTmcFtThfmazkpAQS0VRZ4Ou+IcH1CSfygC7x8XiUqaerT+Q5ARckq5p4O6Hw
         VREEiY/NI7mfG1HZ67Qq2h5EvwYRS9gaptCksWwQ705RPEvPbj2hfLdeGhvfZnlUCHCA
         RDcsE98wi2SaZ7QIXqPBuJ62yCUIa5xDJNDAGawGT1WKVau8YuqKZHlnBFTMVLFmpWCQ
         g0qg==
X-Gm-Message-State: AC+VfDzi0c5WquM4+R/jl5AaDD8Q4mZAYVr2vLHQNW7AiEHuFi0fyKli
        Q95+f7VwZjFHo7AdAMpEhg2yIGR+PRmuMe5Ra0I=
X-Google-Smtp-Source: ACHHUZ4Jf8z7W7Usv/d0SwlrsMZz2Hmw1/+oV9jXBsuLG013BnzhhHzxinstTSolFjrlzSrNIsEGQA==
X-Received: by 2002:a17:902:ef8b:b0:1ad:de0a:f726 with SMTP id iz11-20020a170902ef8b00b001adde0af726mr6955481plb.20.1684018970743;
        Sat, 13 May 2023 16:02:50 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q4-20020a170902788400b001a69d1bc32csm10318805pll.238.2023.05.13.16.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 May 2023 16:02:50 -0700 (PDT)
Message-ID: <6460171a.170a0220.581d7.413e@mx.google.com>
Date:   Sat, 13 May 2023 16:02:50 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v6.4-rc1
X-Kernelci-Report-Type: build
Subject: linusw/for-next build: 8 builds: 0 failed, 8 passed,
 7 warnings (v6.4-rc1)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 8 builds: 0 failed, 8 passed, 7 warnings (v6.4-rc1)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v6.4-rc1/

Tree: linusw
Branch: for-next
Git Describe: v6.4-rc1
Git Commit: ac9a78681b921877518763ba0e89202254349d1b
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Built: 8 unique architectures

Warnings Detected:

arc:

arm64:

arm:

i386:

mips:

riscv:

sparc:
    sparc64_defconfig (gcc-10): 4 warnings

x86_64:
    x86_64_defconfig (gcc-10): 3 warnings


Warnings summary:

    2    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version genera=
tion failed, symbol will not be versioned.
    2    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    1    vmlinux.o: warning: objtool: iovec_from_user+0x88: call to copy_io=
vec_from_user.part.0() with UACCESS enabled
    1    vmlinux.o: warning: objtool: __import_iovec+0x147: call to copy_io=
vec_from_user.part.0() with UACCESS enabled
    1    vmlinux.o: warning: objtool: .altinstr_replacement+0x17a8: redunda=
nt UACCESS disable

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
sparc64_defconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
ection mismatches

Warnings:
    vmlinux.o: warning: objtool: .altinstr_replacement+0x17a8: redundant UA=
CCESS disable
    vmlinux.o: warning: objtool: iovec_from_user+0x88: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled
    vmlinux.o: warning: objtool: __import_iovec+0x147: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled

---
For more info write to <info@kernelci.org>
