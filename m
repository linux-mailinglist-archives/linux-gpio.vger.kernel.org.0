Return-Path: <linux-gpio+bounces-11877-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5854E9AD64F
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 23:05:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 824871C219F6
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 21:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D6A61E5731;
	Wed, 23 Oct 2024 21:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="URivOPtv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5DE155741;
	Wed, 23 Oct 2024 21:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729717548; cv=none; b=nJFIcln00rE67P1rO4OIRweuZ0+JgF1P78a+3CzGezKRAFfvG9voDzd45sXvWpaByNHSDS210/rw5hQEz+InLLZ8r7U+ZOEi4XxV0MzJqtiBEOb8vEQblulvHJv/jAqHjj+Ys7CFeLPzycz1ldNn8THZO5VduNVddxHK+gCTfEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729717548; c=relaxed/simple;
	bh=HN37AY7VkQHWCq/fRiXAiNMyOhGOGgsKmAXYrhnrrVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UdZle4vEw22L2rhRsoVsLtVDRukrCeOp8IGYXwrXClXQH46SN9MBpXMiXlIEf2tbBaiPVTdwG9VKJkz4jqks1ytrUnknGPctkKtu1tZXnR1iwvz4gda+X6wTwKe2fGgn7J6q3z6LT6V03fpCmLiwLtlTcqALctA2RRZImoZ44dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=URivOPtv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E98FDC4CEE5;
	Wed, 23 Oct 2024 21:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729717548;
	bh=HN37AY7VkQHWCq/fRiXAiNMyOhGOGgsKmAXYrhnrrVQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=URivOPtvv5E0wGmqNuSTR2RBxkHdmS5bqmRVF1iHmpyGCYKAEmU0tyjQXYfkbCWty
	 N0Q43/WOc+CKRRU2PSi6N2lOF+b9zKuNGZmkIXy0vvIC+uaYuC4KFBXTBXfk3GHrSW
	 jM03STVBh3PMbUVDKonOc5LZ2Rqivde8rjRZSduNdOKab4bNMgmmqiparavJtSkh0z
	 DK3x6t8eq7UwOavkuqyqIWqJFkA8XeqGrpvpo1B42453yhD1GhkK4cCL2WoOka7CcJ
	 J65jEZCKXeGs/jOfLtpZkaJmqJIV05u8Mg61Y4TGkq7wwDjors2HqqnAIr6Q40ZF+H
	 4VP6FVicLxtdA==
Date: Wed, 23 Oct 2024 22:05:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v5 8/8] gpiolib: notify user-space about in-kernel line
 state changes
Message-ID: <d6601a31-7685-4b21-9271-1b76116cc483@sirena.org.uk>
References: <20241018-gpio-notify-in-kernel-events-v5-0-c79135e58a1c@linaro.org>
 <20241018-gpio-notify-in-kernel-events-v5-8-c79135e58a1c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DRXanqB7GVYj1vg7"
Content-Disposition: inline
In-Reply-To: <20241018-gpio-notify-in-kernel-events-v5-8-c79135e58a1c@linaro.org>
X-Cookie: You will be surrounded by luxury.


--DRXanqB7GVYj1vg7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 18, 2024 at 11:10:16AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> We currently only notify user-space about line config changes that are
> made from user-space. Any kernel config changes are not signalled.
>=20
> Let's improve the situation by emitting the events closer to the source.
> To that end let's call the relevant notifier chain from the functions
> setting direction, gpiod_set_config(), gpiod_set_consumer_name() and
> gpiod_toggle_active_low(). This covers all the options that we can
> inform the user-space about. We ignore events which don't have
> corresponding flags exported to user-space on purpose - otherwise the
> user would see a config-changed event but the associated line-info would
> remain unchanged.

Today's -next is not booting on several of my platforms, including
beaglebone-black, i.MX8MP-EVK and pine64plus.  Bisects are pointing at
this commit, and i.MX8MP-EVK is actually giving some console output:

