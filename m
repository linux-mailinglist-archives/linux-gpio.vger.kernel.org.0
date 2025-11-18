Return-Path: <linux-gpio+bounces-28665-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB662C69D14
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 15:07:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sto.lore.kernel.org (Postfix) with ESMTPS id 212BB28D16
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 14:07:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2763358D30;
	Tue, 18 Nov 2025 14:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a4sWhe5o"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8FB28C2A1;
	Tue, 18 Nov 2025 14:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763474811; cv=none; b=X0IGhH+juiRCO5X2745Usm/WACjmxCc767FXHsxJPtnRtRhkn5R4tZA2clG7tyjaOKTCe3odm2WvM6lp+CXD+gyonulOl78VxNe47SWp0PoVb7QWrrDVQif5w665PUJ+mMrUE7079U0bS1dCot45oBi81KBFJcAHTf8Cvn81h/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763474811; c=relaxed/simple;
	bh=heveM8UszQqYQTax5mb9hr3KNz3VYsoQzxEOARIj1Fs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zv66nLcwdtydXcDbaY2gHOuOHyR+EBxlqhSXKwZ/HiRkSxECO1DkJCVsfBUMZ3ZMVojYXomWSKjXGIsueXm2W3QeGHLybhTFxAw9dJoTqgNKxEosYE7KLKyUZtg+lFIhs+eD8FLAKxTil6AujttCs6jNC5KStQTZD/AwZGPSRzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a4sWhe5o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0454AC4CEF1;
	Tue, 18 Nov 2025 14:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763474810;
	bh=heveM8UszQqYQTax5mb9hr3KNz3VYsoQzxEOARIj1Fs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a4sWhe5oRCdsubKO5x5dmUcy8FY43F+l1bLqIOrJlz3Km+NUyMS2tH8YbRFhFscGl
	 2MfpQqAER2a9yfTWdmplCJJYeg63GrAvIHr50z9yL1V1Gguhn3PW5eBCN+ivTqMMfZ
	 Y6PHawFQlChOuPggG5IEf9W1U7hffBb/phoEtcLBfMDfb3+SkCiiDhPExAkaoBUm08
	 bzb3VeYBSKKTaHkC66GTD7MO1w5mFxH1WrVn6fhly3MJ/6OOcZRMhOIUZaWIc8r2do
	 wbCsS6X63yhLi5OTsaG5G/ZoOI9yirLBc3b/kWBSW/1e9NjbXuLi6Sj6NKXCvP9cVG
	 XmPyvOe6BrNJA==
Date: Tue, 18 Nov 2025 14:06:42 +0000
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Aishwarya.TCV@arm.com
Subject: Re: [PATCH v4 07/10] arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM
Message-ID: <dbe20642-9662-40af-a593-c1263baea73b@sirena.org.uk>
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-7-b51f97b1abd8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xUTDfot4PSBLErIc"
Content-Disposition: inline
In-Reply-To: <20251112-gpio-shared-v4-7-b51f97b1abd8@linaro.org>
X-Cookie: A man's best friend is his dogma.


--xUTDfot4PSBLErIc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 12, 2025 at 02:55:36PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> Some qualcomm platforms use shared GPIOs. Enable support for them by
> selecting the Kconfig switch provided by GPIOLIB.

This is causing boot failures for me in -next on the ARM FVP with
defconfig, the select affects all platforms not just the Qualcomm ones.
We get:

[    0.137360] Unable to handle kernel NULL pointer dereference at virtual =
address 0000000000000058

=2E..

[    0.140979] Call trace:
[    0.141037]  gpio_shared_of_traverse+0x48/0x480 (P)
[    0.141187]  gpio_shared_init+0x28/0x14c
[    0.141314]  do_one_initcall+0x60/0x1d4
[    0.141446]  kernel_init_freeable+0x24c/0x2c8
[    0.141607]  kernel_init+0x20/0x140

Full log:

   https://lava.sirena.org.uk/scheduler/job/2101484#L692

Bisect log:

# bad: [187dac290bfd0741b9d7d5490af825c33fd9baa4] Add linux-next specific f=
iles for 20251118
# good: [17bfd0eea14a5f4217041fc57d85c965b07c02a8] Merge branch 'for-linux-=
next-fixes' of https://gitlab.freedesktop.org/drm/misc/kernel.git
# good: [118eb2cb97b8fc0d515bb0449495959247db58f0] spi: bcm63xx: drop wrong=
 casts in probe()
# good: [059f545832be85d29ac9ccc416a16f647aa78485] spi: add support for mic=
rochip "soft" spi controller
# good: [6402ddf3027d8975f135cf2b2014d6bbeb2d3436] MAINTAINERS: refer to tr=
ivial-codec.yaml in relevant sections
# good: [4e00135b2dd1d7924a58bffa551b6ceb3bd836f2] spi: spi-cadence: suppor=
ts transmission with bits_per_word of 16 and 32
# good: [e65b871c9b5af9265aefc5b8cd34993586d93aab] ASoC: codecs: pm4125: Re=
move irq_chip on component unbind
# good: [8d63e85c5b50f1dbfa0ccb214bd91fe5d7e2e860] firmware: cs_dsp: fix ke=
rnel-doc warnings in a header file
# good: [8ff3dcb0e8a8bf6c41f23ed4aa62d066d3948a10] ASoC: codecs: lpass-rx-m=
acro: add SM6115 compatible
# good: [123cd174a3782307787268adf45f22de4d290128] ASoC: Intel: atom: Repla=
ce strcpy() with strscpy()
# good: [4d6e2211aeb932e096f673c88475016b1cc0f8ab] ASoC: Intel: boards: fix=
 HDMI playback lookup when HDMI-In capture used
