Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C3C3CCBEA
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Oct 2019 20:08:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387527AbfJESIE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Oct 2019 14:08:04 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:35092 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387477AbfJESIE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Oct 2019 14:08:04 -0400
Received: by mail-wr1-f67.google.com with SMTP id v8so10724239wrt.2
        for <linux-gpio@vger.kernel.org>; Sat, 05 Oct 2019 11:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=da8j9n2dzG7iaA7ch9Qf1s8ticRLc5OTi78QVdccRJM=;
        b=ZQmG0u+y8iWpdKQQY+3ruyAK/WXsCh+3XGEimwVwBFnKUzu0Av+LEQuVIG1G6bPGnK
         A1MbIChoyX42wGVYRGk8VIIeLpo4WZ9F/G+bEX2op0CxOdRSrkLv6uiHVScHWX49LwNZ
         UEIakxcDP90XJwHNU0bwh0pkxen7l+xs45JtgCk4pddXUg4XM+tMPdcSB7QVCqo57Yix
         pfPKm200qvT/0AloDOO6vBUoBNmIxbzS+cd6GLLaXqZH06EU31QCnnruD6o870ou9+ZU
         srLWgc1GZLyj//vp7stlEH5Ip6EXhaCTbefdAN/NQh9Kvcmx/GbTTr2CA5dnYhBInrw7
         mvYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=da8j9n2dzG7iaA7ch9Qf1s8ticRLc5OTi78QVdccRJM=;
        b=XM/85k/ka9j+CLFb1eAe6bjk49SxU9DBQGpN+Tg1bQcW7wUdoH5oh13IEYbA8jbetX
         U6Jr87ylEl+MXIos+yHf/mdQrSUNVgnlc7nwnmC0+KRdYYRPAZnWpb7rgRE4j/kT4t9S
         HtWgwmD6qy2JoM07A+vH8fkljkINQvB/Rdn0f5X1KwpkNpDqyqaShtPtKLuU33QF+S6K
         TbmtwrsTSvA3svo+mxHtTJVJ8cLFtZ0HYHrQNeKA3nyv6jE1l7EvHVV+83uwfyAZjLDk
         AEPYV1gzSHd3poKRcG+cKzATAcaBayoOWy09DfPQ46HtoAtDOvqrW2/nYU1c6o3TvSO2
         i4UQ==
X-Gm-Message-State: APjAAAUVIWMHQwjat9Tn22fhMZFeOTC8lN9eQ6ejFYfRidxPIb+5VlQ9
        xszLHswtLn3yIaPUrTk0JN0RUY4UIH8=
X-Google-Smtp-Source: APXvYqxm5hB8c4e7CeWLp+ID6e8u2IVNyuEbsePtKhMdccRBSxGkYqIkTyHuhEa1BRlxtmQjMuPymQ==
X-Received: by 2002:a5d:4a01:: with SMTP id m1mr11724027wrq.343.1570298881845;
        Sat, 05 Oct 2019 11:08:01 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id w125sm17850392wmg.32.2019.10.05.11.08.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 05 Oct 2019 11:08:01 -0700 (PDT)
Message-ID: <5d98dc01.1c69fb81.6b8e2.032e@mx.google.com>
Date:   Sat, 05 Oct 2019 11:08:01 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-rc1-8-g8c550e94b883
X-Kernelci-Tree: linusw
X-Kernelci-Branch: devel
Subject: linusw/devel boot: 43 boots: 0 failed,
 42 passed with 1 untried/unknown (v5.4-rc1-8-g8c550e94b883)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel boot: 43 boots: 0 failed, 42 passed with 1 untried/unknown (v5=
.4-rc1-8-g8c550e94b883)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/devel/ke=
rnel/v5.4-rc1-8-g8c550e94b883/
Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.4-rc1-8-g8c550e94b883/

Tree: linusw
Branch: devel
Git Describe: v5.4-rc1-8-g8c550e94b883
Git Commit: 8c550e94b8835170593169a45b5ba30d3fc72a70
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 40 unique boards, 14 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          am335x-boneblack:
              lab-drue: new failure (last pass: v5.4-rc1-1-gf8b410e3695a)

---
For more info write to <info@kernelci.org>