[    2.502208] Unable to handle kernel NULL pointer dereference at virtual =
address 0000000000000000
[    2.511036] Mem abort info:

=2E..

[    2.679934] Call trace:
[    2.682379]  gpiod_direction_output+0x34/0x5c
[    2.686745]  i2c_register_adapter+0x59c/0x670
[    2.691111]  __i2c_add_numbered_adapter+0x58/0xa8
[    2.695822]  i2c_add_adapter+0xa0/0xd0
[    2.699578]  i2c_add_numbered_adapter+0x2c/0x38
[    2.704117]  i2c_imx_probe+0x2d0/0x640

which looks plausible given the change.

Full boot log for i.MX8MP-EVK:

   https://lava.sirena.org.uk/scheduler/job/887083

Bisect log for that, the others look similar (the long run of good/bad
tags at the start for random commits is my automation pulling test
results it already knows about in the affected range to try to speed up
the bisect):

# bad: [ceab669fdf7b7510b4e4997b33d6f66e433a96db] Add linux-next specific f=
iles for 20241023
# good: [ad023864550daf9a5062e68f7925320146404919] Merge branch 'for-linux-=
next-fixes' of https://gitlab.freedesktop.org/drm/misc/kernel.git
# good: [db7e59e6a39a4d3d54ca8197c796557e6d480b0d] ASoC: qcom: sc7280: Fix =
missing Soundwire runtime stream alloc
# good: [d0ccf760a405d243a49485be0a43bd5b66ed17e2] spi: geni-qcom: Fix boot=
 warning related to pm_runtime and devres
# good: [1e5d0f106164d2089826c16bb521891d1d06d3ad] ASoC: fsl_xcvr: reset RX=
 dpath after wrong preamble
# good: [602ff58ae4fe4289b0ca71cba9fb82f7de92cd64] regulator: core: remove =
machine init callback from config
# good: [e6d20a9b0f376fda3e3c3709a59cefa6c0021784] ASoC: dt-bindings: evere=
st,es8328: Document audio graph port
# good: [6a646e6de58f4aedf5f6c7a4605a0393c4490ef1] ASoC: dt-bindings: qcom:=
 Add SM8750 LPASS macro codecs
# good: [5337ff41d37d4171868bb7b34dade68e269743f0] ASoC: soc-utils: Remove =
PAGE_SIZE compile-time constant assumption
# good: [f45a4399c1b582c6ddc179cc940aed73907b9453] spi: dt-bindings: samsun=
g: Add a compatible for samsung,exynos8895-spi
# good: [42d20a6a61b8fccbb57d80df1ccde7dd82d5bbd6] spi: spi-mem: Add Realte=
k SPI-NAND controller
# good: [36dbe4521a381fd4d2561a90200ae4a2a3efb222] spi: make class structs =
const
# good: [1b9971a4e01b80afbf061ad7cdf84ac6fbbbde8d] ASoC: nau8821: check reg=
map_raw_read/regmap_raw_write for failure
# good: [e92edcf8023d425c7abcf1d7abb5dcac53d106f5] ASoC: SOF: Intel: hda: u=
se machine_check() for SoundWire
# good: [4de1cdb3c299bb98d70198c1fa20c71f0893835c] spi: dt-bindings: brcm,b=
cm2835-aux-spi: Convert to dtschema
# good: [83c062ae81e89f73e3ab85953111a8b3daaaf98e] ASoC: Intel: sof_sdw: Ad=
d quirks for some new Lenovo laptops
# good: [9cb86a9cf12504c8dd60b40a6a200856852c1813] ASoC: SOF: sof-of-dev: a=
dd parameter to override tplg/fw_filename
# good: [c6631ceea573ae364e4fe913045f2aad10a10784] ASoC: rt-sdw-common: Enh=
ance switch case to prevent uninitialized variable
# good: [45b3605089b41b81ba36b231fbb97e3037a51beb] ASoC: loongson: Fix buil=
d warning when !CONFIG_PCI
# good: [f5a0ea8936a640d8229d5219515141fc496ec5d8] ASoC: mediatek: mt8188: =
Remove unnecessary variable assignments
# good: [e0941775e6bdcf45e6e20b7ff3bb87dbb7d92fbb] ASoC/SoundWire: Intel: l=
nl: enable interrupts after first power-up/before last power-down
# good: [c1789209701143b50cba3783fa800a23df30a088] ASoC: codecs: Fix error =
check in es8323_i2c_probe
# good: [a0aae96be5ffc5b456ca07bfe1385b721c20e184] ASoC: Intel: avs: Fix re=
turn status of avs_pcm_hw_constraints_init()
# good: [941584e2f3ddde26e4d71941ebc0836ece181594] spi: stm32: fix missing =
device mode capability in stm32mp25
# good: [b39eec95b84d5dc326c3d7c89e4e08b898dbc73c] ASoC: imx-card: Add CS42=
888 support
# good: [8658c4eb9d6b76311322c1b74b3d4e0dec3599d8] ASoC: rt721-sdca: Clean =
logically deadcode in rt721-sdca.c
# good: [fceffbfe57af7d9941d08e1a995cccf558d08451] regulator: max5970: Drop=
 unused structs
