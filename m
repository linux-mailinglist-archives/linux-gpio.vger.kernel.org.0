Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6209A9F3FE
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2019 22:24:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731186AbfH0UYO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Aug 2019 16:24:14 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:35975 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726871AbfH0UYO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Aug 2019 16:24:14 -0400
Received: by mail-wm1-f65.google.com with SMTP id p13so194321wmh.1
        for <linux-gpio@vger.kernel.org>; Tue, 27 Aug 2019 13:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=VEadQzarGxKXyiaXl4ZP6df5EmfxFEQyTsu6fF9+n3U=;
        b=E6c0Fij16fHF1V597rUPJjAKqoUFoOanD/+npnQuXJ+P6kgXgADiBQFE9/bxnEzkNn
         ppG+Rhi5nOcYYNaJOi1YfTHiILtwPTJOua0Q+toY/XjpgPQwvsmG5yE27/bGVRUDnWoC
         zaQpfDkVLzxzCzJuYpK+aJjIMTr+uG1eSbTplPI9GCVsutP+DrGeGRcZeNH1ZzhaM2dM
         fL7K6OsaNlHJktfnHTAnkLUXfgM2HKv63i+sEQXf7X1RB27791qpJBba66pVR8IDYSKm
         Cb/jeh6dSGx8imGoDa6znONkdlspY0+vyni1P4K7QcG9nB1X9CNkjmwVukCML0Cy8nxg
         pxmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=VEadQzarGxKXyiaXl4ZP6df5EmfxFEQyTsu6fF9+n3U=;
        b=UEc8JGFIocaLCtRWAII6DXkCctOwj7j+SZNe8ASAxohO61QFpcODmoCgioRiAnxDPR
         7OkPmiqj24FrvGvZD5FPG49PWkCU+6+7q6CPdB0Ejh8zGOTGwfiNdC788hJfn7SDGQlW
         6HzLjDkQHa+k06kdW49qg6zH1Ka02EgPpeyp2nSi9KtCpS0dHYzzB8Dah4tUvcnVGIQe
         J6TLmosESifl1k/cWwcKmRdpozLam1ETKaqMjSK2TCRHH9PB3iqwKiEm89UvbODxsuAd
         eJCK+yD2MpbdSNKXbn7ZN0UdLgD2eWwmdroQBACIqIZ386dRTJNI9MsXYMI/Ys0lw4Gp
         EeoA==
X-Gm-Message-State: APjAAAXcr92EL3cAAzFWEvrJjq50414vIF0/+p9RKESLUzjOUci7KCNu
        TCi5D8bCi48bbJIMw6Ly2QjLSji+eQ2Lzg==
X-Google-Smtp-Source: APXvYqypdfK5Nq9RqbRFbFF/w3zCkB2qTW4vUox7LLHZp/PZDpHbx0THe/FHJrEzmsx90cq9duoqsA==
X-Received: by 2002:a7b:cb0f:: with SMTP id u15mr331607wmj.173.1566937452252;
        Tue, 27 Aug 2019 13:24:12 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id t14sm80841wrs.58.2019.08.27.13.24.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Aug 2019 13:24:11 -0700 (PDT)
Message-ID: <5d65916b.1c69fb81.85e70.07a5@mx.google.com>
Date:   Tue, 27 Aug 2019 13:24:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc1-46-gf4e9bcc05f4e
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: for-next
Subject: linusw/for-next boot: 56 boots: 1 failed,
 54 passed with 1 untried/unknown (v5.3-rc1-46-gf4e9bcc05f4e)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next boot: 56 boots: 1 failed, 54 passed with 1 untried/unknown =
(v5.3-rc1-46-gf4e9bcc05f4e)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/v5.3-rc1-46-gf4e9bcc05f4e/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.3-rc1-46-gf4e9bcc05f4e/

Tree: linusw
Branch: for-next
Git Describe: v5.3-rc1-46-gf4e9bcc05f4e
Git Commit: f4e9bcc05f4e8d543afbfc0ca1fd4435a2204776
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 39 unique boards, 16 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          sun5i-a13-olinuxino-micro:
              lab-baylibre: new failure (last pass: v5.3-rc4-40-g67d5826a33=
03)

arm64:

    defconfig:
        gcc-8:
          apq8016-sbc:
              lab-mhart: new failure (last pass: v5.3-rc4-40-g67d5826a3303)

Boot Failure Detected:

arm64:
    defconfig:
        gcc-8:
            apq8016-sbc: 1 failed lab

---
For more info write to <info@kernelci.org>
