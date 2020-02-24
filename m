Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A62E616B0C4
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2020 21:08:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726778AbgBXUIC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Feb 2020 15:08:02 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:54988 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726722AbgBXUIC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Feb 2020 15:08:02 -0500
Received: by mail-pj1-f65.google.com with SMTP id dw13so218105pjb.4
        for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2020 12:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=OwgWKf6f1biOnGAfCkMwwL7E3xGnfUJnYrK5rkCm2nE=;
        b=PrMUOkaujYYrnhuW5Z23aX+zsIijY7hQVzUyfLAcJtywMHAl3PgQABQ5beTuKy0prQ
         2h5Utk0eXVH0kI8fqN/AFmIcRv6jqvH3msDh+IedyvdmL+3T5WD7cwTgCXgWeN86SdmP
         13+CJ14lgFN02N5ORguvOkpeowLP+VxMpe7pNouvlQNfWNF5VWFsUbGDF5YiB/0/6XVM
         KapprqjT6IoV1U1BTwXC+0ktpNrmTo2fXV/Pk8QJvWUQ0o2DnhhR11B1xj5m2OOpPJ2I
         VkfDe8qimMwCcGjrNu/hvRBVz3VRht+LCfWNIaTCtiygDyrdisawQXI/V3o+JBRTd0Jo
         RvsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=OwgWKf6f1biOnGAfCkMwwL7E3xGnfUJnYrK5rkCm2nE=;
        b=fHObjii9sReJuaz9PDbkYFuh0hsUZ097jvga1flv4c6NGmqOrvbXGTadUNg4CB3LGA
         sfeGTntqYMiQQC/sd3qnZFUZ8g9aEw8GdXzvktvlVaO2s3TAMlgV/qQrctt8SNsM5iWg
         POZLxiV839MpfT1Fu10aMLAoLUHqY8E2bPMQpm09C6OGzTCdmy1t+WGiIym9eQHuNV3x
         UMCAuo5r1WRekGkHWn0ht79Sjvp9k1y67ELVV3iMYNJdXeydwmDZoZJA683UD/vJ1h7e
         iJwqj14+K30H2z65AAz8PAIgBeKCAdYG7wm3uC8zqS47zQm1vHYORQlh9vYcO62AspZL
         v+OQ==
X-Gm-Message-State: APjAAAVLJWZcJgB9koClblJN8smzXUiz3gBqLSNMLEdT1y7yeHLTCdVg
        iLIYZxD5FbnDCFUndPBJoQi4wChw3+s=
X-Google-Smtp-Source: APXvYqyi5JX6tWu0QAqAfvif7q3P4cJSaf9l/DlNHDhYFTZGbRUJnswJ6azJ89L04k93mxYg4LhFRQ==
X-Received: by 2002:a17:902:7004:: with SMTP id y4mr51776428plk.263.1582574881660;
        Mon, 24 Feb 2020 12:08:01 -0800 (PST)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j8sm312060pjb.4.2020.02.24.12.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2020 12:08:01 -0800 (PST)
Message-ID: <5e542d21.1c69fb81.a4aa2.112c@mx.google.com>
Date:   Mon, 24 Feb 2020 12:08:01 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.6-rc1-19-g63636d956c45
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: linusw
X-Kernelci-Branch: devel
Subject: linusw/devel boot: 51 boots: 1 failed,
 50 passed (v5.6-rc1-19-g63636d956c45)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel boot: 51 boots: 1 failed, 50 passed (v5.6-rc1-19-g63636d956c45)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/devel/ke=
rnel/v5.6-rc1-19-g63636d956c45/
Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.6-rc1-19-g63636d956c45/

Tree: linusw
Branch: devel
Git Describe: v5.6-rc1-19-g63636d956c45
Git Commit: 63636d956c455c0fbe2118078a03f563ddd6bf6e
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 44 unique boards, 14 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 11 days (last pass: gpio-v5.5-4-=
45-gd18fddff061d - first fail: v5.6-rc1-12-gb2929a9cb2fb)

Boot Failure Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

---
For more info write to <info@kernelci.org>