# good: [b1258105f9ce5203f48a47fd2f2cec8c38c41841] spi: intel: Add protecte=
d and locked attributes
# good: [ba4c5fad598c07492844e514add3ccda467063b2] ASoC: loongson: Add I2S =
controller driver as platform device
# good: [4e9a2c91bff44336157eefd8d80b8ceb27918737] regulator: dt-bindings: =
vctrl-regulator: convert to YAML
# good: [47701a85af0c0d655e06dd23f6b8761848147450] ASoC: SOF: ipc4-topology=
: Add helper function to print the module's in/out audio format
# good: [f3a59ab98cfc18c7b2fb1d8164bedbb1569a7e76] spi: spi-imx: Fix castin=
g warnings
# good: [e2fc05873905f2ee96b38a116ae86f45fe7d8e49] spi: rockchip: Use dev_{=
err,warn}_probe() in the probe path
# good: [5cd575a87f141e438b3e062533bf0c6cc9eba99a] ASoC: dt-bindings: rockc=
hip,rk3036-codec: convert to yaml
# good: [e5553cb6612989d18229c2b03948d6b4ba5d45f2] ASoC: rt721-sdca: Fix is=
sue of warning message
# good: [86ce355c1f9ab943bbe099ea7d0b8a3af2247f65] ASoC: rt721-sdca: Add RT=
721 SDCA driver
# good: [846a8d3cf3bace9f235c38caf1d8d853c323dbd4] ASoC: Intel: soc-acpi-in=
tel-ptl-match: Add rt721 support
# good: [0372abfcd81a4db94070d235e1ae3ff928efcab9] ASoC: amd: acp: refactor=
 sof_card_dai_links_create() function
# good: [c6e86e19e778553dbedab617aafb25b6bbaf4cd9] ASoC: fsl: fsl_qmc_audio=
: Remove the logging when parsing channels
# good: [eb6c65049a274c37f9b6fdf632843b609a0b8fa8] spi: Provide defer reaso=
n if getting irq during probe fails
# good: [56d3705e4b36bf454965e66d8264356a23135aa7] ASoC: Intel: sof_rt5682:=
 Add support for ptl_max98360a_rt5682
# good: [e58b3914ab8303a2783ec1873c17b7a83dd515f7] ASoC: dt-bindings: Depre=
cate {hp,mic}-det-gpio
# good: [64207f8024899938f8e13c4649a060a19f18bff3] ASoC: sh: rz-ssi: Use SS=
IFCR_FIFO_RST macro
# good: [46854574fd76c711c890423f8ac60df4fb726559] spi: spi-ti-qspi: remove=
 redundant assignment to variable ret
