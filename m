Return-Path: <linux-gpio+bounces-35994-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOHAAgez9mnqXgIAu9opvQ
	(envelope-from <linux-gpio+bounces-35994-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 03 May 2026 04:29:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFCE4B428D
	for <lists+linux-gpio@lfdr.de>; Sun, 03 May 2026 04:29:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F0B793008518
	for <lists+linux-gpio@lfdr.de>; Sun,  3 May 2026 02:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B301038B13C;
	Sun,  3 May 2026 02:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="INE1R28I"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1920537BE8F
	for <linux-gpio@vger.kernel.org>; Sun,  3 May 2026 02:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777774964; cv=none; b=LM7MmPGsQGnSVghiym1KM5ov+sYL28es/ut8jmAXqCaQIBNplnDWUg8s30bzmB2SaRU/5rM2nKfvLWkRTdIuzxCZT3Wny/erUybGX5yHBGdfsJ/hWA1imh2ymi2HQsCj7FuONuIWOzA6lHOEKVEVjCNbdWsxZi/ew9dv2a/6/Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777774964; c=relaxed/simple;
	bh=B1PmN4snN3TEmBXKhowypi6Ambrz1PGhChzjKm+5Hg4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ld/fo1iJV7d5EnQGh0TAnKxIh/77jtdHc86T9ZYAYGpKMAhtNT03ZjwI+Kz2zFBKDHKT61tIZHnI6wj5FDbbNYXyNH0LSShnNlpbwHUjHmWB2T+qT2FaGuNvywJ6QHGTLICvMWafIy2nZPZDR8fHrnFnvyK1rbYpZjx5Plppb38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=INE1R28I; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-89fc4147f2eso39850006d6.3
        for <linux-gpio@vger.kernel.org>; Sat, 02 May 2026 19:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777774962; x=1778379762; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ECqabU+TDy0NRCRIeEAH6lrHAxlzLyRi5L607lh5qbM=;
        b=INE1R28IvE/QtZL/oMkIADHU7jre5IHplm70EhXHHlKSzDoU40mvyk0x9rze2cimTE
         yxjKsKU9S5IootkugpNY1Mi3hLm0D2smd1ryOfUrOCOO6oxw4eKiBRN/RM+MsL5c4W8v
         3InO7A0IYLDHiBFawevoH9WTS3HoIaq4xH6WFu/pyOujNW/yvdxFpr6U7a7LL2qqWq8f
         C2E8+F2x3VuEo4r9dcfTbhyYkXyxTedyO41wcntywHHayGZVkYg9bxYDtPfDCFbGAeuT
         24uz0+5L5KMeE+lRYY9GHlQqNsDg1loMNQJWkuWcq6d38QiKA+HBGAyhODirxwVv8dyg
         rduA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777774962; x=1778379762;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ECqabU+TDy0NRCRIeEAH6lrHAxlzLyRi5L607lh5qbM=;
        b=N225Sq+ttXS0EUJCj5Ic5er49m87dHPrwkweMFOaF2Pl9farjYBylxcrdEEZsG5wT2
         fmsBv5xP51WqvcLFHTu+rl7I865aolOthgPi+VIWB+YKrByExwIQgKVTPCKefayBpnhh
         JmL79Red+RkKAE568qhMjXHe0N6Et/2Dv80795y/Wwx0bbquAzK6Tu6tNJx81ceERDyg
         5gwYL8sMRVr/4uzLDd1xf+wwVn4+mAtiEhMQfpEsSyxhjVO+/fdPt13hqoKFvV5dTL9t
         eBxRO7AZYDpdfFZMLd3ggQ9P48Uq6DmkqCkew8hQ414NAEj80nrqZe3f4OODTQ4fnv+C
         FrKg==
X-Forwarded-Encrypted: i=1; AFNElJ8x0lry6V85h1YuLkt8MoGkb/uO1ZISQRbYLjVuskWQUINeVFFbUbBCMkIh9HZebGCtDnbMnupXRKt7@vger.kernel.org
X-Gm-Message-State: AOJu0YxN8hjyUOuPEiwSu0jIqJuAfNQlDI+hM0CtvIpbrli6z7Z0y/Kw
	AMg7skO5hN2nMeuoZ/wYeSXwFcMAGPFBRIy6cmSDcHVrNsp5tgnucuqqcnzXpobAJ+w=
X-Gm-Gg: AeBDietYTSAVjeAMF2gI5lDCMPMjqOb047Am1ZfDElZtxUdnXuo5dG3zQxNnjmX3wfX
	1VsRlQ88quEaKaMu1gAxOM36q03Tcw+URlRA+U/1A5mzD3PhVAp3jOxt12x4vOa/3sMzDBE+7Jt
	Txnvp+dRBEQTPSoVRU0nDcw2mlLQIykkp4iA2fJcDdLt022LvfMs7nTiwZZrKFZW71KUGHbHVaU
	vW9/G6h8p9jDAvZdr1r3rpHtHjKYU9QiOe6flzxVv/fmfrshOFpMDOokO6sDyS22pyfoyPKwe4Z
	ritXBBMhy2AYDkOkB8VIxxatJnhNBZCW/0sACPX8qnrZQhB6fkoq94xRlCFRNNXOlQPGIkJLRYD
	LJqpE/fRGmWzfo3IdDwWIWMD3b31WOiD3lhFs94o+UZTMsVAm1qltn9VfnyXujDWgAnoBzFuD/m
	wxUwqw55uXoYDUXfP5uUXpsN5HyaWm3JRyp6a7p6breMvVSsDLaVVbvEk1gD0cbXiD4+W6UKNNl
	Q==
X-Received: by 2002:a05:6214:5191:b0:89c:6a86:e632 with SMTP id 6a1803df08f44-8b6665f1c01mr90287116d6.18.1777774961977;
        Sat, 02 May 2026 19:22:41 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b53c0e7d3esm83413106d6.28.2026.05.02.19.22.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 May 2026 19:22:41 -0700 (PDT)
Message-ID: <5d18fabb-aac8-4a3a-ae2d-85eaf18cd4ee@riscstar.com>
Date: Sat, 2 May 2026 21:22:37 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 08/12] dt-bindings: net: toshiba,tc965x-dwmac:
 add TC956x Ethernet bridge
