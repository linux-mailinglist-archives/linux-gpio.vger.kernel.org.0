Return-Path: <linux-gpio+bounces-17375-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC23A595ED
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Mar 2025 14:17:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA43B168F5C
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Mar 2025 13:17:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B08D522A1CD;
	Mon, 10 Mar 2025 13:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="U3CdV5B9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B96319F13C
	for <linux-gpio@vger.kernel.org>; Mon, 10 Mar 2025 13:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741612651; cv=none; b=ZvvBTwR8dM01o9Q0bZHWQ2Nes0TQcspkUSMz1JrsM4kIbc5qzU6mWKF2gdGACenhggKEOF8Z5uH19h0NYs2Fvzv6o83h7H8mwyzNk5SOBLJ8cFj2YQ0kqlGMqoy5F4jMnTU4lKPfAmCFPY/OqGOb018nhiQDsnujBCfANkZlyZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741612651; c=relaxed/simple;
	bh=mGnN7BFzBc1uRQ30QCiMw5aQuRpMADs6X0AFsOMKRRc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lHJ2sr1pas+CaUH/7y1xvPG+Oev4Ynhwh1HAh0UCKY9xhPumFQkIlgQhQkN6ze7VydZ/zPX4BU559K5y/DfzEs3vBHqvlZUws65kdqGzWRQCu/fdRjqMko0gF/uZsainvy7DqXIEbgSEf6NaNByWgf27qudbABBOaid+oOzLEkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=U3CdV5B9; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-72726025fa5so785231a34.0
        for <linux-gpio@vger.kernel.org>; Mon, 10 Mar 2025 06:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1741612648; x=1742217448; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8hVV9pYsXZmqC1J6J4fTFIaqWY5CQDoFFEox0FbshQk=;
        b=U3CdV5B9AYfiUIYVPD41IOQJUvlGtt5v4h4BxLGGpCa3/pvc/B6b5jqG+R67sZCzWn
         6RrPVk93QRFO2dtoxWffhjXZBsZq+jBHRN2KaoTJcq01Yy6Z49GQL1UkeE2aYU0Ow9id
         qlR2kW1FE916IiuYE9FjYXQb5jv+/HdTngwCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741612648; x=1742217448;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8hVV9pYsXZmqC1J6J4fTFIaqWY5CQDoFFEox0FbshQk=;
        b=OQqK0yUHIR3ljDB0qTD27eT5Vyxd8So0GSQiUygbaMYBXB8N6QmUzN7QH0wiGRN338
         KCSAfnUEDmFVxp1ci7qI8lDf8LA3EXeAUh+ZZevEGzbwWmE7aF2c+assO7xPy8kW/UqR
         PKIioBomzcV0QVN5KzX+LuT5RkewyZxYgn+7xHC7DiQOOY1slR5cOvlmrIwiKtFpN8pE
         R9q64kjOyGpwk++OatLlbUSwQCRdqUJHKeQZFpE8whbf56HrsBIiDYxvfbNrDmsOg1Hc
         StEdHNiFHUUqhPRvzc+YAVXqyoOqc/Q5xX8TprfZoiK/ObYwUnlcnstvRqmN7kMUxfq5
         zULA==
X-Forwarded-Encrypted: i=1; AJvYcCUVhJD/3iT6MH/5XdEq/VevhNGKQzetJQRpCPoiSNFWLNYHRyt7gNiuw/i0FTGTvEpvjcUYBCPuCeEA@vger.kernel.org
X-Gm-Message-State: AOJu0YwOb+GBvXjJelGNoxCZFZEzrS40Rfh0cUTeT0a3oyvieufCYkDZ
	haPayYLrCrTPA10WcblgwUv/ZoXnsskGZ2i7O0UWpVniNzmHuR1jI0fD45nvZg==
X-Gm-Gg: ASbGncs3w2s6Q87DcKcMp2UBkuMrEkRv7x8AQpQQpi46rqS6d5hZH/NuKyRKE6Q3aB0
	qWaokQoblfNPwwWqZVtNSxWyCoIKG+tnRueIZA7uEEO4SiD+nZsbhrvGKvdO1Uu/EtM+LepMJiq
	Uc9+oLmx3BPfpDP5ZPghqUHb0crqY9CsfY/lHFRxg6DpeJZN4hSkcNhdi48hBjHXr1GYDaZPwZs
	cHbXQpcRH31yY63mTlFJkLulVape6bXHn8WEYYGJ3Aow/UIXDsW3EaoxIkx3bivT8W0sQ36nqk9
	nPmCqEuXU2MSMOXHwrD3Qvkiq7cYAVoUyFm/85wQB/Q9R/T6Bgn2a5vx3D6ndL3lEQjzZV7EzB6
	u8RE0cY7Evn0ejTZM3xE=
X-Google-Smtp-Source: AGHT+IHOtYVjKASEmQbKJvWKm4BF6A5oOWYMfkeEhMYVuALyNuSXIsPApVmHGXH1sFnX9s2IVJE9HQ==
X-Received: by 2002:a05:6830:3498:b0:72b:95e5:edab with SMTP id 46e09a7af769-72b95e5f050mr450321a34.1.1741612648382;
        Mon, 10 Mar 2025 06:17:28 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2c2d1b00173sm207615fac.19.2025.03.10.06.17.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 06:17:26 -0700 (PDT)
Message-ID: <c55f5485-0a32-4745-98a0-d620e4a2c4f1@broadcom.com>
Date: Mon, 10 Mar 2025 06:17:24 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] pinctrl: bcm281xx: Add missing assignment in
 bcm21664_pinctrl_lock_all()
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Artur Weber <aweber.kernel@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, linux-gpio@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <dfc15d59-7fa9-4f96-aacb-37c3df6d420d@stanley.mountain>
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
In-Reply-To: <dfc15d59-7fa9-4f96-aacb-37c3df6d420d@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/10/2025 3:48 AM, Dan Carpenter wrote:
> The next line checks if this regmap_write() failed, but it doesn't
> work because the assignment was accidentally left out.  Add the
> assignment.
> 
> Fixes: 60d69769c851 ("pinctrl: bcm281xx: Add support for BCM21664 pinmux")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


