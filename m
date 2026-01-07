Return-Path: <linux-gpio+bounces-30222-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A5DCFE188
	for <lists+linux-gpio@lfdr.de>; Wed, 07 Jan 2026 14:55:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 67CCF3050195
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Jan 2026 13:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08AAC329C70;
	Wed,  7 Jan 2026 13:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JQTCSVDg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B626C322B75
	for <linux-gpio@vger.kernel.org>; Wed,  7 Jan 2026 13:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767793555; cv=none; b=D5CO492CHfjYkLUpn14lCMR3y7f/NA2KjruvLsmwUIa3AhwX9k0AvgXR+n9YNL8Iz4jHPzNCgVYZKObE6jMFkaBXBN/Vyrb0331YgoHowg4AKlj/Pzf4gmAjTy8RVhIad8iOnvNWrBieMe6x1EDvRx+eqUKANZn0NBiyLZTXUy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767793555; c=relaxed/simple;
	bh=Mo5zQFUvZgfbiFA5jz8xgr54ypO2nOCMgs6MX83smjw=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=UQ7YEjAegV1bNd3elbiy7Zw0mSpdv5ujTgf6SJfSHvIIZczjAW/BVtoip3zUVVj9mJ4OYFIph1VolFq8dyvkHbmZlzYN5e0HlU5+gQsX00p+gKf1DtCKqKM5JbKoymZtt9khVs0GelmY9itN9P+QjXPcp8tf1vN3p2k+lpxXXIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JQTCSVDg; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-59b6f267721so782033e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 07 Jan 2026 05:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767793546; x=1768398346; darn=vger.kernel.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=zbg60yhotFqS4lYQ4SPbRRNfljX1PZuvfnI5dpwkZJ8=;
        b=JQTCSVDgtatkBFRNvr4BBUEVN/fPmYFca9a7gH1f4cdl98ymQ/RvuUbbXlIFbGpKvO
         qed+KYFdgPvLtqSevr61usZx4cUgrlZLbQQEw6dSkQznr1oJZW6yyY/9swM4ukDNbRI/
         x7VrNAWqwUqGgqWZcxbDm6LrmJlgMyH+3Mi8I4PasJKfDbp0a+cA3L4ltS/q/6bBq44l
         ha+od8yY814+GO3yyZd+MoIzApfeSZS9ktHX5F+q1rRRGD/Bx7+gJyhGn4cakrlj1UlQ
         ZkEzZaDTadm68WfK6wOOIJ7rgYX6PZgDVPKvL8UsEC2srAXjXW89lKlBHQg2xVNPKF4E
         AZNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767793546; x=1768398346;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zbg60yhotFqS4lYQ4SPbRRNfljX1PZuvfnI5dpwkZJ8=;
        b=eWWxzi3H/gTLrNRfkKj6t6N397RMu+/V1GDWKSS1n9VvuF5AKUeZmsHPLb6ZlWN0RM
         NOblXDMwVSzPIFVbUBgRKIPpYzPqJ4UvFQdzwbURpGzlJyyNJRVfVott82fNwnpcGCYE
         ZMfsxCi6/viVlE2eD5rUbfzRdj60T27D1m19K3HDrfT0fODNGwznJBdiP9qAxa418Eqc
         q37QPaK2ONB7PmEp6ltv7Y9H6RDJyMzflZsXq0ZiagnnF6B8Zxu7JLea1HPE7WzwDS+d
         jAUOXeft7KvANx7s5DSiHQT/2lXfMWHzSDUKEPTB2U+v6dTguvEchLhEpzb6hWiXuva3
         t+mQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7BIh4tkVhj1Zf5ln7+GXskRBVi8NRFUtII+CaQXYkCzpbexVR3S+9nUX7nRSfdjCDArJmouZsQmMD@vger.kernel.org
X-Gm-Message-State: AOJu0YzgjOnDsT5UOtGOQxXWN3YUkl5vt8DqhfnjSKp69n0DpiRDbqQ9
	ozR7ccyO00CzUFZXCOz5K7E6Sb/RxVWr+GeRPk9wM9oyENN95OPz8+EYDHfHe8H7
