Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CF30F30D8
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Nov 2019 15:06:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728942AbfKGOGv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Nov 2019 09:06:51 -0500
Received: from mail-wr1-f43.google.com ([209.85.221.43]:37152 "EHLO
        mail-wr1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726810AbfKGOGu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Nov 2019 09:06:50 -0500
Received: by mail-wr1-f43.google.com with SMTP id t1so3188945wrv.4
        for <linux-gpio@vger.kernel.org>; Thu, 07 Nov 2019 06:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=6Yc5pzga+Vi1bDcrU3xOEr57D8SyQ2HqMquEcERKgZw=;
        b=wMZOmbs7t2p8wOHowIVBQGLbANw+bS+CmSEQRoa5x48fEAw8QyFzRCAvV4MdXgVGnw
         FKnv1Z1CDgutTIHu1+MQ/ZH3xbQaW6AafyfqXXyhPL3Lh+4FGQPDsOJU6iFtYbnIeywD
         uKFHaqx2FXXy1qW0JX56Akq3l5dFSZKEsLxxKet1O2QVEQSf/gqlNuW60W8T/oRWeuoD
         jHtVbhmNWcBklt1F0PTHv/EErnSVim5tD0RQus9ZMEsSbj6iD2oOKLt7wIINSC+AP02F
         77mpNgT1kjDTfyi5iW6JpQN5W1Njt0PjGZoy6Pz6JKs8EPOmiMGwJR/MPAMHyMlBNy8W
         H4RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=6Yc5pzga+Vi1bDcrU3xOEr57D8SyQ2HqMquEcERKgZw=;
        b=PfEFuVP+W4ijZdb6A9YnGxiBWj4oy0w7qDJX2sw2v4OB0fyXBez+5x3Te1wKrZQLVe
         JeqHqC2GEUbfATIZOGPy/mwoUkwb8H2VTPdkLC6lslgfgyyYsIRuuinmKPUQENWGcGyC
         LOBHWx2NP9pua2rjI4mk5CqUL1MlmXHuvWXh6TKSo5O/Hp0KEZhueprUu1tCYSBwrMtW
         JF4h2UmzjWh8a0yUmUrOPwEglq2/PUc54OYqpO5g6f0qzBXImrbjT1lzZNxkdEqK4vmr
         FCuHkhxyPA2m2DYUzJQgR3Mz2lxPl7RjOaRLr74oDF9N3aZrvRUP9JZvXfObUz7c1XrQ
         dVdw==
X-Gm-Message-State: APjAAAU+tSrTl67BaFdc5D83J/wMvGy8EV1GC+hBq48i1MSHm/HehCOC
        o0dyhHAMFZxrA53z85GTWnVmTCfSYrlrIw==
X-Google-Smtp-Source: APXvYqyLwjow0Wd2vZAQjEi9eo7MTDp8HVvihN7V8B3H6t9AxZmGKjQaHtmU/CWCWrxHF1hYRc6nSw==
X-Received: by 2002:a5d:6947:: with SMTP id r7mr3152669wrw.129.1573135608590;
        Thu, 07 Nov 2019 06:06:48 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id 205sm6632869wmb.3.2019.11.07.06.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 06:06:47 -0800 (PST)
Message-ID: <5dc424f7.1c69fb81.2591f.4d21@mx.google.com>
Date:   Thu, 07 Nov 2019 06:06:47 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-rc6-40-g39f4fc38d180
Subject: linusw/for-next boot: 43 boots: 0 failed,
 42 passed with 1 untried/unknown (v5.4-rc6-40-g39f4fc38d180)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next boot: 43 boots: 0 failed, 42 passed with 1 untried/unknown =
(v5.4-rc6-40-g39f4fc38d180)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/v5.4-rc6-40-g39f4fc38d180/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.4-rc6-40-g39f4fc38d180/

Tree: linusw
Branch: for-next
Git Describe: v5.4-rc6-40-g39f4fc38d180
Git Commit: 39f4fc38d18072da3326a52f3d0922836987256f
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 35 unique boards, 13 SoC families, 3 builds out of 6

---
For more info write to <info@kernelci.org>
