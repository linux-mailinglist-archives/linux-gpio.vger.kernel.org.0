Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 163D8AA0CC
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2019 13:03:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731215AbfIELDC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Sep 2019 07:03:02 -0400
Received: from mail-wm1-f48.google.com ([209.85.128.48]:37148 "EHLO
        mail-wm1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731142AbfIELDC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Sep 2019 07:03:02 -0400
Received: by mail-wm1-f48.google.com with SMTP id r195so2446802wme.2
        for <linux-gpio@vger.kernel.org>; Thu, 05 Sep 2019 04:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=FhjnTquGZZ3aFXATziTvQ84We//+PbuVT3x94XBPMNU=;
        b=pOraGTxeLZbcWhPPLIytalwidZBwq5ah40sXn01NpUs7lAkQoZU5MN5vEPxRG+RTft
         /0MLcWy65bV83K0FDQ8SwQg9ls/Qkh5JVIVPeQR1LNckgWe2FN4R9oYEHKGE/NLpeCP2
         RmHnVYAP7w45nRQ1TCM3Kdwf6e0DX66BgCXrHXL3BK2nOROXyWTlsRdVqiKT0yr83CLI
         9J5iIOpjBVCCFcuYa1VAhSRNlF9HMKtIlqAkpuXeG31mBA2kgQLhN4BLnExOEy6WMe5j
         tbtTGxlzRTfNlCnZCx4SiUW6x6eYWz3d94qXi0NvXNUwneG/8BJAO8tbGoJ674diClp5
         gK1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=FhjnTquGZZ3aFXATziTvQ84We//+PbuVT3x94XBPMNU=;
        b=HINovHmzdfeMw0VhdxlACISI16rnAb/bKkg6B6AGWydIcJY2QBE1QICQtDBqTUl7+0
         rRQGl+KnesomS3gJ52468qFWbcDklw42V9m2lgzPLRjrpI4ODxeSyjQGL3I+QTEdoxSp
         w/7xe0hVO7+TOY/bYL1McIVdSas3idUA/M1niDDigG+G8R5n6EPw1Js4glObG0eUz7Q3
         Qn+66Z8JVtZ9yPNEgmEW5Lw52sf2+ckF6NQRfB5m0V+5Kjj0RZXqTeIQD8cwYBrefFwJ
         NLkKWU3vOANjGdkDxyKyYcQmEIRl/cRqlHBmt8Ueo34nUeJRbL0FyBbOCH6b7ljUSooA
         0O2Q==
X-Gm-Message-State: APjAAAU8zrD/RfH/AtAWHSc9dlMMWWWXey7YBPSFwe8qqfKtpDaH5HBw
        eBg/emgM6W2kdWgV2dSUEGttWyvyfGXuGg==
X-Google-Smtp-Source: APXvYqx5jq8gvPY9POtxQWEHML/3VkSqOyyIcPxR7VkYZ5HaEtTAa/0UTUn6GHBwH6E9trSN7iwaGA==
X-Received: by 2002:a7b:c766:: with SMTP id x6mr2645222wmk.51.1567681379953;
        Thu, 05 Sep 2019 04:02:59 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id j26sm4702451wrd.2.2019.09.05.04.02.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Sep 2019 04:02:59 -0700 (PDT)
Message-ID: <5d70eb63.1c69fb81.68ca8.4983@mx.google.com>
Date:   Thu, 05 Sep 2019 04:02:59 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc7-67-g0481c073211c
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: for-next
Subject: linusw/for-next boot: 4 boots: 0 failed,
 4 passed (v5.3-rc7-67-g0481c073211c)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next boot: 4 boots: 0 failed, 4 passed (v5.3-rc7-67-g0481c073211=
c)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/v5.3-rc7-67-g0481c073211c/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.3-rc7-67-g0481c073211c/

Tree: linusw
Branch: for-next
Git Describe: v5.3-rc7-67-g0481c073211c
Git Commit: 0481c073211c5fa98f97d3c798f2d104008ce286
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 2 unique boards, 2 SoC families, 1 build out of 6

---
For more info write to <info@kernelci.org>
