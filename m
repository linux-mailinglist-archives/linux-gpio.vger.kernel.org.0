Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6D83F4F6F
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2019 16:25:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726445AbfKHPZC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Nov 2019 10:25:02 -0500
Received: from mail-wm1-f54.google.com ([209.85.128.54]:53359 "EHLO
        mail-wm1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726199AbfKHPZB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Nov 2019 10:25:01 -0500
Received: by mail-wm1-f54.google.com with SMTP id x4so6579347wmi.3
        for <linux-gpio@vger.kernel.org>; Fri, 08 Nov 2019 07:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=PwBA0sh14nC4IffFtQuo53ZRkIrKvHi8Nhct3ZaKELY=;
        b=ar9MoLKdzDkVVdFaYhU5lbpPcuhYwkHB77L8dGI6DlLZHE8YkNyUZRzzp1N6M1+rw+
         SEgwG0gdd5XGFf8rGsJXFMieVDiBBVHPqls1NUO5OQbMUDVVsb1acSJ7z+PnX0K3xInB
         U1iRn1+l/hFZ0Rj/1+wDPBXZpTu0FDTFFK/xp0obvKi9uNSujgRq0RMIdXBg7p0F5sTU
         eDIK7OHVUzNiRj5Q18G741SFhyatSKnb/nnvOKokqg/U9GuusTDAY1ugH6ozaB4A4G8t
         dwt/wzHOf13Gfn6V3DAhah2DRg0zaKKW77Kiy6v/NSlBCzq3cjiDlJ43nRUZj8bPoKQD
         qyMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=PwBA0sh14nC4IffFtQuo53ZRkIrKvHi8Nhct3ZaKELY=;
        b=ijSjNjNovVq3WyFBumXOM1v4mEF8lHDcyI64OUWU3IpDMJt6xH6Tf9S4K1nx0MzR9a
         nL9iIgO16AwUAGXPATKmePcqlc4ysf0YSdYLKBsCVWumvxUs/3W0jC8/GeWm8mSpYRWj
         3E3knatYD+8zlPfVtRbO1MC5Ai6JPYwSZC+v686u0EI+tTimMT2eSfydC3scPI/dovk+
         XWXne/Y2fSh6TliVgrnQS/s9M84qs6hi5jmeDETg+6XF4l19zC6oMk9BQkNQvzq23CuB
         GjizFLTSWFIMdfwKs3maCtS5qpWAO5vQSTcXxTc//+RQifghMOGPyewsL6T3VHCZx/+s
         UZcA==
X-Gm-Message-State: APjAAAUQ/eO2zDwrls/JgL8BfHCxITDjiOtIgSFbdH7BzRX5g9A/rscv
        YQA1fSLFaATP/7gl9Q6f04k+tmgtjNEmCQ==
X-Google-Smtp-Source: APXvYqyJo1HK7qa9uFvW+Low4bbzx0HrHoYN2hFwwExhv7KBFUbPgbVF4S02qeTg+DmTx0WrnGmpjQ==
X-Received: by 2002:a1c:30b:: with SMTP id 11mr8153655wmd.171.1573226697618;
        Fri, 08 Nov 2019 07:24:57 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id u26sm5596285wmj.9.2019.11.08.07.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2019 07:24:57 -0800 (PST)
Message-ID: <5dc588c9.1c69fb81.14929.d976@mx.google.com>
Date:   Fri, 08 Nov 2019 07:24:57 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-rc6-38-g70d97e099bb4
Subject: linusw/devel boot: 42 boots: 0 failed,
 42 passed (v5.4-rc6-38-g70d97e099bb4)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel boot: 42 boots: 0 failed, 42 passed (v5.4-rc6-38-g70d97e099bb4)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/devel/ke=
rnel/v5.4-rc6-38-g70d97e099bb4/
Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.4-rc6-38-g70d97e099bb4/

Tree: linusw
Branch: devel
Git Describe: v5.4-rc6-38-g70d97e099bb4
Git Commit: 70d97e099bb426ecb3ad4bf31e88dbf2ef4b2e4c
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 35 unique boards, 13 SoC families, 3 builds out of 6

---
For more info write to <info@kernelci.org>
