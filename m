Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9734BCC61D
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Oct 2019 00:55:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726669AbfJDWzY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Oct 2019 18:55:24 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40805 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbfJDWzY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Oct 2019 18:55:24 -0400
Received: by mail-wr1-f66.google.com with SMTP id h4so195341wrv.7
        for <linux-gpio@vger.kernel.org>; Fri, 04 Oct 2019 15:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=YfRhZiMeq1yXFMfNcs4GaPZqOt8cJ/kkN3vPBsnNvb4=;
        b=J1fyH+Mie9NXxlO7keplwGWqXgZl4+EvETUTVHC7WdrWhEgoHK5oE7lBw6rrIQgOPa
         TkfzJizEOrVXq5v5H5CfJCzkqWPLg36vkI2psQiUp6ZdnTgLldbizdVELkSFmE+fG0Wk
         8RuxezBTOZzdLB/FbQmDfp74/V4CFlAcB+foO7NcM67Kx7IHKytIayFaGMPKcaM36Rfs
         0qarBu7IET9BLEtH7JZIadLVmj5okqvr+tcH017WSWXxme+dOpsuHCYuEsExhRY9mDtB
         i+H5V1zcp3BN4u6C9R1IsSe+GKy54oOnShsG+Pp+/jKSZ8ZjEo770t2n0qTenaOu3Z4i
         pwGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=YfRhZiMeq1yXFMfNcs4GaPZqOt8cJ/kkN3vPBsnNvb4=;
        b=rYrBCpQqSnZZ8hAq27hA3SH5fe5MOaYkJOt3hpE3gUBA2rCrdbZR2LpPZPFQowzOKs
         XdP4cq9FMktAY+thUwGt1bVHwIm8GUfaN1OWs7I4fJISfRKPileb9p/t3+4t8iEXrqhu
         8c1lkVcLgjuEyf98pEwH+o7flvSV2qQm+U07e5KMf6FiBcboBhntH8e8X2L9BhnO7eZc
         D9jkQ1tXUc/dQHLey6MbTih8re89K9ZUD/Fy3lvIk/5e1bmCLiF6IdAAxgaCdm9j/UUp
         rmt3YlJEEbbLcEignrE3H/SZwu1ra8hgKSznl2enlmpTZRnChFUK1uWfFz0jAVZUXIOp
         G6Bw==
X-Gm-Message-State: APjAAAXE9fzS/reiLyJGlcak2ZRM9+UrAfaz+sUstbGCUR+ko2LIf6Ef
        BUbZB2VFOpPBlmZXRtJs7yR8+LBRhNXlIA==
X-Google-Smtp-Source: APXvYqw4N1ovATCdDXls+uF5RP1gecenBohDJefkTpDuxfWEFvpm0OrqnUT0dlSEwQKqQJoQoHPA5A==
X-Received: by 2002:adf:9b81:: with SMTP id d1mr12274558wrc.157.1570229722417;
        Fri, 04 Oct 2019 15:55:22 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id c9sm7889802wrt.7.2019.10.04.15.55.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Oct 2019 15:55:21 -0700 (PDT)
Message-ID: <5d97cdd9.1c69fb81.b78c8.5b8c@mx.google.com>
Date:   Fri, 04 Oct 2019 15:55:21 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-rc1-9-gff8baf289f37
X-Kernelci-Tree: linusw
X-Kernelci-Branch: for-next
Subject: linusw/for-next boot: 38 boots: 0 failed,
 38 passed (v5.4-rc1-9-gff8baf289f37)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next boot: 38 boots: 0 failed, 38 passed (v5.4-rc1-9-gff8baf289f=
37)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/v5.4-rc1-9-gff8baf289f37/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.4-rc1-9-gff8baf289f37/

Tree: linusw
Branch: for-next
Git Describe: v5.4-rc1-9-gff8baf289f37
Git Commit: ff8baf289f37efb0c90ce2de1ea9a9f6feea30d5
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 35 unique boards, 13 SoC families, 3 builds out of 6

---
For more info write to <info@kernelci.org>
