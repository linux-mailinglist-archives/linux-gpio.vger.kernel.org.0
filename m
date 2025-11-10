Return-Path: <linux-gpio+bounces-28337-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8F4C49D21
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 00:58:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2B8574EF9DD
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 23:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37CC03054DE;
	Mon, 10 Nov 2025 23:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rMfnUB62"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4D6337BA6
	for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 23:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762819086; cv=none; b=ppKeSUh24oNs6Ci+c/eUowc+kcWPTjNlBhSIAKEJccmcPmwwgywfeDM6P3f03cptiyKhh/BouDHX01w3H3irtMwljbEHxNb4LvMZQ1TSpRR0ItO22NglV+4S99Q9sh8UWMK2Clh3egaEYf9yRarxzzGV5QBxZ53p5dmCbC72SzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762819086; c=relaxed/simple;
	bh=gR2t+MCFT0pENLeKE/c4frJpybxo9Ti1EMQAvfgDQGI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OABBh0Q/FXLejK0QRQhoKf03qv2Sj0hNDJc/kBZowHWnTwzz+vNR4fCq+jHRX4q0+L7r3I1k+1RWmL0XFwP0QwC+UYwPEnnosbdtwFoqmoRezwx4hl6DteoHZmpBUbqREbQJk/YIt6oHnY7VBnF9PxwAd5jGliYkN1ZRtOl6ATM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rMfnUB62; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-37a34702a20so29580801fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 15:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762819082; x=1763423882; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gR2t+MCFT0pENLeKE/c4frJpybxo9Ti1EMQAvfgDQGI=;
        b=rMfnUB62IkZBgU4Z+MwGW9CfUGrmA19YQdXxMpBNsOeSJ0mEIRcXgpji9QXC0EYyJa
         o+/Tku8BunlJT5rqpTHIDQcnC0gQ3F+JkdSrYjtxQfXoIsyhWp6/QS7GuituJLbu5Vwy
         Y2z36yLhaznblXd+6FSzx3ztBGjYUzzA+q46QqvbjDXeQi0qTzWXA3AuPHvGZXRtu8Cq
         RTZKrvyOiNDmIj/4kKFajk4V5MVhg+bkHb0LR2U8TtduyxRf1DorNvQFruPMZ/SbpwDG
         13aG9D3U2O+aC7XKZ2XKF3l80D0Wm2qCGZQQeTFm/o11lzRynFNQt5R4bLoZZjz8H5GR
         UBqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762819082; x=1763423882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gR2t+MCFT0pENLeKE/c4frJpybxo9Ti1EMQAvfgDQGI=;
        b=abuhmLO34UOaxlCWthfRGHeELXr0t6RbdX3fppU7LtB2IUBKBraRf50qisfenG5t7m
         jW/vFU6kNz//LB85EUZqYq/1I5qOVY6gDkQsJUxtWhuQ9gfGTgix1MG286OXw6L/GczU
         SMs9b/hujSOM3QEY/yhkNHXJ+BblOAXLdokGOWatkLpAj8MemP9kXs2tRBB1U0R/XOa5
         qisnqJ57Ltn6OZd2acHnQZtJyCDaqWwZFcb9etCb+94CmFN9sfq6IoMTnHsAH5ACdOCX
         A2CL9cpYNZSnSlQ31BBMy8947teilaf+pOoco4/hf3QxSBzroYzBqf5k1E/fxEzxz5bT
         P9mw==
X-Forwarded-Encrypted: i=1; AJvYcCXsOlAg0/5cqrbCVL5WVjQrMFUJZUjinyB1Tvs8/nNCKjPac/vZhUHjjjoTH+dZWbhy0J6rX0q8ozm9@vger.kernel.org
X-Gm-Message-State: AOJu0YyVWT9qsk9ns4C5TLi7lMcFmGQ2YF118ZsZ0rpuSdmJsfEm6PI1
	/CVL8LhbTtfSK6w29rVp77JuFzodiJYLlWvqxXskpl324Z59GcI7dAC9GfrTLv+N4QydGVYmu89
	FH9JspP+AuN9CpIT7hiu2flQ3ssfCNRUEyCPTpckUEQ==
