Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A095F13CD1C
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2020 20:30:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729133AbgAOTaM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Jan 2020 14:30:12 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:38759 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725999AbgAOTaM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jan 2020 14:30:12 -0500
Received: by mail-wm1-f65.google.com with SMTP id u2so1211622wmc.3
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jan 2020 11:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=OJtISdR18yjVS74wgDZVYU1cHcFhGeMHKT0a4y8fLNE=;
        b=wqNdJes9aOz9sVjNdLPwxvaYSU5gkyzQtH4IM82UI1r633BsFx0HWZZ0F+jRc+NBd4
         1M24QPY/+vEdLIW+puNyuLRPzoVbqouXhkfBdZ49EvkcUY4uIiMAMga88BCBVGaAL8Sg
         aqmnoOw6sv7c4oGExrzDIxsoRvyRJkHpXteSQe6x+pAOmwfqOEv578lmzhZn0X+ga7B4
         r1zldaHetoACo5TY0K8aMiOrYhY/EqSA9tleckxZwZgQd9t/0FMfsmy73bpDbXUdYNaY
         nOacrsZvupyo70+e6LX8DOehF5X/vwcctNP4hXCmcFn4j2a1ALt1WOv8h7K0QSS02Bde
         fXlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=OJtISdR18yjVS74wgDZVYU1cHcFhGeMHKT0a4y8fLNE=;
        b=gvrrwi7T9zugpBge0gj85W6FBiaoo7Ee2M91c3UgkLbnRxsxcYGKGYMC3Ev4wrB0Iw
         l3hj9dhpNVOp8lG27mYw0ODSit4GyGxmB7grOSqWKTPb7YbTaFg+jRpbfp/4K32XdCYX
         d9XPq72RCjmh5JWTgajGkUxO/IjGNiTVb0MMoangLluYTUCkrxxowzshGTR4WsuLekOo
         2TZW3t/Vwwuoldyy1DP2l9UFZYbkc0CPDVgV6hB5JY/YRyhmNzaRNQbrOvjWzuavXgSh
         gpF4LlblBR7TGdwIVLaObBe0u74YPLVW1NuEhl+JVqtAPFElq1Oh7tblfBQkKCvqPW5N
         FfPA==
X-Gm-Message-State: APjAAAXKWjIrjKXtymrGTAqXdgE64FN2JiIUv7oXUHnizet/UcgJ09VK
        9pOyw2CvnRlfAHtrOkIvxW3lMoGjrjZnBA==
X-Google-Smtp-Source: APXvYqzjPNMFCi/ZMpMLCOuHch0Tn3V6UFJ8n75E6rDPSavNOOZwMqT2WGE8BloTykzXrpEKMc6j8A==
X-Received: by 2002:a1c:48c1:: with SMTP id v184mr1635597wma.5.1579116609762;
        Wed, 15 Jan 2020 11:30:09 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id w8sm5598088wmd.2.2020.01.15.11.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 11:30:09 -0800 (PST)
Message-ID: <5e1f6841.1c69fb81.1e9fc.76e8@mx.google.com>
Date:   Wed, 15 Jan 2020 11:30:09 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.5-rc1-38-g59c324683400
Subject: linusw/devel boot: 55 boots: 0 failed,
 54 passed with 1 conflict (v5.5-rc1-38-g59c324683400)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel boot: 55 boots: 0 failed, 54 passed with 1 conflict (v5.5-rc1-=
38-g59c324683400)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/devel/ke=
rnel/v5.5-rc1-38-g59c324683400/
Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.5-rc1-38-g59c324683400/

Tree: linusw
Branch: devel
Git Describe: v5.5-rc1-38-g59c324683400
Git Commit: 59c324683400b41caa6d85b091e812ee3d5415c3
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 47 unique boards, 13 SoC families, 3 builds out of 5

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

arm:
    multi_v7_defconfig:
        imx6q-sabrelite:
            lab-collabora: FAIL (gcc-8)
            lab-baylibre: PASS (gcc-8)

---
For more info write to <info@kernelci.org>
