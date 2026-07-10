Return-Path: <linux-gpio+bounces-39833-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id toaJDI0IUWoh+QIAu9opvQ
	(envelope-from <linux-gpio+bounces-39833-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 16:58:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9D073BFF5
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 16:58:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=icenowy.me header.s=zmail2 header.b=m40ImWUg;
	dmarc=pass (policy=none) header.from=icenowy.me;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39833-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39833-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0977A304BB43
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 14:57:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E38F6404BCF;
	Fri, 10 Jul 2026 14:57:04 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBD93F411A;
	Fri, 10 Jul 2026 14:57:02 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783695424; cv=pass; b=k+xhgfX7CdQZFL0K94UYycZVOXfT1TOHgo+RyhPiBEHl/JmaFCeqvLeB6eLDW3sAFrBVtMZh4Jjrr8M92q9bYAmuJear/Z5dMwQcDd2xnADo00Z8NhRsXF406wc3P9FjnRz3hE/UdncGER/i6JufHDCpyhC4m73E97qEMoMCPPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783695424; c=relaxed/simple;
	bh=TwqRt93NLpM0edhLSPUb/caZPdXOiIYc96gS/uk8cvc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WQoBTWqcdLOnoycnczCrtDEH5ahCugh1JysAaaj4kRHuaQu2U7BV8I3MHXu1IGbLKb4ZiWZ2bF/uXWqNtCnkcip4587PJKJMmfQTZLvnxuO7B5E0uC6dmMwgPktUFR4O9eDxkQc2p0PZ65NCJMjM509jMuEEbgscocDI53clJHM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me; spf=pass smtp.mailfrom=icenowy.me; dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b=m40ImWUg; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal: i=1; a=rsa-sha256; t=1783695392; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ml+DhCpPf45Z/4qAMFDX1inJx4ll4cpAPqHX1XAOkFYrT3SBF+2X1xNUUPJLWRvizcJMZUrNGm2F2YGl/aoMJOcZge7IU26m8GPDfrDoTX1hgMCr9GVbSyGzS3xCtLP82LHD9t/b5hDYAYnC6hvjNE5xA5DCn5XmRu1NlOpUyoY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1783695392; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=zLiGYp9m/wGqSY8bb0fHrZAj5ElYrLF6yiGUlfJ+qMQ=; 
	b=M0Eg0nQ4cf9rVWSHsT/sNKKmgpk+zGv+qg8eJwb/b/K4Yr3DkpJx054fB1YayRO8z7wd/DQCiNNHDwc04nIUI9x1nvK1zCDeBO2py7aQ6gcgNnqFwzGKcc9jJrPexN5jFSUJFX/nqh4BdiG2OY5ZzByJNj1JuO/PBfQCP/jeBKM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783695392;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=zLiGYp9m/wGqSY8bb0fHrZAj5ElYrLF6yiGUlfJ+qMQ=;
	b=m40ImWUgrfvL+/QoCcMwwJ+Pgtlgx9LtjVk4mi7IQhGrkVavVKfwHBbkFtCEx2Ud
	+Jdk0QkYo/qTGfUPcl+d6JuSfpcDp72ihGQWc7IVQYiTZ95yqP5DnbTyciiYdtZIxwe
	cjQ1Spgu6g5lMsaqJlYOfs2B4CeqjFV5DOubRgrKMfxnPiK0zfeMgD1E0Z97vZDUw7I
	jPp0Cn42fZt04GrRKzr1h2Qffkvw3f0SejtLcHYPSzl+H0xkk86YquVYa8bd3aWB65A
	/1oZJabrJh9qMJ/g19xZ/RYhSbc2UJt7EgHL1rU7HbhFnUEv0mIE30v3O3f8IByUtyc
	foDq8sKiIw==
Received: by mx.zohomail.com with SMTPS id 1783695388721436.80504654321703;
	Fri, 10 Jul 2026 07:56:28 -0700 (PDT)
Message-ID: <b8fc8356212012d92186a1a4cd3ad641f01461a6.camel@icenowy.me>
Subject: Re: [PATCH 11/12] riscv: dts: thead: Add Lichee Pi 4A IO expansions
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei	
 <wefu@redhat.com>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd	 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Vinod
 Koul	 <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Jisheng Zhang <jszhang@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org,
 	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-usb@vger.kernel.org, Han Gao	
 <rabenda.cn@gmail.com>, Yao Zi <ziyao@disroot.org>, Emil Renner Berthing	
 <emil.renner.berthing@canonical.com>
Date: Fri, 10 Jul 2026 22:56:08 +0800
In-Reply-To: <20260507081710.4090814-12-zhengxingda@iscas.ac.cn>
References: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
	 <20260507081710.4090814-12-zhengxingda@iscas.ac.cn>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[icenowy.me,none];
	R_DKIM_ALLOW(-0.20)[icenowy.me:s=zmail2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39833-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[uwu@icenowy.me,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_RECIPIENTS(0.00)[m:fustini@kernel.org,m:guoren@kernel.org,m:wefu@redhat.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:gregkh@linuxfoundation.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:jszhang@kernel.org,m:p.zabel@pengutronix.de,m:linux-riscv@lists.infradead.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-usb@vger.kernel.org,m:rabenda.cn@gmail.com,m:ziyao@disroot.org,m:emil.renner.berthing@canonical.com,m:krzk@kernel.org,m:conor@kernel.org,m:rabendacn@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[pengutronix.de,lists.infradead.org,vger.kernel.org,gmail.com,disroot.org,canonical.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[uwu@icenowy.me,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[icenowy.me:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:email,icenowy.me:from_mime,icenowy.me:dkim,icenowy.me:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9A9D073BFF5

=E5=9C=A8 2026-05-07=E5=9B=9B=E7=9A=84 16:17 +0800=EF=BC=8CIcenowy Zheng=E5=
=86=99=E9=81=93=EF=BC=9A
> From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
>=20
> Lichee Pi 4A has 3 I2C IO expansion chips onboard, connected to the
> I2C0/1/3 busses.
>=20
> Add device tree nodes for them.
>=20
> Signed-off-by: Emil Renner Berthing
> <emil.renner.berthing@canonical.com>
> [Icenowy: added commit description]
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>

I am going to send a newer revision of PATCH 9~11 in a few days,
because the I2C1 controller is already added to the mainline device
tree for Wi-Fi support, although the already-merged patches are a
little weird.

Thanks,
Icenowy

> ---
> =C2=A0.../boot/dts/thead/th1520-lichee-pi-4a.dts=C2=A0=C2=A0=C2=A0 | 111
> ++++++++++++++++++
> =C2=A01 file changed, 111 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
> b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
> index 4198dbf953f06..354f3893aa8cf 100644
> --- a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
> +++ b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
> @@ -16,6 +16,9 @@ aliases {
> =C2=A0		gpio3 =3D &gpio3;
> =C2=A0		gpio4 =3D &gpio4;
> =C2=A0		gpio5 =3D &aogpio;
> +		i2c0 =3D &i2c0;
> +		i2c1 =3D &i2c1;
> +		i2c3 =3D &i2c3;
> =C2=A0		serial0 =3D &uart0;
> =C2=A0		serial1 =3D &uart1;
> =C2=A0		serial2 =3D &uart2;
> @@ -110,6 +113,76 @@ hdmi_out_con: endpoint {
> =C2=A0	};
> =C2=A0};
> =C2=A0
> +&i2c0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&i2c0_pins>;
> +	clock-frequency =3D <100000>;
> +	i2c-sda-hold-time-ns =3D <300>;
> +	i2c-sda-falling-time-ns =3D <510>;
> +	i2c-scl-falling-time-ns =3D <510>;
> +	status =3D "okay";
> +
> +	ioexp1: gpio@18 {
> +		compatible =3D "nxp,pca9557";
> +		reg =3D <0x18>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +		gpio-line-names =3D "cam0_dvdd12",
> +				=C2=A0 "cam0_avdd28",
> +				=C2=A0 "cam0_dovdd18";
> +	};
> +};
> +
> +&i2c1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&i2c1_pins>;
> +	clock-frequency =3D <100000>;
> +	i2c-sda-hold-time-ns =3D <300>;
> +	i2c-sda-falling-time-ns =3D <510>;
> +	i2c-scl-falling-time-ns =3D <510>;
> +	status =3D "okay";
> +
> +	ioexp2: gpio@18 {
> +		compatible =3D "nxp,pca9557";
> +		reg =3D <0x18>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +		gpio-line-names =3D "",
> +				=C2=A0 "cam0_reset",
> +				=C2=A0 "cam1_reset",
> +				=C2=A0 "cam2_reset",
> +				=C2=A0 "wl_host_wake",
> +				=C2=A0 "bt_resetn",
> +				=C2=A0 "",
> +				=C2=A0 "bt_host_wake";
> +	};
> +};
> +
> +&i2c3 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&i2c3_pins>;
> +	clock-frequency =3D <100000>;
> +	i2c-sda-hold-time-ns =3D <300>;
> +	i2c-sda-falling-time-ns =3D <510>;
> +	i2c-scl-falling-time-ns =3D <510>;
> +	status =3D "okay";
> +
> +	ioexp3: gpio@18 {
> +		compatible =3D "nxp,pca9557";
> +		reg =3D <0x18>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +		gpio-line-names =3D "tp0_rst",
> +				=C2=A0 "",
> +				=C2=A0 "",
> +				=C2=A0 "vcc5v_usb",
> +				=C2=A0 "vdd28_tp0",
> +				=C2=A0 "vdd33_lcd0",
> +				=C2=A0 "vdd18_lcd0",
> +				=C2=A0 "lcd0_reset";
> +	};
> +};
> +
> =C2=A0&padctrl0_apsys {
> =C2=A0	fan_pins: fan-0 {
> =C2=A0		pwm1-pins {
> @@ -123,6 +196,18 @@ pwm1-pins {
> =C2=A0		};
> =C2=A0	};
> =C2=A0
> +	i2c3_pins: i2c3-0 {
> +		i2c-pins {
> +			pins =3D "I2C3_SCL", "I2C3_SDA";
> +			function =3D "i2c";
> +			bias-disable; /* external pull-up */
> +			drive-strength =3D <7>;
> +			input-enable;
> +			input-schmitt-enable;
> +			slew-rate =3D <0>;
> +		};
> +	};
> +
> =C2=A0	uart0_pins: uart0-0 {
> =C2=A0		tx-pins {
> =C2=A0			pins =3D "UART0_TXD";
> @@ -146,6 +231,32 @@ rx-pins {
> =C2=A0	};
> =C2=A0};
> =C2=A0
> +&padctrl1_apsys {
> +	i2c0_pins: i2c0-0 {
> +		i2c-pins {
> +			pins =3D "I2C0_SCL", "I2C0_SDA";
> +			function =3D "i2c";
> +			bias-disable; /* external pull-up */
> +			drive-strength =3D <7>;
> +			input-enable;
> +			input-schmitt-enable;
> +			slew-rate =3D <0>;
> +		};
> +	};
> +
> +	i2c1_pins: i2c1-0 {
> +		i2c-pins {
> +			pins =3D "I2C1_SCL", "I2C1_SDA";
> +			function =3D "i2c";
> +			bias-disable; /* external pull-up */
> +			drive-strength =3D <7>;
> +			input-enable;
> +			input-schmitt-enable;
> +			slew-rate =3D <0>;
> +		};
> +	};
> +};
> +
> =C2=A0&uart0 {
> =C2=A0	pinctrl-names =3D "default";
> =C2=A0	pinctrl-0 =3D <&uart0_pins>;

