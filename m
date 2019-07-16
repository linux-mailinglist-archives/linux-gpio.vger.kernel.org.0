Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2784F6A926
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jul 2019 15:06:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732565AbfGPNGt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jul 2019 09:06:49 -0400
Received: from mail-wm1-f51.google.com ([209.85.128.51]:37626 "EHLO
        mail-wm1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726997AbfGPNGt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jul 2019 09:06:49 -0400
Received: by mail-wm1-f51.google.com with SMTP id f17so18626653wme.2
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jul 2019 06:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=qkOyoKBkwaTxg+YteeUdOucEgl78TUe/h6ecJNF7EoE=;
        b=X1tT1ok2xo1A6fawxRN3i03QDauCEt/lDx08Zwqr3zUYrg+HiKj9BF8XCotnBe9xmv
         zK9aO6bi1QnmnY/VNE0MRNCDUe/GeN0VIQbQivY4Sf468FgzdDsw7ej3gVjS8sX14wRf
         Yh7/v+paaT79J1BT57RullaoSEe5ctR6tZVqyJO8rMtC2yLbz6dnUmlx+pspq95it9c9
         GF4DXT0CHEnZ40US+GU1l3450+2PzQj3fVqCMaWZ+iVoQpvozO9ePlLyWgJ8Be4rwgCE
         +ShNPfBDATwH/YiroexR13rG2U2wkGxsjhl3fN1qxRzEcLm+mK1HkGoCierXggDaw0AT
         Dz1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=qkOyoKBkwaTxg+YteeUdOucEgl78TUe/h6ecJNF7EoE=;
        b=eWkSlWpabpUYLVE8UFxknCqAwD3KJD9X91wIj3rQbIE6x46nsHw7uHZZWtlS2mcUDY
         6kwEwzV+5gkIChLc4mzseKQy70w6u11DvcTMmIC/vNvRt643sn2ps7qTsyLsAUU1wD7g
         maOjb3I1qjjDIdiENd7b5WHqkk8FvHwERyTJsEKTxXgwQ9Kugu0ldQddBte5roRGeWvh
         ayLVfQPMmKX9Izw4cikS4x662/VZ4Mcjm/eps+FoMU6KEDUBgmdas0xy8Q43FAc4r5HQ
         L+aIVAwY/TX0/LCEPgFniEupSveV3u8h5RjmHlEqz4ag1YAJ24UzVmhNQEbRGCwz3ako
         RGyQ==
X-Gm-Message-State: APjAAAWoMOWafTv4IdicnhsNCAdBB4ksCMRyFbTa9p5NQYEG6gRumP1x
        Z1GwbyiHTlwpD0T3BWMgUa4EUDljtqw=
X-Google-Smtp-Source: APXvYqz23sqOafJ2BXLR0I286tUJudsaE7NDTZV4cNDWRBjf8EjH/fj3C2WPmHJIO/GUofpVPK7ifw==
X-Received: by 2002:a1c:f505:: with SMTP id t5mr37142wmh.67.1563282406949;
        Tue, 16 Jul 2019 06:06:46 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id w23sm21281263wmi.45.2019.07.16.06.06.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Jul 2019 06:06:46 -0700 (PDT)
Message-ID: <5d2dcbe6.1c69fb81.872bd.9010@mx.google.com>
Date:   Tue, 16 Jul 2019 06:06:46 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.2-10813-g88785b7fa74a
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: linusw
X-Kernelci-Branch: fixes
Subject: linusw/fixes boot: 43 boots: 0 failed,
 43 passed (v5.2-10813-g88785b7fa74a)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes boot: 43 boots: 0 failed, 43 passed (v5.2-10813-g88785b7fa74a)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/fixes/ke=
rnel/v5.2-10813-g88785b7fa74a/
Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/v=
5.2-10813-g88785b7fa74a/

Tree: linusw
Branch: fixes
Git Describe: v5.2-10813-g88785b7fa74a
Git Commit: 88785b7fa74ae2dc52f879140b976984b5374c79
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 29 unique boards, 15 SoC families, 3 builds out of 6

---
For more info write to <info@kernelci.org>
