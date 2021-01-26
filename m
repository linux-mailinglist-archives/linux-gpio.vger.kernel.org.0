Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F7B43034BC
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Jan 2021 06:26:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732742AbhAZF0q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jan 2021 00:26:46 -0500
Received: from mailout1.samsung.com ([203.254.224.24]:49705 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728581AbhAZBeM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Jan 2021 20:34:12 -0500
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20210126000854epoutp01b3f2e19ac97b131e26ae6f0dbfa51a57~dn5wESLSE0320403204epoutp01X
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jan 2021 00:08:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20210126000854epoutp01b3f2e19ac97b131e26ae6f0dbfa51a57~dn5wESLSE0320403204epoutp01X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1611619734;
        bh=aSvj28i9A8oFrK1lSot7dpTKIdqbMJEIpQmUs4/r/ak=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=C7MQsPY89ClXQMPuvQOTk29QBIVIcKWf9ZE/wTUyPx9jEzsbssXkdaUF4KCPKJdWR
         ECXjAxls0nnZRl+7tbybN+J13tyVa7Q+PgjfpuLoPD8hdGfgN6If7EP6wpl+ZPxMEa
         bjtrW0uIdjTcCHA0IFV6s0t6HZU9iZ0QOjlM2WRc=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTP id
        20210126000853epcas2p3e0f7c61e7ecdc693e76569e15668a55f~dn5vulj4a1772817728epcas2p36;
        Tue, 26 Jan 2021 00:08:53 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.40.187]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4DPnC75gJxz4x9Q8; Tue, 26 Jan
        2021 00:08:51 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        0B.DE.56312.29D5F006; Tue, 26 Jan 2021 09:08:50 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20210126000849epcas2p2fc24738f752b4ce7bd02fca819e07b64~dn5r4pSxJ0359403594epcas2p2U;
        Tue, 26 Jan 2021 00:08:49 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210126000849epsmtrp16afd72589aa2d40fe0217954bda29178~dn5r37Hzy1242312423epsmtrp1K;
        Tue, 26 Jan 2021 00:08:49 +0000 (GMT)
