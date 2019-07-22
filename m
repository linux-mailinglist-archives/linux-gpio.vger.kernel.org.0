Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2480700DA
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2019 15:19:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729335AbfGVNSw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jul 2019 09:18:52 -0400
Received: from mx2.suse.de ([195.135.220.15]:39378 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729269AbfGVNSv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 22 Jul 2019 09:18:51 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 5131EB12A;
        Mon, 22 Jul 2019 13:18:48 +0000 (UTC)
Message-ID: <96113adb5fcab9c2f4bb5fa82b84ff5f9c07fd07.camel@suse.de>
Subject: Re: [PATCH 00/18] ARM: Add minimal Raspberry Pi 4 support
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     Stefan Wahren <wahrenst@gmx.net>, Eric Anholt <eric@anholt.net>,
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
        Adrian Hunter <adrian.hunter@intel.com>
Cc:     bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-mmc@vger.kernel.org
Date:   Mon, 22 Jul 2019 15:18:45 +0200
In-Reply-To: <1563774880-8061-1-git-send-email-wahrenst@gmx.net>
References: <1563774880-8061-1-git-send-email-wahrenst@gmx.net>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-+xvs9/Nc6gcPUG2kjj1w"
User-Agent: Evolution 3.32.3 
MIME-Version: 1.0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--=-+xvs9/Nc6gcPUG2kjj1w
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-07-22 at 07:54 +0200, Stefan Wahren wrote:
> This series adds minimal support for the new Raspberry Pi 4, so we are ab=
le
> to login via debug UART.
>=20
> Patch 1-5:   Prepare platform and DTS for the new SoC BMC2711
> Patch 6-10:  Enable support for emmc2 on BCM2711
> Patch 11-12: Enable pinctrl for BCM2711
> Patch 13-17: Add Raspberry Pi 4 DTS support
> Patch 18:    Update MAINTAINERS
>=20
> Unfortunately the Raspberry Pi Foundation didn't released a
> peripheral documentation for the new SoC yet. So we only have a prelimina=
ry
> datasheet [1] and reduced schematics [2].
>=20
> Changes since RFC:
> - change BCM2838 -> BCM2711 as discussed in RFC
> - update MAINTAINERS accordingly
> - drop "spi: bcm2835: enable shared interrupt support" from series
> - squash all pinctrl-bcm2835 changes into one patch
> - introduce SoC specific clock registration as suggested by Florian
> - fix watchdog probing for Raspberry Pi 4
> - convert brcm,bcm2835.txt to json-schema
> - move VC4 node to bcm2835-common.dtsi
> - fallback to legacy pull config for Raspberry Pi 4
> - revert unintended change of mailbox in bcm283x.dtsi
> - add reference for arm64
>=20
> [1] -=20
>=20
https://www.raspberrypi.org/documentation/hardware/raspberrypi/bcm2711/rpi_=
DATA_2711_1p0_preliminary.pdf
> [2] -=20
>=20
https://www.raspberrypi.org/documentation/hardware/raspberrypi/schematics/r=
pi_SCH_4b_4p0_reduced.pdf
>=20
> Phil Elwell (1):
>   ARM: bcm2835: DMA can only address 1GB
>=20
> Stefan Wahren (17):
>   ARM: bcm283x: Reduce register ranges for UART, SPI and I2C
>   ARM: dts: bcm283x: Move BCM2835/6/7 specific to bcm2835-common.dtsi
>   ARM: dts: bcm283x: Define MMC interfaces at board level
>   ARM: dts: bcm283x: Define memory at board level
>   dt-bindings: bcm2835-cprman: Add bcm2711 support
>   clk: bcm2835: Introduce SoC specific clock registration
>   clk: bcm2835: Add BCM2711_CLOCK_EMMC2 support
>   dt-bindings: sdhci-iproc: Add brcm,bcm2711-emmc2
>   mmc: sdhci-iproc: Add support for emmc2 of the BCM2711
>   dt-bindings: pinctrl: bcm2835: Add brcm,bcm2711 compatible
>   pinctrl: bcm2835: Add support for BCM2711 pull-up functionality
>   dt-bindings: arm: Convert BCM2835 board/soc bindings to json-schema
>   dt-bindings: arm: bcm2835: Add Raspberry Pi 4 to DT schema
>   ARM: bcm2835: Add bcm2711 compatible string
>   ARM: dts: Add minimal Raspberry Pi 4 support
>   arm64: dts: broadcom: Add reference to RPi 4 B
>   MAINTAINERS: Add BCM2711 to BCM2835 ARCH

Hi Stefan,
I rebased your bcm2711-initial branch on top of v5.3-rc1 and got this:

[    2.307920] mmc1: new ultra high speed DDR50 SDHC card at address 59b4
[    2.314972] mmcblk1: mmc1:59b4 USD   15.0 GiB=20
[    2.320240]  mmcblk1: p1 p2
[    2.324366] mmc0: new high speed SDIO card at address 0001
[    2.365315] EXT4-fs (mmcblk1p2): mounted filesystem with ordered data mo=
de. Opts: (null)
[    2.373579] VFS: Mounted root (ext4 filesystem) readonly on device 179:2=
.
[    2.381220] devtmpfs: mounted
[    2.386618] Freeing unused kernel memory: 2048K
[    2.394373] Run /sbin/init as init process
[    2.644330] 8<--- cut here ---
[    2.647439] Unable to handle kernel paging request at virtual address bb=
000000
[    2.654795] pgd =3D (ptrval)
[    2.657540] [bb000000] *pgd=3D00000000
[    2.661172] Internal error: Oops: 2805 [#1] SMP ARM
[    2.666122] Modules linked in:
[    2.669225] CPU: 0 PID: 86 Comm: kworker/0:1H Not tainted 5.3.0-rc1-0002=
0-g496d90bc72a9 #374
[    2.677792] Hardware name: BCM2835
[    2.681254] Workqueue: mmc_complete mmc_blk_mq_complete_work
[    2.687002] PC is at v7_dma_inv_range+0x3c/0x54
[    2.691602] LR is at __dma_page_dev_to_cpu+0x84/0x104
[    2.696728] pc : [<c031cfec>]    lr : [<c0317468>]    psr: 80000013
[    2.703089] sp : e8081e60  ip : ea059000  fp : 00000000
[    2.708390] r10: 00000002  r9 : 00000002  r8 : e9fb9000
[    2.713692] r7 : c1708cc4  r6 : c18cde80  r5 : 00001000  r4 : 00000000
[    2.720316] r3 : 0000003f  r2 : 00000040  r1 : bb001000  r0 : bb000000
[    2.726942] Flags: Nzcv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment=
 none
[    2.734185] Control: 10c5383d  Table: 0020406a  DAC: 00000051
[    2.740017] Process kworker/0:1H (pid: 86, stack limit =3D 0x(ptrval))
[    2.746466] Stack: (0xe8081e60 to 0xe8082000)
[    2.750891] 1e60: c031d084 ea004480 e928f300 e8053014 00000002 c0319350 =
c0f015d0 e9196c10
[    2.759197] 1e80: 00000002 c0317ac4 00000000 c124fc74 0000757d e97fb390 =
c0317a6c c1704c48
[    2.767503] 1ea0: e92a60c4 00000000 e97fb2b0 e9782800 e9783800 c0cce770 =
00000000 ea004480
[    2.775809] 1ec0: e928f300 e92a6008 e97fb200 c0cc8c68 e92a6008 e97fb200 =
c1704c48 e92a60c4
[    2.784115] 1ee0: 00000000 c0cc9040 00000000 e4380000 00000000 ada3354f =
28989000 e92a60d8
[    2.792420] 1f00: e9286080 ea004280 ff7b0200 00000000 c1891c70 00000000 =
ea004280 c0360eb8
[    2.800726] 1f20: ffffe000 ea004280 c1703d00 e9286080 ea004280 e9286094 =
c1703d00 ea004298
[    2.809032] 1f40: ffffe000 00000008 ea004280 c0361bb4 ffffe000 c18915ac =
c124ea98 00000000
[    2.817338] 1f60: ffffe000 e91fc380 e92d3b00 00000000 e8080000 e9286080 =
c0361b70 e90bfea4
[    2.825643] 1f80: e91fc39c c0366dac 00000001 e92d3b00 c0366c64 00000000 =
00000000 00000000
[    2.833948] 1fa0: 00000000 00000000 00000000 c03010e8 00000000 00000000 =
00000000 00000000
[    2.842253] 1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000 00000000
[    2.850559] 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000 =
00000000 00000000
[    2.858872] [<c031cfec>] (v7_dma_inv_range) from [<c0317468>] (__dma_pag=
e_dev_to_cpu+0x84/0x104)
[    2.867797] [<c0317468>] (__dma_page_dev_to_cpu) from [<c0317ac4>] (arm_=
dma_unmap_sg+0x58/0x74)
[    2.876635] [<c0317ac4>] (arm_dma_unmap_sg) from [<c0cce770>] (sdhci_pos=
t_req+0x5c/0x8c)
[    2.884857] [<c0cce770>] (sdhci_post_req) from [<c0cc8c68>] (mmc_blk_mq_=
post_req+0x30/0xb4)
[    2.893340] [<c0cc8c68>] (mmc_blk_mq_post_req) from [<c0cc9040>] (mmc_bl=
k_mq_complete_prev_req.part.4+0x174/0x238)
[    2.903855] [<c0cc9040>] (mmc_blk_mq_complete_prev_req.part.4) from [<c0=
360eb8>] (process_one_work+0x218/0x510)
[    2.914104] [<c0360eb8>] (process_one_work) from [<c0361bb4>] (worker_th=
read+0x44/0x5c0)
[    2.922323] [<c0361bb4>] (worker_thread) from [<c0366dac>] (kthread+0x14=
8/0x150)
[    2.929836] [<c0366dac>] (kthread) from [<c03010e8>] (ret_from_fork+0x14=
/0x2c)
[    2.937168] Exception stack(0xe8081fb0 to 0xe8081ff8)
[    2.942296] 1fa0:                                     00000000 00000000 =
00000000 00000000
[    2.950601] 1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000 00000000
[    2.958906] 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    2.965623] Code: e1110003 e1c11003 1e071f3e e1500001 (3e070f36)=20
[    2.971830] ---[ end trace 918fd7aaa4c1e4cc ]---

I'm looking into it. Any ideas?

Regards,
Nicolas


--=-+xvs9/Nc6gcPUG2kjj1w
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl01t7UACgkQlfZmHno8
x/5uswgAoGs+CiRagO/OyBrZCckc6k9KNXpfzhuvSyLsp2zcQJ84mDiGPIVRtgzI
cFOT8JeaQE0k14mm9xDcJN9kgDS74vwgUCW2709V2MZnseeF0Q8IXarBid8Be5m/
m7bPYtPc8tec23NB4WB0rF3rmI4wf3VJkgtpt9ODdrfDJssQdP6925BD+nlUYfC+
0OZBEJLqFEMrmE0PR5Fxycu7fzgCggawne/4gpR/tV73C9EBgq4T7bBl3G95f1r7
FP0R9uPFPffbakGaMhG/yS3wEXSNrx/aa2jbwhglo4B1cPf/ORoAP2ht9sSVvIs6
y4vSd03kJG+Mbj89Sto+SNPAI/vjZw==
=p/Q/
-----END PGP SIGNATURE-----

--=-+xvs9/Nc6gcPUG2kjj1w--

