Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 471EFEDC40
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2019 11:13:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727796AbfKDKN6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Nov 2019 05:13:58 -0500
Received: from mail-wr1-f54.google.com ([209.85.221.54]:46934 "EHLO
        mail-wr1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727499AbfKDKN6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Nov 2019 05:13:58 -0500
Received: by mail-wr1-f54.google.com with SMTP id b3so10550888wrs.13
        for <linux-gpio@vger.kernel.org>; Mon, 04 Nov 2019 02:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=pAVyPL8XDcTTsphfiqmoEBw5KgUiw/X7P+hxwxYGPss=;
        b=UbcM/OlGWyVEpHXlAsNatF0wHA63zjdNfYR9WzanFPfOIgtEcITOI9tMqsQOq2fAM4
         7Ilopf/0RKr3kCL/c6Kv8v/6NBvzp2B8sw+Q97eFwANbkyAetr/Sz13KK1zfEGoTH/3q
         tZ2UE62hj8XWWOw0rAWKnX/0EU40OCbZRFoGDFhHf1b4z1v8/pzUsrvJHguO1JpxJJsy
         OWTzN5GbHmobu4UGqFLkviRds0Gu1mJ7pr7Q0lSuhWI2zK6oAEWKx3ykQpohzGvgQJ5j
         KEgpmPxogOpY5xBQR+cci04IZFVLrFAKEjdf6WJ8sopTXrvwS5q3Wfn2gNh8QKWpmrrX
         Va1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=pAVyPL8XDcTTsphfiqmoEBw5KgUiw/X7P+hxwxYGPss=;
        b=buA+odnErbtQ6Y87G9yGtlrCNRZnoanxbHy7lA8vXmEg40d2npEetSsW/Ur+vsZ7rO
         VYF/gsa6bOn8Fp4dVMaZDH5kIm+OiliIQcJw/kty5ka4s3kVCwCCgknvz3NKoOjbJVlc
         TnDt5BXunwsH3FBAAAqYUFIOOIAUg4KrBOY2MWaarQR/lbyW+E+GykJsaXTSQF29dq5j
         l6qHh1ylOVBMAZKkMd8aCWjqTTqxM6z6ahuhUd9Pgo0xzYeq+iIQ58fA12iokSDvOkLP
         PWY4MIGFtGfNF8qxQ+S/im8WnE0AfRFfUrqdtKt8X9+CrkzBQQ/asqFZmgQPA7de3Bdx
         J7iA==
X-Gm-Message-State: APjAAAUFsxi7tbNbmqQklKWxKN1cOvToz2WSpiszvStcVQlJ/oAgYORT
        jBE8qUdsSsVRbNcXbftyYuBnv2AUegyKPA==
X-Google-Smtp-Source: APXvYqylvg0n7cub9uD0eGcn2tnKVrJFJE7svjhbDWnIJxWIzeNtOaMkN2+oU4wQntQYtmvNLvHPqQ==
X-Received: by 2002:adf:b199:: with SMTP id q25mr23854004wra.320.1572862436089;
        Mon, 04 Nov 2019 02:13:56 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id g5sm8059349wmf.37.2019.11.04.02.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 02:13:55 -0800 (PST)
Message-ID: <5dbff9e3.1c69fb81.da6a6.e063@mx.google.com>
Date:   Mon, 04 Nov 2019 02:13:55 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: fixes
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-rc4-5-g1173c3c28abf
Subject: linusw/fixes boot: 43 boots: 0 failed,
 43 passed (v5.4-rc4-5-g1173c3c28abf)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes boot: 43 boots: 0 failed, 43 passed (v5.4-rc4-5-g1173c3c28abf)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/fixes/ke=
rnel/v5.4-rc4-5-g1173c3c28abf/
Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/v=
5.4-rc4-5-g1173c3c28abf/

Tree: linusw
Branch: fixes
Git Describe: v5.4-rc4-5-g1173c3c28abf
Git Commit: 1173c3c28abfc3d7b7665db502280ba9322320e6
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 36 unique boards, 13 SoC families, 3 builds out of 6

---
For more info write to <info@kernelci.org>
