Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1B4F16B030
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2020 20:23:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726216AbgBXTXV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Feb 2020 14:23:21 -0500
Received: from mail-pl1-f171.google.com ([209.85.214.171]:40180 "EHLO
        mail-pl1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725860AbgBXTXU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Feb 2020 14:23:20 -0500
Received: by mail-pl1-f171.google.com with SMTP id y1so4439199plp.7
        for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2020 11:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=IXuuh8aOrESryqIciVPtjR1u7sSETWwv7uSYn24CPhg=;
        b=DQa73QpGxamEpbcQjkSYhgxwIQgBR1DmdfRi2V8IpdQHPkUveCVdFWbTtP4bUenuQ/
         d57fnZV3HinLlnLcMpbJksNVoU3cellJPwLAhPvZnRHP/hfC6VKbDa3AgVxBpwF9qMYP
         JiXlCHdo18RycBKHJWtzEH38h+9F9ojU/Cip2b4VcXdeG/w0bbfgEQ3AW1f3SsEHEhnV
         BGyDcCddBb5D5xsb3VMmakiuqFaB3yIHzsIBMXHfCDRl1qgQrBwkB3rJcZzH50nC0kxr
         XU1viKO1mSonNpL5XlTHfkDCjLxWb/vuou+vRG6r9jGMS/ndHeNhnqqniNVZs1VUljZH
         1DhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=IXuuh8aOrESryqIciVPtjR1u7sSETWwv7uSYn24CPhg=;
        b=DhZATgoK4bMJ8KuTqaZNSQGcMFa5XGAZ9WMTmhhDy69YLKCpppyPZvBR3fAho7Wza0
         xwuCwl4mRuVCQ6hLWCFuU9RBIWcpwvRCcztNBwpOUIJc/Vx7O+EWps2c4KVCBEWjUkjA
         v3bJC/bFA8Rr9rpWj3SwBXoH4f69f2srXCW3wpsTyHJWkRNb3NpwoKkZdn7txT2V1xPV
         K3pEtaz59paxb80lN2yO4Et8/6EZxUV3IhjkBI36VYmSu0bujlKa3Ns5ErEcYrpX2NbQ
         /yeafBPWzxs7ZKyDEYs94qehGfGLDXOUSSPQlAyOdceOwYL6bOaxvUtjcTXC2W8sXUTP
         effw==
X-Gm-Message-State: APjAAAXwZS3k6JsrorC1HDuKBcDMyH1ER2u0Dr3Occ0yx9a2JQTpob7i
        RQkrJqWJo3Ydy5V5VhrgmTXnfSdVs3k=
X-Google-Smtp-Source: APXvYqz8CFDJXU42Rr9xAqhzglNtfT4Apw7ZuIXTfYD1hIV1rHggTBOVNftE0XRi84pIs+nOSxafgQ==
X-Received: by 2002:a17:90a:bc41:: with SMTP id t1mr641037pjv.137.1582572198522;
        Mon, 24 Feb 2020 11:23:18 -0800 (PST)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 4sm14230503pfn.90.2020.02.24.11.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2020 11:23:17 -0800 (PST)
Message-ID: <5e5422a5.1c69fb81.747cc.674b@mx.google.com>
Date:   Mon, 24 Feb 2020 11:23:17 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.6-rc1-19-g63636d956c45
X-Kernelci-Report-Type: build
X-Kernelci-Tree: linusw
X-Kernelci-Branch: devel
Subject: linusw/devel build: 6 builds: 0 failed,
 6 passed (v5.6-rc1-19-g63636d956c45)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel build: 6 builds: 0 failed, 6 passed (v5.6-rc1-19-g63636d956c45)

Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.6-rc1-19-g63636d956c45/

Tree: linusw
Branch: devel
Git Describe: v5.6-rc1-19-g63636d956c45
Git Commit: 63636d956c455c0fbe2118078a03f563ddd6bf6e
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
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
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
