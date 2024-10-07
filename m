Return-Path: <linux-gpio+bounces-10912-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B7399255F
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 09:08:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C7C11F231ED
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 07:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE5AD1662E4;
	Mon,  7 Oct 2024 07:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HKkUDAWD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EFC158D93;
	Mon,  7 Oct 2024 07:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728284920; cv=none; b=DdhfOOjmjssG63SJka27RErT3D3oHX97LeHVjAjHibU4u/5oM64EGJOlHhKvC7/sU1sMcuWjiEa/ZbLL2EPbPFYF98qovMIv7SveLF6GkWwGiW+RCHqNy2Zejkj1AAtvlgjABkXVaKP/3Ct4pmMvJdll/tTEuPLfX6pbg27lpJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728284920; c=relaxed/simple;
	bh=IQOcvDJqVu/hJm9GOzkNwws7mshROkqYNoo8IGf0Jmo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SeWlMXEL4jdgo1d2d/PaZMLk5MVES0wMhkghO/SfSD7hKxbYA560zPPYT8SRR82zp2ngG4jWziINwBftqtSmOyyk0OP/kArPQYRTwebfdNl0NHOTRkXrsFoaIS5cqGZnplGtfev7+Q7r/B3top7fe8zDaafIdjYdmv1VZ+yT1z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HKkUDAWD; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7ea16c7759cso41203a12.1;
        Mon, 07 Oct 2024 00:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728284918; x=1728889718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vz9a7VvlQafkbxIA5pAmc5ag/lOwx2IBaT9Y8vCtVh8=;
        b=HKkUDAWDi97xgAnwSsoQB+EOx3LFQFzJ6QnFERxYZK1Hcm0Von7vmRx05adnGUtL0x
         Mjdz6Amk0LpNqsLi+IaUqW8f6kdDv9sAgsmIjCQBR+riDQa9aguULc9Takx5X5xOiqTr
         F7XbAkfjbrduevqvky/pc9+nukwQ9lyayyTNR3ASczr1ezIKR+sn5wd2cB6UJQpPh0Om
         vxgXnkvzI/WXuvHQjLGoCReyxRBRukqxYYNXkGnZEMHvHXgWnIA0hkpO26Dmrg++nvui
         d7RenlPiovkNNMBstY0FrsC3/DxGSSYATK32OoNwnKQJ8DuPgh/yEWuherYaFA/kgu8Q
         3cPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728284918; x=1728889718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vz9a7VvlQafkbxIA5pAmc5ag/lOwx2IBaT9Y8vCtVh8=;
        b=hxLh9xDB4Llc8+hGqvC02HD4yvCbbk4QgDfvgGcqq5MgrBJAD5J8/ts7MZMUygwxgC
         79Jd/TNoghLT+HK2assXmumeCU541CaTZF7+DkvTH4PX0lbh0LQLEEndkDiIExu7KpJl
         cixH8sD1IRwS2gxsx8wYXus2cOvQ92CfXfi38ESLML3/q6+V85jeItMwN+4C182EsL8H
         3Eg/TUGRVIudhAeBkLOWYLcaNQGG4d+XHjfOqFtxxNC67IRR6KY/urczQgV+FcT52gdH
         WiBX8KfGgkJy0vNIs87TpALn3ibhwJolR8CFPDM5bK3bUipoZgIhklJPnvXbCFwZ+I2Z
         x1xg==
