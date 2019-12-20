Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA3D51273FB
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2019 04:34:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726986AbfLTDec (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Dec 2019 22:34:32 -0500
Received: from mail-wm1-f43.google.com ([209.85.128.43]:50227 "EHLO
        mail-wm1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726964AbfLTDec (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Dec 2019 22:34:32 -0500
Received: by mail-wm1-f43.google.com with SMTP id a5so7485316wmb.0
        for <linux-gpio@vger.kernel.org>; Thu, 19 Dec 2019 19:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=HrAhS1+eem1uCHzxgkwexZR1s5lTl3Rv93UYeH57BBs=;
        b=S7AArjkkFTKLlr6feyX1tRDAqrSL3MpZXKgdnVxI5KtOrC9fF2vVl60LW8ugWVqcd6
         OD3LjfjJP8AFtfQPjjEfL7o+MLzAoZ7tQrUaGY1CUtQk5TnPHBf9OIkcTZDoJ4TxEAZR
         o+RivENNTlbGnKE4dbohogjZJMZVw0XGaq6XWRe2s4kbQEk1PsztBP/ecV+q9JU64gn/
         Ff7nzRPOL5VtjUfLww9j5VNJf+lgbeiZ6JJLc+nKGWMZZliXISGUuMBeGBEDW/v8Xxgr
         bbRDjsH2O29szO6G4IVpPH2/vfewAyblFJXdcOJm8Eh8tYiu7f++kiWC9wXMMJmSslQd
         dtCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=HrAhS1+eem1uCHzxgkwexZR1s5lTl3Rv93UYeH57BBs=;
        b=a13bnUItF/tLkMfleMhZkXGWxl5+qdG0gyWw5XloUi0//Ty6nIiP0S+OaHjp+Y5br+
         sth9FvTKVWlGeFfWKjsbWuni4ahHBirG/mm1KW4cKuPj3JrUzXj1/1Lh7LXaMIJy+P4Z
         7s+Mrmxba8M7zkc55cbvwVPdcaAiBQ6PlMPnyg/ggMn4Lv9mJ3JdO1Hfv38h0XMmt/1G
         ZksJORZxlxMA2l0xpB69LiCqLu+O0E9rKzkPi0gZwk3l37A7AEzne/7i3pDmrkB5/DBk
         iHSEJ2/1CdBnv6v7wztEUkzCgQiWJJZBSX3qo91fiyTLVzHAJ5Ha1X+W8m168A985zrN
         ixHg==
X-Gm-Message-State: APjAAAXpgzm5+m0kKeB6utKzEWyU2gZQof6OUNyOr4mV21UWab4w2LRS
        1wWlmLgtxn2so+YJoaA50x5E1h6FCBRn+Q==
X-Google-Smtp-Source: APXvYqxw6Bcx++B38gdZTqGDldAUViwGZWGJOtByQNS1s1lC4feSHPAgIIl8y7YDi4WFTzoibGZbLg==
X-Received: by 2002:a05:600c:290f:: with SMTP id i15mr13883773wmd.115.1576812870404;
        Thu, 19 Dec 2019 19:34:30 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id x7sm8420940wrq.41.2019.12.19.19.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 19:34:29 -0800 (PST)
Message-ID: <5dfc4145.1c69fb81.247bc.abef@mx.google.com>
Date:   Thu, 19 Dec 2019 19:34:29 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.5-rc1-20-g06c4fc5eda6b
X-Kernelci-Tree: linusw
X-Kernelci-Branch: for-next
Subject: linusw/for-next boot: 46 boots: 0 failed,
 45 passed with 1 untried/unknown (v5.5-rc1-20-g06c4fc5eda6b)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next boot: 46 boots: 0 failed, 45 passed with 1 untried/unknown =
(v5.5-rc1-20-g06c4fc5eda6b)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/v5.5-rc1-20-g06c4fc5eda6b/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.5-rc1-20-g06c4fc5eda6b/

Tree: linusw
Branch: for-next
Git Describe: v5.5-rc1-20-g06c4fc5eda6b
Git Commit: 06c4fc5eda6bce50e3995e436db6aa7fb5bc56eb
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 43 unique boards, 14 SoC families, 2 builds out of 5

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          sun50i-a64-pine64-plus:
              lab-baylibre: new failure (last pass: v5.5-rc1-18-g65115d1733=
b4)

---
For more info write to <info@kernelci.org>