# good: [6061483d7141db3a805f8660eae23805af02d544] ASoC: codecs: wcd9335: r=
emove unnecessary MODULE_ALIAS()
# good: [8cd4e1f087b6906bacbbf8b637cac4e479a9cb34] ASoC: amd: acp: drop bog=
us NULL check from i2s_irq_handler
# good: [667b5e803a94f1ce48ac85b3fef94891a8d40ccf] spi: spi-fsl-lpspi: supp=
ort effective_speed_hz
# good: [a34b9d812d7ec95789b15ce84de5f03c6dd1137b] ASoC: rt1320: fix the ra=
nge of patch code address
# good: [4649cbd97fdae5069e9a71cd7669b62b90e03669] ASoC: dt-bindings: mt635=
9: Update generic node name and dmic-mode
# good: [ac8775d7de5a8ccac225a398cbce9fb9fffdbb9f] ASoC: atmel: atmel_ssc_d=
ai: Drop S24_LE support due to single channel limitation
# good: [9864c8af89eb14a2e5334f8e24bb82086182e894] ASoC: amd: acp: remove u=
nused variable from acp platform driver
# good: [625de1881b5aee6a42a3130004e47dbd632429f8] spi: atmel-quadspi: Add =
cs_hold and cs_inactive setting support
# good: [3c44a715e389929b8243d6a0545992d78cff6cba] ASoC: atmel: mchp-spdifr=
x: Remove interface name from stream_name
# good: [8adff2ff73d8271c993549b106b26f301fa003cf] ASoC: constify snd_soc_c=
omponent_driver struct
# good: [dc9004ea273a9141c16b90a687da70b77f5a640a] ASoC: codecs: Add NeoFid=
elity NTP8835 codec
# good: [1482c40b440fa58f956bc3e1ef3426e0cdbc09e0] spi: rockchip-sfc: Use d=
ev_err_probe() in the probe path
# good: [cc3ae21f360bfa375fc3539e24e7adb0e643a9d4] ASoC: fsl_micfil: Enable=
 micfil error interrupt
# good: [49a85851b14cf6630013d1b9bae2ac2345c9430b] regcache: Store values m=
ore directly in maple trees
# good: [36ec3f437227470568e5f460997f367f5446a34d] regulator: Add devres ve=
rsion of of_regulator_get_optional()
# good: [18be43aca2c0ec475037923a8086d0a29fcc9d16] regulator: qcom-smd: mak=
e smd_vreg_rpm static
# good: [04e800fc328e6eba9f4ec3df375f2b500802653a] ASoC: codecs: aw88399: F=
ix spelling mistake "unsupport" -> "unsupported"
# good: [6c30eee359127c31cd8c6b586c8c3ced9f50f74b] spi: spi_amd: Add HIDDMA=
 basic read support
