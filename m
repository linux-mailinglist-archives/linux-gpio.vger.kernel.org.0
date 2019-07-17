Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8D686C010
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jul 2019 19:08:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726889AbfGQRIU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Jul 2019 13:08:20 -0400
Received: from mail-wm1-f53.google.com ([209.85.128.53]:33558 "EHLO
        mail-wm1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725873AbfGQRIT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Jul 2019 13:08:19 -0400
Received: by mail-wm1-f53.google.com with SMTP id h19so19634031wme.0
        for <linux-gpio@vger.kernel.org>; Wed, 17 Jul 2019 10:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=QKUXF+OL1TM+XEORqH/4rY79YO9ZJxpbwgFoGRTBy6E=;
        b=zlhYKLriX1c2iVrs0QYP6M8AONHUQcP+jVbGlPwN5j5nO1blKrKL2usZipEtrbUSTB
         iqTkIIEt8f9tYyyGODUFVFVuQ5K3Kcmx4sbN82EeWY8qoYXavPDSN0m4EnKx8Bc6psUK
         GtxCcYLUtBgtoHJ4Abc3ssQAp8HRsbYYUYiHs04pO1++WeBOq/4+2N7LUJIGy4DR40ge
         tk9kBdOB03UBt6Dy6JEivurjXg1DmP1MShce5ePUesHl1d8so5RMnond+wil+TSq6JFS
         hLSVYX35y+FLA+rIyr5PhtKDmnuYCDTYBGc+NFHARKmtc40nIqT7k7Fq8gm404DZSrs5
         HCQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=QKUXF+OL1TM+XEORqH/4rY79YO9ZJxpbwgFoGRTBy6E=;
        b=Q4CzM2lkiUTTj1hj4jvhpVUuUJzG8LnEbkPvXfvU3dJUZMYM3+nVwWMaR33ZtX0D/0
         alCwn7c7GDYQkoBSgKLooCyHqmPhOycysF+Fm9OHybcpU8QPm1BJB5TMzExCWpUXJ5j5
         ZOBex00DvdK25MyXMvlF5wNoe6DkUBosIKcS98aMgKCO6vse7lm3VIex9wOtV4MPQVVH
         04HPNL28wlBqwKsUU8EYTpPMvu8Qv+QNns0Nc7E8UyYh4w3loHpri53nkggbPvofQMX1
         +0yWDWEqo/woqE3jyMu36rtOZgGoZMvUKUW9mNscnO8n1Toa94i7w4fyXe3p4QG6+6Ly
         FjNw==
X-Gm-Message-State: APjAAAWUOlp0CSaqdVm3n2jWeZwwqLo5r0Rs5AdmsSu3JAk1H6ObWC4t
        IFWHNfQot6OxNAXtlafEOqUtvYYaW9w=
X-Google-Smtp-Source: APXvYqxW4koO62boNc3WCoIDhISX0LcyjZr3hZmrH0Ismqe1dCh6cyCDbtxTZMu7rpmlAJtG7VjsNg==
X-Received: by 2002:a7b:c751:: with SMTP id w17mr39395441wmk.127.1563383297570;
        Wed, 17 Jul 2019 10:08:17 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id b8sm28879591wmh.46.2019.07.17.10.08.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Jul 2019 10:08:16 -0700 (PDT)
Message-ID: <5d2f5600.1c69fb81.843ee.6bb5@mx.google.com>
Date:   Wed, 17 Jul 2019 10:08:16 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.2-10808-g9637d517347e
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: linusw
X-Kernelci-Branch: devel
Subject: linusw/devel boot: 49 boots: 0 failed,
 49 passed (v5.2-10808-g9637d517347e)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel boot: 49 boots: 0 failed, 49 passed (v5.2-10808-g9637d517347e)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/devel/ke=
rnel/v5.2-10808-g9637d517347e/
Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.2-10808-g9637d517347e/

Tree: linusw
Branch: devel
Git Describe: v5.2-10808-g9637d517347e
Git Commit: 9637d517347e80ee2fe1c5d8ce45ba1b88d8b5cd
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 33 unique boards, 15 SoC families, 3 builds out of 6

---
For more info write to <info@kernelci.org>
