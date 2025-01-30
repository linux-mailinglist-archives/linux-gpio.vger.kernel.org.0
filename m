Return-Path: <linux-gpio+bounces-15115-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BBCA2371B
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jan 2025 23:13:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08E2B3A6B89
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jan 2025 22:13:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 393631F1908;
	Thu, 30 Jan 2025 22:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Wut1mONI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AAEF1AC884
	for <linux-gpio@vger.kernel.org>; Thu, 30 Jan 2025 22:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738275190; cv=none; b=eXl1lhIsmcDmoJLNqu1kTuZC4tAeVfQm/anCsqkRBee7e7Cjcdyz0bBOES9vZt3QK9IQUB78mw3YWK4wzrUy63wWl8dCuKoYQ6LW2+/Fy588f9aGD690rZn9pNIti3/NUx7qwKjnosaG/9w1xpT/WDWh+MjK02f+wl8/lQoR1d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738275190; c=relaxed/simple;
	bh=ZV6FlMXD2252vz0OBq25tRE9rjj2v6FTayK5muBz2Nc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RYeZwAjlXF3+w4bkVnkSjBfUNHmKnGR5QJAsgGEQtXYOQPQOOv87ZE3PR5z8+Tir7II8fPh1+a/NYMx18cZ37N1aXDsRpUXXLgOvzTn/6aqcsPrl8L42sgsWUy1Oka7z3SL3A7SbiJr/tQ4ziiszb1BrZj/Kh5+hgJJC9RbYVxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Wut1mONI; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5f89aa7a101so537290eaf.2
        for <linux-gpio@vger.kernel.org>; Thu, 30 Jan 2025 14:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1738275186; x=1738879986; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=M3RknPmbAgH7Zo71GAVzAj0fabQZcf9EFTBkp1G+LJ0=;
        b=Wut1mONIFZ/PLmlb6mRYJmTNMTkZV1ui+WXvSJsaHJN5H2QMEUYzPAWuaIZ4O5OYfZ
         MrDwBb4ZpEIW219rRrujGSQNZUEFj1NJ5fFoMR2JcU76BPKS57hZ/Q+TNnKhR3JZYqen
         n7XLf3OCUTsnII+FKEE0m/rgsXs+b8a13m0M4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738275186; x=1738879986;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M3RknPmbAgH7Zo71GAVzAj0fabQZcf9EFTBkp1G+LJ0=;
        b=dHQOVUQWTxdm15QZJ8Yka3khujgdCo2CFZ9A2PrpG963Tj4JKakn+igBMaZz6Il9XP
         tiF0GM6LhyjbA8Fux9JnsNWLZ5Dp4l5W3yV31KJKqSMwqaaPb9N340hOaNRZWkLG7kZd
         qg2latU3T6It2NcCKRYbVAulCWLsmsdsPoiDACLYT3ri7BpPknCUm6xoFDUUH59QFPcU
         5OSmuiRdxUiJmuyXXjBrTRC5jCtwXfL6Y4Bj7TmJNKP1BQaWbfutmKxPgYSEdKUYqxAO
         26ZWGkariBtis6+93C7cV6v4eShctbxW8n8dQjsCUM0o+QVC258BAsIdROmlTTZqWMue
         jDWQ==
X-Gm-Message-State: AOJu0YyzPl/M0eb/0wuvnj+3kGCPsSC1S6vdib9ezBzFkhkxswBwCsng
	Hm5MfG8yBU6ggtEpEnLWFAMH3Hb7m570gxZ5MmV4/yiWr/tMJBSSKV2FL7YUOQ==
X-Gm-Gg: ASbGncvD6Jrl7bf9qkRW6Ef/+gu3mfuV1D05eHzRvfTQ6QfCtfXRJpZaZWOlWqaApK+
	Xqztrjo4dZyIh2uwb75BS5H2jft1LZeulETFA8GtDtUhG5Y6Y4G4X+TSj5OO5jBbvKe14r3LP43
	jkaRWfT06FI6S17FX5P3sweMwOpNCAQM7/qOR1G48r1rrjDhXeA/0BTrif3gp53oB79Vna06Hld
	1NDsLkSRqh4Bt+utLYv9n9OsY0HOiwABMJtS/lncrTVwe7K3M7SbDAMeRqIVYtiFmDlsMyTvGkB
	OzP4kVhYvwGb/3ILDgFd0TSfeP8XdzJnUoKtDcndUoqyPWmgcUSjYJs=
X-Google-Smtp-Source: AGHT+IGEOfUHHL4aDQshI1kV0F2HcWh2MzgUSVtxSrQ5ZrGN+EAiOGyR9TNTrD4etw5eNv69qLkhog==
X-Received: by 2002:a4a:e90a:0:b0:5fa:840b:19aa with SMTP id 006d021491bc7-5fc0031b4a8mr6402835eaf.4.1738275186130;
        Thu, 30 Jan 2025 14:13:06 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-726617cb804sm528520a34.15.2025.01.30.14.13.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 14:13:04 -0800 (PST)
Message-ID: <356d5a78-85ee-45ef-90a4-b88dc1a3448c@broadcom.com>
Date: Thu, 30 Jan 2025 14:13:02 -0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] gpio: bcm-kona: Make sure GPIO bits are unlocked when
 requesting IRQ
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
 <20250130-kona-gpio-fixes-v1-2-dd61e0c0a9e7@gmail.com>
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
In-Reply-To: <20250130-kona-gpio-fixes-v1-2-dd61e0c0a9e7@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/30/25 09:10, Artur Weber wrote:
> The settings for all GPIOs are locked by default in bcm_kona_gpio_reset.
> The settings for a GPIO are unlocked when requesting it as a GPIO, but
> not when requesting it as an interrupt, causing the IRQ settings to not
> get applied.
> 
> Fix this by making sure to unlock the right bits when an IRQ is requested.
> To avoid a situation where an IRQ being released causes a lock despite
> the same GPIO being used by a GPIO request or vice versa, add an unlock
> counter and only lock if it reaches 0.
> 
> Fixes: 757651e3d60e ("gpio: bcm281xx: Add GPIO driver")
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

