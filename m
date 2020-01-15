Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB0C513CC6D
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2020 19:45:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729033AbgAOSp0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Jan 2020 13:45:26 -0500
Received: from mail-wr1-f45.google.com ([209.85.221.45]:44495 "EHLO
        mail-wr1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729012AbgAOSp0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jan 2020 13:45:26 -0500
Received: by mail-wr1-f45.google.com with SMTP id q10so16778889wrm.11
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jan 2020 10:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Ew84wkD6v/js+xQwaesZi0yxpr9lfUNzeYgbkCeo1wM=;
        b=Brhct+Ow1qaMMDHmVjB1mr9u6dwTVtTsUqmWsv7fURXIUoVZ/kTcEfGwtyGkSLSjMc
         RzFaut+pCMZM+BagsFw+MxyW/VnO4fI1HGd1W4RpL02k7LfJqg4wZjrdMIOP0G8ALM1l
         mFHRpfsCd2ehWYvpl8cWwHL9ZhydphbRjY4X3JQeu19hF2f6tX8YjI0WHkCQdvZ/JKos
         6ytqmz34Yh8WndHo4uwBJSUE7IJaahwOCNKxZD6bsNKRaV5Gh2tOAs0ztx4HSdkcKLLV
         ahwOlSRvII9qKBUL40H4AFzd1JwRKoaVwtdso3nYmOKY8r4TVMk2Z9N15FMKxpA70xG9
         IiGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Ew84wkD6v/js+xQwaesZi0yxpr9lfUNzeYgbkCeo1wM=;
        b=A2Td8F1jwGo4X/8BdSELBVokd+0mJrdP2Sn2CnfqWbCXfXacYpTUh2Zr0DCri8hbkk
         VGjUrtuzqCH+hIXFE//ycWX4MhW1nVKZq4EO3YJMWyjzJc/Mofqe6tZgcZIHXpqsX3TK
         S9JXkO+uUYTC6MUYYPXr6/EPcGHrkeL0REaVe7GkzIPkcmtAEaRf8lPALTRO3TmJKtAc
         ZebVeF6YzrGGkSf9HTBP+pf5vj8GWWXvVJ+8RwqgurniKT48751LZOjDQ3ip7jbhXISN
         P+cFqlW+9LrnttISn6Sf47Sq/32euSQUY7dWDj86+mT/6qPMyExUTXgi7dHO3iaqjsKG
         kepw==
X-Gm-Message-State: APjAAAWW1jk8VieNXmCPs6EXqNTHAkqJ/ukeGMrmfgeplUwNdiXGmd4+
        SVkFD3xvDJi+ERDlmjOqj9t+tHaeraexPg==
X-Google-Smtp-Source: APXvYqylnTsr8puxWSIf41UKZGeXZo8tdjOp7kvdpJrCzprT+Q0zaNCZ9A0859UPEUAl3GcpA0hAgw==
X-Received: by 2002:adf:e984:: with SMTP id h4mr32114928wrm.275.1579113924172;
        Wed, 15 Jan 2020 10:45:24 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id m126sm240450wmf.7.2020.01.15.10.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 10:45:23 -0800 (PST)
Message-ID: <5e1f5dc3.1c69fb81.951d6.1309@mx.google.com>
Date:   Wed, 15 Jan 2020 10:45:23 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.5-rc1-38-g59c324683400
Subject: linusw/devel build: 5 builds: 0 failed,
 5 passed (v5.5-rc1-38-g59c324683400)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel build: 5 builds: 0 failed, 5 passed (v5.5-rc1-38-g59c324683400)

Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.5-rc1-38-g59c324683400/

Tree: linusw
Branch: devel
Git Describe: v5.5-rc1-38-g59c324683400
Git Commit: 59c324683400b41caa6d85b091e812ee3d5415c3
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Built: 5 unique architectures

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---
For more info write to <info@kernelci.org>
