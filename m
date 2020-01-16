Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A780513D983
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jan 2020 13:01:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726230AbgAPMBm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jan 2020 07:01:42 -0500
Received: from mail-wm1-f48.google.com ([209.85.128.48]:37038 "EHLO
        mail-wm1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726088AbgAPMBm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jan 2020 07:01:42 -0500
Received: by mail-wm1-f48.google.com with SMTP id f129so3515661wmf.2
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jan 2020 04:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=15SR7cVQEjN+8zAjQHX15N334fgpBhxuiwehHth+aVE=;
        b=Kfv/k8Jszxs8PYefsemqiNZXYEWsoJQqjNf41ObRzgILQLav/2wxzh3q4spUNyMHz/
         cxKbWOWVOvpDDSRLVTcF07pdjK3UyDD7QM7uikW2vlmf5GJQxqD1bGqc0T573vm4G30O
         X7yciN27GVHumLL4UdgM7mfEuz+OcwLVLOX0F2A4KVaV7lUmqXOGwREKITQIQrEiceuV
         yteGHZ7/SYzWuAfaWoHJGWUUjKIevns7eqfd3MLZjmiaYb/EzVpZuJDVPzJGzcZJPhIg
         mWDbprhGPVv4ScOfkdPX/tywKex5RqUC64uxm/WxsZ1C5DGMd/ZDPMr0c1HXFgc3b1Sm
         GhNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=15SR7cVQEjN+8zAjQHX15N334fgpBhxuiwehHth+aVE=;
        b=Avls7uiq4AO6HteuEzg2+GoHosgHsnFc/0Qtu29rO9aXIVqaqY7xqPIF/aQmZFhpjP
         UcEV4hQhMRPOuYUA01vrp3jVEeZ5kUDY5k2kSlso1/L6vTLKRxtQS0bP0l8hFU3DZRLR
         a3NtC3SoCwxkGBKNQcLvWWcX5ZRDwoEmHIl9I7hD8QElwyM95grtGwUCD3GQJrBhJHFm
         F63DCPriplkDXobnoEwKFYvmnKLuGTDXr0ztxxDN+KxnRllfoJEWyF6Oi5TOxHHARCl1
         bDLLyvgczO1NDok/g/2YDpUTIfG51BuwSLmlVNbuprmmJSgO8dLwJ7J8S+1VRfsDR36o
         7fmQ==
X-Gm-Message-State: APjAAAWIJlQUnj8gq8MfPD7I42ifCRYFHaKDy7G/9q61qVzdRPQojwbH
        3EiPV4YuT7h+3Q56YbAhqudLNDNo/0bqsw==
X-Google-Smtp-Source: APXvYqwPknGITnp3oYq45Sz3zvIke0FZ8aik6wsRgnnygAKMeX8i3dJvgJfCNE7vK0FgowM1E2F6FQ==
X-Received: by 2002:a1c:49c2:: with SMTP id w185mr5585472wma.138.1579176100196;
        Thu, 16 Jan 2020 04:01:40 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id n3sm27393500wrs.8.2020.01.16.04.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2020 04:01:39 -0800 (PST)
Message-ID: <5e2050a3.1c69fb81.917b5.2493@mx.google.com>
Date:   Thu, 16 Jan 2020 04:01:39 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.5-rc6-44-g158a4056fd63
Subject: linusw/for-next build: 5 builds: 0 failed,
 5 passed (v5.5-rc6-44-g158a4056fd63)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 5 builds: 0 failed, 5 passed (v5.5-rc6-44-g158a4056f=
d63)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.5-rc6-44-g158a4056fd63/

Tree: linusw
Branch: for-next
Git Describe: v5.5-rc6-44-g158a4056fd63
Git Commit: 158a4056fd63860093771b40cebdd78dc218798e
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
