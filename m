Return-Path: <linux-gpio+bounces-2234-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC9782DA28
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jan 2024 14:32:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 513761C217FA
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jan 2024 13:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FCC31754A;
	Mon, 15 Jan 2024 13:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="O9ei0t+8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129CE171D4;
	Mon, 15 Jan 2024 13:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1705325448; x=1736861448;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iPNqV4WqSslaaJ2XVWrUIXiGS/Zq3AEGuqtwwZfh5Cw=;
  b=O9ei0t+8rGQ4OOK8AnmZiIiAhzIiG5X4NFaD1M+dN3CNNJsX/jVRg8YQ
   HXybkUkroJF/c1OA8MQAqnLhpoDuWVCDoZKXlInXRHa3RqK84JQZ4jY/L
   GZDCdwA1c0ZCoAUQWnX+9nCb8gk4t6nrEwswBqziok6D0nJmC8rqK6EME
   rCmeuRscGAYte5WWyOtDFynUEwWQ+PBLanC27D0tbWGjlojE9hZVVRCcC
   IXl12qSh2tvKtjROD8TcEsilOB4kWpRXVIP7Nsk/vwarkYz79kiLz8b2E
   ctkND7TBS51j4q2s2TaLBg6n4mLAGTPFrljQOhzuXTMaNkjyOEvsJHfXm
   w==;
X-IronPort-AV: E=Sophos;i="6.04,196,1695679200"; 
   d="scan'208";a="34897440"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 15 Jan 2024 14:30:45 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 9C112280075;
	Mon, 15 Jan 2024 14:30:45 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: linus.walleij@linaro.org, brgl@bgdev.pl, robh+dt@kernel.org, Hector Palacios <hector.palacios@digi.com>
Cc: stefan@agner.ch, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, peng.fan@nxp.com, haibo.chen@nxp.com, hector.palacios@digi.com
Subject: Re: [PATCH v2 2/2] arm64: dts: imx93: specify available 'ngpios' per GPIO port
Date: Mon, 15 Jan 2024 14:30:45 +0100
Message-ID: <2919725.e9J7NaK4W3@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20240115131605.395691-3-hector.palacios@digi.com>
References: <20240115131605.395691-1-hector.palacios@digi.com> <20240115131605.395691-3-hector.palacios@digi.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi Hector,

thanks for the patch.

Am Montag, 15. Januar 2024, 14:16:05 CET schrieb Hector Palacios:
> According to NXP HRM for i.MX93, the following GPIO pins are available:
> - GPIO1: 16 pins (0..15)

Mh, RM Rev4 (12/2023) says:
>  Bit[31:17] should be Reserved for GPIO1

So GPIO1 has the range 0..16

> - GPIO2: 30 pins (0..29)
> - GPIO3: 32 pins (0..31)
> - GPIO4: 30 pins (0..29)

RM Rev4 (12/2023) says:
> Bit[31:28] should be Reserved for GPIO4

So GPIO4 would be the range 0..27

Where did you get your numbers from?

Best regards,
Alexander

>=20
> Signed-off-by: Hector Palacios <hector.palacios@digi.com>
> ---
>  arch/arm64/boot/dts/freescale/imx93.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi
> b/arch/arm64/boot/dts/freescale/imx93.dtsi index 34c0540276d1..7eb2cab7c7=
49
> 100644
> --- a/arch/arm64/boot/dts/freescale/imx93.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
> @@ -970,6 +970,7 @@ gpio2: gpio@43810000 {
>  				 <&clk IMX93_CLK_GPIO2_GATE>;
>  			clock-names =3D "gpio", "port";
>  			gpio-ranges =3D <&iomuxc 0 4 30>;
> +			ngpios =3D <30>;
>  		};
>=20
>  		gpio3: gpio@43820000 {
> @@ -986,6 +987,7 @@ gpio3: gpio@43820000 {
>  			clock-names =3D "gpio", "port";
>  			gpio-ranges =3D <&iomuxc 0 84 8>, <&iomuxc 8 66=20
18>,
>  				      <&iomuxc 26 34 2>, <&iomuxc 28 0=20
4>;
> +			ngpios =3D <32>;
>  		};
>=20
>  		gpio4: gpio@43830000 {
> @@ -1001,6 +1003,7 @@ gpio4: gpio@43830000 {
>  				 <&clk IMX93_CLK_GPIO4_GATE>;
>  			clock-names =3D "gpio", "port";
>  			gpio-ranges =3D <&iomuxc 0 38 28>, <&iomuxc 28 36=20
2>;
> +			ngpios =3D <30>;
>  		};
>=20
>  		gpio1: gpio@47400000 {
> @@ -1016,6 +1019,7 @@ gpio1: gpio@47400000 {
>  				 <&clk IMX93_CLK_GPIO1_GATE>;
>  			clock-names =3D "gpio", "port";
>  			gpio-ranges =3D <&iomuxc 0 92 16>;
> +			ngpios =3D <16>;
>  		};
>=20
>  		ocotp: efuse@47510000 {


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



