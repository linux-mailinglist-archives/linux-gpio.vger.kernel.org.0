Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D9A6105214
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2019 13:09:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726532AbfKUMI7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Nov 2019 07:08:59 -0500
Received: from mail-wr1-f51.google.com ([209.85.221.51]:44862 "EHLO
        mail-wr1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726230AbfKUMI7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Nov 2019 07:08:59 -0500
Received: by mail-wr1-f51.google.com with SMTP id i12so4049122wrn.11
        for <linux-gpio@vger.kernel.org>; Thu, 21 Nov 2019 04:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=H5redmgoYjWJgtAGwa2yyfjB5yxbT3o1QSoUJT+prbQ=;
        b=IU95MESoPl6lYZZfO/TRTHaHkG9gRsGOzzuXuI8mKTBgdjEKSgvrKaFbcj1CA0VUUC
         atUkNHias0tvTPB2nCluke+2yF0yJJL3k7FyYPQc5e30dMq98N3w+rcdsGhmWqPmDdUw
         4+UHiwuVNhW+sgh08sQ8SrUXthwN9MtjZiGs+gPDQwUk5u/ueJZSOXEdOXbjYLQyQpyC
         cqcXp9CwzhYUnDyE4YckqmedvfdSLbLJMysD6oC1lc/WdgHXkY64sO7p5NSDF/svWrjK
         nuFej3AH4l39aYZdEJ4uYSBVOAJpKFq1w7QYxtmAbZgsPoAtCc6Np9ZhsxQcFMfeOIh0
         aRjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=H5redmgoYjWJgtAGwa2yyfjB5yxbT3o1QSoUJT+prbQ=;
        b=OoL9aD7NIy4AH+GQhtPO9awM0Poz0tG/eVg44rR/pJIAC5MaK2aO87AJNYpwFbYjaQ
         aJWJ+Cfv9pReQY4vlTFMlf32H+vgpyW2yIRBN53MSeot8aXUk2Gim2Pk61QRn22mGYM9
         ISWfhCJgSAQ5PhkIMgXGyOqkvjngEcmBMhhokIOt248YqA312kG0eoedO8pDM7lO+5ao
         m3nrIOVgtskY7jMFqqyM+U0RD5aLYa6H6klZj6Q65LlI7QwZjmA/tVyeRy1M25TZN/Ri
         9QkIhF7KzcSkjatf7lgVau+xIk8K0RTgjCvqJtf8agWa64rK3OOZ3Q1V4Dg3omGaPA9T
         4bSg==
X-Gm-Message-State: APjAAAXMNT1zcd/ibKNurQTOWfVokiFvTuDaXEUVWvY3+1JPfGXnUYs1
        fhBw0nLXwedRJkAEloG1Fs3jNDRc/hDUwQ==
X-Google-Smtp-Source: APXvYqxIJqQzzX3kE4cpsek/hLfPoa2HAayZpdP3iN7uiHrSpQa4z/lwAjf5AcJU1DZL6xNDJ1qOtw==
X-Received: by 2002:adf:f20d:: with SMTP id p13mr9670334wro.325.1574338135302;
        Thu, 21 Nov 2019 04:08:55 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id f67sm2752335wme.16.2019.11.21.04.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2019 04:08:54 -0800 (PST)
Message-ID: <5dd67e56.1c69fb81.f67d0.da93@mx.google.com>
Date:   Thu, 21 Nov 2019 04:08:54 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-rc6-124-g3f86a7e090d1
Subject: linusw/devel boot: 59 boots: 0 failed,
 59 passed (v5.4-rc6-124-g3f86a7e090d1)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel boot: 59 boots: 0 failed, 59 passed (v5.4-rc6-124-g3f86a7e090d=
1)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/devel/ke=
rnel/v5.4-rc6-124-g3f86a7e090d1/
Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.4-rc6-124-g3f86a7e090d1/

Tree: linusw
Branch: devel
Git Describe: v5.4-rc6-124-g3f86a7e090d1
Git Commit: 3f86a7e090d1dfb974a9dc9d44049f9bff01e6a5
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 48 unique boards, 15 SoC families, 3 builds out of 6

---
For more info write to <info@kernelci.org>
