Return-Path: <linux-gpio+bounces-30907-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOF/BpxVcmkJiwAAu9opvQ
	(envelope-from <linux-gpio+bounces-30907-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 17:51:40 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9A36A589
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 17:51:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DC6A3303ABE7
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 16:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7ECD42982B;
	Thu, 22 Jan 2026 15:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="OAShtVl8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-106119.protonmail.ch (mail-106119.protonmail.ch [79.135.106.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7B63A782D;
	Thu, 22 Jan 2026 15:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769096263; cv=none; b=Lc4pm3+6oVt6jWjZLaTpKfHSCGLTFfSsfocUdCjPV9T2NwLmjJqDhf4mM368MsrJQumgU5QeJRXe2m0xBKXMJ0BETg9wykBev5euUbcDZHoefcISw6sH1vkCnO9UKCeOI1KkIQUBKSkjly6Jc8zwMboOPPYUnVBt5K/cUZGTBEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769096263; c=relaxed/simple;
	bh=S1BGqcMlASMvyYCKXlGf55t9i2UcSbu9BGB4Vbxmsjw=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZQzsXDzaZI6ydqpvUHpNqFHScoVX4Zkw2JlKlSyDi92h7Rgmsx98oZdgEfSPhMF6/epMbuXBV1VkkH3mDqjVqvmYX+nIMjKDc39XBftbk2GzWbFVLnP/tmgKVxPBNES/kULs2N+jzswT9wBrDlPxIhxRuKl2QS+Q6w4NsYiOQj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=OAShtVl8; arc=none smtp.client-ip=79.135.106.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1769096249; x=1769355449;
	bh=S1BGqcMlASMvyYCKXlGf55t9i2UcSbu9BGB4Vbxmsjw=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=OAShtVl8spr+0GUWWivMvpCjCyV4nt7net/RqiDocSoRyc2xGILA5VY3XkzJCj5rN
	 JBlHlnEg7Vc+q+W2pH00Kt/XkXvx/kl4CFvgkIuexUOB6S+hdAhnsISrVfJP6hEtXc
	 cgoRwCNiDa59Pd7yCtj6KSqs5XR3JzrS7A46BRv7KCBCveSUeD4L3A2c8WwOTkWaq1
	 X/9mfBKXG/p5ecgX44tQSC0rOp26QPaFpXV84SRN1WShlnz70Tz4swAIkbTukIVFhT
	 OrDavFueoypp77UwkvbkXzUtgk4i8ug1Z6o3wQwrbCWhC8SJ5yFWNUintGE7vIWboE
	 791SQUjO/0mZg==
Date: Thu, 22 Jan 2026 15:37:23 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Arturs Artamonovs <arturs.artamonovs@protonmail.com>
Cc: arturs.artamonovs@analog.com, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Greg Malysa <greg.malysa@timesys.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Utsav Agarwal <Utsav.Agarwal@analog.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>, Andi Shyti <andi.shyti@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, soc@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org, adsp-linux@analog.com, Nathan Barrett-Morrison
	<nathan.morrison@timesys.com>
Subject: Re: [PATCH 00/21] Adding support of ADI ARMv8 ADSP-SC598 SoC.
Message-ID: <D29814F7-69C2-4C64-AF05-87AE6019DE21@protonmail.com>
Feedback-ID: 15175799:user:proton
X-Pm-Message-ID: 645533fd368795d784bccb039ef9deb7ee99176c
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	FAKE_REPLY(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[protonmail.com,quarantine];
	R_DKIM_ALLOW(-0.20)[protonmail.com:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[protonmail.com];
	RCPT_COUNT_TWELVE(0.00)[30];
	TAGGED_FROM(0.00)[bounces-30907-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[protonmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arturs.artamonovs@protonmail.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[analog.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:url,protonmail.com:mid,protonmail.com:dkim]
X-Rspamd-Queue-Id: 9B9A36A589
X-Rspamd-Action: no action

Hi, big thanks to Krysztof, Arnd, Rob and Linus Walleij for the reviewing f=
irst set of patches that were sent some time ago. I have reviewed comments =
few times since then and Im currently at last stage of internal review for =
v2 series those are planned to be sent sometime in near future.=20

> On 16 Sep 2024, at 10:05, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>=20
> On 12/09/2024 20:24, Arturs Artamonovs via B4 Relay wrote:
>> This set of patches based on ADI fork of Linux Kerenl that support famil=
y of ADSP-SC5xx
>> SoC's and used by customers for some time . Patch series contains minima=
l set
>> of changes to add ADSP-SC598 support to upstream kernel. This series inc=
lude
>> UART,I2C,IRQCHIP,RCU drivers and device-tree to be able boot on EV-SC598=
-SOM
>> board into serial shell and able to reset the board. Current SOM board
>> requires I2C expander to enable UART output.
>>=20
>> UART,I2C and PINCTRL drivers are based on old Blackfin drivers with
>> ADSP-SC5xx related bug fixes and improvments.
>>=20
>> Signed-off-by: Arturs Artamonovs <arturs.artamonovs@analog.com>
>> ---
>=20
> For new platform, be sure you have 0 warnings:
> 1. Please run standard kernel tools for static analysis, like
> coccinelle, smatch and sparse, and fix reported warnings.
>=20
> 2. Also check for warnings when building with W=3D1. Most of these
> commands (checks or W=3D1 build) can build specific targets, like some
> directory, to narrow the scope to only your code. The code here looks
> like it needs a fix. Feel free to get in touch if the warning is not clea=
r.
>=20
> 3. Fix all compile test warning reported by LKP and check for common
> configs, regardless of reports.
>=20
> 4. Please run `make dtbs_check W=3D1` (see
> Documentation/devicetree/bindings/writing-schema.rst or
> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sou=
rces-with-the-devicetree-schema/
> for instructions).
>=20
> 5. Please run scripts/checkpatch.pl and fix reported warnings. Then
> please run `scripts/checkpatch.pl --strict` and (probably) fix more
> warnings. Some warnings can be ignored, especially from --strict run.
>=20
>=20
> Best regards,
> Krzysztof
>=20
>=20