X-Forwarded-Encrypted: i=1; AJvYcCV9S5kmww8QTupK3KH39UCzY+i0stYfo5/SNri+DQPQy9DZGkc0zt/bFTK8VRpEIRtCAeYO8zR1isrb7LiT@vger.kernel.org, AJvYcCV9TFweNaE+SuXw9q6q6K9JcfyqML1CsHglcWig9YIbMIpvUv1Kuh8Q+oKY31y1VDIuQ+5j7fq7/kSSzQ==@vger.kernel.org, AJvYcCW7eD/4RKKo0kMSeLNUDtV7v2AbKP1/WlgQUrrg1p8LQJKQSDqVrz07IBN/81+SVPfy3OOv0XY+DFWG@vger.kernel.org, AJvYcCXJsrQehOTwPx2Qzc2xo2gpmQ5KtUkCdQx0ykaqa4tO6K9JVxbml2vZdQV0ekz0WvgUs7zRs/BX/ixtz0gbRgY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjDoZ51JqiOyk1LPnivu7UHNxgqADiDtbqCPF9dYryXSntARLJ
	r+e6gC4a4EtVLr97ad616+ZyQAYCR751YUe6NeWY+gsyKS4Kc2dR
X-Google-Smtp-Source: AGHT+IEXax3uatvk/YqDpXIrO2NyLwUW45Kd+cNRXXiH1XaPga7IHLFCMdAAB6RhdG7dWI1Vfm6FUQ==
X-Received: by 2002:a05:6a20:e18a:b0:1d6:d0d3:c50c with SMTP id adf61e73a8af0-1d6dfac81c7mr16563231637.35.1728284917623;
        Mon, 07 Oct 2024 00:08:37 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71df0ccd1a3sm3764147b3a.66.2024.10.07.00.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 00:08:37 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v6 00/20] Initial device trees for A7-A11 based Apple devices
Date: Mon,  7 Oct 2024 15:05:25 +0800
Message-ID: <20241007070758.9961-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series adds device trees for all A7-A11 SoC based iPhones, iPads,
iPod touches and Apple TVs.

The following devices has been excluded from this series:
  - All T2 devices (A10-based): bootloader does not work (yet)
  - HomePod: Not tested, and it's also a different form factor

To pass `make dtbs_check`, please install the latest dtschema from the main
branch, for the `television` chassis type.

This series supports the following on all devices:
- SMP (spin-table)
- UART
- simple-framebuffer
- watchdog
- timer
- pinctrl
- AIC interrupts

The following is supported on A7-A10:
- Buttons and switches (with pinctrl)
The buttons on A11 based devices like the iPhone X is a subdevice of the
not yet supported SMC.

Patch dependencies:
- A patch to increase the reset delay in the watchdog driver[3] are 
needed on some SoCs to avoid the "Reboot Failed" message. (The
system will reset regardless of the patch)

Authorship information:
- The commits to actually add the dts files are mostly made by Konrad,
and Konrad's sign-off is added by me with permission. I also updated the
Konrad's email in the actual dts files. Konrad can confirm this.

- Everything else is entirely made by me.

Changes since v5:
 - Changed how device trees are split. {soc}.dtsi now only contain on-SoC
   parts, and parts common to all devices using a soc is in
   {soc}-common.dtsi. For A9 devices the common .dtsi is
   "s800-0-3-common.dtsi". For A8 devices additonally there is
   "t7000-handheld.dtsi" to group iPhones, iPad and iPod touches from
   Apple TVs.
 - For other SoCs, either all devices are handheld or there are only one
   type of handheld devices using it, so no handheld .dtsi is needed.
 - This is closer to how the existing device trees are split, and will
   allow nodes likes power manager and battery to be added more easily.
 - Fixed Apple TV HD serial debug console. It is serial6, not serial0.

Changes since v4:
  - Removed incorrect commit message about the order of CPU cores
    in the commit adding Apple A7-A11 CPU cores.
  - Update tags on commit added A8X device tree files, requested by
    Markuss.

Changes since v3:
  - Properly seperate A10X dt-binding additions and dts additions.
  - Apple CPU cores, including the existing ones are now ordered
    alphabetically.