X-Gm-Gg: AY/fxX4qDhwVbnvPRs8k+sieLYqHZovKTeF5ykEyBxwuw4NkM+F3mD3IJtvuUCC79Lv
	vsN2AA6m/M1KOI1LBkTyJKyKgMXoHlj86TkGK990j3lcGb85WDPEHxvJTNqe1H8dDY9Wk7IWpSF
	Wc1Wmu8S8lmTUNYn4hhNnyk4+yhw19aUtpXcZzNqHdfUSzqiZiRXXVco79zZ7ESW+R4wipNVW+U
	OYeeURwjvKzNMTOO3C4ggDtVhzcXwbBr/R8I95XBOINfW/geWxJ8U2eA1QA/2zhVFarDep0qQ+d
	XTXEgYiEFn4c1OuHCDe4HgfNgJZk5hv/5myiJWBVsWEYOE6nSeBkUrQofTaHPW4TWERpN4Ob/kE
	E8ZmWH8c7c+QeNe9tIcbYB03iZV1rqdEgqYH50ys3MF0Ti5zEPb/6cdj47LuU0Um6BqFzzhbj
X-Google-Smtp-Source: AGHT+IFBvFdbxlKvEOgpHQQ8YktwaenfQmmG9RkrtS+47ehkEyiqafqKukfyFwzDbyon83pp4CA81A==
X-Received: by 2002:a05:6512:2399:b0:59b:730d:4a57 with SMTP id 2adb3069b0e04-59b730d4b44mr510415e87.39.1767793545398;
        Wed, 07 Jan 2026 05:45:45 -0800 (PST)
Received: from razdolb ([77.220.204.220])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b669418b6sm1224545e87.20.2026.01.07.05.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 05:45:45 -0800 (PST)
References: <20251216-upstream_pcie_rc-v7-0-4aeb0f53c4ce@aspeedtech.com>
 <875x9fuj7i.fsf@gmail.com>
 <SEYPR06MB513404EB419B7850159F3CC29D84A@SEYPR06MB5134.apcprd06.prod.outlook.com>
User-agent: mu4e 1.10.9; emacs 30.2
From: Mikhail Rudenko <mike.rudenko@gmail.com>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
 <joel@jms.id.au>, Andrew  Jeffery <andrew@codeconstruct.com.au>, Bjorn
 Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Manivannan
  Sadhasivam
 <mani@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v7 0/7] Add ASPEED PCIe Root Complex support
Date: Wed, 07 Jan 2026 16:40:09 +0300
In-reply-to: <SEYPR06MB513404EB419B7850159F3CC29D84A@SEYPR06MB5134.apcprd06.prod.outlook.com>
Message-ID: <875x9dcz9c.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


Hi Jacky,

On 2026-01-07 at 02:28 GMT, Jacky Chou <jacky_chou@aspeedtech.com> wrote:

> Hi Mikhail Rudenko,
>
>> First of all, thank you for your efforts in getting this driver upstreamed! I am
>> trying to understand whether this driver supports PCIe devices that have an I/O
>> port BAR, where CPU access to I/O ports is required for proper device
>> operation.
>>
>> If I understand correctly, this line in the Aspeed 2600 dtsi file declares the I/O
>> port range:
>>
>>     ranges = <0x01000000 0x0 0x00018000 0x00018000 0x0 0x00008000
>>
>> During system initialization, the pci_remap_iospace() function in
>> arch/arm/mm/ioremap.c maps the physical address range
>> 0x00018000-0x00020000 to the virtual address PCI_IO_VIRT_BASE
>> (0xfee00000). After this mapping, inb() and outb() calls work by converting I/O
>> port addresses to virtual addresses starting at PCI_IO_VIRT_BASE, then
>> performing reads and writes to those virtual addresses.
>>
>> What I don't understand is this: according to the Aspeed 2600 datasheet, the
>> address range 0x00000000-0x0fffffff (which contains
>> 0x00018000-0x00020000) is mapped to Firmware SPI Memory. This would
>> mean that outb() operations get routed to memory-mapped SPI flash instead of
>> PCIe.
>>
>> It seems like there's a missing piece to this puzzle. Could you help clarify how
>> this is supposed to work?
>>
>
> Thank you for pointing this out, and sorry for the confusion.
>
> You are correct that, as things stand, this does not make sense from a real hardware perspective.
>
> In fact, the I/O addressing support you noticed was something we experimented with internally
> only. There is no actual hardware design on AST2600 that supports PCIe I/O port addressing in
> this way. To enable those experiments, we modified our internal kernel accordingly, but this was
> never intended to represent real, supported hardware behavior.
>
> This is our mistake for leaving this description in the DTS, as it can indeed be misleading. We
> will remove this part to avoid further confusion.
>
> Thank you again for your careful review and for bringing this to our attention.

Thank you for prompt reply and for getting this clarified!

> Thanks,
> Jacky


--
Kind regards,
Mikhail

