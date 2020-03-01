Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D70C1174A5F
	for <lists+linux-gpio@lfdr.de>; Sun,  1 Mar 2020 01:12:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727205AbgCAAMz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 29 Feb 2020 19:12:55 -0500
Received: from mail-pg1-f181.google.com ([209.85.215.181]:37428 "EHLO
        mail-pg1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726786AbgCAAMy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 29 Feb 2020 19:12:54 -0500
Received: by mail-pg1-f181.google.com with SMTP id z12so3490990pgl.4
        for <linux-gpio@vger.kernel.org>; Sat, 29 Feb 2020 16:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=hyKIEVG9lZE2xeiuQw4BWvfgp1wyVZEteJyyzDDfSZU=;
        b=miegiKwp6m0cAoNgchRYekFCoPkVSe/ZaBRiRk9C6+IKmdPv6A61imQQSd5cuVZgmz
         AwlPCBK3xtmstTaQ1mpql6+Z2JTGDJtvS5Ujgfx2PdkpiyWzgQZWyIhRh4CHvfOVrD8v
         afnkeiEk5PELYsLlC6U+jkMfNX0RRW/YxWes2UrQbVnuYm2faikXNtBIoFkD51UQc5BM
         DPst4r1l+cqtk2MYKNEJHBDmbwCyTShHVsdduQzfaWuT3Cqz50e8ENZi+609ANBFuXen
         IEqa9iKqwKllwDRrEsHKdnlCGrbCXB6u4eF79Zp5pJ0V8rVWmtzLVTzaOjt36h7zcT2k
         05mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=hyKIEVG9lZE2xeiuQw4BWvfgp1wyVZEteJyyzDDfSZU=;
        b=r4lNoQOrGog3+suNfChg/+oMYl0ddE7AEe0SZ8k7nvNIDdCfdYmKVTfAa0MhslGJks
         uaNkHzNkpRwpccOpJkfCn1ZHlMrjHHg19xEPebpvH5PIGhUrLp+7mGQSno/b9k1pdUtf
         Yez/XTKMi8/25qoQ2QwFogNaOhwkv5srxBU/yZgWlJRcHvJQclUQetr+J6Y8G46qxOcJ
         fuHL7+v/tr6DSdyM3kNcFhtCm4OrDw0211I2g2fao9/R1VlZ8+VozV6KMUn3DmPhTZ77
         gPXRhgaE/IQjUZ3fCeVbe2Egow1qjC+On7Ntg8x2Hh6aoE6vqcGbS8918WXmFOf6iQhi
         0gkA==
X-Gm-Message-State: APjAAAVmO9GifwHdjPypzBem4dqXoEu/UXggshALATgc2WvEOh0V+yP5
        jbXnOvqAT2sBowpEHmL8B60yJcIExIU=
X-Google-Smtp-Source: APXvYqyTNS11j7plOZGVCHTuac/nLF92kK1wV8sX7RMLZvpkdUQ0SA3DbY0QBVJ5UYjruC6bt/sVNw==
X-Received: by 2002:a63:3744:: with SMTP id g4mr12240656pgn.424.1583021573516;
        Sat, 29 Feb 2020 16:12:53 -0800 (PST)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x11sm15672234pfn.53.2020.02.29.16.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Feb 2020 16:12:52 -0800 (PST)
Message-ID: <5e5afe04.1c69fb81.0503.99c3@mx.google.com>
Date:   Sat, 29 Feb 2020 16:12:52 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-next
X-Kernelci-Kernel: v5.6-rc3-21-g27a2a9a4fa1f
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: linusw
Subject: linusw/for-next boot: 26 boots: 0 failed,
 26 passed (v5.6-rc3-21-g27a2a9a4fa1f)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next boot: 26 boots: 0 failed, 26 passed (v5.6-rc3-21-g27a2a9a4f=
a1f)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/v5.6-rc3-21-g27a2a9a4fa1f/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.6-rc3-21-g27a2a9a4fa1f/

Tree: linusw
Branch: for-next
Git Describe: v5.6-rc3-21-g27a2a9a4fa1f
Git Commit: 27a2a9a4fa1f84d99a649134aab7367464a1762b
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 26 unique boards, 7 SoC families, 2 builds out of 6

---
For more info write to <info@kernelci.org>
