Return-Path: <linux-gpio+bounces-23328-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D6CB06764
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 22:02:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34CF73ADA04
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 20:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DE072749DB;
	Tue, 15 Jul 2025 20:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="SsEnfuXT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6A9DF76;
	Tue, 15 Jul 2025 20:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752609739; cv=none; b=TWpkqXlxPHjXttIiRVS5pDiYglLySahVUOCdivWsE8TGDs+303E5w0c9il8grLG9Yl7utdQW42odxiAFZow7fj+nzAgy2uG6IkCMGn64P0q0GnmbmI3VTIb4aJRxRMq483dfsV5YN800NdOoy4bF0sEgkHzigNnijtYXX7askXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752609739; c=relaxed/simple;
	bh=IlCzUyU86o/VK/0QI6Z3Ae+UognH1Q9r6mhfH/bE0bw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PpcXVaJ5JmnIpzTUwA28EkH0yEt2lrqg8LfM6Ycx44LAYyWQZvSPlJjjgqJaWXnRZksseQWqGB8EhHvM10cMnmHeSV3emlSXFkk3DCDvXrbdUDe4vTz+QM4/DIzrMcaEFkNZlElh/DnY71wPAC54FjHdqwTZwioBWlfu/8MOd9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=SsEnfuXT; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1752609728; x=1753214528; i=wahrenst@gmx.net;
	bh=61UFxOUi1pwMBOxBFTpDvD+DtYLmLBP8UmNGHaLoWaU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=SsEnfuXTV3q+bz5MAXTorkj8WO47rQAJPH8ECRyz4lj0acQXo453WvU9uFjHKPUC
	 menMr8xJ3yCvLjW8G7b5Z1YGwCX336Uzvo61jGUiocmTPruAtqjQfxYGWGNf0WHCh
	 jEBsTn+LIAXbTmAuZBYlHo17T1aeF48LZfdkZNs3tPvtS8F91shqBD2RRXoJRFz9b
	 5GXkv0eYW/LQVq2BJS1f4kiSUzBDzpYiOpm8fd0hI7YU8CY9EDew0JAEeAQ4toxG2
	 clxQPpVFXZjb+m9KnUDc1uUwGpximOifaa+gIcZkFjKCnKIdrlc2zwgDlapdqTA/P
	 g9p200W3URzeUOKXUw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([91.41.216.208]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mo6ux-1uzVhT2bc3-00kl84; Tue, 15
 Jul 2025 22:02:08 +0200
Message-ID: <079344d8-392f-4c2a-916e-5430151015db@gmx.net>
Date: Tue, 15 Jul 2025 22:02:07 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] Add pin control driver for BCM2712 SoC
To: Andrea della Porta <andrea.porta@suse.com>, linus.walleij@linaro.org,
 robh@kernel.org, krzk+dt@kernel.org
Cc: conor+dt@kernel.org, florian.fainelli@broadcom.com,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 iivanov@suse.de, svarbanov@suse.de, mbrugger@suse.com
References: <cover.1752584387.git.andrea.porta@suse.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <cover.1752584387.git.andrea.porta@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:YBt3iETvHk15FICLdZV4z407Act/04bgV1qCSNtRBW/D1SQjocj
 P1NiekE+uVO1Ixakbdybr9CCguGUqjZj253ksox5BQu2JiwGht2h1DlwSABCk1Xhbn8hjK3
 L6jzHJWO3Cia9yaosdv6tbG20Rlv7oRrFCNxi6uoHMvUaQ19E32gz/+PP9/4WAKwCsYoZwC
 QgeGVrb1VzgL9qW9dn4fw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:FQGRF7x41nE=;ibHQF1Y322nAXqx8vSEYuoLuAyg
 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
 4CKHvK+dHhRqrGhknP1ZL68=

Hi Andrea,

Am 15.07.25 um 20:31 schrieb Andrea della Porta:
> Hi,
>
> The following patches add a pin control driver for the BCM2712 SoC and few
> pin/gpio Devicetree nodes for Raspberry Pi 5.
>
> Device driver is follow up version on what Andrea posted in April [1].
>
> It is based on sources from here [2]. I just made few cosmetic changes
> and addressed review comments from earlier submission. I don't have
> documentation for this controller.
>
> Patch 4 wire up power button on RPi5.
>
> Patch 5 adds WiFi Devicetree node for RPi5.
>
> Patch 6 adds Bluetooth Devicetree node for RPi5.
>
> All this have been tested as kernel was directly booted RPi5 via
> kernel= config.txt option and cmdline.txt file with following content
> (Note I am using Tumbleweed RPi raw images)
>
> # cat /boot/efi/cmdline.txt
> root=/dev/mmcblk0p3 rootwait rw systemd.show_status=1 console=tty ignore_loglevel earlycon console=ttyAMA10,115200
>
> With all these patches Bluetooth and Wifi are working fine (tm) with
> firmware files provided by openSUSE Tumbleweed.
>
> All comments and suggestions are welcome!
>
> Happy hacking!
> Ivan and Andrea
>
> [1] https://lore.kernel.org/lkml/f6601f73-cb22-4ba3-88c5-241be8421fc3@broadcom.com/
> [2] https://github.com/raspberrypi/linux/blob/rpi-6.6.y/drivers/pinctrl/bcm/pinctrl-bcm2712.c
> [3] https://lore.kernel.org/lkml/20240605120712.3523290-1-florian.fainelli@broadcom.com/#t
> [4] https://lore.kernel.org/all/bfc60a7e-54d2-48a6-a288-4fe76d66507a@gmx.net/
>
>
> CHANGES in V2: (all patchset is based upon linux-next/master)
this mention a V2, but the series doesn't have a version in the subject?