# good: [0809a9ccac4a2ffdfd1561bb551aec6099775545] spi: remove {devm_}spi_a=
lloc_master/slave()
# good: [7a01e17e42fe944982acde1dd40bdea177372173] ASoC: stm: fix macro def=
inition on STM_SAI_HAS_EXT_SYNC
git bisect start 'ceab669fdf7b7510b4e4997b33d6f66e433a96db' 'ad023864550daf=
9a5062e68f7925320146404919' 'db7e59e6a39a4d3d54ca8197c796557e6d480b0d' 'd0c=
cf760a405d243a49485be0a43bd5b66ed17e2' '1e5d0f106164d2089826c16bb521891d1d0=
6d3ad' '602ff58ae4fe4289b0ca71cba9fb82f7de92cd64' 'e6d20a9b0f376fda3e3c3709=
a59cefa6c0021784' '6a646e6de58f4aedf5f6c7a4605a0393c4490ef1' '5337ff41d37d4=
171868bb7b34dade68e269743f0' 'f45a4399c1b582c6ddc179cc940aed73907b9453' '42=
d20a6a61b8fccbb57d80df1ccde7dd82d5bbd6' '36dbe4521a381fd4d2561a90200ae4a2a3=
efb222' '1b9971a4e01b80afbf061ad7cdf84ac6fbbbde8d' 'e92edcf8023d425c7abcf1d=
7abb5dcac53d106f5' '4de1cdb3c299bb98d70198c1fa20c71f0893835c' '83c062ae81e8=
9f73e3ab85953111a8b3daaaf98e' '9cb86a9cf12504c8dd60b40a6a200856852c1813' 'c=
6631ceea573ae364e4fe913045f2aad10a10784' '45b3605089b41b81ba36b231fbb97e303=
7a51beb' 'f5a0ea8936a640d8229d5219515141fc496ec5d8' 'e0941775e6bdcf45e6e20b=
7ff3bb87dbb7d92fbb' 'c1789209701143b50cba3783fa800a23df30a088' 'a0aae96be5f=
fc5b456ca07bfe1385b721c20e184' '941584e2f3ddde26e4d71941ebc0836ece181594' '=
b39eec95b84d5dc326c3d7c89e4e08b898dbc73c' '8658c4eb9d6b76311322c1b74b3d4e0d=
ec3599d8' 'fceffbfe57af7d9941d08e1a995cccf558d08451' 'b1258105f9ce5203f48a4=
7fd2f2cec8c38c41841' 'ba4c5fad598c07492844e514add3ccda467063b2' '4e9a2c91bf=
f44336157eefd8d80b8ceb27918737' '47701a85af0c0d655e06dd23f6b8761848147450' =
'f3a59ab98cfc18c7b2fb1d8164bedbb1569a7e76' 'e2fc05873905f2ee96b38a116ae86f4=
5fe7d8e49' '5cd575a87f141e438b3e062533bf0c6cc9eba99a' 'e5553cb6612989d18229=
c2b03948d6b4ba5d45f2' '86ce355c1f9ab943bbe099ea7d0b8a3af2247f65' '846a8d3cf=
3bace9f235c38caf1d8d853c323dbd4' '0372abfcd81a4db94070d235e1ae3ff928efcab9'=
 'c6e86e19e778553dbedab617aafb25b6bbaf4cd9' 'eb6c65049a274c37f9b6fdf632843b=
