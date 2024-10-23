Return-Path: <linux-gpio+bounces-11836-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E43A9AC284
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 11:00:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D98DD1F22E2B
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 09:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DB1A19ABD8;
	Wed, 23 Oct 2024 09:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Ts5wCi4U"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFF4199E9A;
	Wed, 23 Oct 2024 09:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729674004; cv=none; b=qoMBL4jVb2rZ9IJPONn1NFRXxeVnVhDzoTCFmEFvS7FEMMvDut3PLLTJ0SAUJpXzK062aByU4o/LTLywo+15onH859qpEhFhESdlFknqY2+SHQwP2Re5jAoEl7ko3tWVIW5raxf4dH3a8oZ/qV8XFN+rAU5tsaN9aSIliGKKmQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729674004; c=relaxed/simple;
	bh=u4oK+ppGTcU7dSjV7y+6H5nQdcyYAsUQKkYiXnnfEy8=;
	h=Message-ID:Subject:From:To:CC:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M7JuDayY9WfdctPDqy/fn423ev6K8MjukT7cB6EFh355C1Bsda0jUMtKK8LGsvRBwh8Sm5/OYawNYi7+AKKoPPZS7D1lvyg+c+jKYIeLDBfq5qPGH3fzMsWgsBrRkrbecC+u0oFjVuFgYscsmvQHd2c/G17qiYCZV/lB4TX5iIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Ts5wCi4U; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49N81V6Z032518;
	Wed, 23 Oct 2024 10:59:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	u4oK+ppGTcU7dSjV7y+6H5nQdcyYAsUQKkYiXnnfEy8=; b=Ts5wCi4Us1LuKr7x
	FkhxMlBejRiyra2bjKbcFaK2my+Zey3E/JKpZ3atkMlSgXh2EQe63v157zg5bBTp
	dfaJGvqueS7uZmhDxmD4rd+KQNI+9vwR9HOmuYcmQ7+/gEtEup9UUf/gQijF+Yn7
	SpXznbRHmfbviY4XW0YZg2uZr0DWZYhZHAwqLhtl0HFbztYaqwae3b9T4/hpiVsj
	O9+rklX+4/6JxFB9CwtW7RIoDJ4G+YOFp9kfUke5JceL3eIF0V+tNIjb0E2xVKa8
	MIXD6lG5mj1+I2WrjtFEivHGEkACFhMNw5fRtMwKhaIAcrX3OAbUL4/qA4TIJp9R
	RU/Jgw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42em4a2abc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 10:59:39 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 355724002D;
	Wed, 23 Oct 2024 10:58:30 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 29FBE265534;
	Wed, 23 Oct 2024 10:57:00 +0200 (CEST)
Received: from [192.168.8.15] (10.48.87.33) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 23 Oct
 2024 10:56:59 +0200
Message-ID: <680f3e0b7458015d5b909200342a623eb55f907d.camel@foss.st.com>
Subject: Re: [PATCH 04/14] dt-bindings: pinctrl: stm32: add RSVD mux function
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        =?ISO-8859-1?Q?Cl=E9ment?= Le Goffic
	<clement.legoffic@foss.st.com>,
        Stephane Danieau
	<stephane.danieau@foss.st.com>,
        Amelie Delaunay
	<amelie.delaunay@foss.st.com>,
        Fabien Dessenne <fabien.dessenne@foss.st.com>,
        Valentin Caron <valentin.caron@foss.st.com>,
        Gatien Chevallier
	<gatien.chevallier@foss.st.com>,
        Cheick Traore <cheick.traore@foss.st.com>,
        <linux-stm32@st-md-mailman.stormreply.com>
Date: Wed, 23 Oct 2024 10:56:57 +0200
In-Reply-To: <swbppwzpavktjpyb6piayzzht6ta75w3g36oyndmim54oztar5@svb4452yob7g>
References: <20241022155658.1647350-1-antonio.borneo@foss.st.com>
	 <20241022155658.1647350-5-antonio.borneo@foss.st.com>
	 <swbppwzpavktjpyb6piayzzht6ta75w3g36oyndmim54oztar5@svb4452yob7g>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

On Wed, 2024-10-23 at 10:47 +0200, Krzysztof Kozlowski wrote:
> On Tue, Oct 22, 2024 at 05:56:48PM +0200, Antonio Borneo wrote:
> > From: Fabien Dessenne <fabien.dessenne@foss.st.com>
> >=20
> > Document the RSVD (Reserved) mux function, used to reserve pins
> > for a coprocessor not running Linux.
> >=20
> > Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
> > Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
> > ---
> > =C2=A0.../devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml=C2=A0=C2=A0=
=C2=A0=C2=A0 | 8 ++++++++
> > =C2=A0include/dt-bindings/pinctrl/stm32-pinfunc.h=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> > =C2=A02 files changed, 9 insertions(+)
> >=20
>=20
> BTW, which *existing* SoCs use it? Aren't you adding it for the new
> platform?
>=20

This is already used in ST downstream kernel for STM32MP15x
In this example
https://github.com/STMicroelectronics/linux/blob/v6.1-stm32mp/arch/arm/boot=
/dts/stm32mp157f-dk2-m4-examples.dts#L112

the GPIOs for LED and for PWM are assigned to the Cortex-M4 and Linux (on C=
ortex-A7) is not supposed to touch them.

Regards,
Antonio



