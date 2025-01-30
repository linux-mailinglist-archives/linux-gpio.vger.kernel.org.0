Return-Path: <linux-gpio+bounces-15109-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 303F3A236B9
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jan 2025 22:33:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E2593A3149
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jan 2025 21:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CA651F1521;
	Thu, 30 Jan 2025 21:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="dbI5No0E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5696D322B
	for <linux-gpio@vger.kernel.org>; Thu, 30 Jan 2025 21:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738272795; cv=none; b=gVsfI567CCIC9y9FoDnPey/xb2SWzY2rOu1y7fAbNCHVspnQP82CKrFrQaUm2PLn5qY1cxlE9pbPvpCgUP1NYH9ueGsP1ptS/J1cP5BPJlno3gLRb4iIYp71OnfGOjLpF7FOFoZjfbqNa7Dkdtkkg51od4v92J1sV6Rx3NOABpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738272795; c=relaxed/simple;
	bh=CA6nupbZUo05G5Iuc4kBMccAvvIoOja3loUSPbRfne8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c4G5E6Uelhl/08qgx3maGF9tU1uBpMqPtlqHigzy/ya7Y6fMGwZhSAQSdtbqDEB/uH9Zd2HkQnb5K5Ra+yX1ZvMYL9ZBZXvShm+GkXVyFA75MQ2duMu6GGORuA+hj8AOLlfIYJvIKAPDO/iwHsAbES17p1n12gjuU+w/E9d2zdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=dbI5No0E; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-71e1158fe3eso785743a34.1
        for <linux-gpio@vger.kernel.org>; Thu, 30 Jan 2025 13:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1738272791; x=1738877591; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZKkftTHEIQ8NUHqycqtSFEDm/0Wht2CIlZPfEKZ0mXo=;
        b=dbI5No0E5Sj0iz3jZCaP6KjIK4+tOQQWLoY+6dj+btmW+14JfIN1e4ykZ1xqJY3YIK
         uOkEjSyyXd0Yz9WtAyOhESifvWxmY0oHMhw5qmgUMqasMluwhuuPV2i7x7qfS0ln5oO1
         mT01dKMbrrAyWKNONsa8z5y/iiX5ldqoqHW9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738272791; x=1738877591;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZKkftTHEIQ8NUHqycqtSFEDm/0Wht2CIlZPfEKZ0mXo=;
        b=xC1Ibgt/PUgqUhD+iNuJzaHLWxl+yvvdl163xw4642DahU/rwr501VNWvdDg82Xciu
         aZHeZ76Oq58IE873FRNQ+RgnD5GUpkmrKVJa/IXVIGABRMeRRmgjC2YJEwLGM1BXNcXm
         aSjG2VqeTYNT4J4zegbkgZocALD6RDxKrXz1m6rGneVkcLxzCBVRgxUYU13siX7M6EYQ
         C9fq+cDuKYYn2+mPW3qAuBNU79EOLVQJpJqXtneVl5fDnOc8DLu7QW6PUjk2faHnTYFp
         IHttvHf31eQO3COBvGUhWAt6zqIuMKKfG2nAWUnqiBzC6AXKt/GmXSkxQU8SCj+8XBip
         qufQ==
X-Gm-Message-State: AOJu0Yw3aXu7zIIGhGYoyS7Trq30dX1fuAwLPBa3XxQhX/eRIMKkNSVx
	vg68OhXjwWpmyuwaNWtr7MrM4ckd/PHDOkc5+CnXX4kKiiT84mLD2wg+q5JLsQ==
X-Gm-Gg: ASbGncvqC+jqRcFwxD7KUnzewx5RIiNLHIEq9IFyOlMuKU1cjgu9ULiQ1ilLiAFSrGn
	96khlPcYGOax9PhFAO1Wd+xc8fSd5wKIV2QhOQtCdaoEpUOOdMbP6KwO5SFdVGcbbG1/05+UtLD
	9Ao3VxD7a8aWe8sj9RYWWzow1UPy5rn1tkQ+d+KNh8lIOTDCLxtQoHSCvThULjCJjVb5OJ69drc
	QDILhLIxSxF5i2oHOsN7Y9SiYyTfqVcg7Yti1RfxiSbvWqdepbIu6e+ceZGpjRbMECUKuPWZodV
	2PrdFKAbsXWiwmQZPZgO6C8NG5CcnfGOTjX6BzJr1PbYDrwK1C2hdEA=
X-Google-Smtp-Source: AGHT+IFOQsgC420bIwaDwZ9ScUNrgNM+VOWl+T2RCXC+4Y9wntTtyqlSsCdcsjQOSG+D2pf6mky+zQ==
X-Received: by 2002:a05:6830:61ce:b0:718:f57:11ea with SMTP id 46e09a7af769-72656758b56mr6177848a34.3.1738272791389;
        Thu, 30 Jan 2025 13:33:11 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-726617eb274sm511565a34.33.2025.01.30.13.33.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 13:33:10 -0800 (PST)
Message-ID: <b7662246-813e-4e5f-b41a-574751110833@broadcom.com>
Date: Thu, 30 Jan 2025 13:33:08 -0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] gpio: bcm-kona: Fix GPIO lock/unlock for banks above
 bank 0
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
 <20250130-kona-gpio-fixes-v1-1-dd61e0c0a9e7@gmail.com>
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
In-Reply-To: <20250130-kona-gpio-fixes-v1-1-dd61e0c0a9e7@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/30/25 09:10, Artur Weber wrote:
> The GPIO lock/unlock functions clear/write a bit to the relevant
> register for each bank. However, due to an oversight the bit that
> was being written was based on the total GPIO number, not the index
> of the GPIO within the relevant bank, causing it to fail for any
> GPIO above 32 (thus any GPIO for banks above bank 0).
> 
> Fix lock/unlock for these banks by using the correct bit.
> 
> Fixes: bdb93c03c550 ("gpio: bcm281xx: Centralize register locking")
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

