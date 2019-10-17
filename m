Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B6ADDA80B
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2019 11:09:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405313AbfJQJJq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Oct 2019 05:09:46 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40054 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404200AbfJQJJq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Oct 2019 05:09:46 -0400
Received: by mail-wr1-f65.google.com with SMTP id o28so1411559wro.7
        for <linux-gpio@vger.kernel.org>; Thu, 17 Oct 2019 02:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=wUFxy8cwQGCG1Lc8GVFoPN0G8HmUImzqv1sUNJ6iCx4=;
        b=0CzpO7w1P7OMuETVVsV6osHpGjgMPtG9kiMelQm2au+UfdAevv5YTKg9OsOYbh62LK
         EfN2WqrASWzDoubNavkGV+85zF6fOIJFGxIUQVO1Y0mZQuM52C1tl+am0KYeOjaWSEcO
         +qvmlxtBuyQEc42nBVxnScNcmEdb5boXZGl/fa+Csa+vyV/gMZtdwZGuEmh7m83Tzi+Q
         bpQSc+fpget1y9oGjhvL2VTPzl4Dsgdb4ljIfCdx7nhKowoFsR3czOD4+g2Htfe+k9z+
         erAUL/98ncBP8lEyrkwz6+NmPnRwzxwH3TBOgagH/lK62JmLvy+UaRZ2TDjaNopeo4gb
         SR3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=wUFxy8cwQGCG1Lc8GVFoPN0G8HmUImzqv1sUNJ6iCx4=;
        b=Gr0rhijeAAX5RbbN1Fc5x3X75d9Q6ZqKMaiuUx+SwaS/RiY7Gmf+x9NvX/U6FwUgKE
         CodCBEm1Ew3V+81NmbJOH1/D376bkfHFAffq1IQ8qlScoc8V+0CeF6p/DmbxJyLxqMT4
         MjRqBgrM6wzu6rhxZtR07mraZqaghSj7duLMRnWF537oareOyUllqBeh2dDIqr8/z74/
         NIZe+G+a39J3CHlexY23DgTwud5yuvj70JmFv+vSCzgg3cGn6cQHcV6QzGPst4xga60T
         f3T/uoa7Ru/7YLYnzceTfg82JdqiAKF0cp/lcpj062o7fVFinCEW3gWHVVzCvReVLaXY
         CVbQ==
X-Gm-Message-State: APjAAAVCAvP3hhqhynz6bhciCbb6g282G2YZjFNTN5eurlnxQl0lS7PJ
        zeu6t1pYxYuoosmBXj4VUwe2Z/IdTqI=
X-Google-Smtp-Source: APXvYqz6X57hZlPcOasfFtAnvHjyImlo7yur6BOqYvNW+fVBgHr1+O4Nm8jDudDDKbPxqeGyseNHvw==
X-Received: by 2002:adf:f704:: with SMTP id r4mr2035089wrp.30.1571303384420;
        Thu, 17 Oct 2019 02:09:44 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id r27sm2436380wrc.55.2019.10.17.02.09.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Oct 2019 02:09:43 -0700 (PDT)
Message-ID: <5da82fd7.1c69fb81.44c2e.b502@mx.google.com>
Date:   Thu, 17 Oct 2019 02:09:43 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: gpio-v5.4-3-13-g7c547cb52849
Subject: linusw/for-next boot: 41 boots: 0 failed,
 41 passed (gpio-v5.4-3-13-g7c547cb52849)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next boot: 41 boots: 0 failed, 41 passed (gpio-v5.4-3-13-g7c547c=
b52849)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/gpio-v5.4-3-13-g7c547cb52849/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/gpio-v5.4-3-13-g7c547cb52849/

Tree: linusw
Branch: for-next
Git Describe: gpio-v5.4-3-13-g7c547cb52849
Git Commit: 7c547cb52849e0806a407dccb9b471ef261ba20a
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 39 unique boards, 12 SoC families, 3 builds out of 6

---
For more info write to <info@kernelci.org>
