Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4A5B139F44
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2020 03:00:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729351AbgANCAK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Jan 2020 21:00:10 -0500
Received: from mail-wr1-f44.google.com ([209.85.221.44]:45364 "EHLO
        mail-wr1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728838AbgANCAJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jan 2020 21:00:09 -0500
Received: by mail-wr1-f44.google.com with SMTP id j42so10553876wrj.12
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jan 2020 18:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=lOlXYY1lmKIJfVg3AXuj5KFqIZYzHRN6Uzaw1npLG6s=;
        b=pjwRfK56xKGMUteIc9QL9doVg5m5yJoAD+FRNUdDPHEWuqo21jWS8+9S4xobxTyeeT
         tDf9MI7SetsO09RM63DasyS3qImhrwbdYrNbl9zLo3tC/wbf07zPR53UGT1VcwyE+bDY
         7UcRCVX6CXzHGIEMTepQGNTZUvAMEjqKuLwCDeQum6su76zL6FYfJIg86uCa3k2v0eU/
         LPrda6hiV4AbwL3mu8VXKRHiZZSSM1x8XWhA5Dj+VlfUsvVTi0dkJ1ETNlzxxQ5Wmzzp
         mOmdzB4itLNR2wHa1Et1FkTEIVuFFAImpTANbRYICHFytuODMj9xhJBWZftEL7R/z7U4
         zuUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=lOlXYY1lmKIJfVg3AXuj5KFqIZYzHRN6Uzaw1npLG6s=;
        b=ZZ/n3CecmjnwQ6gsw4wfiJQvaiaRMHy6kRyAqUrCRbivSWGCYF5Gn4qitA3tpNOvYo
         Yd6Xam3Q51zXt1msWRW5BTJ5XQsqukiHqysBHHQJfE6dmaNOET78SfCddE4fzAXNTN1A
         mqWehjGh20Kdgl1UVlm+a75MuMYF2/lDohFW4ig+MTZqMoFPUvGr3ydU668DDPioCK7s
         1G2Yn6Y+fItRk5QkbaRCNR7kZOD9NXx0KouYvknaPM+6YHhFvGKb4f+GM9QhSJFwE6Rv
         3LzuswISYkNeh6gbvp2bfBsznjWuiGbNaMeq2Nw4oeXkqyzdIcdO6o0NS4RJSfUKv5Lf
         s9hg==
X-Gm-Message-State: APjAAAWOxzpEu4V357K9mb8DOlPs8j70QpDUoIeEorL2SqH6MakAAFdf
        idmFtPy3HfnYA8CtWvA+ZCVYB1gL7WvLKw==
X-Google-Smtp-Source: APXvYqwzjxP+dOb+JlIRusy5QBJcklRjmCSyb0bv7F0j0b4JL47mui9cAlxFStoOo0xrOGbn+DOvYA==
X-Received: by 2002:adf:d183:: with SMTP id v3mr22052603wrc.180.1578967207242;
        Mon, 13 Jan 2020 18:00:07 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id c195sm17503193wmd.45.2020.01.13.18.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 18:00:06 -0800 (PST)
Message-ID: <5e1d20a6.1c69fb81.1e869.9f52@mx.google.com>
Date:   Mon, 13 Jan 2020 18:00:06 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.5-rc1-30-gb0d126e1d64e
Subject: linusw/devel build: 5 builds: 0 failed,
 5 passed (v5.5-rc1-30-gb0d126e1d64e)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel build: 5 builds: 0 failed, 5 passed (v5.5-rc1-30-gb0d126e1d64e)

Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.5-rc1-30-gb0d126e1d64e/

Tree: linusw
Branch: devel
Git Describe: v5.5-rc1-30-gb0d126e1d64e
Git Commit: b0d126e1d64e76f165dc9ce6a4b02497c48053fb
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
