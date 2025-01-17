Return-Path: <linux-gpio+bounces-14919-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A92A154D9
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 17:51:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 259DB1881976
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 16:51:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E2DC19924D;
	Fri, 17 Jan 2025 16:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="V8mVu+Wn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5357119DF66
	for <linux-gpio@vger.kernel.org>; Fri, 17 Jan 2025 16:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737132666; cv=none; b=iW9Q6AdXh7PdznFBXLq0HGCKHbYRLr4b88s2ibrqt6fuL/3orhCSp6BgIL6sXdeZVZ4EtQ1eduaeV6JeaK5zffFTg0wU7TxSCBaWdW/JVHxxwyRDVqu3kvxJwC8sxYH9gl6+XNHtB2VCsuCjhdjjoTtD2Nvj8U/Rb10M6I87AK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737132666; c=relaxed/simple;
	bh=YfaxOwi4b41jhMk1IriLdmjs4Iy4QvAbdE5FGCKSjr8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=P/44sISp/zKp0V1oNXXk1KsyfqX4spf/yNriQ4wyekgfYBfovpwKXM0vTEqWFxHlU4xiwy+o0M0YWzD2cgtfvfr25rW/4dWoL6gIMCZMo+XuPuHWuCk28KjIBf3O8g0y89Ab8k45vyjRser+/psoJbXf/s3QR5bv+F1ntRORL0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=V8mVu+Wn; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-71e3f291ad6so1475641a34.0
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jan 2025 08:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1737132664; x=1737737464; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SkhdPwR+i8G4KznbeuRGEbuhMQKkED+QsjQdmytH0d8=;
        b=V8mVu+Wn3SbEPoxoT1S5EUWRhFE8ogvg3plAMeZDMcdXrLNQuAuXWQkz/gVf6m//1P
         qInQkIJ4oqAmHFVf1zDi8QTyAUzUE3QF3P27IJDJPZfasPB/wCtUAyukjG4ycwsAneG4
         852ugGHlVHgowNoGbCwPteBYMrtFDFKHGVEnI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737132664; x=1737737464;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SkhdPwR+i8G4KznbeuRGEbuhMQKkED+QsjQdmytH0d8=;
        b=n0drrpFQQEW9IG8bxwSPL0vFDMJ9JZfkL+EQsXPPeXfSAHfqR/D/D+07bdS7f/poQQ
         Sm6R94MevnPcNYKMi7LvgG+VxWZ0NXlJJEh0ZeZOUqZ0OxtzRaY1f+zOl1x4w2VImbme
         aCo4CjdkfP7ER1iF3nORegwQRtOE5c45VQtlZNF2qI8TE/cVqpnXghFCws2dd/9o7hIG
         pjORHiwAGrja761JcaxJsaDpYr4KdfeZLbIQrroZ2Uhwj0ZIEgZffgZqn+zJso359GWS
         r6dqVBksgRwhOFsyDXv1H/EZxznI9pkZkjnJAXpBZZJ+WluRs9Ij0xdovAfq4xKZpEqM
         hm1w==
X-Forwarded-Encrypted: i=1; AJvYcCW37u4cJCyllHZeZ74CkfEJ328n9Fc07ZfrVv+vLIZy8zj3Jbmez2qHN/1I5WfSKuR1pi3FKeQEApVV@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg1GJptCCVazmUcdwU+ZVZTH+nkDbE5I/WWlsADgIIuQZE7Phf
	v7WIlvhYTfDTmO5MQ2rZ0584A2J67TCto6m2PH/T+qRFz4VGX2rasEr/yl9FQQ==
X-Gm-Gg: ASbGncuHDAcqQLy5V+XslUrGwAVvDIUH1BnSr4S45NhB2INfgiphtsZHQgBvkO3u9m0
	9VLJb3bNZysl0hKPLu88zWwZAZHQydotmLp8ICmfVX3lxGb4mbS5RbLXUnWBPuoXPzKD5CMED0U
	Y7YwGNy41YO4D5RkS166IAxvCLxHwVhgUcLZ7buJvZGQO92aIuAAacgLHF24nzVJxcYMN1SWxUh
	8VZcEhYKEYfpulrUiGJ0z1XobJXDX+yrydwPrlTzYWaNSPD0Q00McwHXFWB2p9GOtKqtAFSKX9V
	qGI8vjj5X+KFdmxTHP/FxjwzcPlKlGc=
X-Google-Smtp-Source: AGHT+IFKbDhEyNtGWlN2yc2R755sLxWqKLsveQjo/EwG8YGMpFOe5bAas7SyegTZ4OtUkrD6juv5rg==
X-Received: by 2002:a05:6830:6713:b0:71d:5b70:41bd with SMTP id 46e09a7af769-7249da7191dmr2187325a34.12.1737132664380;
        Fri, 17 Jan 2025 08:51:04 -0800 (PST)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5fa35f07ebbsm846110eaf.14.2025.01.17.08.51.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jan 2025 08:51:03 -0800 (PST)
Message-ID: <7c154b5c-e745-45a9-8939-b0d429299b31@broadcom.com>
Date: Fri, 17 Jan 2025 08:51:01 -0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/10] arm64: dts: bcm2712: Add external clock for RP1
 chipset on Rpi5
To: Andrea della Porta <andrea.porta@suse.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof Wilczynski <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Linus Walleij
 <linus.walleij@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic
 <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>, Stefan Wahren <wahrenst@gmx.net>,
 Herve Codina <herve.codina@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Andrew Lunn <andrew@lunn.ch>
References: <cover.1736776658.git.andrea.porta@suse.com>
 <bb69c32871d162a06dfdd26ba958ea0a74b592d5.1736776658.git.andrea.porta@suse.com>
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
In-Reply-To: <bb69c32871d162a06dfdd26ba958ea0a74b592d5.1736776658.git.andrea.porta@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/13/2025 6:58 AM, Andrea della Porta wrote:
> The RP1 found on Raspberry Pi 5 board needs an external crystal at 50MHz.
> Add clk_rp1_xosc node to provide that.
> 
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>

I don't expect conflicts so this could go through the tree that will 
merge the misc driver (Greg?).
-- 
Florian


