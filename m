Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A5E23055D8
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jan 2021 09:35:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbhA0Ifd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jan 2021 03:35:33 -0500
Received: from mailout4.samsung.com ([203.254.224.34]:60986 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232991AbhA0IYS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jan 2021 03:24:18 -0500
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20210127082331epoutp04c3f1e162d268b481877784b042707366~eCS5Ln6zD0462004620epoutp04m
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jan 2021 08:23:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20210127082331epoutp04c3f1e162d268b481877784b042707366~eCS5Ln6zD0462004620epoutp04m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1611735811;
        bh=9/YGMF2wG22cImHwtFDTscKexxHVW5JRkUankPaW6k8=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=YkoHB4i16lRU0DjTiwGgIrsxYOxkLvn4pgAcH2Xxt8oItlw8WEv1mXLd5Ca42n5tQ
         zRPibcXPIRMQkx0fbccyub3u+jWKhnYxk4Vtu9dVnOswakf7YFc9dH+gulCAYVFVx0
         lFlVxQelSrywUkPhMxxQRoiDuAS2EAkMgSjw1oOI=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTP id
        20210127082330epcas2p3a4ed2c5197c68d21b0978876004db26e~eCS4cWg501787117871epcas2p3M;
        Wed, 27 Jan 2021 08:23:30 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.40.191]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4DQc7N3YyBz4x9Pt; Wed, 27 Jan
        2021 08:23:28 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        8D.B4.05262.CF221106; Wed, 27 Jan 2021 17:23:24 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20210127082324epcas2p33221fff84d78dcffb9765b32972d05c6~eCSy3PtiP1883018830epcas2p3G;
        Wed, 27 Jan 2021 08:23:24 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210127082324epsmtrp111af1488d87c9e606e061f1302b3d53a~eCSy2amEp0867208672epsmtrp18;
        Wed, 27 Jan 2021 08:23:24 +0000 (GMT)
X-AuditID: b6c32a47-b97ff7000000148e-46-601122fc975d
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        60.48.08745.CF221106; Wed, 27 Jan 2021 17:23:24 +0900 (KST)
Received: from KORCO039056 (unknown [10.229.8.156]) by epsmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20210127082324epsmtip2d4af3c79081714db798c8f4dab2fad60~eCSyt_b-W2800228002epsmtip2M;
        Wed, 27 Jan 2021 08:23:24 +0000 (GMT)
From:   "Chanho Park" <chanho61.park@samsung.com>
To:     "'Linus Walleij'" <linus.walleij@linaro.org>
Cc:     "'Tomasz Figa'" <tomasz.figa@gmail.com>,
        "'Krzysztof Kozlowski'" <krzk@kernel.org>,
        "'Sylwester Nawrocki'" <s.nawrocki@samsung.com>,
        "'Linux ARM'" <linux-arm-kernel@lists.infradead.org>,
        "'linux-samsung-soc'" <linux-samsung-soc@vger.kernel.org>,
        "'open list:GPIO SUBSYSTEM'" <linux-gpio@vger.kernel.org>
