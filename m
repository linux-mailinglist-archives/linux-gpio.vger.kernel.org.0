Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD2F7C8E36
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2019 18:24:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726165AbfJBQYe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Oct 2019 12:24:34 -0400
Received: from mail-wr1-f46.google.com ([209.85.221.46]:42278 "EHLO
        mail-wr1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725999AbfJBQYe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Oct 2019 12:24:34 -0400
Received: by mail-wr1-f46.google.com with SMTP id n14so20362271wrw.9
        for <linux-gpio@vger.kernel.org>; Wed, 02 Oct 2019 09:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=QPu4vU8943RZ1gcjdj4Hq9x3Hn4gFc65TKQJZR7JpE8=;
        b=E+MOfUq9jP0ubVvB8aWD9mY3GW5CycSOC2Oaxk2nLNyjq1IJ3iMXqcUqPeQUz9ciSS
         7Zy4aLkCHjAovEurQHOlTRyj4fR+LU2pflAWDekHxvbPB/fpTOrJlXOkYHDZR5lYJvjY
         hJ8ez4H/FTL/1UXe3E1uPxTvZuc4oHvDelD6u8aGUaUk9Rv0EoJXTwFj7z35rxzKsSWM
         AHVBq9vzICDyCCEtR9xZUrd0tcnZ8jB3n+dkXDfIB7QNeeTPXH+xkBccKmB/mRzxQKOq
         yhu5PcUf2X6rMTMywiGOkwkneyf6DiroMXqOC2pNylZ5Ci2dF7eFAIprOu5YmW299vkx
         V5RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=QPu4vU8943RZ1gcjdj4Hq9x3Hn4gFc65TKQJZR7JpE8=;
        b=BJhSy1TjV0bd5YSp82viDghE3D3rn4bhPKLlU7wZ2RVvNQ7yJrfGnGKNek0hc24dfq
         hs4lL2c8PdI+4JneIYhqsFbz6PTB8ubcsjz7CSF3wmX6MOSzHHmyz+3rNLy675Wmg2UF
         08KUx8dwJvSloMnYOgoyDXLVOYrN2FGsIDP0Fevj8QjA+3Gpnvde5o5PRaY19fvgoFD5
         ReGp3ly84qGjgWdupfG6nT2b3zU8JvOeIuW/E4VdA77km7RZN6lzj03uB0morJvj59yU
         usQ9Ngvr1SP7VsfXkQgAzSR2GTQpXGdtTFNk5qJKq8rKThUvthxUBF8jUz3XcpVvEyKL
         vzhA==
X-Gm-Message-State: APjAAAUU5+sJcnqtZ3MRw3JSmb6D7tlsgxT9ABGLPRWP4HpAzlivs1if
        o8szfEErcO4wLKt39ugXCE0GoBcq8SKoLg==
X-Google-Smtp-Source: APXvYqwytMm+lCY+lmg+EQ9WsgzcwJJRFbSda4p/JUBuDYeYrQx0dBohiCJr7qZqn8cp3PAbIMBz9w==
X-Received: by 2002:adf:eb42:: with SMTP id u2mr3397080wrn.307.1570033472667;
        Wed, 02 Oct 2019 09:24:32 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id o19sm11238743wmh.27.2019.10.02.09.24.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 Oct 2019 09:24:31 -0700 (PDT)
Message-ID: <5d94cf3f.1c69fb81.9eec0.8b24@mx.google.com>
Date:   Wed, 02 Oct 2019 09:24:31 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-rc1-1-gf8b410e3695a
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
Subject: linusw/devel boot: 56 boots: 0 failed,
 56 passed (v5.4-rc1-1-gf8b410e3695a)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel boot: 56 boots: 0 failed, 56 passed (v5.4-rc1-1-gf8b410e3695a)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/devel/ke=
rnel/v5.4-rc1-1-gf8b410e3695a/
Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.4-rc1-1-gf8b410e3695a/

Tree: linusw
Branch: devel
Git Describe: v5.4-rc1-1-gf8b410e3695a
Git Commit: f8b410e3695a86686f4075b997bc53c8a178e4e2
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 46 unique boards, 13 SoC families, 3 builds out of 6

---
For more info write to <info@kernelci.org>
