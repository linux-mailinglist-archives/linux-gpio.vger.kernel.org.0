Return-Path: <linux-gpio+bounces-17231-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7B4A56584
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 11:36:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 268891895D02
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 10:36:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BFFF20E018;
	Fri,  7 Mar 2025 10:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="jo2Ui7RS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178453398B;
	Fri,  7 Mar 2025 10:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741343778; cv=none; b=uUFNe6d5cO65ZEdgay0NkwCruyy9RAVl5pASLpAiJpjKaI5ZtDWZEv8MiGex8rPSEk6coK4yGFuC6I6rSGwBLuyLc3pRgWL40z/hbaz5hJZdbVAlUVPd6Q9sXhnnRIXhNuv+yE/SVsrq7uezHV4QjUd2DK8g8L/a1kdF9LGxMVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741343778; c=relaxed/simple;
	bh=xpz0JnTO8EjnXprVVDznWVVBFkSwf2xO+/6B8EcHiYk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p7LrqBmOrYwu6WR0ji6yjHJbIfrnx/xb15IhTzukKHEjU/eEvLbO3SxNZaL8LJi1vqVLz1r+Xfk1bJv/qNqY45Tt/fdCdoy1xn8dFacQiw7sKskERXtsm6U2NAp+CONHenivgltx9T4GjPVONfNvgjTxPlUWWx1DKpc/bpXH+XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=jo2Ui7RS; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 527Aa3fT3942355
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 7 Mar 2025 04:36:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741343763;
	bh=cvgYwkrSX3m7pHovfj4EkqP0IQAfEUDayUzafJ2vb1I=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=jo2Ui7RSC0ZEqlQEvafSN1F50gheE8QOeksiKYoEV3x+lcXTQE8xlZhkV5Pl2+9vM
	 pZYqPQ6USz0DZN+vdwVTlKn7RfswUlCKhqeSIEh2kgWq8BGPw36NY5UrDmySJUR+Be
	 T6AuIReVOfJuCbMUeX5mv73HXLmT03g+l8U33WAY=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 527Aa3O8029218;
	Fri, 7 Mar 2025 04:36:03 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 7
 Mar 2025 04:36:02 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 7 Mar 2025 04:36:02 -0600
Received: from uda0132425.dhcp.ti.com (dhcp-10-24-69-250.dhcp.ti.com [10.24.69.250])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 527AZwbc079336;
	Fri, 7 Mar 2025 04:35:59 -0600
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz
 Golaszewski <brgl@bgdev.pl>,
        Jared McArthur <j-mcarthur@ti.com>, Michael
 Walle <mwalle@kernel.org>
CC: Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 1/2] arm64: dts: ti: k3-am62p: fix pinctrl settings
Date: Fri, 7 Mar 2025 16:05:55 +0530
Message-ID: <174133309361.1072814.8037717583251450140.b4-ty@ti.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250221091447.595199-1-mwalle@kernel.org>
References: <20250221091447.595199-1-mwalle@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Michael Walle,

On Fri, 21 Feb 2025 10:14:46 +0100, Michael Walle wrote:
> It appears that pinctrl-single is misused on this SoC to control both
> the mux and the input and output and bias settings. This results in
> non-working pinctrl configurations for GPIOs within the device tree.
> 
> This is what happens:
>  (1) During startup the pinctrl settings are applied according to the
>      device tree. I.e. the pin is configured as output and with
>      pull-ups enabled.
>  (2) During startup a device driver requests a GPIO.
>  (3) pinctrl-single is applying the default GPIO setting according to
>      the pinctrl-single,gpio-range property.
> 
> [...]

> Maybe one could also switch the pinctrl-single to a pinconf-single node
> which is able to control all the bias settings and restrict
> "pinctrl-single,function-mask" to just the actual function. Not
> sure

I agree, we should probably migrate to pinconf-single bindings in long
term. There is just too much legacy code and tools relying on current
bindings though. Something for look at for next SoC. Thanks for the
patch!


I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/2] arm64: dts: ti: k3-am62p: fix pinctrl settings
      commit: 33bab9d84e52188cf73c3573fd7cf3ec0e01d007
[2/2] arm64: dts: ti: k3-j722s: fix pinctrl settings
      commit: 06daad327d043c23bc1ab4cdb519f589094b9e98

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
--
Vignesh


