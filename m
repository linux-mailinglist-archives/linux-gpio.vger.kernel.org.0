Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D05F120679
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2019 13:58:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727576AbfLPM6f (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Dec 2019 07:58:35 -0500
Received: from mail-wr1-f50.google.com ([209.85.221.50]:36215 "EHLO
        mail-wr1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727553AbfLPM6f (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Dec 2019 07:58:35 -0500
Received: by mail-wr1-f50.google.com with SMTP id z3so7137820wru.3
        for <linux-gpio@vger.kernel.org>; Mon, 16 Dec 2019 04:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Xp7qZyb5j0uo4gtnwFBZ76CryRRkT+barKxg+kk9qHU=;
        b=18+OXC2p2BSNaR9QFPDeOBChjp4xtd4++36NSPC8qwVU/vlAYy2dq75F25mR+/z+U/
         xS/eST5NKIGyGQaCBDs1vNd3Zt7zSdplsP4QxiwwW+Cd8E2Z5M3guaBlg+ui0KbS+jJQ
         rIuRs0/CrKZfH8hKkbrKW2pQ0SmsWtwTTE5Zoc9TKC/5/W6B6AFohBWmHOoU3P1ackoz
         3h+rkHtD93VW8NBqsiRkxNnJXtqGhtQWSA4aNeL5hEVy41gZruw6T6Zj8RQ9qf+qxgft
         riOUU4RQxfmFaHCB/JeMopZ+uUXDUPaHQWuB5jCQ41djV5XPT7VUKWbLdYsM0+ZTl4dD
         vKjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Xp7qZyb5j0uo4gtnwFBZ76CryRRkT+barKxg+kk9qHU=;
        b=M/3kAK+HnB34ApqCMnOErgN6jXvDiwka/YAnA3QRhlOEM/qWUbAhtrktMZqRFsgZcp
         AcgzpHD/3HIvJSlA7copo3xxOtBBjV33N58VYo1TnkuxT1alBOpNJd4Uhc+ipgpKA9LW
         2knq9qRvAv9WZ+EjRo08qiA2+x5lOc6jwPL0l1DkAXeOVXZjr89XNV0Cs3a04uFHIlS1
         2nEuhYMfHXTrGRwWl8va3HJrK9E4zqWxzUxlK18AforJ88eCoZPDEZFhM6L3zqoPgHO2
         OHjXdT71C2Ls3TMKMoYDuvAKi6UoxvCtk2keCai+cqGkn0jQZmsSOLcXx7fh75sIP0DM
         s6VA==
X-Gm-Message-State: APjAAAV0rcr7+49JHPjnikfPqTivccyV/6I1HFWN36x1j4lGm+v4xuE1
        Zvbe0Kr2OdRxkleuWDwU7/FGoIzCBxY=
X-Google-Smtp-Source: APXvYqw5Q4eP0UqPmqSFlCZYMUFuOQC7x+MxiFBvGHrxfZ7NucoEp2DBfBHidpq31ycToSII1gNFsg==
X-Received: by 2002:adf:f10a:: with SMTP id r10mr30000208wro.202.1576501112697;
        Mon, 16 Dec 2019 04:58:32 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id t8sm21473567wrp.69.2019.12.16.04.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 04:58:32 -0800 (PST)
Message-ID: <5df77f78.1c69fb81.96a3d.eab0@mx.google.com>
Date:   Mon, 16 Dec 2019 04:58:32 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.5-rc1-11-g286e7beaa4cc
X-Kernelci-Tree: linusw
X-Kernelci-Branch: fixes
Subject: linusw/fixes boot: 25 boots: 0 failed,
 25 passed (v5.5-rc1-11-g286e7beaa4cc)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes boot: 25 boots: 0 failed, 25 passed (v5.5-rc1-11-g286e7beaa4cc)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/fixes/ke=
rnel/v5.5-rc1-11-g286e7beaa4cc/
Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/v=
5.5-rc1-11-g286e7beaa4cc/

Tree: linusw
Branch: fixes
Git Describe: v5.5-rc1-11-g286e7beaa4cc
Git Commit: 286e7beaa4cc7734894ee214569de4669ed9891e
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 25 unique boards, 9 SoC families, 3 builds out of 5

---
For more info write to <info@kernelci.org>
