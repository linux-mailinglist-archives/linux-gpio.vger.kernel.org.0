Return-Path: <linux-gpio+bounces-22223-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 005E4AE8E3E
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 21:13:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9487E3A8B93
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 19:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BE942DECCE;
	Wed, 25 Jun 2025 19:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="DHcoxDLT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26722DCC1A
	for <linux-gpio@vger.kernel.org>; Wed, 25 Jun 2025 19:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750878602; cv=none; b=uyuTHjLguPPVwYN0NbROQhlKzLWL6fn5yms5aBt6ZjfRQpdEJLVpEd8GP2tg+UtOFcQOY8i62+UVXMJsH6wlzQZMjCyDUHZUfUsoBYGOwyqWtLyQ6ZXDFYHMAbf8m7OeKteGfddR/zmEJ6c8XtNnQa43knoB1Q/bYUdWvQxoNp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750878602; c=relaxed/simple;
	bh=2bB7vPFiR82NefYXBt0U6WnlFITpDcWiy9Z3+apDBH0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QegaFlzULXsM33LFRdFDef6DXJ8j1Ug+SKsIgbGKBNG098PBKPDEpINOYOQv8lcRrFAVfrOFjaq2rM/wAG2GrvxeiO6E08tm0SBAEhEjur1aiOYuwSrdmbyVFLNuO5vX/pldJYL/VL/RRSqNcpglLBbuOnu7tw5DqGFs+laOzUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=DHcoxDLT; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-747fc77bb2aso303971b3a.3
        for <linux-gpio@vger.kernel.org>; Wed, 25 Jun 2025 12:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1750878600; x=1751483400; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=o0Ju6aCN24wZr3uVZs3SbxTR4fn7gitkctCIzfzOgoc=;
        b=DHcoxDLTMPzs8f7pG3NcdQlTJGG0cWRtHNx2p9Xkf5G/L7R+1QpL/I/aRiOLkkAzp8
         0IseWwOffNSl+fqs4aboYZaIkV/V76Bzih9C6CBGj/uAUa7s38hduTlHcQzEJYp8Ko1q
         /TaSO6lwey2imDQdCUrvseSKn7MPxHA5P2bPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750878600; x=1751483400;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o0Ju6aCN24wZr3uVZs3SbxTR4fn7gitkctCIzfzOgoc=;
        b=krsoDKynn6RRlbPBk0dLtS+N+O27kBy5RVnspe/qI6ljawiOZT+jvxUydRGRprw5HA
         1dtzGSK4BQgsA232S1bZzBxl76C6NxTuo9rDoA3uwy1cBdCWOyYPC3CcpK3nED3zKQID
         MBfn2CqRA8AYATzJyIjctHqEJvozUyVzMhGC7qq0PS9e/GctjLNRv0BXrhdYpL1PnVo7
         FnPBEGDXKEvOfRnA23omy3xZ6MR1YClJ4wEIx9Vn8wrn3Iw3nsZVZukU76PzZnz38Ops
         K/h2JLGNERPkP+zTZal6gYjpypIzTXEXX9HYIjotOa5WHOlkNxjvogPLBPABD1RhFOR4
         3HnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVisISLM8wTgAYVXzjqP06WmJG7Jh6tPsCs3Um0IpFiDg82ZqNCOoDDniVQtiAWyWuOsEatkXRncRtf@vger.kernel.org
X-Gm-Message-State: AOJu0YzRYUYFtKifHtGpeBH/8WQhPcFJACKO4kSmwUEZ8mhf9ydRfbhq
	/qSiAm7rIe6NqS/TmlH2tR9A9mwr0r77rDdLCoEgXRVS3babfgStvzRECw8OKkkqlg==
X-Gm-Gg: ASbGncuidCL3jtDmWDZtzlwolAzviqjmEW2Xs2U0mXH1TO2JLeSSi1XmmIG26vcQMgH
	DneUx/Hctx8Xkhe1t42c2jFaUA0dky3yGeYVdBzyx7/NJ73y4CHor0gWKut8+3vCGc0oWjEIaS/
	r8IWLo9lQhmLsI8wuRG+QouDZsRrXZnXvdFFx/ezpAOzugIgpc9E5v/8Oi2Aix2zdZw1tzjNUew
	DxUDmNwLls6V+ykq+FVAsXQA2zUfTioluOhTzAAO2YzZraK7iQFHpr1RmYxGXAVio6MoBor9Amw
	QNX1KrL/O0Q7pdz7+r+xu3Q1DMGjpzsqdOeV17/cx/M6Lv9tvPFX+9Jo818XXrYCMegMog0K7Ii
	5zP4vs/ad382F0O9Wb0mh1/TS7g==
X-Google-Smtp-Source: AGHT+IHtKCeR3mNQuZjKw/LxFiZxZrGAtvXQtQeH7qGm7c4Q8vzCq5hRLQONNTo8uXUtyVJkmfvDEg==
X-Received: by 2002:a05:6a00:39a1:b0:742:8d52:62f1 with SMTP id d2e1a72fcca58-74ad4477262mr7141643b3a.8.1750878599991;
        Wed, 25 Jun 2025 12:09:59 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749c88313fdsm5242219b3a.92.2025.06.25.12.09.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 12:09:59 -0700 (PDT)
Message-ID: <3ae39319-0962-4e1a-ad0e-27aca86c2075@broadcom.com>
Date: Wed, 25 Jun 2025 12:09:52 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH stblinux/next] pinctrl: rp1: Implement RaspberryPi RP1
 pinmux/pinconf support
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof Wilczynski <kw@linux.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Derek Kiernan <derek.kiernan@amd.com>,
 Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-gpio@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
 Stefan Wahren <wahrenst@gmx.net>, Herve Codina <herve.codina@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Andrew Lunn
 <andrew@lunn.ch>, Phil Elwell <phil@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 kernel-list@raspberrypi.com, Matthias Brugger <mbrugger@suse.com>
References: <8c282b89b1aa8b9e3c00f6bd3980332c47d82df7.1750778806.git.andrea.porta@suse.com>
 <9d31a4d7-ffd1-48ca-8df6-0ddc6683a49c@broadcom.com>
 <CACRpkdbAxyZK_f8y6mzX_eJ3UM5ZtuXEpSmXE+QpUXaHKw_NGg@mail.gmail.com>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <CACRpkdbAxyZK_f8y6mzX_eJ3UM5ZtuXEpSmXE+QpUXaHKw_NGg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/25/25 01:45, Linus Walleij wrote:
> On Tue, Jun 24, 2025 at 11:11 PM Florian Fainelli
> <florian.fainelli@broadcom.com> wrote:
>> On 6/24/25 08:36, Andrea della Porta wrote:
>>> The current implementation for the pin controller peripheral
>>> on the RP1 chipset supports gpio functionality and just the
>>> basic configuration of pin hw capabilities.
>>>
>>> Add support for selecting the pin alternate function (pinmux)
>>> and full configuration of the pin (pinconf).
>>>
>>> Related pins are also gathered into groups.
>>>
>>> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
>>
>> Linus, can I get an ack or reviewed by tag from you and take that in the
>> next few days to go with the Broadcom ARM SoC pull requests? Thanks!
> 
> I was just very confused by the "stblinux/next" thing in the
> subject ... what is that even. I thought the patch was for some
> outoftree stuff.
> 
> But go ahead!
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

Applied to drivers/next, thanks!
-- 
Florian