# good: [1d562ba0aa7df81335bf96c02be77efe8d5bab87] spi: dt-bindings: nuvoto=
n,npcm-pspi: Convert to DT schema
# good: [b3a5302484033331af37569f7277d00131694b57] ASoC: Intel: sof_rt5682:=
 Add quirk override support
# good: [873bc94689d832878befbcadc10b6ad5bb4e0027] ASoC: Intel: sof_sdw: ad=
d codec speaker support for the SKU
# good: [32172cf3cb543a04c41a1677c97a38e60cad05b6] ASoC: cs35l56: Allow res=
toring factory calibration through ALSA control
# good: [772ada50282b0c80343c8989147db816961f571d] ASoC: cs35l56: Alter err=
or codes for calibration routine
# good: [6985defd1d832f1dd9d1977a6a2cc2cef7632704] regmap: sdw-mbq: Reorder=
 regmap_mbq_context struct for better packing
# good: [fb1ebb10468da414d57153ddebaab29c38ef1a78] regulator: core: disable=
 supply if enabling main regulator fails
# good: [6951be397ca8b8b167c9f99b5a11c541148c38cb] ASoC: codecs: pm4125: re=
move duplicate code
# good: [4e92abd0a11b91af3742197a9ca962c3c00d0948] spi: imx: add i.MX51 ECS=
PI target mode support
# good: [2089f086303b773e181567fd8d5df3038bd85937] regulator: mt6363: Remov=
e unneeded semicolon
# good: [abc9a349b87ac0fd3ba8787ca00971b59c2e1257] spi: fsl-qspi: support t=
he SpacemiT K1 SoC
# good: [55d03b5b5bdd04daf9a35ce49db18d8bb488dffb] spi: imx: remove CLK cal=
culation and check for target mode
# good: [1b0f3f9ee41ee2bdd206667f85ea2aa36dfe6e69] ASoC: SDCA: support Q7.8=
 volume format
# good: [6bd1ad97eb790570c167d4de4ca59fbc9c33722a] regulator: pf9453: Fix k=
ernel doc for mux_poll()
# good: [3c36965df80801344850388592e95033eceea05b] regulator: Add support f=
or MediaTek MT6363 SPMI PMIC Regulators
# good: [655079ac8a7721ac215a0596e3f33b740e01144a] ASoC: qcom: q6asm: Use g=
uard() for spin locks
# good: [2f538ef9f6f7c3d700c68536f21447dfc598f8c8] spi: aspeed: Use devm_io=
unmap() to unmap devm_ioremap() memory
# good: [aa897ffc396b48cc39eee133b6b43175d0df9eb5] ASoC: dt-bindings: ti,pc=
m1862: convert to dtschema
# good: [380fd29d57abe6679d87ec56babe65ddc5873a37] spi: tegra210-quad: Chec=
k hardware status on timeout
# good: [af9c8092d84244ca54ffb590435735f788e7a170] regmap: i3c: Use ARRAY_S=
IZE()
# good: [c4e68959af66df525d71db619ffe44af9178bb22] ASoC: dt-bindings: ti,ta=
s2781: Add TAS5822 support
# good: [2ecc8c089802e033d2e5204d21a9f467e2517df9] regulator: pf9453: remov=
e unused I2C_LT register
# good: [84194c66aaf78fed150edb217b9f341518b1cba2] ASoC: codecs: aw88261: p=
ass pointer directly instead of passing the address
# good: [252abf2d07d33b1c70a59ba1c9395ba42bbd793e] regulator: Small cleanup=
 in of_get_regulation_constraints()
# good: [ed5d499b5c9cc11dd3edae1a7a55db7dfa4f1bdc] regcache: maple: Split -=
>populate() from ->init()
# good: [e73b743bfe8a6ff4e05b5657d3f7586a17ac3ba0] ASoC: soc-core: check op=
s & auto_selectable_formats in snd_soc_dai_get_fmt() to prevent dereference=
 error
# good: [6ef8e042cdcaabe3e3c68592ba8bfbaee2fa10a3] ASoC: codec: wm8400: rep=
lace printk() calls with dev_*() device aware logging
# good: [ecd0de438c1f0ee86cf8f6d5047965a2a181444b] spi: tle62x0: Add newlin=
e to sysfs attribute output
# good: [f1dfbc1b5cf8650ae9a0d543e5f5335fc0f478ce] ASoC: max98090/91: fixin=
g the stream index
# good: [8fdb030fe283c84fd8d378c97ad0f32d6cdec6ce] ASoC: qcom: sc7280: make=
 use of common helpers
# good: [20bcda681f8597e86070a4b3b12d1e4f541865d3] ASoC: codecs: va-macro: =
fix revision checking
# good: [cf6bf51b53252284bafc7377a4d8dbf10f048b4d] ASoC: cs4271: Add suppor=
t for the external mclk
# good: [28039efa4d8e8bbf98b066133a906bd4e307d496] MAINTAINERS: remove obso=
lete file entry in DIALOG SEMICONDUCTOR DRIVERS
# good: [e062bdfdd6adbb2dee7751d054c1d8df63ddb8b8] regmap: warn users about=
 uninitialized flat cache
