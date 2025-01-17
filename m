Return-Path: <linux-gpio+bounces-14916-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAFCA154B7
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 17:48:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D6B33A99E6
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 16:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 714CF1A071C;
	Fri, 17 Jan 2025 16:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="DsTKbvYe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98C319F48D
	for <linux-gpio@vger.kernel.org>; Fri, 17 Jan 2025 16:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737132499; cv=none; b=pBouh01DWVYJ+MJvSzs9267DlxnTHQQE8UlE50KJp/JrffwH3d+4J1Kgn+BAqHWNKaHgVxD9+stLBs1dEgv38Kf7va2HM5GpZprWQ7nYgsTY46Fx15fOQl5vAKN0gm+ZbwhWL8i8fY3rv1onIKuKIhVo8PKdjkuQtBc0JXB9yXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737132499; c=relaxed/simple;
	bh=gYb1kqdV6OoJpnxC34fRTLu5PUOWyFCJa6cz1JOnhMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SMwxiHCzs1g+21CF0crDgGzC6RoVudF8fVPVw81bUsLfQ6nL1gDqMFKCH6v7mnCCRlUCrikyHOYdqImuN5An4iNxSmAydztj4ogtvlU0M6DAeaF7J1PVKPkXsFfp6XI3KejLEp3WDWiYRVMxixyo2I5LsUoX0rH7UbpQ/Vpr8eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=DsTKbvYe; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-71e2bc5b90fso1262696a34.0
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jan 2025 08:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1737132495; x=1737737295; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5Q5B/dY6oMiz81FjN8mBPvGWEx24pGyjt+FkzOK2nI8=;
        b=DsTKbvYeVd1gb9+7g1PhPNO6ysQs0QLf/6RNU8zgzTZoeYNG8vLtlq0gwEpSS9KoF9
         +t3SY3QrY0JcQDtYUv4jgU3ck3UQLP7ZGp/+NxJFIhxYRzVUCYdY2EFPNajSGy3iEX5l
         dz3OGDqvBVDmHz3dPcuwbWwluEwtVWH/JCLVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737132495; x=1737737295;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Q5B/dY6oMiz81FjN8mBPvGWEx24pGyjt+FkzOK2nI8=;
        b=iGXvQTDTGGPacmzy1AlzgOm+YPPJZdX8JqdvvgkAJdHkDtRbLgX783t92+1slCA+8U
         wYVhKf7PDWM8BFGbugFT4/W/ilSj2cQcFw1BfwyIV/PhPfBSPa8uEFAOW8guN/x3Zgok
         lg1uN8bXU809E+zHlshh2Cv6FkV5eN//pYmH2YNX5ATiX/z/iyG8hLR+nYR9jcx17myX
         HbzLqdt3cyAMu5GWMY3052uRz+4em7kl7dNQ78KqUjSAQNY3Ey9cqlFCBGislQp1AU3d
         aax1Pegioosw0QkY/E9qWD94bu3BwBgHikNk7fYuCYiFACxrtuNEzD9qjMkON/XreSmx
         ZqHw==
X-Forwarded-Encrypted: i=1; AJvYcCX8StJkRP143fOz2VOb6sruzt7bf72OxniXqcU+uAwvClm9XlDiYkC6NkR+vgYYXWFabXlSs0MLolTJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzwB4dybB7q5rWKaqTNN6LhWHDFsda2rDdZhiSoUnbJjLFHOccP
	T85tV1/wqR8TRVYBxwpRosM29TRzQ+e5b40GY/rkY9yV2x3N94f8OJ7RgUFMSw==
X-Gm-Gg: ASbGncut+WDCZWumdSve+nYvODu5a1e1I6LjF0hHwyM1etOExY6iTW9MoH1wUN13HuZ
	PM8pDWIUJk+9qRqS5w/44k/SoegogRnArCuX4YwkTv163/JD66oUIqGSlKMcZL9QNXuRp1cOA3s
	w4q8lylrZfYHQIXYejTpHneZx+NStDsKquDCzzCQix6LhdQ7kCeukUTr1FBZ1jgTAA8Lz6iTzp5
	1SDUVKgIcx4X2XSDLjxYVY+NaGE1aZevJqonK2M/QkQdVabS5sGQzYI1oI/i5AjVNJtbcxJxIAL
	QH30FQGw2a1jUK5Ir3klSVdu3jIXuwY=
X-Google-Smtp-Source: AGHT+IF6HBKuramUxfZ03WLrKRxT9Rq7V91iMfxEsBjw1iYwzz4R/iPVpQvLNQeC9Tgu4MJd9+8z1w==
X-Received: by 2002:a05:6830:6999:b0:71d:f239:c0b5 with SMTP id 46e09a7af769-7249daff60amr1950245a34.18.1737132494750;
        Fri, 17 Jan 2025 08:48:14 -0800 (PST)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7249b3be2e2sm1021115a34.31.2025.01.17.08.48.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jan 2025 08:48:13 -0800 (PST)
Message-ID: <cb4c8ce4-db43-4cf9-94e2-2f4d04057d8d@broadcom.com>
Date: Fri, 17 Jan 2025 08:48:10 -0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/10] dt-bindings: pinctrl: Add RaspberryPi RP1
 gpio/pinctrl/pinmux bindings
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <cover.1736776658.git.andrea.porta@suse.com>
 <585d04509edca5c8b786fee9383471e0b3ea35a3.1736776658.git.andrea.porta@suse.com>
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
In-Reply-To: <585d04509edca5c8b786fee9383471e0b3ea35a3.1736776658.git.andrea.porta@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/13/2025 6:58 AM, Andrea della Porta wrote:
> Add device tree bindings for the gpio/pin/mux controller that is part of
> the RP1 multi function device, and relative entries in MAINTAINERS file.
> 
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


