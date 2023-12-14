Return-Path: <linux-gpio+bounces-1503-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 558C58137DB
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 18:13:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10FA7283227
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 17:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E762C65EAB;
	Thu, 14 Dec 2023 17:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="ZKW4NG7C"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A67D11A;
	Thu, 14 Dec 2023 09:13:10 -0800 (PST)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3BEFknrP009412;
	Thu, 14 Dec 2023 18:12:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	message-id:subject:from:to:cc:date:in-reply-to:references
	:content-type:content-transfer-encoding:mime-version; s=
	selector1; bh=K1A/PPNJBGqkruf8X8nVhc1/sg7nXB8ln3XDnZhh2B0=; b=ZK
	W4NG7CAR9E7mB1Zc39RfsI5XhrgZoMHpLE7ZXNd77c5lcOREZ4zZ2DKxSsROHzpI
	+YIbCIII20Mykc6BhTIGKen698cnupimeGgMTbk1I+VgJoK9cNxf8xB9t8vtVafR
	v5AuyNrzQXkuekspHya2StNpF4iuVUwzRiMD7nHuJuuNTqUa/ugNh6q99Gq4dsQ8
	v77W3S8JtmZFkZSHlzn4L6HLdJgg9W2gZhrsNEGZe0wbjr2uz6jZOf392vppDF6m
	Pypc0dtyWJ01kMqwD3Hsjs3znulEfJbockN/eehlpuC6woFe1qEB7fTTlWOILX9G
	cph3ctGHoWMgC1yCnS+w==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3uvgf1xash-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Dec 2023 18:12:49 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 17E2F100053;
	Thu, 14 Dec 2023 18:12:49 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0E8252291A9;
	Thu, 14 Dec 2023 18:12:49 +0100 (CET)
Received: from [192.168.8.15] (10.201.20.114) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 14 Dec
 2023 18:12:48 +0100
Message-ID: <72700f397d32f6a81164aafbf6f9d30b510672cf.camel@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH 2/2] pinctrl: stm32: fix GPIO level
 interrupts
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Ben Wolsieffer <ben.wolsieffer@hefring.com>
CC: Thomas Gleixner <tglx@linutronix.de>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-gpio@vger.kernel.org>
Date: Thu, 14 Dec 2023 18:12:46 +0100
In-Reply-To: <20231204203357.2897008-3-ben.wolsieffer@hefring.com>
References: <20231204203357.2897008-1-ben.wolsieffer@hefring.com>
	 <20231204203357.2897008-3-ben.wolsieffer@hefring.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.3 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-14_11,2023-12-14_01,2023-05-22_02

On Mon, 2023-12-04 at 15:33 -0500, Ben Wolsieffer wrote:
> The STM32 doesn't support GPIO level interrupts in hardware, so the
> driver tries to emulate them using edge interrupts, by retriggering the
> interrupt if necessary based on the pin state after the handler
> finishes.
>=20
> Currently, this functionality does not work because the irqchip uses
> handle_edge_irq(), which doesn't run the irq_eoi() or irq_unmask()
> callbacks after handling the interrupt. This patch fixes this by using
> handle_level_irq() for level interrupts, which causes irq_unmask() to be
> called to retrigger the interrupt.
>=20
> Signed-off-by: Ben Wolsieffer <ben.wolsieffer@hefring.com>
> ---
> =C2=A0drivers/pinctrl/stm32/pinctrl-stm32.c | 3 +++
> =C2=A01 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm3=
2/pinctrl-stm32.c
> index 603f900e88c1..fb9532601cbb 100644
> --- a/drivers/pinctrl/stm32/pinctrl-stm32.c
> +++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
> @@ -348,12 +348,15 @@ static int stm32_gpio_set_type(struct irq_data *d, =
unsigned int type)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case IRQ_TYPE_EDGE_RISING=
:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case IRQ_TYPE_EDGE_FALLIN=
G:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case IRQ_TYPE_EDGE_BOTH:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0irq_set_handler_locked(d, handle_edge_irq);

Hi,
this patch causes a NULL pointer dereference and crashes the kernel boot on=
 STM32 MPU's,
either STM32MP13x, STM32MP15x and the new STM32MP25x.

Please do not merge it as is.

This pinctrl-stm32 driver is shared between STM32 MCUs and MPUs.
In both cases the EXTI is the parent interrupt controller of this pinctrl, =
but despite
the fact that there is a single file irq-stm32-exti.c, it contains two inde=
pendent
drivers, one for MCUs and the other for MPUs.
Swapping in this function the irq_desc::handle_irq between handle_edge_irq(=
) and
handle_level_irq() is probably fine for MCU (I have not tested it).
But on MPUs the default handler is handle_fasteoi_irq(); should not be chan=
ged here.

Checking quickly ... this function calls irq_chip_set_type_parent() at the =
very end.
It will in turn call EXTI's irq_set_type(), which has different implementat=
ions for MCU
and MPU.
By moving this handler swap in the MCU specific stm32_irq_set_type() it wil=
l not impact
MPUs.

Best Regards,
Antonio


> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0parent_type =3D type;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0break;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case IRQ_TYPE_LEVEL_HIGH:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0irq_set_handler_locked(d, handle_level_irq);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0parent_type =3D IRQ_TYPE_EDGE_RISING;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0break;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case IRQ_TYPE_LEVEL_LOW:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0irq_set_handler_locked(d, handle_level_irq);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0parent_type =3D IRQ_TYPE_EDGE_FALLING;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0break;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0default:


