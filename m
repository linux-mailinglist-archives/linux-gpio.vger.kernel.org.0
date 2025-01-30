Return-Path: <linux-gpio+bounces-15106-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DA893A233EF
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jan 2025 19:41:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E02A23A4E56
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jan 2025 18:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F060C1F03DE;
	Thu, 30 Jan 2025 18:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Fa7VNVlV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338F11487E1
	for <linux-gpio@vger.kernel.org>; Thu, 30 Jan 2025 18:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738262498; cv=none; b=Rb7VvdtokWhBHM1l8D6f1N62mU/jzL1PoBN5tZnH2fIhMty6SpIXMO2dwhIpZe67ko5BtPrTf+ioX44qGd7LRQBZAY9ogjDX7/co12HGmKPEmTl6TPKI8PIZFHXLguLcOK2U0FqILjJ3k+gkXmgJOLS1rqGppxNbW+BgtO1Huzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738262498; c=relaxed/simple;
	bh=hDrbzZ/o8zXac0UrLKZHSJsKzybmBO43plcozHXvA7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d3H9P3MCOGhl3XyazUFGZhn+mP1WfRFgRSIZm3hT3trxxjnzRhun2L5y48veMfZhgBiSd4/hE7ttoVVQ25NqEmIV13dM3gAK/GuDzSJn0+auHJrsIEZA00Jz3kk7tIN52XuwTxJD6pFZlcQeL3nNUtpHD4iimgonPKYBY4IdhpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Fa7VNVlV; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3eb98b3b63dso290015b6e.1
        for <linux-gpio@vger.kernel.org>; Thu, 30 Jan 2025 10:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1738262496; x=1738867296; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qOd3iWC7zZDqWb1/6kUeblWIuvBy4/wvZo2kXA/gdXo=;
        b=Fa7VNVlViW7KodrV/7ISdD2xsLP5mUIK0KvV4h6ImQLdm/iTmzVWQDj2OzMINXhKEP
         vA9VHPRjQ7+QIriCxVixC+HRLoNfHPKf4oWDUUfhwcaXnJF3c0fq31icj/rHcfYx8E9P
         qP9CfzU8BU+bkJKdfVVW6dIVHIlJhB0l8U+b4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738262496; x=1738867296;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qOd3iWC7zZDqWb1/6kUeblWIuvBy4/wvZo2kXA/gdXo=;
        b=R/VtEUJc09FQU5UavyAJEGgdaOJ73lhPKF9pm/t2IcgjopE89fTm6hAOW6ImimNmHl
         PZMRoEm1MQBp745da+ZibobYA3e6aPFQklqyKlOMHN0YkzHhKvXEzP2tMLHMrXxHeR+2
         dF8fOgE57vmgNorFizuwMPIyQMbrKcBGDMTSGlLifvH7IldzFn5Un0Hyo+zNeMjUSYE1
         s8WTukBZmXD8vwhI+8rDOdwhbIXNJfDiT7v9vgrUskO+uH6O/SBt2JL2lTQ2Ur8aZ+DY
         iutBrs455FGwEMPWArKWDyLHr8Yo9yTkQbZqPuyPQ5RVmZV8vxzxxEthHENhS0mD3Cyw
         4CZQ==
X-Gm-Message-State: AOJu0Yzq8DYsbjsmAkAxyxir2w6WoYCcUDXU9LY5AybTM3uKyHH23n9A
	UdSZyxMJ4j0ibg5xYWPVraczi8cXrabu2UfBeD16E6jnyMkgFB0GB5W2S/z+LL9WSMLB+8QAd+g
	=
X-Gm-Gg: ASbGnctlremo43FF4FNT1QrJePeoDCqC3Ely4G/uheYCPwe7LccTaHCvH8p5FoE+tNk
	rKujzrbbVTn8xXB3e5wUQLQf/3iXn8D4y1hmwh/KsXVT/JkLiY9CTm+/13AHytC5Haj3muuTMpD
	ClzlWPve/G/8hHFtAnWOG823pjZky40i5OPmPfcSvWnCl4HK4A1nPy7jqmu4IkX0Vwq6FkcHZTS
	t63a/IZwYpHfm8AW6uVrY/QW8pcWLH+o6iptWSUyv3my6JWLDJAKP40YfRIVVpJxYJ6mHZYEeiH
	RQHfgNU/LRADrOQ+5BAmFjcZZIMfVOMROuDc9QYdVzVz4VaVLfu/ENI=
X-Google-Smtp-Source: AGHT+IF9hPMapcrHVYgiwr6mfFGr1150ASwMIWTB4CXyFsQRq91Q5GFZfWBy/o7V8rqkPEXMa3zRpA==
X-Received: by 2002:a05:6808:1b87:b0:3e4:d4ca:2774 with SMTP id 5614622812f47-3f323a8d14emr5680855b6e.20.1738262496255;
        Thu, 30 Jan 2025 10:41:36 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f33365be46sm369818b6e.36.2025.01.30.10.41.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 10:41:35 -0800 (PST)
Message-ID: <5fe49a62-b40d-480f-aee1-224e17db9f02@broadcom.com>
Date: Thu, 30 Jan 2025 10:41:31 -0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] gpio: bcm-kona: Add missing newline to dev_err format
 string
To: Artur Weber <aweber.kernel@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Scott Branden <sbranden@broadcom.com>,
 Markus Mayer <markus.mayer@linaro.org>, Tim Kryger <tim.kryger@linaro.org>,
 Matt Porter <matt.porter@linaro.org>, Markus Mayer <mmayer@broadcom.com>,
 Christian Daudt <csd@broadcom.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20250130-kona-gpio-fixes-v1-0-dd61e0c0a9e7@gmail.com>
 <20250130-kona-gpio-fixes-v1-3-dd61e0c0a9e7@gmail.com>
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
In-Reply-To: <20250130-kona-gpio-fixes-v1-3-dd61e0c0a9e7@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/30/25 09:10, Artur Weber wrote:
> Add a missing newline to the format string of the "Couldn't get IRQ
> for bank..." error message.
> 
> Fixes: 757651e3d60e ("gpio: bcm281xx: Add GPIO driver")
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