X-Gm-Gg: ASbGncu0otTpcVDbMskI62bZXjAzTb4kjwaJAR1pmP/A5ZOsp7/2/2lSF071uKjiRwH
	RquDTJtktDTV3gEvSUvY4bH6l8VglRY4WFc9z9jENX3ckIQ7HaSfvWKKiK96kEYCJ4NpXr6xiA8
	ynwmk6JXqzkg4naRqnIQcecmYHNpYWIwLFcFMSpbm8Amm86PwlDlz3oNmHIkpJoqUWxFdk4KMto
	yMJ7qFWngBD9o/WnnEdsuAvzLduPJERAz9hOgnA7xelUHgsbqYiER6NOfIb/u2mvwhHj7U=
X-Google-Smtp-Source: AGHT+IGq8/YFN7hlWLIK9a4/CG12Y6T0bDy/N5/JTLofPKZElIMDZsi5lcAadM+CuswrNL2lnuY1YgL0/HzwYkg+O1w=
X-Received: by 2002:a05:6512:b03:b0:594:4a5a:346 with SMTP id
 2adb3069b0e04-5945f15bf72mr2619011e87.17.1762819081904; Mon, 10 Nov 2025
 15:58:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251107-wakeirq_support-v5-0-464e17f2c20c@oss.qualcomm.com> <20251107-wakeirq_support-v5-2-464e17f2c20c@oss.qualcomm.com>
In-Reply-To: <20251107-wakeirq_support-v5-2-464e17f2c20c@oss.qualcomm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 11 Nov 2025 00:57:50 +0100
X-Gm-Features: AWmQ_blAezbQ4rkb-Vrevk4Zgb5huFnQ0lcUTpotRRUAIJPGPB05jzXROpJ4ido
Message-ID: <CACRpkdY9HsnG=xo=swnMcVha+unmvmxR6e6Ynsj09srM_tPmWA@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] PCI: Add support for PCIe WAKE# interrupt
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-gpio@vger.kernel.org, quic_vbadigan@quicinc.com, quic_mrana@quicinc.com, 
	sherry.sun@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 7, 2025 at 10:22=E2=80=AFAM Krishna Chaitanya Chundru
<krishna.chundru@oss.qualcomm.com> wrote:

> According to the PCIe specification 6, sec 5.3.3.2, there are two defined
> wakeup mechanisms: Beacon and WAKE# for the Link wakeup mechanisms to
> provide a means of signaling the platform to re-establish power and
> reference clocks to the components within its domain. Beacon is a hardwar=
e
> mechanism invisible to software (PCIe r7.0, sec 4.2.7.8.1). Adding WAKE#
> support in PCI framework.
>
> According to the PCIe specification, multiple WAKE# signals can exist in
> a system. In configurations involving a PCIe switch, each downstream port
> (DSP) of the switch may be connected to a separate WAKE# line, allowing
> each endpoint to signal WAKE# independently. From figure 5.4, WAKE# can
> also be terminated at the switch itself. To support this, the WAKE#
> should be described in the device tree node of the endpint/bridge. If all
> endpoints share a single WAKE# line, then WAKE# should be defined in the
> each node.
>
> To support legacy devicetree in direct attach case, driver will search
> in root port node for WAKE# if the driver doesn't find in the endpoint
> node.
>
> In pci_device_add(), PCI framework will search for the WAKE# in its node,
> If not found, it searches in its upstream port only if upstream port is
> root port to support legacy bindings. Once found, register for the wake I=
RQ
> in shared mode, as the WAKE# may be shared among multiple endpoints.
>
> When the IRQ is asserted, the handle_threaded_wake_irq() handler triggers
> a pm_runtime_resume(). The PM framework ensures that the parent device is
> resumed before the child i.e controller driver which can bring back devic=
e
> state to D0.
>
> WAKE# is added in dts schema and merged based on below links.
>
> Link: https://lore.kernel.org/all/20250515090517.3506772-1-krishna.chundr=
u@oss.qualcomm.com/
> Link: https://github.com/devicetree-org/dt-schema/pull/170
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.co=
m>

The GPIO parts look all right to me, a bit complex since we can't use
devm_* stuff here, but that happens.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