Changes since v2:
  - Removed A10 cpufreq. The loader may be missing some initialization
    code that just happened to be performed by some versions of the
    firmware as well, given the inconsistent behavior on different
    devices. It is also possible that the driver needs to be modified,
    I do not know and this needs more research first.

  - Removed Ivaylo's tags on commit to add A8X device trees, seems he
    does not want those anymore[4].
  - Added Ivaylo's tags on commit to add A8 device tree, I have missed
    the tag. See [5] for source of those tags.
  - Added Conor's missing A-b on the commit to add A7 machine bindings.

Changes since v1:
  - Added /chassis-type property
  - Added opp-microvolt in A10 cpufreq for documentation purposes
  - Home button is now assigned KEY_HOMEPAGE
  - Fixed t8010-n112.dts and do not remove it from Makefile in later
    commits... (iPod touch 7)

In order to be consistent with the Apple ARM Machines bindings,
the order of dt-bindings did not change from v1.

The sort order logic here is having SoC type families in release
order, and SoCs within each family in release order:
    
- t8xxx/t700x/s5l8960x (Apple HxxP/G series, "phone"/"tablet" chips)
   - s5l8960x (Apple H6/A7)
   - t7000 (Apple H7P/A8)
   - t7001 (Apple H7G/A8X)
   - s8000/3 (Apple H8P/A9)
   - s8001 (Apple H8G/A9X)
   - t8010 (Apple H9P/A10)
   - t8011 (Apple H9G/A10X)
   - t8015 (Apple H10/A11)
   - t8103 (Apple H13G/M1)
   - t8112 (Apple H14G/M2)
- t6xxx (Apple HxxJ series, "desktop" chips)
   - t6000 (Apple H13J(S)/M1 Pro)
   - t6001 (Apple H13J(C)/M1 Max)
   - t6002 (Apple H13J(D)/M1 Ultra)

At this moment, it is expected that most hardware blocks will be 100%
compatible between A-series and AX-series SoCs, though to a less extent
than compatibility between desktop chips of the same generation.

v1: https://lore.kernel.org/asahi/20240911084353.28888-2-towinchenmi@gmail.com
v2: https://lore.kernel.org/asahi/20240914052413.68177-1-towinchenmi@gmail.com
v3: https://lore.kernel.org/asahi/20240915080733.3565-1-towinchenmi@gmail.com
v4: https://lore.kernel.org/asahi/20240919161443.10340-1-towinchenmi@gmail.com
v5: https://lore.kernel.org/asahi/20240925071939.6107-1-towinchenmi@gmail.com

[1]: https://lore.kernel.org/asahi/20240901034143.12731-1-towinchenmi@gmail.com
[2]: https://lore.kernel.org/asahi/20240911050741.14477-1-towinchenmi@gmail.com
[3]: https://lore.kernel.org/asahi/20241001170018.20139-1-towinchenmi@gmail.com
[4]: https://lore.kernel.org/asahi/34c748fe-89d2-d3a5-599d-52972c10f688@gmail.com
[5]: https://github.com/konradybcio/linux-apple/commits/apple/v5.19-rc1

Nick Chan
---

Konrad Dybcio (8):
  arm64: dts: apple: Add A7 devices
  arm64: dts: apple: Add A8 devices
  arm64: dts: apple: Add A8X devices
  arm64: dts: apple: Add A9 devices
  arm64: dts: apple: Add A9X devices
  arm64: dts: apple: Add A10 devices
  arm64: dts: apple: Add A10X devices
  arm64: dts: apple: Add A11 devices