Best regards
>
> --- PINCTRL DRIVER ---
>
> - dropped bcm2712_c0_aon_sgpio_pin_funcs[] and bcm2712_d0_aon_sgpio_pin_funcs[]
>    struct array definitions since they are not used anywhere.
>
> - dropped 'arg' variable in brcmstb_pinconf_set() as it's not used.
>
> - updated copyright info at the top.
>
> - several changes in the declared macros. Renaming the macro name and the
>    macro parameters to better reflect the semantic.
>
> - reworked MUX_BIT() macro to be more streamlined and easy to
>    understand.
>
> - added PAD_BIT() macro to avoid code duplication.
>
> - renamed 'lock' variable to 'fsel_lock'.
>
> - added some comments about non-existent pins on D0 silicon revision pin
>    declarations.
>
> - brcmstb_pinctrl_fsel_set(), brcmstb_pull_config_set()  and
>    brcmstb_pinconf_set() (and functions that call them) can now return -EINVAL
>    as error.
>
> - added myself as MODULE_AUTHOR.
>
> - dropped the 'brcm,bcm2712-[aon-]pinctrl' fallback compatible. Only c0 or d0
>    compatibles are permitted now.
>
>
> --- DTS ---
>
> - moved 'clock-frequency' property from (uarta) board dts node to SoC dtsi node.
>
> - added 'brcm,sdhci-brcmstb' compatible and 'clock-names' property to mmc node
>    to avoid dt_binding_check errors.
>
> - added 'brcm,bcm7445-gpio' compatible to gpio node to avoid dt_binding_check
>    errors.
>
> - renamed all pinctrl pin nodes as per yaml schema (*-state and *-pins).
>
> - changed 'brcm,bcm2712-*pinctrl' to 'brcm,bcm2712c0-*pinctrl' since the
>    former was more of a fallback and does not reflect a real silicon revision.
>
> - moved status="okay" to the last entry in 'uarta' node.
>
> - removed 'local-*-address' property from everywhere.
>
> - dropped 'skip-init' property in 'uarta' node since it does not apply to
>    linux kernel.
>
> - renamed 'pwr-button' node to 'gpio-keys' and 'pwr_key' node to
>    'power_button'.
>
> - dropped an userspace related 'brcm,gpio-direct' property from gpio node.
>
>
>
> --- DT BINDINGS ---
>
> - binding schema file renamed to 'brcm,bcm2712c0-pinctrl.yaml' to reflect the
>    compatible name.
>
> - dropped the 'brcm,bcm2712-[aon-]pinctrl' fallback compatible. Only c0 or d0
>    compatibles are permitted now.
>
> - added example section.
>
> - moved allOf: block at the beginning of the schema.
>
> - dropped some unnecessary new lines.
>
> - replaced current layout to describe the pin subnodes with patternProperties
>    (nodes now end with -state and -pins).
>
> - expanded the schema description to give some context about STB family of pin
>    controller and added some details about C0 and D0 silicon variants. This is
>    also reflected in the commit message.
>
>
> --- MISC ---
>
> - enabled CONFIG_PINCTRL_BRCMSTB in arm64 defconfig.
>
>
> Andrea della Porta (1):
>    arm64: defconfig: Enable BCM2712 on-chip pin controller driver
>
> Ivan T. Ivanov (6):
>    dt-bindings: pinctrl: Add support for Broadcom STB pin controller
>    pinctrl: bcm: Add STB family pin controller driver
>    arm64: dts: broadcom: bcm2712: Add pin controller nodes
>    arm64: dts: broadcom: bcm2712: Add one more GPIO node
>    arm64: dts: broadcom: bcm2712: Add second SDHCI controller node
>    arm64: dts: broadcom: bcm2712: Add UARTA controller node
>
>   .../pinctrl/brcm,bcm2712c0-pinctrl.yaml       |  123 ++
>   .../dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts  |  134 ++
>   arch/arm64/boot/dts/broadcom/bcm2712.dtsi     |   48 +
>   arch/arm64/configs/defconfig                  |    1 +
>   drivers/pinctrl/bcm/Kconfig                   |   13 +
>   drivers/pinctrl/bcm/Makefile                  |    1 +
>   drivers/pinctrl/bcm/pinctrl-brcmstb.c         | 1195 +++++++++++++++++
>   7 files changed, 1515 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm2712c0-pinctrl.yaml
>   create mode 100644 drivers/pinctrl/bcm/pinctrl-brcmstb.c
>