In-Reply-To: <CACRpkdZhZP9uJ7Wm6vLQYCCZN3=g_Rfrbap9cmwUREPeuWFGUA@mail.gmail.com>
Subject: RE: [PATCH] pinctrl: samsung: use raw_spinlock for s3c64xx
Date:   Wed, 27 Jan 2021 17:23:24 +0900
Message-ID: <018901d6f485$ae109b80$0a31d280$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQE2icd3O+rtEwzwFlocWNI1WHVyrgEm2ClKAT5BgamraM5kAA==
Content-Language: ko
x-msg-type: PERSONAL
x-drm-type: PERSONAL
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprDJsWRmVeSWpSXmKPExsWy7bCmqe4fJcEEg8WTrSzOn9/AbjHlz3Im
        i02Pr7FabJ7/h9Fixvl9TBaH37SzWqza9YfRgd1j56y77B6bVnWyedy5tofNY/OSeo++LasY
        PT5vkgtgi8qxyUhNTEktUkjNS85PycxLt1XyDo53jjc1MzDUNbS0MFdSyEvMTbVVcvEJ0HXL
        zAE6RUmhLDGnFCgUkFhcrKRvZ1OUX1qSqpCRX1xiq5RakJJTYGhYoFecmFtcmpeul5yfa2Vo
        YGBkClSZkJPR23qNreAeY8WxbW3MDYyrGLsYOTgkBEwkFl2s72Lk4hAS2MEo0b/4GjOE84lR
        YktjDyuE85lRouXpc5YuRk6wjmv3rjFBJHYxSpz4cgPKecEosfH0OVaQKjYBfYmXHdvAbBEB
        A4n756exgxQxC+xmkji99DPYKE6BQIkbH1+AFQkLOEvs3twIFmcRUJVYs/0gE4jNK2ApMfPv
        F2YIW1Di5MwnYDXMAvIS29/OYYY4SUHi59NlUMucJDauPcEMUSMiMbuzDapGRKJ7y20miKdF
        JO7sSQG5R0LgCIdE295GVogaF4k5995BvSks8er4FnYIW0riZX8bO0RDN6NE66P/UInVjBKd
        jT4Qtr3Er+lbWEEWMAtoSqzfpQ+xS1niyC2ok/kkOg7/ZYcI80p0tAlNYFSZheSxWUgem4Xk
        gVkIMxcwsqxiFEstKM5NTy02KjBGjuxNjOBkquW+g3HG2w96hxiZOBgPMUpwMCuJ8NopCCYI
        8aYkVlalFuXHF5XmpBYfYjQFBvVEZinR5HxgOs8riTc0NTIzM7A0tTA1M7JQEuctNngQLySQ
        nliSmp2aWpBaBNPHxMEp1cA0cfniizY2yby5m8J2ZK1h2DjLuzDu4cxfhZ9XFIh8qZh7W2f1
        43bGNOuQG3b8PctUOxIF+vMK1+3OqO/12eJww7Cq1+/2jafaXws3v82/W1IZ5v3i/R0BPZaM
        eKM1/4K7j8fzOItwh9xpc3y/zcNDskkxf2nf58sLDAseMh/JbXpl62Hy/Hic76YJr/Q0vRf4
        JCl7nJKuU4su0pnhdSms88TOa+uWLhNtSTy2LaYuw+HO9ortv5ja+m+FXXu79+DFh7Fn2W6l
        zDp653aWrJFl882iqw5+nC+5jyaLb5U4vkfQxIG5Scbsn3lmxtXV4rPylrGWmN/Yahs9Ken7
        9YU3GQRDat/fevvPcTfjrqtKLMUZiYZazEXFiQCjrF2sLwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOIsWRmVeSWpSXmKPExsWy7bCSvO4fJcEEg0vf+CzOn9/AbjHlz3Im
        i02Pr7FabJ7/h9Fixvl9TBaH37SzWqza9YfRgd1j56y77B6bVnWyedy5tofNY/OSeo++LasY
        PT5vkgtgi+KySUnNySxLLdK3S+DK6G29xlZwj7Hi2LY25gbGVYxdjJwcEgImEtfuXWMCsYUE
        djBK/O6NhIjLSjx7t4MdwhaWuN9yhLWLkQuo5hmjxK/Zy8Ga2QT0JV52bGMFsUUEDCTun5/G
        DlLELLCXSeLp0uXMEB1XGSW+Lt0E1sEpEChx4+MLsA5hAWeJ3ZsbWUBsFgFViTXbD4KdwStg
        KTHz7xdmCFtQ4uTMJ2A1zALaEr0PWxkhbHmJ7W/nMEOcpyDx8+kyVphTXx3fAnW2qcSFryuY
        IK5zkti49gQzRK+IxOzONqheEYnuLbeBajjA7Dt7UiYwis9CsnkWks2zkGyehWTSAkaWVYyS
        qQXFuem5xYYFRnmp5XrFibnFpXnpesn5uZsYwXGrpbWDcc+qD3qHGJk4GA8xSnAwK4nw2ikI
        JgjxpiRWVqUW5ccXleakFh9ilOZgURLnvdB1Ml5IID2xJDU7NbUgtQgmy8TBKdXAFG51dPP0
        7Sndd6+6PHItS1YvVjKedW4G092M8KPTXtbfZNjeepSX7ZyTZVLPrY1vnSzaf5zuqFjNEZd7
        0+Ks8+ZZ0Y3V8ubhOad23qpkaVr96lCDoObuAOdvUcrZr/cdnfhixkfFM4zfgi3jcwM2OZxg
        Dl2ry+o0/6/D3R1eX+bf//jzUklM/ouzUlYC+2TD0heslg/ff64xizWvvYzxTvhrsXYJj/dy
        iuri03bvNJ7T8uit7Cs37sX/BUszF3+5+/Rv/DbHW+Uya1ecEhBwtSvzLdY4b5dyUKtZdYLg
        2Zvl9obH1/BOUnl1k8HI/Fnpmej2/uh7Pz9ONPhuFii9e0noDpnFs02ZDtcrTnB/qcRSnJFo
        qMVcVJwIAN7nB5BKAwAA
X-CMS-MailID: 20210127082324epcas2p33221fff84d78dcffb9765b32972d05c6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210127001644epcas2p13cbc984fecc3ac7700a422488b488135
References: <CGME20210127001644epcas2p13cbc984fecc3ac7700a422488b488135@epcas2p1.samsung.com>
        <20210127001631.91209-1-chanho61.park@samsung.com>
        <CACRpkdZhZP9uJ7Wm6vLQYCCZN3=g_Rfrbap9cmwUREPeuWFGUA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> Fixed up the patch commit text a bit as indicated by Krzysztof and applied
> so the tree compiles again.
> Thanks for fixing!

Thanks a lot. I'll check them up carefully next time :)

Best Regards,
Chanho Park