609a0b8fa8' '56d3705e4b36bf454965e66d8264356a23135aa7' 'e58b3914ab8303a2783=
ec1873c17b7a83dd515f7' '64207f8024899938f8e13c4649a060a19f18bff3' '46854574=
fd76c711c890423f8ac60df4fb726559' '6061483d7141db3a805f8660eae23805af02d544=
' '8cd4e1f087b6906bacbbf8b637cac4e479a9cb34' '667b5e803a94f1ce48ac85b3fef94=
891a8d40ccf' 'a34b9d812d7ec95789b15ce84de5f03c6dd1137b' '4649cbd97fdae5069e=
9a71cd7669b62b90e03669' 'ac8775d7de5a8ccac225a398cbce9fb9fffdbb9f' '9864c8a=
f89eb14a2e5334f8e24bb82086182e894' '625de1881b5aee6a42a3130004e47dbd632429f=
8' '3c44a715e389929b8243d6a0545992d78cff6cba' '8adff2ff73d8271c993549b106b2=
6f301fa003cf' 'dc9004ea273a9141c16b90a687da70b77f5a640a' '1482c40b440fa58f9=
56bc3e1ef3426e0cdbc09e0' 'cc3ae21f360bfa375fc3539e24e7adb0e643a9d4' '49a858=
51b14cf6630013d1b9bae2ac2345c9430b' '36ec3f437227470568e5f460997f367f5446a3=
4d' '18be43aca2c0ec475037923a8086d0a29fcc9d16' '04e800fc328e6eba9f4ec3df375=
f2b500802653a' '6c30eee359127c31cd8c6b586c8c3ced9f50f74b' '0809a9ccac4a2ffd=
fd1561bb551aec6099775545' '7a01e17e42fe944982acde1dd40bdea177372173'
# bad: [ceab669fdf7b7510b4e4997b33d6f66e433a96db] Add linux-next specific f=
iles for 20241023
git bisect bad ceab669fdf7b7510b4e4997b33d6f66e433a96db
# good: [397886451c608b881fc990abac627839b5010e4c] Merge branch 'master' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git
git bisect good 397886451c608b881fc990abac627839b5010e4c
# good: [9bbf38bc6804c62ec9b29548b739f0e5dbd11d6b] Merge branch 'for-mfd-ne=
xt' of git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git
git bisect good 9bbf38bc6804c62ec9b29548b739f0e5dbd11d6b
# good: [1b1952166f2b15f8d4665beeb8cc5443cda6f17d] Merge branch 'char-misc-=
next' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git
git bisect good 1b1952166f2b15f8d4665beeb8cc5443cda6f17d
# good: [5a5a05d1e3cc8cb7127b5acac0fe647f4524567b] Merge branch 'for-next' =
of git://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git
git bisect good 5a5a05d1e3cc8cb7127b5acac0fe647f4524567b
# bad: [5ee7b36c01a29f242bd4c29dc95406caa53d0f1a] Merge branch 'for-next' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/livepatching/livepatching
git bisect bad 5ee7b36c01a29f242bd4c29dc95406caa53d0f1a
# bad: [b0ec3aaca3890d7e345e3ca4d58fb1b93d56354c] Merge branch 'for-next' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
git bisect bad b0ec3aaca3890d7e345e3ca4d58fb1b93d56354c
# bad: [8ddbd3e4039f2df83797cfda217f240d4a191bad] Merge branch 'for-next' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git
git bisect bad 8ddbd3e4039f2df83797cfda217f240d4a191bad
# good: [2707a028c9b9c54a6dff22c9dcfebf3083ea095e] gpio: mpc8xxx: use a hel=
per variable to store the address of pdev->dev
git bisect good 2707a028c9b9c54a6dff22c9dcfebf3083ea095e
# good: [8c44447bd76109e33a69fccda89c84715fbd5658] gpio: cdev: prepare gpio=
_desc_to_lineinfo() for being called from atomic
git bisect good 8c44447bd76109e33a69fccda89c84715fbd5658
# bad: [3aba8402910bfab998d5cf6c84744de5db466936] gpio: grgpio: remove remo=
ve()
git bisect bad 3aba8402910bfab998d5cf6c84744de5db466936
# bad: [07c61d4da43fa3b34c152b28010d20be115a96db] gpiolib: notify user-spac=
e about in-kernel line state changes
git bisect bad 07c61d4da43fa3b34c152b28010d20be115a96db
# good: [40b7c49950bd56c984b1f6722f865b922879260e] gpio: cdev: put emitting=
 the line state events on a workqueue
git bisect good 40b7c49950bd56c984b1f6722f865b922879260e
# good: [fcc8b637c542d1a0c19e5797ad72f9258e10464c] gpiolib: switch the line=
 state notifier to atomic
git bisect good fcc8b637c542d1a0c19e5797ad72f9258e10464c
# first bad commit: [07c61d4da43fa3b34c152b28010d20be115a96db] gpiolib: not=
ify user-space about in-kernel line state changes

--DRXanqB7GVYj1vg7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcZZScACgkQJNaLcl1U
h9CBMAgAhK7QXLQuDWQ/byYc88yyFW8031B6A6zgCfyB/qLdU6aTxdELped03Ctv
rIAXZDv0eRtxswuDoVQRH2qCuAAn/NJ4qOw3ILWmJZVu2RwJ/nxj3NQN269ca2zb
p3B9IRc9vTQMSVdOcAi6Do+/b0FTzXJJTvIy/hxc/0kc6KLU45g7SpeG4xL/j9HD
sGR5vZh7fL0f+D0zY2waUcnXYRaRkGWU8YC/Au2/jcOMykrPh4ho9/TczuknyZhO
oCI5jwktRLJ3yOh5NATYWoYlNGKd5N9D6wdvaRcypeinIyI3LexWLYc3bC3pVE8d
Lvq7JsfTTceH9VGoaOAZ3WW21WXmTg==
=xXy9
-----END PGP SIGNATURE-----

--DRXanqB7GVYj1vg7--