X-AuditID: b6c32a46-1efff7000000dbf8-bd-600f5d9291ba
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        6E.16.13470.19D5F006; Tue, 26 Jan 2021 09:08:49 +0900 (KST)
Received: from KORCO039056 (unknown [10.229.8.156]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20210126000849epsmtip12ce8d73cf0f112a461643fb383e97661~dn5rsc-yf0660006600epsmtip1H;
        Tue, 26 Jan 2021 00:08:49 +0000 (GMT)
From:   "Chanho Park" <chanho61.park@samsung.com>
To:     "'Linus Walleij'" <linus.walleij@linaro.org>
Cc:     <linux-gpio@vger.kernel.org>,
        "'Krzysztof Kozlowski'" <krzk@kernel.org>
In-Reply-To: <202101260734.haBuNSsB-lkp@intel.com>
Subject: RE: [pinctrl:devel 32/33]
 drivers/pinctrl/samsung/pinctrl-s3c64xx.c:296:25: error: passing argument 1
 of 'spin_unlock_irqrestore' from incompatible pointer type
Date:   Tue, 26 Jan 2021 09:08:49 +0900
Message-ID: <000001d6f377$6c1b3af0$4451b0d0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHfPgJ7vKMTCmjJO21WdD9GUhLuoAGwfof8qhrtfgA=
Content-Language: ko
x-msg-type: PERSONAL
x-drm-type: PERSONAL
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrBKsWRmVeSWpSXmKPExsWy7bCmue6kWP4Eg6mz2C3On9/AbjHlz3Im
        i83z/zA6MHtsWtXJ5nHn2h42j8+b5AKYo3JsMlITU1KLFFLzkvNTMvPSbZW8g+Od403NDAx1
        DS0tzJUU8hJzU22VXHwCdN0yc4AWKSmUJeaUAoUCEouLlfTtbIryS0tSFTLyi0tslVILUnIK
        DA0L9IoTc4tL89L1kvNzrQwNDIxMgSoTcjK+T9AvOCtb0XP/I2sD4xmRLkZODgkBE4l5LQfZ
        uhi5OIQEdjBKtB3tZwFJCAl8YpR4MLcKIvGNUeJIdwsrTMfbOz9ZIBJ7GSWOLWllhnBeMErs
        aW1iBqliE9CXeNmxDaxDRMBA4v75aewgNrOAt8SRb5/AVnAKGElcfXaUFaRZWGAto8SZ718Z
        QRIsAqoSx05/ZAKxeQUsJU78fMUKYQtKnJz5hAVikLzE9rdzmCFOUpD4+XQZ1DIribNrH7JC
        1IhIzO5sg6oRkejechtoJgeYfWdPCkR4IofE2RmmELaLxNZl0xkhbGGJV8e3sEPYUhIv+9vY
        Qe6UEOhmlGh99B8qsZpRorPRB8K2l/g1fQsryHxmAU2J9bv0IVYpSxy5BXUxn0TH4b/sEGFe
        iY42oQmMKrOQ/DULyV+zkNw/C2HmAkaWVYxiqQXFuempxUYFRshRvYkRnAS13HYwTnn7Qe8Q
        IxMH4yFGCQ5mJRHe3Xo8CUK8KYmVValF+fFFpTmpxYcYTYEhPZFZSjQ5H5iG80riDU2NzMwM
        LE0tTM2MLJTEeYsNHsQLCaQnlqRmp6YWpBbB9DFxcEo1MInPPt8fzX6yxW7r+j1Hb7XOCEoT
        dvKPVy09u9JlrtizGON8a8czVVd/qlZMnXP/VPFL7tfLdT/lK2RUP5rDXa0RfJKJjSXjoXt5
        k/EPkRur9d4/yGPZEPRYjstnd+cWRfY52rlci9sWhtvyL74arVYi67HGNonhlMDbuexvSgul
        vFdrn7516yp/6xr3vXJ7Lv8+wW1xvmbHF8PpFcqLXwe+PfzJRr3oMRvrnf23Q0p089r8mTrS
        NIoibN2KEhdtnKClubP4a6T8F2FGpq5tt3YXfZ7WWvfiwv6nvdZWdi/zPH5+q/0fwjj/4nVr
        p47jGgv7l0+wE3M4tL/j+uE/AtcKp8c8mClYKb/bddq3eUosxRmJhlrMRcWJAGfuS8ULBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprEIsWRmVeSWpSXmKPExsWy7bCSnO7EWP4Eg92X5CzOn9/AbjHlz3Im
        i83z/zA6MHtsWtXJ5nHn2h42j8+b5AKYo7hsUlJzMstSi/TtErgyvk/QLzgrW9Fz/yNrA+MZ
        kS5GTg4JAROJt3d+soDYQgK7GSW+7rGGiMtKPHu3gx3CFpa433KEtYuRC6jmGaPEoW8PmEES
        bAL6Ei87trGC2CICBhL3z08Da2AW8JVYe+MUE0RDM6PE6o8bwBKcAkYSV58dBZskLLCSUeL3
        5HNgq1kEVCWOnf7IBGLzClhKnPj5ihXCFpQ4OfMJUA0H0FQ9ibaNjBAL5CW2v53DDHGdgsTP
        p8ugjrCSOLv2IStEjYjE7M42qBpTiVVXv7PBfHP3wUuoz0QkurfcZgIZD2Lf2ZMygVF8FpLF
        sxAWz0KyeBaSBQsYWVYxSqYWFOem5xYbFhjmpZbrFSfmFpfmpesl5+duYgRHm5bmDsbtqz7o
        HWJk4mA8xCjBwawkwrtbjydBiDclsbIqtSg/vqg0J7X4EKM0B4uSOO+FrpPxQgLpiSWp2amp
        BalFMFkmDk6pBqZZ5nePfDqv8sfZry0ss2p35uaK73+MVy870+hlcLJtrvT0rkL1J8IPfv87
        En9iO/cZlga3rUwTE912FctM41u6o6I7Xr9ZcUJODf/UPRz8Z6LmPZlltFdqG+/vqM3db8yK
        vjPe4X5TvmvGofpr7UvENyxe8N6vaz/3jsLMX7meUTEL3jNsr6qM1om41n7fkWvt/KNnzs7N
        /v/xmePc4l0m8Sf4bVVWdbiqxsa8b72+JmtGscfSfIPIi+fsowqDfyrYLFL2uLPi3t6e5Se+
        mMW2XJx5uvLIgvyinytNDMzXuNff8ywxta36enjjld7D39/MfrbswU731Vpffy1uU3h78+/J
        qZYBk9Ye+fetbedUPiWW4oxEQy3mouJEAB4Ya+QlAwAA
X-CMS-MailID: 20210126000849epcas2p2fc24738f752b4ce7bd02fca819e07b64
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210125232704epcas2p4f362849a8f5e85f46d406d20b7983429
References: <CGME20210125232704epcas2p4f362849a8f5e85f46d406d20b7983429@epcas2p4.samsung.com>
        <202101260734.haBuNSsB-lkp@intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

>         git fetch --no-tags pinctrl devel
>         git checkout 1f306ecbe0f66681bd87a2bb9013630233a32f7f
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross
> ARCH=c6x
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from include/linux/wait.h:9,
>                     from include/linux/pid.h:6,
>                     from include/linux/sched.h:14,
>                     from include/linux/ratelimit.h:6,
>                     from include/linux/dev_printk.h:16,
>                     from include/linux/device.h:15,
>                     from drivers/pinctrl/samsung/pinctrl-s3c64xx.c:14:
>    drivers/pinctrl/samsung/pinctrl-s3c64xx.c: In function
> 's3c64xx_irq_set_function':
> >> drivers/pinctrl/samsung/pinctrl-s3c64xx.c:289:20: error: passing
> >> argument 1 of 'spinlock_check' from incompatible pointer type
> >> [-Werror=incompatible-pointer-types]
>      289 |  spin_lock_irqsave(&bank->slock, flags);
>          |                    ^~~~~~~~~~~~
>          |                    |
>          |                    raw_spinlock_t * {aka struct raw_spinlock *}
>    include/linux/spinlock.h:252:34: note: in definition of macro
> 'raw_spin_lock_irqsave'
>      252 |   flags = _raw_spin_lock_irqsave(lock); \
>          |                                  ^~~~
>    drivers/pinctrl/samsung/pinctrl-s3c64xx.c:289:2: note: in expansion of
> macro 'spin_lock_irqsave'
>      289 |  spin_lock_irqsave(&bank->slock, flags);
>          |  ^~~~~~~~~~~~~~~~~
>    In file included from include/linux/wait.h:9,
>                     from include/linux/pid.h:6,
>                     from include/linux/sched.h:14,
>                     from include/linux/ratelimit.h:6,
>                     from include/linux/dev_printk.h:16,
>                     from include/linux/device.h:15,
>                     from drivers/pinctrl/samsung/pinctrl-s3c64xx.c:14:
>    include/linux/spinlock.h:327:67: note: expected 'spinlock_t *' {aka
> 'struct spinlock *'} but argument is of type 'raw_spinlock_t *' {aka
> 'struct raw_spinlock *'}
>      327 | static __always_inline raw_spinlock_t
*spinlock_check(spinlock_t
> *lock)
>          |
~~~~~~~~~~~~^~~~
> >> drivers/pinctrl/samsung/pinctrl-s3c64xx.c:296:25: error: passing
> >> argument 1 of 'spin_unlock_irqrestore' from incompatible pointer type
> >> [-Werror=incompatible-pointer-types]
>      296 |  spin_unlock_irqrestore(&bank->slock, flags);
>          |                         ^~~~~~~~~~~~
>          |                         |
>          |                         raw_spinlock_t * {aka struct
raw_spinlock *}
>    In file included from include/linux/wait.h:9,
>                     from include/linux/pid.h:6,
>                     from include/linux/sched.h:14,
>                     from include/linux/ratelimit.h:6,
>                     from include/linux/dev_printk.h:16,
>                     from include/linux/device.h:15,
>                     from drivers/pinctrl/samsung/pinctrl-s3c64xx.c:14:
>    include/linux/spinlock.h:407:64: note: expected 'spinlock_t *' {aka
> 'struct spinlock *'} but argument is of type 'raw_spinlock_t *' {aka
> 'struct raw_spinlock *'}
>      407 | static __always_inline void spin_unlock_irqrestore(spinlock_t
> *lock, unsigned long flags)
>          |
~~~~~~~~~~~~^~~~
>    cc1: some warnings being treated as errors
> 
> 

Hi Linus,

I was not aware PINCTRL_S3C64XX because it's not enabled in
s3c6410_defconfig.
Please pick the v2 patch. Sorry for the inconvenience.

Best Regards,
Chanho Park