Nick Chan (12):
  dt-bindings: arm: cpus: Add Apple A7-A11 CPU cores
  dt-bindings: watchdog: apple,wdt: Add A7-A11 compatibles
  dt-bindings: pinctrl: apple,pinctrl: Add A7-A11 compatibles
  dt-bindings: arm: apple: Add A7 devices
  dt-bindings: arm: apple: Add A8 devices
  dt-bindings: arm: apple: Add A8X devices
  dt-bindings: arm: apple: Add A9 devices
  dt-bindings: arm: apple: Add A9X devices
  dt-bindings: arm: apple: Add A10 devices
  dt-bindings: arm: apple: Add A10X devices
  dt-bindings: arm: apple: Add A11 devices
  arm64: Kconfig: Update help text for CONFIG_ARCH_APPLE

 .../devicetree/bindings/arm/apple.yaml        | 160 +++++++++++-
 .../devicetree/bindings/arm/cpus.yaml         |   8 +-
 .../bindings/pinctrl/apple,pinctrl.yaml       |   5 +
 .../bindings/watchdog/apple,wdt.yaml          |   5 +
 arch/arm64/Kconfig.platforms                  |   4 +-
 arch/arm64/boot/dts/apple/Makefile            |  53 ++++
 arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi    |  51 ++++
 arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi  |  51 ++++
 .../arm64/boot/dts/apple/s5l8960x-common.dtsi |  48 ++++
 arch/arm64/boot/dts/apple/s5l8960x-j71.dts    |  14 ++
 arch/arm64/boot/dts/apple/s5l8960x-j72.dts    |  14 ++
 arch/arm64/boot/dts/apple/s5l8960x-j73.dts    |  14 ++
 arch/arm64/boot/dts/apple/s5l8960x-j85.dts    |  14 ++
 arch/arm64/boot/dts/apple/s5l8960x-j85m.dts   |  14 ++
 arch/arm64/boot/dts/apple/s5l8960x-j86.dts    |  14 ++
 arch/arm64/boot/dts/apple/s5l8960x-j86m.dts   |  14 ++
 arch/arm64/boot/dts/apple/s5l8960x-j87.dts    |  14 ++
 arch/arm64/boot/dts/apple/s5l8960x-j87m.dts   |  14 ++
 arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi |  51 ++++
 arch/arm64/boot/dts/apple/s5l8960x-mini3.dtsi |  14 ++
 arch/arm64/boot/dts/apple/s5l8960x-n51.dts    |  14 ++
 arch/arm64/boot/dts/apple/s5l8960x-n53.dts    |  14 ++
 arch/arm64/boot/dts/apple/s5l8960x.dtsi       | 113 +++++++++
 .../arm64/boot/dts/apple/s800-0-3-common.dtsi |  48 ++++
 arch/arm64/boot/dts/apple/s8000-j71s.dts      |  15 ++
 arch/arm64/boot/dts/apple/s8000-j72s.dts      |  15 ++
 arch/arm64/boot/dts/apple/s8000-n66.dts       |  15 ++
 arch/arm64/boot/dts/apple/s8000-n69u.dts      |  15 ++
 arch/arm64/boot/dts/apple/s8000-n71.dts       |  15 ++
 arch/arm64/boot/dts/apple/s8000.dtsi          | 144 +++++++++++
 arch/arm64/boot/dts/apple/s8001-common.dtsi   |  48 ++++
 arch/arm64/boot/dts/apple/s8001-j127.dts      |  14 ++
 arch/arm64/boot/dts/apple/s8001-j128.dts      |  14 ++
 arch/arm64/boot/dts/apple/s8001-j98a.dts      |  14 ++
 arch/arm64/boot/dts/apple/s8001-j99a.dts      |  14 ++
 arch/arm64/boot/dts/apple/s8001-pro.dtsi      |  44 ++++
 arch/arm64/boot/dts/apple/s8001.dtsi          | 133 ++++++++++
 arch/arm64/boot/dts/apple/s8003-j71t.dts      |  15 ++
 arch/arm64/boot/dts/apple/s8003-j72t.dts      |  15 ++
 arch/arm64/boot/dts/apple/s8003-n66m.dts      |  15 ++
 arch/arm64/boot/dts/apple/s8003-n69.dts       |  15 ++
 arch/arm64/boot/dts/apple/s8003-n71m.dts      |  15 ++
 arch/arm64/boot/dts/apple/s8003.dtsi          |  21 ++
 arch/arm64/boot/dts/apple/s800x-6s.dtsi       |  49 ++++
 arch/arm64/boot/dts/apple/s800x-ipad5.dtsi    |  43 ++++
 arch/arm64/boot/dts/apple/s800x-se.dtsi       |  49 ++++
 arch/arm64/boot/dts/apple/t7000-6.dtsi        |  50 ++++
 arch/arm64/boot/dts/apple/t7000-common.dtsi   |  36 +++
 arch/arm64/boot/dts/apple/t7000-handheld.dtsi |  27 ++
 arch/arm64/boot/dts/apple/t7000-j42d.dts      |  31 +++
 arch/arm64/boot/dts/apple/t7000-j96.dts       |  14 ++
 arch/arm64/boot/dts/apple/t7000-j97.dts       |  14 ++
 arch/arm64/boot/dts/apple/t7000-mini4.dtsi    |  51 ++++
 arch/arm64/boot/dts/apple/t7000-n102.dts      |  48 ++++
 arch/arm64/boot/dts/apple/t7000-n56.dts       |  14 ++
 arch/arm64/boot/dts/apple/t7000-n61.dts       |  14 ++
 arch/arm64/boot/dts/apple/t7000.dtsi          | 125 ++++++++++
 arch/arm64/boot/dts/apple/t7001-air2.dtsi     |  74 ++++++
 arch/arm64/boot/dts/apple/t7001-j81.dts       |  14 ++
 arch/arm64/boot/dts/apple/t7001-j82.dts       |  14 ++
 arch/arm64/boot/dts/apple/t7001.dtsi          | 123 +++++++++
 arch/arm64/boot/dts/apple/t8010-7.dtsi        |  43 ++++
 arch/arm64/boot/dts/apple/t8010-common.dtsi   |  48 ++++
 arch/arm64/boot/dts/apple/t8010-d10.dts       |  14 ++
 arch/arm64/boot/dts/apple/t8010-d101.dts      |  14 ++
 arch/arm64/boot/dts/apple/t8010-d11.dts       |  14 ++
 arch/arm64/boot/dts/apple/t8010-d111.dts      |  14 ++
 arch/arm64/boot/dts/apple/t8010-ipad6.dtsi    |  44 ++++
 arch/arm64/boot/dts/apple/t8010-ipad7.dtsi    |  14 ++
 arch/arm64/boot/dts/apple/t8010-j171.dts      |  14 ++
 arch/arm64/boot/dts/apple/t8010-j172.dts      |  14 ++
 arch/arm64/boot/dts/apple/t8010-j71b.dts      |  14 ++
 arch/arm64/boot/dts/apple/t8010-j72b.dts      |  14 ++
 arch/arm64/boot/dts/apple/t8010-n112.dts      |  47 ++++
 arch/arm64/boot/dts/apple/t8010.dtsi          | 133 ++++++++++
 arch/arm64/boot/dts/apple/t8011-common.dtsi   |  46 ++++
 arch/arm64/boot/dts/apple/t8011-j105a.dts     |  16 ++
 arch/arm64/boot/dts/apple/t8011-j120.dts      |  16 ++
 arch/arm64/boot/dts/apple/t8011-j121.dts      |  16 ++
 arch/arm64/boot/dts/apple/t8011-j207.dts      |  16 ++
 arch/arm64/boot/dts/apple/t8011-j208.dts      |  16 ++
 arch/arm64/boot/dts/apple/t8011-pro2.dtsi     |  42 ++++
 arch/arm64/boot/dts/apple/t8011.dtsi          | 141 +++++++++++
 arch/arm64/boot/dts/apple/t8015-8.dtsi        |  13 +
 arch/arm64/boot/dts/apple/t8015-8plus.dtsi    |   9 +
 arch/arm64/boot/dts/apple/t8015-common.dtsi   |  48 ++++
 arch/arm64/boot/dts/apple/t8015-d20.dts       |  14 ++
 arch/arm64/boot/dts/apple/t8015-d201.dts      |  14 ++
 arch/arm64/boot/dts/apple/t8015-d21.dts       |  14 ++
 arch/arm64/boot/dts/apple/t8015-d211.dts      |  14 ++
 arch/arm64/boot/dts/apple/t8015-d22.dts       |  14 ++
 arch/arm64/boot/dts/apple/t8015-d221.dts      |  14 ++
 arch/arm64/boot/dts/apple/t8015-x.dtsi        |  13 +
 arch/arm64/boot/dts/apple/t8015.dtsi          | 234 ++++++++++++++++++
 94 files changed, 3298 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-common.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j71.dts
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j72.dts
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j73.dts
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j85.dts
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j85m.dts
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j86.dts
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j86m.dts
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j87.dts
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j87m.dts
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-mini3.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-n51.dts
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-n53.dts
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s800-0-3-common.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s8000-j71s.dts
 create mode 100644 arch/arm64/boot/dts/apple/s8000-j72s.dts
 create mode 100644 arch/arm64/boot/dts/apple/s8000-n66.dts
 create mode 100644 arch/arm64/boot/dts/apple/s8000-n69u.dts
 create mode 100644 arch/arm64/boot/dts/apple/s8000-n71.dts
 create mode 100644 arch/arm64/boot/dts/apple/s8000.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s8001-common.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s8001-j127.dts
 create mode 100644 arch/arm64/boot/dts/apple/s8001-j128.dts
 create mode 100644 arch/arm64/boot/dts/apple/s8001-j98a.dts
 create mode 100644 arch/arm64/boot/dts/apple/s8001-j99a.dts
 create mode 100644 arch/arm64/boot/dts/apple/s8001-pro.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s8001.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s8003-j71t.dts
 create mode 100644 arch/arm64/boot/dts/apple/s8003-j72t.dts
 create mode 100644 arch/arm64/boot/dts/apple/s8003-n66m.dts
 create mode 100644 arch/arm64/boot/dts/apple/s8003-n69.dts
 create mode 100644 arch/arm64/boot/dts/apple/s8003-n71m.dts
 create mode 100644 arch/arm64/boot/dts/apple/s8003.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s800x-6s.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s800x-ipad5.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s800x-se.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t7000-6.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t7000-common.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t7000-handheld.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t7000-j42d.dts
 create mode 100644 arch/arm64/boot/dts/apple/t7000-j96.dts
 create mode 100644 arch/arm64/boot/dts/apple/t7000-j97.dts
 create mode 100644 arch/arm64/boot/dts/apple/t7000-mini4.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t7000-n102.dts
 create mode 100644 arch/arm64/boot/dts/apple/t7000-n56.dts
 create mode 100644 arch/arm64/boot/dts/apple/t7000-n61.dts
 create mode 100644 arch/arm64/boot/dts/apple/t7000.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t7001-air2.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t7001-j81.dts
 create mode 100644 arch/arm64/boot/dts/apple/t7001-j82.dts
 create mode 100644 arch/arm64/boot/dts/apple/t7001.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8010-7.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8010-common.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8010-d10.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8010-d101.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8010-d11.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8010-d111.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8010-ipad6.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8010-ipad7.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8010-j171.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8010-j172.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8010-j71b.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8010-j72b.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8010-n112.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8010.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8011-common.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8011-j105a.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8011-j120.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8011-j121.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8011-j207.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8011-j208.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8011-pro2.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8011.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8015-8.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8015-8plus.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8015-common.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8015-d20.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8015-d201.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8015-d21.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8015-d211.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8015-d22.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8015-d221.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8015-x.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8015.dtsi


base-commit: 58ca61c1a866bfdaa5e19fb19a2416764f847d75
-- 
2.46.2


