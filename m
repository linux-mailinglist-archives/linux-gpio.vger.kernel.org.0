Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 387027082B
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2019 20:10:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728727AbfGVSKv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jul 2019 14:10:51 -0400
Received: from mout.gmx.net ([212.227.17.21]:48917 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726343AbfGVSKv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 22 Jul 2019 14:10:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1563819022;
        bh=6lxKj9+sAR06pf4/6QYCp/kmuXeMmLOJxEbFufJqsMY=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=NiS8HRwy6BgozWdYXNK66p7vCt84CIH768tsox/WUTizJPw0yiW9bFFUNESICvAy4
         7phIn5MT5n+y2bfpvpzRH35h5Bf5fIvF3dELl330B9Lxn8ka+HCI0OLAXBkSJn9qya
         WJYmzOvgqeobCymj2JpHAgVFlnU5tRjkFmtaIQAo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.1.162] ([37.4.249.131]) by mail.gmx.com (mrgmx101
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0Ls8Qd-1iYkN70S6B-013rz1; Mon, 22
 Jul 2019 20:10:22 +0200
Subject: Re: [PATCH 00/18] ARM: Add minimal Raspberry Pi 4 support
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc:     Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Matthias Brugger <mbrugger@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-mmc@vger.kernel.org, Christoph Hellwig <hch@lst.de>
References: <1563774880-8061-1-git-send-email-wahrenst@gmx.net>
 <96113adb5fcab9c2f4bb5fa82b84ff5f9c07fd07.camel@suse.de>
From:   Stefan Wahren <wahrenst@gmx.net>
Message-ID: <bc650090-db86-ccac-01dc-23f08ad7b19b@gmx.net>
Date:   Mon, 22 Jul 2019 20:10:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <96113adb5fcab9c2f4bb5fa82b84ff5f9c07fd07.camel@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Provags-ID: V03:K1:wsdWOD8AOx6/JWnkhR7JmMozxoIsTd0nGR6x18zyFHiE5k7ixIg
 YvoaKuGef1o21yRhV6QI5yj/qKiEpyz9zeiTe4O4TjFlQd7V3zMX5BJSNZYVXWu/q5cUVhB
 HgOQxltRUf0IzFYpxAc1pA2yZUVxs+V651FJ+JJAhZJ+eS+EW+3P98wrOCewMt3y8u1GBgX
 WHv882PYeKQ3/TDzFNmKA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:rfqlcl1wERE=:mZf8bwHaSDOG1NT1+VB7Nw
 xaGTPzW8ch2nLgiOYZfCsFCRJSXtBShrb9GpDh4gu5xC5osUOxEW4pcqBbIQBoD4dJpvYikqA
 ZSyKU+gBx5QmtcefoeAjH+3lf4MGoHLjYHHPCWruh0fpCTwh9x0DA83rLdli4ehqy4JKcSLjI
 dA3hKQBfgSUjNydI5viRDyl4+VdOdgTlNyVorscw1HS41NxFUhZfRmshgT8TmO2JTxH25WL2G
 dVEJS6czXxaErayQrXW8+Vm5MrEzZrYNcwzsfO0AdCF4feqaFRgOZji/+JhkynJc3Qsi81Xgn
 aTW7Zb5AzM8cGSOCmWoo+Va+oy+zsYU3KDfiF3exEX/6UXniLf0wZrswFdeNZS6lHhPA76yME
 hcRYx62Mb4UFp5o9EyZmEvGntxh0TwCsMtfU6ifLpBgYjH5qtRHuQUtVCScgvRwKW7o2FmW+9
 PU/gt/5ZNJwSVqU9NktJqFUVx0+Zs2vynS9qeotiCJtT0+w0nIAxGYjcH9rqUEbw/9o+A+Xqh
 fwt0Cl3F7VdEtSXsDSHQGN/dmti8rRZHk4Rr2tmm5t/0u9wH4kyDOGqrnFeDelTdo1uFLxEIU
 pUEex92OSUxVuVTWBF3Njfr/b9rstXk5U5DoPkSbMzI1j7pc0VAYuC4X+Y0rF1EJje95NyexZ
 ffKYeMWTgpoSi7wm82/0t76ObLJ15b4i1NsgiGFjC6QDc1a86VFGMoa6RqK1gQDrflCYK7dKb
 jIZnG05zOOsx7F1T3gsZMofPDdJFEF8y2IFzgA8/EHEy+fnlmJgWg8Hv0Yv/OcKQSTJELm1zf
 uL4MTeGueKKvXI+QU5RKv+II4nZ1MNsSVfoO/CcYCnwTQjLekG0KAcqlUFr6EMYYXwy+gKerf
 AxxcZqLsthbYy0vXkuqty3KCcFujxf7v5J1aCW1jGTrgdPX2XhMcTakQnH7hUrhr82VH1gIZW
 0ATKuxFGdm41AsMhHNzM4AX6h3AAkoGg6qkURxylozLMkTBDp8BXfEdJ47QT2sdXQ4mWM8g/d
 En2yW6AAoedRoVpaLsAWxmbCXtcBoe4zb4UcPN7wJtxkDeJGtMg/w6ug/oEQL6bQXUJ4kMXjJ
 /oAAzShv32hDkk=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Nicolas,

[add Christoph]

Am 22.07.19 um 15:18 schrieb Nicolas Saenz Julienne:
> Hi Stefan,
> I rebased your bcm2711-initial branch on top of v5.3-rc1 and got this:
>
> [    2.307920] mmc1: new ultra high speed DDR50 SDHC card at address 59b=
4
> [    2.314972] mmcblk1: mmc1:59b4 USD   15.0 GiB
> [    2.320240]  mmcblk1: p1 p2
> [    2.324366] mmc0: new high speed SDIO card at address 0001
> [    2.365315] EXT4-fs (mmcblk1p2): mounted filesystem with ordered data=
 mode. Opts: (null)
> [    2.373579] VFS: Mounted root (ext4 filesystem) readonly on device 17=
9:2.
> [    2.381220] devtmpfs: mounted
> [    2.386618] Freeing unused kernel memory: 2048K
> [    2.394373] Run /sbin/init as init process
> [    2.644330] 8<--- cut here ---
> [    2.647439] Unable to handle kernel paging request at virtual address=
 bb000000
> [    2.654795] pgd =3D (ptrval)
> [    2.657540] [bb000000] *pgd=3D00000000
> [    2.661172] Internal error: Oops: 2805 [#1] SMP ARM
> [    2.666122] Modules linked in:
> [    2.669225] CPU: 0 PID: 86 Comm: kworker/0:1H Not tainted 5.3.0-rc1-0=
0020-g496d90bc72a9 #374
> [    2.677792] Hardware name: BCM2835
> [    2.681254] Workqueue: mmc_complete mmc_blk_mq_complete_work
> [    2.687002] PC is at v7_dma_inv_range+0x3c/0x54
> [    2.691602] LR is at __dma_page_dev_to_cpu+0x84/0x104
> [    2.696728] pc : [<c031cfec>]    lr : [<c0317468>]    psr: 80000013
> [    2.703089] sp : e8081e60  ip : ea059000  fp : 00000000
> [    2.708390] r10: 00000002  r9 : 00000002  r8 : e9fb9000
> [    2.713692] r7 : c1708cc4  r6 : c18cde80  r5 : 00001000  r4 : 0000000=
0
> [    2.720316] r3 : 0000003f  r2 : 00000040  r1 : bb001000  r0 : bb00000=
0
> [    2.726942] Flags: Nzcv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segm=
ent none
> [    2.734185] Control: 10c5383d  Table: 0020406a  DAC: 00000051
> [    2.740017] Process kworker/0:1H (pid: 86, stack limit =3D 0x(ptrval)=
)
> [    2.746466] Stack: (0xe8081e60 to 0xe8082000)
> [    2.750891] 1e60: c031d084 ea004480 e928f300 e8053014 00000002 c03193=
50 c0f015d0 e9196c10
> [    2.759197] 1e80: 00000002 c0317ac4 00000000 c124fc74 0000757d e97fb3=
90 c0317a6c c1704c48
> [    2.767503] 1ea0: e92a60c4 00000000 e97fb2b0 e9782800 e9783800 c0cce7=
70 00000000 ea004480
> [    2.775809] 1ec0: e928f300 e92a6008 e97fb200 c0cc8c68 e92a6008 e97fb2=
00 c1704c48 e92a60c4
> [    2.784115] 1ee0: 00000000 c0cc9040 00000000 e4380000 00000000 ada335=
4f 28989000 e92a60d8
> [    2.792420] 1f00: e9286080 ea004280 ff7b0200 00000000 c1891c70 000000=
00 ea004280 c0360eb8
> [    2.800726] 1f20: ffffe000 ea004280 c1703d00 e9286080 ea004280 e92860=
94 c1703d00 ea004298
> [    2.809032] 1f40: ffffe000 00000008 ea004280 c0361bb4 ffffe000 c18915=
ac c124ea98 00000000
> [    2.817338] 1f60: ffffe000 e91fc380 e92d3b00 00000000 e8080000 e92860=
80 c0361b70 e90bfea4
> [    2.825643] 1f80: e91fc39c c0366dac 00000001 e92d3b00 c0366c64 000000=
00 00000000 00000000
> [    2.833948] 1fa0: 00000000 00000000 00000000 c03010e8 00000000 000000=
00 00000000 00000000
> [    2.842253] 1fc0: 00000000 00000000 00000000 00000000 00000000 000000=
00 00000000 00000000
> [    2.850559] 1fe0: 00000000 00000000 00000000 00000000 00000013 000000=
00 00000000 00000000
> [    2.858872] [<c031cfec>] (v7_dma_inv_range) from [<c0317468>] (__dma_=
page_dev_to_cpu+0x84/0x104)
> [    2.867797] [<c0317468>] (__dma_page_dev_to_cpu) from [<c0317ac4>] (a=
rm_dma_unmap_sg+0x58/0x74)
> [    2.876635] [<c0317ac4>] (arm_dma_unmap_sg) from [<c0cce770>] (sdhci_=
post_req+0x5c/0x8c)
> [    2.884857] [<c0cce770>] (sdhci_post_req) from [<c0cc8c68>] (mmc_blk_=
mq_post_req+0x30/0xb4)
> [    2.893340] [<c0cc8c68>] (mmc_blk_mq_post_req) from [<c0cc9040>] (mmc=
_blk_mq_complete_prev_req.part.4+0x174/0x238)
> [    2.903855] [<c0cc9040>] (mmc_blk_mq_complete_prev_req.part.4) from [=
<c0360eb8>] (process_one_work+0x218/0x510)
> [    2.914104] [<c0360eb8>] (process_one_work) from [<c0361bb4>] (worker=
_thread+0x44/0x5c0)
> [    2.922323] [<c0361bb4>] (worker_thread) from [<c0366dac>] (kthread+0=
x148/0x150)
> [    2.929836] [<c0366dac>] (kthread) from [<c03010e8>] (ret_from_fork+0=
x14/0x2c)
> [    2.937168] Exception stack(0xe8081fb0 to 0xe8081ff8)
> [    2.942296] 1fa0:                                     00000000 000000=
00 00000000 00000000
> [    2.950601] 1fc0: 00000000 00000000 00000000 00000000 00000000 000000=
00 00000000 00000000
> [    2.958906] 1fe0: 00000000 00000000 00000000 00000000 00000013 000000=
00
> [    2.965623] Code: e1110003 e1c11003 1e071f3e e1500001 (3e070f36)
> [    2.971830] ---[ end trace 918fd7aaa4c1e4cc ]---
>
> I'm looking into it. Any ideas?

i rebased this series also and got this only on the RPi 4.

After reverting the following:

79a986721de dma-mapping: remove dma_max_pfn
7559d612dff0 mmc: core: let the dma map ops handle bouncing

This crash disappear, but wifi seems to be still broken.

Would be nice, if you can investigate further.

Regards
Stefan

>
> Regards,
> Nicolas
>
