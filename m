Return-Path: <linux-gpio+bounces-36324-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAu4Gdyj+2mvegMAu9opvQ
	(envelope-from <linux-gpio+bounces-36324-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 22:26:04 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 281134E0274
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 22:26:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 016A1301E9B1
	for <lists+linux-gpio@lfdr.de>; Wed,  6 May 2026 20:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CDBC34F49F;
	Wed,  6 May 2026 20:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="ia5ZBPeE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40DF34D398
	for <linux-gpio@vger.kernel.org>; Wed,  6 May 2026 20:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778099161; cv=none; b=SOnQsN+bU+auiUnC/oUxoOmP4GaTk+IU004amg8sQ0wZzEYW5xVFTOmT8RHQyWunUYQ7J+zmd7iPyvwYLESERubUkD7Kni+x0uNP14LQYuxiEj03X1I7jWy9x8vk49679GV4x0E4Z2zJnPzoCOxbJP/e/kU/fzUP0qzJg2baGQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778099161; c=relaxed/simple;
	bh=KvR482t3qQMqG271biDigSfwVZFQRtL0ARFYeTgyodw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KXodWB7tTn+eWBP4EwEILjYvC9GQkiP6uGU9fkfyehP3pugS2TCbRf2zlXBurGjMe9flZqOV485DoOfM+ZL7NxbVstkJpq7rbsGieBgbPZG4KCIk21B9DDA869IETQtS3gOa1J4YSklNjOxjHkTpSFr4czBptchGhmHUM3HYNUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=ia5ZBPeE; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-902deb2412fso11420985a.3
        for <linux-gpio@vger.kernel.org>; Wed, 06 May 2026 13:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778099159; x=1778703959; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SdukG9VKDRkZW3L7pajWJZpmf+/8rRp6+77POw0TW7Q=;
        b=ia5ZBPeE/pweZyU+cTmMpjjJ7WkZpZtxCfiduXWdBSU5BXn33/pvZcR1XOuyIikkOu
         8mC+VtLKj5Jsxr3U+ugEB1YTyCsdO/H7PzWyyg9VR4ehYALtQb2bv9PcwZJP6/5DOc5Y
         HQs4gbMaGVBE/j6na1CBKDOSrxLYk15Uqj0gP8+GBRWQ1uRX5rcCqb6bfpJ0I+ma7wn4
         CymG6SUnjDFy00+uAmtYt3LHKT3PJiVkWlmuGK1M0VJJ4uLZizTuW+UCj4VOJUnarDoM
         J35EE185rdZBRcMFCxkpXUVX26m8+tsRBLNxjfZBKD9YDDtnCJY/BiSyPhBhEM45uF0/
         JI4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778099159; x=1778703959;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SdukG9VKDRkZW3L7pajWJZpmf+/8rRp6+77POw0TW7Q=;
        b=Un1ZM5KK0D+/grHaOHSCeEKkfcBWukfEu5/gV3gKKT1/eNtEjzdypKwbyTHUJCLMID
         5rDRYuPo/x/9mTeGYpKAlj4aPeBWj3QsV0c1AjQTyyr77h50hESD5tBWb+VDRNOvuQoO
         R0Fmpjk096cJexiUZveLfLfVqALcCAWVxcne1/mvxckyi0GQkLxkQBUo/Tr16Ve+4nF7
         XunLwv6wafVTLoKAodDDpsw2wug2SHnitCfTr/soMCTXu2qzKya7TCBQzhVu+qW/Mpf8
         TT6z/i5ZpUo2Gua8kbHn7mg493r13XV9c7vjUjZ2djpSSWn6DreWuUJrld835SC/X9AX
         ob/A==
X-Forwarded-Encrypted: i=1; AFNElJ9stzQHvPfrg86V751dHGVwAEJWo79zhIgfp22Lqs/8nlVfdRSpbnRA+dgf5RSO3Xx+JdhRUO7krw0/@vger.kernel.org
X-Gm-Message-State: AOJu0YwR29WUXnrbev+LJZeaoLNRdSjD4+tSdGfdXWG7YoBktpI1+KpC
	CstjaHHCfSxd0wxNmAKxQwFiNdE67EsIDbVY0EsJD7g1gv7SlcgRiKJSeqoffMF5vs4=
X-Gm-Gg: AeBDieteOSPZmDWuZ52ijHYjp58jjd4uG4hpqcB5al/321UX/Fwy1Jpl9zbGSDKDd+Q
	KfP7YR8OkKfFvkN27K2bLXHk0GTSc393vYpBusnl9L64b+bAt3js0W/3l2WkdYqt0XkjA9XARv5
	3MIIG+POp4kOOGt90KnqqVSH/rysYjxf7oJIe/OXq/4ReubNp0KSa/J7mRjNtSssErdcYpnM7WL
	QogAwZTKMOfji1jmbZv4Y6EqCEYy0UNxzBveYZw/hzu2Spn+g4egzhmlbP5Je49yVNCKSy/GGac
	iEsuCkEmOsgzjJvZlDqLB78Bw0u2YEnuAcJbGiXjTV/xAfrYTnOUlGpMsmwcHIhXbT0ytDk72U3
	D7Fk7T/DgYoelBo/UILDf7EgwRHhaJ9JxBVVJ57b9IIZCOzZNQeAslmaP7kMfcc9mhNxzh0X27Y
	1QymMaEEMdBnqBYnuNGLfOwcdJEx6xisfh6HnP1ieGI+dp2+9My/iByJfPSLSOxTOxTgePB851Y
	w==
X-Received: by 2002:a05:620a:298c:b0:8f6:2efb:b10d with SMTP id af79cd13be357-904d5ffe436mr774330185a.35.1778099158536;
        Wed, 06 May 2026 13:25:58 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c25324esm2003603885a.23.2026.05.06.13.25.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 13:25:57 -0700 (PDT)
Message-ID: <79684efa-4ba9-4144-a99b-dab935007a2f@riscstar.com>
Date: Wed, 6 May 2026 15:25:54 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 09/12] gpio: tc956x: add TC956x/QPS615 support
To: Andrew Lunn <andrew@lunn.ch>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, linusw@kernel.org,
 brgl@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 daniel@riscstar.com, mohd.anwar@oss.qualcomm.com, a0987203069@gmail.com,
 alexandre.torgue@foss.st.com, ast@kernel.org, boon.khai.ng@altera.com,
 chenchuangyu@xiaomi.com, chenhuacai@kernel.org, daniel@iogearbox.net,
 hawk@kernel.org, hkallweit1@gmail.com, inochiama@gmail.com,
 john.fastabend@gmail.com, julianbraha@gmail.com, livelycarpet87@gmail.com,
 matthew.gerlach@altera.com, mcoquelin.stm32@gmail.com, me@ziyao.cc,
 prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, sdf@fomichev.me, siyanteng@cqsoftware.com.cn,
 weishangjuan@eswincomputing.com, wens@kernel.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-10-elder@riscstar.com>
 <736fb3b7-c88a-4ec4-96ad-d1b79cc48d30@lunn.ch>
 <30cec7dd-ac3c-47ab-896a-c29992bd5ba5@riscstar.com>
 <3666e3e6-e6f3-4cbf-b9fe-caa394fbab7c@lunn.ch>
 <0751a051-9894-45be-92d6-0d46f2c39293@riscstar.com>
 <7d7b6b89-3ef4-4891-a794-c8b11f39db34@lunn.ch>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <7d7b6b89-3ef4-4891-a794-c8b11f39db34@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 281134E0274
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,bootlin.com,armlinux.org.uk,arndb.de,linuxfoundation.org,riscstar.com,oss.qualcomm.com,gmail.com,foss.st.com,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36324-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_GT_50(0.00)[50];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,netdev,kernel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[riscstar.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On 5/6/26 2:43 PM, Andrew Lunn wrote:
>>>                 ----------------------------------
>>>                 |              Host              |
>>>                 ------+...+----------+........+---
>>>                       |i2c|          |  PCIe  |
>>>       ----------------+...+----------+........+------
>>>       | TC956x        |I2C|          |upstream|     |
>>>       |               -----        --+--------+---  |
>>>       |  -----  ------  -------    | PCIe switch |  |
>>>       |  |SPI|  |GPIO|  |reset|    |             |  |
>>>       |  -----  ------  |clock|    | DS3 DS2 DS1 |  |
>>>       |                 -------    ---++--++--++--  |
>>>       |  -----  ------     downstream//    \\  \\   |  downstream
>>>       |  |MCU|  |SRAM|    /==========/      \\  \===== PCIe port 1
>>>       |  -----  ------   //PCIe port 3       \\     |
>>>       |                  ||                   \======= downstream
>>>       |  ----+-----------++-----------+----         |  PCIe port 2
>>>       |  | M | internal PCIe endpoint | M |         |
>>>       |  | S |------------------------| S |  ------ |
>>>       |  | I |   PCIe   |  |   PCIe   | I |  |UART| |
>>>       |  | G |function 0|  |function 1| G |  ------ |
>>>       |  | E |----++----|  |----++----| E |         |
>>>       |  | N |  eMAC 0  |  |  eMAC 1  | N |         |
>>>       --------+.......+------+.....+-----------------
>>>               |USXGMII|      |SGMII|
>>>             --+.......+--  --+.....+--
>>>             |  ARQ113C  |  | QEP8121 |
>>>             |    PHY    |  |   PHY   |
>>>             -------------  -----------
>>>
> 
> 
>> Because the internal endpoint won't operate until the PCIe
>> power controller has enabled power, this GPIO driver and
>> the PCIe power control driver won't interfere with each
>> other's access to the shared registers.
> 
> What i find interesting is that there are two GPIOs, and two external
> downstream PCIe ports. A naive way of looking at this is that each
> external PCIe port has one GPIO. And the internal PCIe port does not
> have one. Hence the internal port might well work without any
> additional setup?  That was my thinking.

I see what you're saying.  I don't actually know what effect those
two reset signals have on the internal PCIe endpoint or its port.

Here is what the power control driver does:
- asserts those two reset signals (via direct register writes)
     - for every port on the switch:
         - disables the port (which programs a sequence of values to
           specific addresses)
         - sets several PCIe configuration options
             - l0s_entry_delay
             - l1_entry_delay
             - TX amplitude
             - NFTS
             - disable DFE
- Finally deasserts those two reset signals again.

And "every port on the switch" is:
- USP (upstream port)
- DSP 1, 2, 3 (downstream ports, including the embedded one)
- Ethernet (which tells me maybe we need to update that driver
   to support two eMACs?)

The whole point of this power control driver is that it doesn't
actually power up the PCIe switch at all until *after* this
configuration step is complete.  So I believe the internal
endpoint and its two functions aren't powered until after the
power control driver finishes probing.

The GPIO controller is obviously alive when the power control
driver runs though.

> But you are saying it is not as simple as this, and two GPIOs affect
> three ports? Do you have any idea what they actually do?

To be honest, for the most part we haven't looked closely at
the PCIe power control driver--though it's relatively simple
and I understand how the code works...

So I don't know the answer, but I expect with some work I
might be able to find out.


To be clear, the reason you're asking is that you're suggesting
we might want to model the GPIO controller differently, correct?

I.e., model it as *not* associated with the embedded PCIe
functions.  Then we need to think about what its parent device
would be (the power control device, which I think somehow
duplicates the switch device?).

					-Alex

>        Andrew