# good: [f034c16a4663eaf3198dc18b201ba50533fb5b81] ASoC: spacemit: add fail=
ure check for spacemit_i2s_init_dai()
# good: [66fecfa91deb536a12ddf3d878a99590d7900277] ASoC: spacemit: use `dep=
ends on` instead of `select`
# good: [4a5ac6cd05a7e54f1585d7779464d6ed6272c134] ASoC: sun4i-spdif: Suppo=
rt SPDIF output on A523 family
# good: [ef042df96d0e1089764f39ede61bc8f140a4be00] ASoC: SDCA: Add HID butt=
on IRQ
# good: [4795375d8aa072e9aacb0b278e6203c6ca41816a] ASoC: cs-amp-lib-test: A=
dd test cases for cs_amp_set_efi_calibration_data()
# good: [4c33cef58965eb655a0ac8e243aa323581ec025f] regulator: pca9450: link=
 regulator inputs to supply groups
# good: [e973dfe9259095fb509ab12658c68d46f0e439d7] ASoC: qcom: sm8250: add =
qrb2210-sndcard compatible string
# good: [e7434adf0c53a84d548226304cdb41c8818da1cb] ASoC: cs530x: Add SPI bu=
s support for cs530x parts
# good: [d29479abaded34b2b1dab2e17efe96a65eba3d61] ASoC: renesas: fsi: Cons=
tify struct fsi_stream_handler
# good: [77a58ba7c64ccca20616aa03599766ccb0d1a330] spi: spi-mem: Trace exec=
_op
# good: [01313661b248c5ba586acae09bff57077dbec0a5] regulator: Let raspberry=
pi drivers depend on ARM
# good: [c17fa4cbc546c431ccf13e9354d5d9c1cd247b7c] ASoC: sdw_utils: add nam=
e_prefix for rt1321 part id
# good: [310bf433c01f78e0756fd5056a43118a2f77318c] ASoC: max98090/91: fixin=
g a space
# good: [fd5ef3d69f8975bad16c437a337b5cb04c8217a2] spi: spi-qpic-snand: mak=
e qcom_spi_ecc_engine_ops_pipelined const
# good: [d054cc3a2ccfb19484f3b54d69b6e416832dc8f4] regulator: rpmh-regulato=
r: Add RPMH regulator support for PMR735D
# good: [2528c15f314ece50218d1273654f630d74109583] ASoC: max98090/91: addin=
g DAPM routing for digital output for max98091
# good: [638bae3fb225a708dc67db613af62f6d14c4eff4] ASoC: max98090/91: added=
 DAPM widget for digital output for max98091
# good: [ecba655bf54a661ffe078856cd8dbc898270e4b5] ASoC: fsl_aud2htx: add I=
EC958_SUBFRAME_LE format in supported list
# good: [7e1906643a7374529af74b013bba35e4fa4e6ffc] ASoC: codecs: va-macro: =
Clean up on error path in probe()
# good: [d742ebcfe524dc54023f7c520d2ed2e4b7203c19] ASoC: soc.h: remove snd_=
soc_kcontrol_component()
# good: [fce217449075d59b29052b8cdac567f0f3e22641] ASoC: spacemit: add i2s =
support for K1 SoC
# good: [6658472a3e2de08197acfe099ba71ee0e2505ecf] ASoC: amd: amd_sdw: Prop=
agate the PCI subsystem Vendor and Device IDs
# good: [0cc08c8130ac8f74419f99fe707dc193b7f79d86] spi: aspeed: Fix an IS_E=
RR() vs NULL bug in probe()
# good: [0743acf746a81e0460a56fd5ff847d97fa7eb370] spi: airoha: buffer must=
 be 0xff-ed before writing
# good: [d77daa49085b067137d0adbe3263f75a7ee13a1b] spi: aspeed: fix spellin=
g mistake "triming" -> "trimming"
# good: [1e570e77392f43a3cdab2849d1f81535f8a033e2] ASoC: mxs-saif: support =
usage with simple-audio-card
# good: [15afe57a874eaf104bfbb61ec598fa31627f7b19] ASoC: dt-bindings: qcom:=
 Add Kaanapali LPASS macro codecs
# good: [fb25114cd760c13cf177d9ac37837fafcc9657b5] regulator: sy7636a: add =
gpios and input regulator
# good: [65efe5404d151767653c7b7dd39bd2e7ad532c2d] regulator: rpmh-regulato=
r: Add RPMH regulator support for Glymur
# good: [6621b0f118d500092f5f3d72ddddb22aeeb3c3a0] ASoC: codecs: rt5670: us=
e SOC_VALUE_ENUM_SINGLE_DECL for DAC2 L/R MX-1B
# good: [433e294c3c5b5d2020085a0e36c1cb47b694690a] regulator: core: forward=
 undervoltage events downstream by default
# good: [0b0eb7702a9fa410755e86124b4b7cd36e7d1cb4] ASoC: replace use of sys=
tem_wq with system_dfl_wq
# good: [7e7e2c6e2a1cb250f8d03bb99eed01f6d982d5dd] ASoC: sof-function-topol=
ogy-lib: escalate the log when missing function topoplogy
# good: [64d87ccfae3326a9561fe41dc6073064a083e0df] spi: aspeed: Only map ne=
cessary address window region
# good: [4d410ba9aa275e7990a270f63ce436990ace1bea] dt-bindings: sound: Upda=
te ADMAIF bindings for tegra264
# good: [b83fb1b14c06bdd765903ac852ba20a14e24f227] spi: offload: Add offset=
 parameter
# good: [9797329220a2c6622411eb9ecf6a35b24ce09d04] ASoC: sof-function-topol=
ogy-lib: escalate the log when missing function topoplogy
# good: [fe8cc44dd173cde5788ab4e3730ac61f3d316d9c] spi: dw: add target mode=
 support
# good: [6277a486a7faaa6c87f4bf1d59a2de233a093248] regulator: dt-bindings: =
Convert Dialog DA9211 Regulators to DT schema
# good: [5e537031f322d55315cd384398b726a9a0748d47] ASoC: codecs: Fix the er=
ror of excessive semicolons
# good: [4412ab501677606436e5c49e41151a1e6eac7ac0] spi: dt-bindings: spi-qp=
ic-snand: Add IPQ5332 compatible
git bisect start '187dac290bfd0741b9d7d5490af825c33fd9baa4' '17bfd0eea14a5f=
4217041fc57d85c965b07c02a8' '118eb2cb97b8fc0d515bb0449495959247db58f0' '059=
f545832be85d29ac9ccc416a16f647aa78485' '6402ddf3027d8975f135cf2b2014d6bbeb2=
d3436' '4e00135b2dd1d7924a58bffa551b6ceb3bd836f2' 'e65b871c9b5af9265aefc5b8=
cd34993586d93aab' '8d63e85c5b50f1dbfa0ccb214bd91fe5d7e2e860' '8ff3dcb0e8a8b=
f6c41f23ed4aa62d066d3948a10' '123cd174a3782307787268adf45f22de4d290128' '4d=
6e2211aeb932e096f673c88475016b1cc0f8ab' '1d562ba0aa7df81335bf96c02be77efe8d=
5bab87' 'b3a5302484033331af37569f7277d00131694b57' '873bc94689d832878befbca=
dc10b6ad5bb4e0027' '32172cf3cb543a04c41a1677c97a38e60cad05b6' '772ada50282b=
0c80343c8989147db816961f571d' '6985defd1d832f1dd9d1977a6a2cc2cef7632704' 'f=
b1ebb10468da414d57153ddebaab29c38ef1a78' '6951be397ca8b8b167c9f99b5a11c5411=
48c38cb' '4e92abd0a11b91af3742197a9ca962c3c00d0948' '2089f086303b773e181567=
fd8d5df3038bd85937' 'abc9a349b87ac0fd3ba8787ca00971b59c2e1257' '55d03b5b5bd=
d04daf9a35ce49db18d8bb488dffb' '1b0f3f9ee41ee2bdd206667f85ea2aa36dfe6e69' '=
6bd1ad97eb790570c167d4de4ca59fbc9c33722a' '3c36965df80801344850388592e95033=
eceea05b' '655079ac8a7721ac215a0596e3f33b740e01144a' '2f538ef9f6f7c3d700c68=
536f21447dfc598f8c8' 'aa897ffc396b48cc39eee133b6b43175d0df9eb5' '380fd29d57=
abe6679d87ec56babe65ddc5873a37' 'af9c8092d84244ca54ffb590435735f788e7a170' =
'c4e68959af66df525d71db619ffe44af9178bb22' '2ecc8c089802e033d2e5204d21a9f46=
7e2517df9' '84194c66aaf78fed150edb217b9f341518b1cba2' '252abf2d07d33b1c70a5=
9ba1c9395ba42bbd793e' 'ed5d499b5c9cc11dd3edae1a7a55db7dfa4f1bdc' 'e73b743bf=
e8a6ff4e05b5657d3f7586a17ac3ba0' '6ef8e042cdcaabe3e3c68592ba8bfbaee2fa10a3'=
 'ecd0de438c1f0ee86cf8f6d5047965a2a181444b' 'f1dfbc1b5cf8650ae9a0d543e5f533=
5fc0f478ce' '8fdb030fe283c84fd8d378c97ad0f32d6cdec6ce' '20bcda681f8597e8607=
0a4b3b12d1e4f541865d3' 'cf6bf51b53252284bafc7377a4d8dbf10f048b4d' '28039efa=
4d8e8bbf98b066133a906bd4e307d496' 'e062bdfdd6adbb2dee7751d054c1d8df63ddb8b8=
' 'f034c16a4663eaf3198dc18b201ba50533fb5b81' '66fecfa91deb536a12ddf3d878a99=
590d7900277' '4a5ac6cd05a7e54f1585d7779464d6ed6272c134' 'ef042df96d0e108976=
4f39ede61bc8f140a4be00' '4795375d8aa072e9aacb0b278e6203c6ca41816a' '4c33cef=
58965eb655a0ac8e243aa323581ec025f' 'e973dfe9259095fb509ab12658c68d46f0e439d=
7' 'e7434adf0c53a84d548226304cdb41c8818da1cb' 'd29479abaded34b2b1dab2e17efe=
96a65eba3d61' '77a58ba7c64ccca20616aa03599766ccb0d1a330' '01313661b248c5ba5=
86acae09bff57077dbec0a5' 'c17fa4cbc546c431ccf13e9354d5d9c1cd247b7c' '310bf4=
33c01f78e0756fd5056a43118a2f77318c' 'fd5ef3d69f8975bad16c437a337b5cb04c8217=
a2' 'd054cc3a2ccfb19484f3b54d69b6e416832dc8f4' '2528c15f314ece50218d1273654=
f630d74109583' '638bae3fb225a708dc67db613af62f6d14c4eff4' 'ecba655bf54a661f=
fe078856cd8dbc898270e4b5' '7e1906643a7374529af74b013bba35e4fa4e6ffc' 'd742e=
bcfe524dc54023f7c520d2ed2e4b7203c19' 'fce217449075d59b29052b8cdac567f0f3e22=
641' '6658472a3e2de08197acfe099ba71ee0e2505ecf' '0cc08c8130ac8f74419f99fe70=
7dc193b7f79d86' '0743acf746a81e0460a56fd5ff847d97fa7eb370' 'd77daa49085b067=
137d0adbe3263f75a7ee13a1b' '1e570e77392f43a3cdab2849d1f81535f8a033e2' '15af=
e57a874eaf104bfbb61ec598fa31627f7b19' 'fb25114cd760c13cf177d9ac37837fafcc96=
57b5' '65efe5404d151767653c7b7dd39bd2e7ad532c2d' '6621b0f118d500092f5f3d72d=
dddb22aeeb3c3a0' '433e294c3c5b5d2020085a0e36c1cb47b694690a' '0b0eb7702a9fa4=
10755e86124b4b7cd36e7d1cb4' '7e7e2c6e2a1cb250f8d03bb99eed01f6d982d5dd' '64d=
87ccfae3326a9561fe41dc6073064a083e0df' '4d410ba9aa275e7990a270f63ce436990ac=
e1bea' 'b83fb1b14c06bdd765903ac852ba20a14e24f227' '9797329220a2c6622411eb9e=
cf6a35b24ce09d04' 'fe8cc44dd173cde5788ab4e3730ac61f3d316d9c' '6277a486a7faa=
a6c87f4bf1d59a2de233a093248' '5e537031f322d55315cd384398b726a9a0748d47' '44=
12ab501677606436e5c49e41151a1e6eac7ac0'
# test job: [118eb2cb97b8fc0d515bb0449495959247db58f0] https://lava.sirena.=
org.uk/scheduler/job/2092429
# test job: [059f545832be85d29ac9ccc416a16f647aa78485] https://lava.sirena.=
org.uk/scheduler/job/2086705
# test job: [6402ddf3027d8975f135cf2b2014d6bbeb2d3436] https://lava.sirena.=
org.uk/scheduler/job/2086607
# test job: [4e00135b2dd1d7924a58bffa551b6ceb3bd836f2] https://lava.sirena.=
org.uk/scheduler/job/2082519
# test job: [e65b871c9b5af9265aefc5b8cd34993586d93aab] https://lava.sirena.=
org.uk/scheduler/job/2083021
# test job: [8d63e85c5b50f1dbfa0ccb214bd91fe5d7e2e860] https://lava.sirena.=
org.uk/scheduler/job/2082629
# test job: [8ff3dcb0e8a8bf6c41f23ed4aa62d066d3948a10] https://lava.sirena.=
org.uk/scheduler/job/2083070
# test job: [123cd174a3782307787268adf45f22de4d290128] https://lava.sirena.=
org.uk/scheduler/job/2078932
# test job: [4d6e2211aeb932e096f673c88475016b1cc0f8ab] https://lava.sirena.=
org.uk/scheduler/job/2078021
# test job: [1d562ba0aa7df81335bf96c02be77efe8d5bab87] https://lava.sirena.=
org.uk/scheduler/job/2078357
# test job: [b3a5302484033331af37569f7277d00131694b57] https://lava.sirena.=
org.uk/scheduler/job/2074567
# test job: [873bc94689d832878befbcadc10b6ad5bb4e0027] https://lava.sirena.=
org.uk/scheduler/job/2074808
# test job: [32172cf3cb543a04c41a1677c97a38e60cad05b6] https://lava.sirena.=
org.uk/scheduler/job/2075068
# test job: [772ada50282b0c80343c8989147db816961f571d] https://lava.sirena.=
org.uk/scheduler/job/2069222
# test job: [6985defd1d832f1dd9d1977a6a2cc2cef7632704] https://lava.sirena.=
org.uk/scheduler/job/2059088
# test job: [fb1ebb10468da414d57153ddebaab29c38ef1a78] https://lava.sirena.=
org.uk/scheduler/job/2059751
# test job: [6951be397ca8b8b167c9f99b5a11c541148c38cb] https://lava.sirena.=
org.uk/scheduler/job/2055789
# test job: [4e92abd0a11b91af3742197a9ca962c3c00d0948] https://lava.sirena.=
org.uk/scheduler/job/2055834
# test job: [2089f086303b773e181567fd8d5df3038bd85937] https://lava.sirena.=
org.uk/scheduler/job/2058076
# test job: [abc9a349b87ac0fd3ba8787ca00971b59c2e1257] https://lava.sirena.=
org.uk/scheduler/job/2054550
# test job: [55d03b5b5bdd04daf9a35ce49db18d8bb488dffb] https://lava.sirena.=
org.uk/scheduler/job/2053870
# test job: [1b0f3f9ee41ee2bdd206667f85ea2aa36dfe6e69] https://lava.sirena.=
org.uk/scheduler/job/2053622
# test job: [6bd1ad97eb790570c167d4de4ca59fbc9c33722a] https://lava.sirena.=
org.uk/scheduler/job/2053461
# test job: [3c36965df80801344850388592e95033eceea05b] https://lava.sirena.=
org.uk/scheduler/job/2049487
# test job: [655079ac8a7721ac215a0596e3f33b740e01144a] https://lava.sirena.=
org.uk/scheduler/job/2049673
# test job: [2f538ef9f6f7c3d700c68536f21447dfc598f8c8] https://lava.sirena.=
org.uk/scheduler/job/2048609
# test job: [aa897ffc396b48cc39eee133b6b43175d0df9eb5] https://lava.sirena.=
org.uk/scheduler/job/2048708
# test job: [380fd29d57abe6679d87ec56babe65ddc5873a37] https://lava.sirena.=
org.uk/scheduler/job/2044538
# test job: [af9c8092d84244ca54ffb590435735f788e7a170] https://lava.sirena.=
org.uk/scheduler/job/2043755
# test job: [c4e68959af66df525d71db619ffe44af9178bb22] https://lava.sirena.=
org.uk/scheduler/job/2044079
# test job: [2ecc8c089802e033d2e5204d21a9f467e2517df9] https://lava.sirena.=
org.uk/scheduler/job/2038469
# test job: [84194c66aaf78fed150edb217b9f341518b1cba2] https://lava.sirena.=
org.uk/scheduler/job/2038350
# test job: [252abf2d07d33b1c70a59ba1c9395ba42bbd793e] https://lava.sirena.=
org.uk/scheduler/job/2038498
# test job: [ed5d499b5c9cc11dd3edae1a7a55db7dfa4f1bdc] https://lava.sirena.=
org.uk/scheduler/job/2028996
# test job: [e73b743bfe8a6ff4e05b5657d3f7586a17ac3ba0] https://lava.sirena.=
org.uk/scheduler/job/2026389
# test job: [6ef8e042cdcaabe3e3c68592ba8bfbaee2fa10a3] https://lava.sirena.=
org.uk/scheduler/job/2025846
# test job: [ecd0de438c1f0ee86cf8f6d5047965a2a181444b] https://lava.sirena.=
org.uk/scheduler/job/2026091
# test job: [f1dfbc1b5cf8650ae9a0d543e5f5335fc0f478ce] https://lava.sirena.=
org.uk/scheduler/job/2025507
# test job: [8fdb030fe283c84fd8d378c97ad0f32d6cdec6ce] https://lava.sirena.=
org.uk/scheduler/job/2021419
# test job: [20bcda681f8597e86070a4b3b12d1e4f541865d3] https://lava.sirena.=
org.uk/scheduler/job/2022919
# test job: [cf6bf51b53252284bafc7377a4d8dbf10f048b4d] https://lava.sirena.=
org.uk/scheduler/job/2022940
# test job: [28039efa4d8e8bbf98b066133a906bd4e307d496] https://lava.sirena.=
org.uk/scheduler/job/2020277
# test job: [e062bdfdd6adbb2dee7751d054c1d8df63ddb8b8] https://lava.sirena.=
org.uk/scheduler/job/2020136
# test job: [f034c16a4663eaf3198dc18b201ba50533fb5b81] https://lava.sirena.=
org.uk/scheduler/job/2015402
# test job: [66fecfa91deb536a12ddf3d878a99590d7900277] https://lava.sirena.=
org.uk/scheduler/job/2015319
# test job: [4a5ac6cd05a7e54f1585d7779464d6ed6272c134] https://lava.sirena.=
org.uk/scheduler/job/2011242
# test job: [ef042df96d0e1089764f39ede61bc8f140a4be00] https://lava.sirena.=
org.uk/scheduler/job/2010188
# test job: [4795375d8aa072e9aacb0b278e6203c6ca41816a] https://lava.sirena.=
org.uk/scheduler/job/2009710
# test job: [4c33cef58965eb655a0ac8e243aa323581ec025f] https://lava.sirena.=
org.uk/scheduler/job/2009389
# test job: [e973dfe9259095fb509ab12658c68d46f0e439d7] https://lava.sirena.=
org.uk/scheduler/job/2008156
# test job: [e7434adf0c53a84d548226304cdb41c8818da1cb] https://lava.sirena.=
org.uk/scheduler/job/2007781
# test job: [d29479abaded34b2b1dab2e17efe96a65eba3d61] https://lava.sirena.=
org.uk/scheduler/job/2008399
# test job: [77a58ba7c64ccca20616aa03599766ccb0d1a330] https://lava.sirena.=
org.uk/scheduler/job/2007312
# test job: [01313661b248c5ba586acae09bff57077dbec0a5] https://lava.sirena.=
org.uk/scheduler/job/2008756
# test job: [c17fa4cbc546c431ccf13e9354d5d9c1cd247b7c] https://lava.sirena.=
org.uk/scheduler/job/2000025
# test job: [310bf433c01f78e0756fd5056a43118a2f77318c] https://lava.sirena.=
org.uk/scheduler/job/1995997
# test job: [fd5ef3d69f8975bad16c437a337b5cb04c8217a2] https://lava.sirena.=
org.uk/scheduler/job/1996106
# test job: [d054cc3a2ccfb19484f3b54d69b6e416832dc8f4] https://lava.sirena.=
org.uk/scheduler/job/1995702
# test job: [2528c15f314ece50218d1273654f630d74109583] https://lava.sirena.=
org.uk/scheduler/job/1997627
# test job: [638bae3fb225a708dc67db613af62f6d14c4eff4] https://lava.sirena.=
org.uk/scheduler/job/1991837
# test job: [ecba655bf54a661ffe078856cd8dbc898270e4b5] https://lava.sirena.=
org.uk/scheduler/job/1985161
# test job: [7e1906643a7374529af74b013bba35e4fa4e6ffc] https://lava.sirena.=
org.uk/scheduler/job/1978626
# test job: [d742ebcfe524dc54023f7c520d2ed2e4b7203c19] https://lava.sirena.=
org.uk/scheduler/job/1975991
# test job: [fce217449075d59b29052b8cdac567f0f3e22641] https://lava.sirena.=
org.uk/scheduler/job/1975648
# test job: [6658472a3e2de08197acfe099ba71ee0e2505ecf] https://lava.sirena.=
org.uk/scheduler/job/1973468
# test job: [0cc08c8130ac8f74419f99fe707dc193b7f79d86] https://lava.sirena.=
org.uk/scheduler/job/1965716
# test job: [0743acf746a81e0460a56fd5ff847d97fa7eb370] https://lava.sirena.=
org.uk/scheduler/job/1964817
# test job: [d77daa49085b067137d0adbe3263f75a7ee13a1b] https://lava.sirena.=
org.uk/scheduler/job/1962810
# test job: [1e570e77392f43a3cdab2849d1f81535f8a033e2] https://lava.sirena.=
org.uk/scheduler/job/1962218
# test job: [15afe57a874eaf104bfbb61ec598fa31627f7b19] https://lava.sirena.=
org.uk/scheduler/job/1962933
# test job: [fb25114cd760c13cf177d9ac37837fafcc9657b5] https://lava.sirena.=
org.uk/scheduler/job/1960135
# test job: [65efe5404d151767653c7b7dd39bd2e7ad532c2d] https://lava.sirena.=
org.uk/scheduler/job/1959967
# test job: [6621b0f118d500092f5f3d72ddddb22aeeb3c3a0] https://lava.sirena.=
org.uk/scheduler/job/1959721
# test job: [433e294c3c5b5d2020085a0e36c1cb47b694690a] https://lava.sirena.=
org.uk/scheduler/job/1957324
# test job: [0b0eb7702a9fa410755e86124b4b7cd36e7d1cb4] https://lava.sirena.=
org.uk/scheduler/job/1957396
# test job: [7e7e2c6e2a1cb250f8d03bb99eed01f6d982d5dd] https://lava.sirena.=
org.uk/scheduler/job/1954253
# test job: [64d87ccfae3326a9561fe41dc6073064a083e0df] https://lava.sirena.=
org.uk/scheduler/job/1947205
# test job: [4d410ba9aa275e7990a270f63ce436990ace1bea] https://lava.sirena.=
org.uk/scheduler/job/1947743
# test job: [b83fb1b14c06bdd765903ac852ba20a14e24f227] https://lava.sirena.=
org.uk/scheduler/job/1946813
# test job: [9797329220a2c6622411eb9ecf6a35b24ce09d04] https://lava.sirena.=
org.uk/scheduler/job/1947377
# test job: [fe8cc44dd173cde5788ab4e3730ac61f3d316d9c] https://lava.sirena.=
org.uk/scheduler/job/1946013
# test job: [6277a486a7faaa6c87f4bf1d59a2de233a093248] https://lava.sirena.=
org.uk/scheduler/job/1947015
# test job: [5e537031f322d55315cd384398b726a9a0748d47] https://lava.sirena.=
org.uk/scheduler/job/1946667
# test job: [4412ab501677606436e5c49e41151a1e6eac7ac0] https://lava.sirena.=
org.uk/scheduler/job/1946327
# test job: [187dac290bfd0741b9d7d5490af825c33fd9baa4] https://lava.sirena.=
org.uk/scheduler/job/2101535
# bad: [187dac290bfd0741b9d7d5490af825c33fd9baa4] Add linux-next specific f=
iles for 20251118
git bisect bad 187dac290bfd0741b9d7d5490af825c33fd9baa4
# test job: [abb54b0b86a61f10649f9ef3f6ab6821ae6abe74] https://lava.sirena.=
org.uk/scheduler/job/2101660
# good: [abb54b0b86a61f10649f9ef3f6ab6821ae6abe74] Merge branch 'master' of=
 https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.g=
it
git bisect good abb54b0b86a61f10649f9ef3f6ab6821ae6abe74
# test job: [ad048b22af91649db0797904f7452bbd082c4f72] https://lava.sirena.=
org.uk/scheduler/job/2101860
# good: [ad048b22af91649db0797904f7452bbd082c4f72] Merge branch 'for-backli=
ght-next' of https://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.=
git
git bisect good ad048b22af91649db0797904f7452bbd082c4f72
# test job: [2eb38aa81687e8bde227a4be8bc16aaea024b41a] https://lava.sirena.=
org.uk/scheduler/job/2102056
# good: [2eb38aa81687e8bde227a4be8bc16aaea024b41a] Merge branch 'driver-cor=
e-next' of https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driv=
er-core.git
git bisect good 2eb38aa81687e8bde227a4be8bc16aaea024b41a
# test job: [276498a96b70a88fc8c42d9104edd0d79c1bf6a8] https://lava.sirena.=
org.uk/scheduler/job/2102243
# good: [276498a96b70a88fc8c42d9104edd0d79c1bf6a8] Merge branch 'for-next' =
of https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git
git bisect good 276498a96b70a88fc8c42d9104edd0d79c1bf6a8
# test job: [36ebc989a5812e1de53b78054cb8a2f07b048d2b] https://lava.sirena.=
org.uk/scheduler/job/2102380
# bad: [36ebc989a5812e1de53b78054cb8a2f07b048d2b] Merge branch 'ntb-next' o=
f https://github.com/jonmason/ntb.git
git bisect bad 36ebc989a5812e1de53b78054cb8a2f07b048d2b
# test job: [5bcc5021b9db0a2f07a041671c3c4a70889d813b] https://lava.sirena.=
org.uk/scheduler/job/2102409
# bad: [5bcc5021b9db0a2f07a041671c3c4a70889d813b] Merge branch 'for-next' o=
f https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
git bisect bad 5bcc5021b9db0a2f07a041671c3c4a70889d813b
# test job: [8e9536f35f91235a023bb97d1aa2ce34f702bcfa] https://lava.sirena.=
org.uk/scheduler/job/2102420
# bad: [8e9536f35f91235a023bb97d1aa2ce34f702bcfa] Merge branch 'gpio/for-ne=
xt' of https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
git bisect bad 8e9536f35f91235a023bb97d1aa2ce34f702bcfa
# test job: [82e71fe4368699341333e7e0d059ef7df139cf95] https://lava.sirena.=
org.uk/scheduler/job/2102438
# bad: [82e71fe4368699341333e7e0d059ef7df139cf95] Merge tag 'gpio/shared-gp=
ios-for-v6.19-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/li=
nux.git into gpio/for-next
git bisect bad 82e71fe4368699341333e7e0d059ef7df139cf95
# test job: [0efa5b2ca6fa7baab4c523b34cfb9495ec143d61] https://lava.sirena.=
org.uk/scheduler/job/2102456
# good: [0efa5b2ca6fa7baab4c523b34cfb9495ec143d61] gpio: aspeed: remove unn=
eeded include
git bisect good 0efa5b2ca6fa7baab4c523b34cfb9495ec143d61
# test job: [7e061b462b3d43a1f85519f5aebdc77cbbe648c0] https://lava.sirena.=
org.uk/scheduler/job/2102591
# good: [7e061b462b3d43a1f85519f5aebdc77cbbe648c0] gpio: mmio: use lock gua=
rds
git bisect good 7e061b462b3d43a1f85519f5aebdc77cbbe648c0
# test job: [1e4f6db614a310cc34d07ffbf031c76ea9581bcf] https://lava.sirena.=
org.uk/scheduler/job/2102712
# good: [1e4f6db614a310cc34d07ffbf031c76ea9581bcf] gpiolib: support shared =
GPIOs in core subsystem code
git bisect good 1e4f6db614a310cc34d07ffbf031c76ea9581bcf
# test job: [b6d31cd41814a33c1a22b8c676131820440cc44e] https://lava.sirena.=
org.uk/scheduler/job/2102848
# good: [b6d31cd41814a33c1a22b8c676131820440cc44e] gpio: cdev: replace use =
of system_wq with system_percpu_wq
git bisect good b6d31cd41814a33c1a22b8c676131820440cc44e
# test job: [e511d484cbe44fe48a1b9f621f6a947c72503f9e] https://lava.sirena.=
org.uk/scheduler/job/2103002
# bad: [e511d484cbe44fe48a1b9f621f6a947c72503f9e] arm64: select HAVE_SHARED=
_GPIOS for ARCH_QCOM
git bisect bad e511d484cbe44fe48a1b9f621f6a947c72503f9e
# test job: [eb374f764a7012eda28019266a6d9191670c4fa5] https://lava.sirena.=
org.uk/scheduler/job/2103014
# good: [eb374f764a7012eda28019266a6d9191670c4fa5] gpio: provide gpiod_is_s=
hared()
git bisect good eb374f764a7012eda28019266a6d9191670c4fa5
# first bad commit: [e511d484cbe44fe48a1b9f621f6a947c72503f9e] arm64: selec=
t HAVE_SHARED_GPIOS for ARCH_QCOM

--xUTDfot4PSBLErIc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkcfXEACgkQJNaLcl1U
h9Clpwf+KIRFnOYtL9D/2mAUJJwIEryLqU7k4q2RoEaQGbe5Bft7qU8cXNIsoNR3
ekEwY+vjIn1rwmJkY2dggbTWvv79oGWcmq7TFTishLNn8qP7Z5cUZ4VwAzZu8GuX
v9SG9ptokJFV7mxm5mlwo6y4+2z7Q9NvciDes2whlyowPuUnX4JqPEyyDTZkdz96
5jgWoTgzURasVjf/Bt170aHUah286UO7mNpC9VTkTOLUehSAcq7shcaA/B8luYLW
qdtVKuMpBuQqZGIrl4uPlCCIntpm/4BSp/ygNP2O5IX4gfKVYfpmLgRGT6c2UaNe
VuktAjWd+gx9nUIAoNWprNf2XBwz/g==
=/6YJ
-----END PGP SIGNATURE-----

--xUTDfot4PSBLErIc--

