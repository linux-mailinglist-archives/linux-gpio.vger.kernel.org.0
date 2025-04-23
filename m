Return-Path: <linux-gpio+bounces-19204-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7377DA985FD
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 11:43:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 883344439BF
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 09:43:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6316726D4F6;
	Wed, 23 Apr 2025 09:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b="c4PAb5qL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205BD2566DF;
	Wed, 23 Apr 2025 09:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745401290; cv=pass; b=JNgg02FoQY+HbdtAe2HrlRDI2NHAdxiE0/Rd5wopWLPinSn6TXP6YlAulZgf6QdVTu7d2WbpL1KEKlK1euvqYycpfyxdQXw5cLmbs7i+QO78WMx6xzdTdE8OrCC2KsdT2pnWH89X4HkBEooKwZ7nEZRk0g95RYKbaxn0cE0dzww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745401290; c=relaxed/simple;
	bh=QDHDEuyljbJolfRYa6VdWA2fhf9lKyKVCtDK3RLTvtA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=UXUkqJIOIZWsE8CbdqnukhFBfqznbRtkjkkvQPkIFAKiC/dfuxMiYCGdWbqNmZeXasQFCJ9aKhp+TNNuwOhRpww2yumb7R11vOX9RtdHOQf6uQ88gLS8gS4sU0KT0V/e7YJdWNU+WMm1j4SJoYcwjy1S4yocHcTF0RDgVzGgYzY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me; spf=pass smtp.mailfrom=icenowy.me; dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b=c4PAb5qL; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
ARC-Seal: i=1; a=rsa-sha256; t=1745401270; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=C8o3k/MNKgokhJ/HASLGbQyUh60PC5Hw29hzZ6sHRk/lH7QXyZNAVNpD0SoeEzIMmTEMQuSvSns7SvYqpjM4vh+N50kM6AZ5NYRR5GqcEeP730gjqcbem1sqCfV42Tq3EjMpfDSHEMsKVIxElXzX4L4BdtqdQYqANNWEIZ1jgOA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745401270; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wW5kFrJgTitCYAlrW6MnWYT7C3pZ0s7BzoECLOXQLSA=; 
	b=SG3BFC0J28ZjJf7+QjDGQbeBOVQx6dwrDWsCHFj+fvZWR7lJQmE6lUaViF+aglBb44CC2FJfIuFaEF1XVh6SLOwkM1UDJbLvR9aam+wKbPh9yaWhZvabVW6i/0nwN01yGveJfqvAx6ucTUyxzapT55FzfNzjLZloH6v7Y5OjLdo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745401270;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Date:Date:From:From:To:To:CC:Subject:Subject:In-Reply-To:References:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=wW5kFrJgTitCYAlrW6MnWYT7C3pZ0s7BzoECLOXQLSA=;
	b=c4PAb5qLq55mEXHWomaV1Q59jzLSiqxwbV2fhuJg34/Ed/heUYX6CPJgAiIGfTt+
	K2m4msbW83z4vlykFpteoTMQgjxeWSIfhJI8itB0TXbWxtQaAFzzteUammVeTiZKNrm
	hx0ejHOMLndNiXDYeNNYQWw2plDKi+pJ5qYWDSLQAjbkUDFSZo2ucfo6iy6NL4v5YSp
	yZO1o7yLAKjU8iF0NmUhEPeHSTIQsSrgvPDXs/asgroohBv2gnwZJ85FLJk8AE5CqbY
	1bUtIWLhD14KJ6zR5xElbiK1hlMyRIAmfbemnjxJEnjtsejXuRfxNg+SPmQ9r0o+qPj
	0oo687eECg==
Received: by mx.zohomail.com with SMTPS id 1745401267041866.6059217283805;
	Wed, 23 Apr 2025 02:41:07 -0700 (PDT)
Date: Wed, 23 Apr 2025 17:40:58 +0800
From: Icenowy Zheng <uwu@icenowy.me>
To: Linus Walleij <linus.walleij@linaro.org>
CC: Emil Renner Berthing <kernel@esmil.dk>,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 Hal Feng <hal.feng@starfivetech.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: =?US-ASCII?Q?Re=3A_=5BRFC_PATCH_1/3=5D_dt-bindings=3A_pi?=
 =?US-ASCII?Q?nctrl=3A_jh7110-sys=3A_add_force_inputs?=
User-Agent: K-9 Mail for Android
In-Reply-To: <CACRpkdbGwPyQgVL18iMvUTAvh4XTjo6g3mGT4e_b2aNAjr2obg@mail.gmail.com>
References: <20250422162250.436169-1-uwu@icenowy.me> <20250422162250.436169-2-uwu@icenowy.me> <CACRpkdbGwPyQgVL18iMvUTAvh4XTjo6g3mGT4e_b2aNAjr2obg@mail.gmail.com>
Message-ID: <B4C8B369-E345-4133-A106-7C5E71513329@icenowy.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External



=E4=BA=8E 2025=E5=B9=B44=E6=9C=8823=E6=97=A5 GMT+08:00 17:09:42=EF=BC=8CLi=
nus Walleij <linus=2Ewalleij@linaro=2Eorg> =E5=86=99=E9=81=93=EF=BC=9A
>Hi Icenowy,
>
>thanks for your patch!
>
>On Tue, Apr 22, 2025 at 6:23=E2=80=AFPM Icenowy Zheng <uwu@icenowy=2Eme> =
wrote:
>
>> +  starfive,force-low-inputs:
>> +    description:
>> +      The list of input signals forced to be low inside the SoC itself=
=2E
>> +    $ref: /schemas/types=2Eyaml#/definitions/uint32-array
>
>I don't see why you need this hack=2E

Unfortunately these properties are not for pins, but internal signals that=
 isn't
bound to external pins=2E

>
>Use the existing per-pin output-low property (see
>Documentation/devicetree/bindings/pinctrl/pincfg-node=2Eyaml)=2E
>
>> +  starfive,force-high-inputs:
>> +    description:
>> +      The list of input signals forced to be high inside the SoC itsel=
f=2E
>> +    $ref: /schemas/types=2Eyaml#/definitions/uint32-array
>
>Use the existing output-high property=2E
>
>Now I *know* these two properties are per-pin=2E That is more talkative
>but way easier for users to read=2E
>
>Then use pincontrol hogs to make sure these configs are set up
>at probe=2E
>
>Yours,
>Linus Walleij

