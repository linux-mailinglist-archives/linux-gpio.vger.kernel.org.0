Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19F7CCD9DA
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2019 02:15:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726489AbfJGAPP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 6 Oct 2019 20:15:15 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40928 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726000AbfJGAPP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 6 Oct 2019 20:15:15 -0400
Received: by mail-wm1-f68.google.com with SMTP id b24so10547016wmj.5
        for <linux-gpio@vger.kernel.org>; Sun, 06 Oct 2019 17:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=yw705i5OyjMppv/7c7oCwGbt8DKQACRcDQIiNteTisI=;
        b=n5ycaqg5R5sLtY0MiS1i9MELLi76CPEf4FKi3RajteoAWYlz++AsO0YVnRJKvPNhMZ
         Ge4Z/EL8cRiGRi8WrmjDn3CTwdsrTvQp/qIWv6J5uUhj0YJfIG378LKRSOMeMqBek4jy
         iPwSYsj/G4zynqkdFKwY3bseSm7utM6KFIRGUnZ7+2zIGBvhSrUNAiDh6etpCH3A/MiN
         OH3ru3ss6UFXPiwPVHvycMFrgtUhmNRArz6dsiLkBw7GnDrzxJcL40ysB9j6n7rFccqV
         WRgDEJlx5J413C9wW2z0n25GYUcBo6ugtlR8Y5OJfqabkQ483aHYN7D5fgziVJ5c166g
         5NIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=yw705i5OyjMppv/7c7oCwGbt8DKQACRcDQIiNteTisI=;
        b=h1SqGvxDwi9mahGYiAp1PE9F7LEg8oTR4bMaXJpJ4VxozI2gnptqG8FTVCcyfSN4zt
         NwjAdXPryZKRCJiXTJ5RkZUsZft+iJZ60nNnT76TEJCB74eLKE3h+080HBRo3Zq8bJBB
         ujXnSTO4yJlbjltXfhLpRizDuFUMg7pcxk9iyiaC8LQ27frXhPRrH4RLXdVbC3RPiPut
         6A2ba3KJGAO6dYgPV2LOgFHZbzmI/nIDLC9VttLZkciKADWR4C3/fusZ0aZ9x3SEruRn
         FyCBDf8WanML/LwjfC5P46/V0UAzF/Z3i3lXlkg3AAd+UeauZzu1BetI4RUpNoNex1vD
         1FoA==
X-Gm-Message-State: APjAAAU7xfdwrObTbsJmDIS5+M7BV/J8U7VC2w3MI/HrURyhI0TL9GM+
        8IKwjqZhzKkzNqCtYNkZyct85I4igds=
X-Google-Smtp-Source: APXvYqyxLPtQlAtrzV9kZoaUgFyznEhJcsJozQ+w0Jzc47pjBLYrQ3BEbRFoFhG7UBxWsGzUAYeubA==
X-Received: by 2002:a7b:c84f:: with SMTP id c15mr19054052wml.52.1570407312870;
        Sun, 06 Oct 2019 17:15:12 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id 59sm27965700wrc.23.2019.10.06.17.15.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 06 Oct 2019 17:15:12 -0700 (PDT)
Message-ID: <5d9a8390.1c69fb81.e59b1.decf@mx.google.com>
Date:   Sun, 06 Oct 2019 17:15:12 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-rc1-14-g6dd9b912c9b4
X-Kernelci-Tree: linusw
X-Kernelci-Branch: for-next
Subject: linusw/for-next boot: 42 boots: 0 failed,
 42 passed (v5.4-rc1-14-g6dd9b912c9b4)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next boot: 42 boots: 0 failed, 42 passed (v5.4-rc1-14-g6dd9b912c=
9b4)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/v5.4-rc1-14-g6dd9b912c9b4/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.4-rc1-14-g6dd9b912c9b4/

Tree: linusw
Branch: for-next
Git Describe: v5.4-rc1-14-g6dd9b912c9b4
Git Commit: 6dd9b912c9b4d8e7b4877554fc9e412e1189e30a
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 39 unique boards, 14 SoC families, 3 builds out of 6

---
For more info write to <info@kernelci.org>
