Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6070E19AAAB
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2020 13:20:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732147AbgDALUj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Apr 2020 07:20:39 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:39779 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732146AbgDALUj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Apr 2020 07:20:39 -0400
Received: by mail-pg1-f196.google.com with SMTP id g32so5920686pgb.6
        for <linux-gpio@vger.kernel.org>; Wed, 01 Apr 2020 04:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=wjNt+nzb1d6Hb09W94UrootMNzhqU/r1KyVVrPVO/vs=;
        b=IZ7GpFFOXPoCMfBtUFm0DK7FKFm86jtIPSoj1Y+/rif1oOn3ZGvG/xkPPZndgRYYHG
         IRu9CnpQOPIbyZPSyAf8fV9gBrpfKgldUcRuVgPdfi4N+Z39CiERG2WqFZuh9cYJjnIn
         jxqTR2iqE3y+8RCD3z1rQxjTWn+Y8YKqbliyaHRWZ39KwkxhOdOP8cipwNSlMdfbVpUf
         LCaKztH+6ZhP5iFJhGt0BLMV4laeCYkhHAjoyUUiaCOn1LSpGuYQThPbcO88+BmrAWq3
         8fv7S2Pg0WThQQpIyhzXxzyoAsHziNwUZJbaOs29xZDxPEndsESMieAjnYruhpwuWiXj
         TAfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=wjNt+nzb1d6Hb09W94UrootMNzhqU/r1KyVVrPVO/vs=;
        b=k8VC+bc1fVicJ2yziEUxDfDxOyOBlN5uUQ0/+BZ0f+tPoiRJ6VrbydUO7IfQ6xZxAT
         nBO33V6wcQkO/GIm9xjDz4FChf9zcf+j5GTvl7vv1aUSZtNYZfSzFkGz/lpiX0jIyeuz
         /DOtK9Z6oYf7dh+p5eO/Bq1/BmpF6FjDmryieufVhzUqiayGKgCL2eVyfCd65k1s/94v
         d4LN5OxDRsnAZ1rAVQ6YnTRR0ZaDg0eXilIbGdMbIy4nHtjidCGzaF8KRxG6X434p0tw
         il2gY7cKqCzPy1dNk3i6mN3G6HURTrRliyoG6fkTovw4hvJPTiGQMuSjDYO5DcDl57xO
         Oeng==
X-Gm-Message-State: AGi0PubIMTeFXd6FHVJWQh5oM6QBE0DNx5GZ1f32P1d9UiDDwfqGTZ1O
        DFcW+ZRNQhTZvm8EdIycXNIf70xS0hQ=
X-Google-Smtp-Source: APiQypIKHxZi80Io3yNZpjOwRVG6tLaDNHgi7lcy7sQrNubkZ/oU0SIBWjy3Y0bC/gM3IWnCii+iuw==
X-Received: by 2002:a63:1718:: with SMTP id x24mr15220324pgl.421.1585740037413;
        Wed, 01 Apr 2020 04:20:37 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b16sm1397177pfb.71.2020.04.01.04.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2020 04:20:36 -0700 (PDT)
Message-ID: <5e847904.1c69fb81.9e9a.646a@mx.google.com>
Date:   Wed, 01 Apr 2020 04:20:36 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.6-rc7-61-g33dd88826319
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: linusw
X-Kernelci-Branch: devel
Subject: linusw/devel boot: 61 boots: 1 failed,
 60 passed (v5.6-rc7-61-g33dd88826319)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel boot: 61 boots: 1 failed, 60 passed (v5.6-rc7-61-g33dd88826319)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/devel/ke=
rnel/v5.6-rc7-61-g33dd88826319/
Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.6-rc7-61-g33dd88826319/

Tree: linusw
Branch: devel
Git Describe: v5.6-rc7-61-g33dd88826319
Git Commit: 33dd888263199676946f1c789e821d39a9a79d98
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 58 unique boards, 15 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 47 days (last pass: gpio-v5.5-4-=
45-gd18fddff061d - first fail: v5.6-rc1-12-gb2929a9cb2fb)

Boot Failure Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

---
For more info write to <info@kernelci.org>