To: Andrew Lunn <andrew@lunn.ch>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, linusw@kernel.org,
 brgl@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 Daniel Thompson <daniel@riscstar.com>, mohd.anwar@oss.qualcomm.com,
 a0987203069@gmail.com, alexandre.torgue@foss.st.com, ast@kernel.org,
 boon.khai.ng@altera.com, chenchuangyu@xiaomi.com, chenhuacai@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, hkallweit1@gmail.com,
 inochiama@gmail.com, john.fastabend@gmail.com, julianbraha@gmail.com,
 livelycarpet87@gmail.com, matthew.gerlach@altera.com,
 mcoquelin.stm32@gmail.com, me@ziyao.cc,
 prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, sdf@fomichev.me, siyanteng@cqsoftware.com.cn,
 weishangjuan@eswincomputing.com, wens@kernel.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-9-elder@riscstar.com>
 <1f34cbce-e2dd-4e80-b136-55d0efa50002@lunn.ch>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <1f34cbce-e2dd-4e80-b136-55d0efa50002@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 6AFCE4B428D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.94 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,bootlin.com,armlinux.org.uk,arndb.de,linuxfoundation.org,riscstar.com,oss.qualcomm.com,gmail.com,foss.st.com,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-35994-lists,linux-gpio=lfdr.de];
	R_DKIM_ALLOW(0.00)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	GREYLIST(0.00)[pass,body];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_GT_50(0.00)[50];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.147];
	TAGGED_RCPT(0.00)[linux-gpio,netdev,kernel,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:172.105.105.114:c];
	DBL_BLOCKED_OPENRESOLVER(0.00)[riscstar.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.0:email,riscstar-com.20251104.gappssmtp.com:dkim]

On 5/1/26 12:38 PM, Andrew Lunn wrote:
> Your ASCII art of the chip might be useful here as documentation.
> 
>> +  # We can't allOf reference Ethernet-controller.yaml because we end up with
>> +  # contradictory $nodename rules (`ethernet@` versus `pci@`). Happily only a
>> +  # small number of the properties are useful on TC956x so we can just reference
>> +  # what we need.
> 
> Why not add an subnodes for the ethernet interfaces?

I'm going to wait to respond to this until I've had a chance
to discuss it with Daniel.  (It might be Tuesday.)

> 
>> +examples:
>> +  - |
>> +    pcie {
>> +      #address-cells = <3>;
>> +      #size-cells = <2>;
>> +
>> +      tc956x_emac0: pci@0,0 {
>> +        compatible = "pci1179,0220";
>> +        reg = <0x50000 0x0 0x0 0x0 0x0>;
>> +        #address-cells = <3>;
>> +        #size-cells = <2>;
>> +        device_type = "pci";
>> +        ranges;
>> +
>> +        gpio-controller;
>> +        #gpio-cells = <2>;
> 
> I've not got to the GPIO driver patch yet...
> 
> Is the GPIO part of the ethernet device, or part of the chip? The
> hierarchy here should match the hierarchy of the hardware.

The GPIO is part of the TC9564 chip, and is a separate IP
within it.  Within this chip there is one GPIO controller
(as well as a UART and so on), independent of the eMACs.

>> +        phy-mode = "10gbase-r";
>> +        phy-handle = <&tc956x_emac0_phy>;
>> +
>> +        mdio {
>> +          compatible = "snps,dwmac-mdio";
>> +          #address-cells = <1>;
>> +          #size-cells = <0>;
>> +
>> +          tc956x_emac0_phy: ethernet-phy@1c {
>> +            compatible = "ethernet-phy-id311c.1c12";
>> +            reg = <0x1c>;
>> +          };
>> +        };
>> +      };
>> +      pci@0,1 {
>> +        compatible = "pci1179,0220";
>> +        reg = <0x50100 0x0 0x0 0x0 0x0>;
>> +        #address-cells = <3>;
>> +        #size-cells = <2>;
>> +        device_type = "pci";
>> +        ranges;
>> +
> 
> You second ethernet does not have a gpio controller?

Basically, no.  We made the decision to create a "chip"
abstraction that is responsible for managing these other
shared IP blocks (of which only the GPIO controller has
a separate driver).

Both of the PCIe endpoints are able to manipulate the
registers for the GPIO, but we made it the responsibility
of function 0--not function 1--to handle that.

It's possible that some platforms won't use the built-in
GPIO controller to manage PHY resets.  So we used this
property to signal that it was required.

So *if* the gpio-controller (and #gpio-cells) property is
present, then function 0 creates an auxiliary device for
the GPIO controller.  Otherwise something else supplies the
GPIO lines managing PHY resets.

					-Alex

> 
> 	Andrew


