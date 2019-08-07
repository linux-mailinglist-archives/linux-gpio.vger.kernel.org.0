Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E54ED85143
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2019 18:43:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730117AbfHGQmF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Aug 2019 12:42:05 -0400
Received: from mail-wm1-f46.google.com ([209.85.128.46]:37098 "EHLO
        mail-wm1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730010AbfHGQmF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Aug 2019 12:42:05 -0400
Received: by mail-wm1-f46.google.com with SMTP id f17so704102wme.2
        for <linux-gpio@vger.kernel.org>; Wed, 07 Aug 2019 09:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=pnFL5ecUIi20WW/ro7bDYvmmgQR6A0AehF1RRiDJTK4=;
        b=S+UGw8A1Au20eJ7KXcw0D41zWKE+Rppp/dUQ1fF60NxhW4xsh1X+okvr5xNMv//oJo
         SsyVYAUXsA5DbmbecSL+R3/mjO7kj17sstPF0SrPKUqAlFwhI/G2mwnXCdQdZyOcBVIG
         MB9+xQYbo6Z1yyd5WxZVVdJbyZTaE15ThTM++3ruA3fQQx7r1gg3O+tn3LnX80WknwrC
         baXJrrgOTXsfa+BzG8WspHQCI8XShLfg8WTREr5xlAGj9On5ee8sn5uo4kt3b6bGWhXH
         qISayLrAe+XxNjnOeYKEuWy1ONmc2I1pswH2do3SQR4DBY1Et6lFL68ThNosFXRilDom
         F9ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=pnFL5ecUIi20WW/ro7bDYvmmgQR6A0AehF1RRiDJTK4=;
        b=A/qg3Ns0hma7a7ebs9fKUEYoTn3ufZ8eR7rIAEYAIV3qXYTyU7oT/X1AMfDmPzHxKb
         cgCpyDt0fgJw/QAMLeLFWNzdxVUlQi0PYA2NSGM8eTf6Yhz/2o+9G7QCDDnTssML3arj
         SP14UCVQZK17ZJrmx2Ef6d31X7S/2ftBo1qGkI13KC9JKvDo5T3dKjDRTYDtEalHwM9p
         gwf9vcvr4Dl+NHhJUtvvydl3eDlJ4XD/qQTQ5Ur0eFn2D2a9PmR5F/fHFiorP8H0qtOb
         0T68nBkOid9GpWvRTc006vyLIpAdK5RnyzAf6+KP9cOnMML8r9V8EtDBWWTni0lahLWk
         uQkA==
X-Gm-Message-State: APjAAAX42MY/o+/1RNyjbVXMUEFebDxWYbyjnO7c87LFHpAzd0sICAhw
        VICCCK41IEg28aT2sjmH41ZGnKHGTKjn6w==
X-Google-Smtp-Source: APXvYqxTqidebUqoSYeGra7bQ79U6RPWSfWB2besnKGhg4kgCTLKvjtNn8p0JJjZ87TbpIhX4gvfIw==
X-Received: by 2002:a05:600c:303:: with SMTP id q3mr833260wmd.130.1565196122746;
        Wed, 07 Aug 2019 09:42:02 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id a6sm741150wmj.15.2019.08.07.09.42.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Aug 2019 09:42:01 -0700 (PDT)
Message-ID: <5d4aff59.1c69fb81.20667.431e@mx.google.com>
Date:   Wed, 07 Aug 2019 09:42:01 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.3-rc1-18-g40b0bcd3e0e2
X-Kernelci-Branch: devel
X-Kernelci-Report-Type: boot
Subject: linusw/devel boot: 49 boots: 1 failed,
 48 passed (v5.3-rc1-18-g40b0bcd3e0e2)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel boot: 49 boots: 1 failed, 48 passed (v5.3-rc1-18-g40b0bcd3e0e2)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/devel/ke=
rnel/v5.3-rc1-18-g40b0bcd3e0e2/
Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.3-rc1-18-g40b0bcd3e0e2/

Tree: linusw
Branch: devel
Git Describe: v5.3-rc1-18-g40b0bcd3e0e2
Git Commit: 40b0bcd3e0e258cff3382717fb287f8be161a398
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 35 unique boards, 14 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          apq8016-sbc:
              lab-mhart: failing since 8 days (last pass: v5.2-10808-g9637d=
517347e - first fail: v5.3-rc1-5-ga299726da44f)

Boot Failure Detected:

arm64:
    defconfig:
        gcc-8:
            apq8016-sbc: 1 failed lab

---
For more info write to <info@kernelci.org>
