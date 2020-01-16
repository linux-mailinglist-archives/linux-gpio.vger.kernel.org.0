Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D84313DA56
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jan 2020 13:46:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726763AbgAPMq0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jan 2020 07:46:26 -0500
Received: from mail-wr1-f49.google.com ([209.85.221.49]:43080 "EHLO
        mail-wr1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726559AbgAPMq0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jan 2020 07:46:26 -0500
Received: by mail-wr1-f49.google.com with SMTP id d16so19013443wre.10
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jan 2020 04:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=xr0qn//J1xmcx0t/D0tws+PoFK9ai+00ltu654FrHfs=;
        b=qNhbbLzMzB+3eXnPvo3UnSj8a6qNmH0fa4dlrG9+sSLn1a6QNxTtQujUBtB8i4mCH2
         KzacLyUeTZamFZP8J/na0nQDKARnJ7X5I/Ox3LTqg7YbAME0JkA3apcYTNEivn0aIkzW
         ax5xdU/sjYvdH04bR6HVObrFKCqGJh98GQR3zPkx2d/YXpTzmjWUhmLCLzr8d4wmGng4
         6rqb28cdV8GMl7AIpYfIz8qm3fK3dVk7tc8Xd0ZKXH7XpSNU2dc1nvKYCqQgJf2unYok
         19l0HiNFWQ0dB56YWlCNAKaCcboFWw3vGOoVD+8xdMH43rS2xuG2gjDLYqolqWX+FZ/j
         smAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=xr0qn//J1xmcx0t/D0tws+PoFK9ai+00ltu654FrHfs=;
        b=td+DbGqk61HDXEbXScvRc7YsE9+ZMC6roGEZKp8bgWbKmQFFRHtsU9exGN6LrGUSXo
         lg0aYH4ZlN0j72fs7uNyeWoNPoSg4MDHpuh7MWTDiYWKwb09pw/fGQ4Uw4vJNBgUlDc0
         Fbx4VJzXiQSqq4wBowZmWFvG7Yk5VNKiNianELNGrOELimrsbDeqv3wDIEWvBSZtg8AM
         1/oJ9CmXaXy7u+ZVsc2pIUCxYNUr7wtJMy4TWPe/bv1dPy98rQYBlyMZq0JGmRysYY5z
         KqeHreNaPzyjkZLG4szCFB/30+xTvixxOCp4vZhaDEfOhRXBsJCxfqW7ynaOtc7rKJuH
         dC9w==
X-Gm-Message-State: APjAAAU+CF4otVmz5KjyZCb8ruU+bPuqn9tihT6gJ1SGWgzd4/M6FUNS
        Nv8KWZm6BMncij+RjItB7XdKDtHCeuwg2g==
X-Google-Smtp-Source: APXvYqyYMZmYLAt6CdIBQEpKFkZVU6MABk9Op26pKDpSAzKUA24enY+xO0Q+NfYkiOqMb5Xuqh9Qag==
X-Received: by 2002:adf:ec41:: with SMTP id w1mr3009228wrn.212.1579178783938;
        Thu, 16 Jan 2020 04:46:23 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id d8sm29788202wre.13.2020.01.16.04.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2020 04:46:23 -0800 (PST)
Message-ID: <5e205b1f.1c69fb81.97cd6.af96@mx.google.com>
Date:   Thu, 16 Jan 2020 04:46:23 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.5-rc6-44-g158a4056fd63
Subject: linusw/for-next boot: 55 boots: 0 failed,
 54 passed with 1 untried/unknown (v5.5-rc6-44-g158a4056fd63)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next boot: 55 boots: 0 failed, 54 passed with 1 untried/unknown =
(v5.5-rc6-44-g158a4056fd63)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/v5.5-rc6-44-g158a4056fd63/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.5-rc6-44-g158a4056fd63/

Tree: linusw
Branch: for-next
Git Describe: v5.5-rc6-44-g158a4056fd63
Git Commit: 158a4056fd63860093771b40cebdd78dc218798e
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 47 unique boards, 14 SoC families, 3 builds out of 5

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          am335x-boneblack:
              lab-baylibre: new failure (last pass: v5.5-rc6-43-g18c24c6782=
82)

---
For more info write to <info@kernelci.org>
