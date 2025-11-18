Return-Path: <linux-gpio+bounces-28695-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C1277C6B402
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 19:37:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EE1BB4E7920
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 18:36:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8404B2DCF6C;
	Tue, 18 Nov 2025 18:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="VFMggGLa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qv1-f98.google.com (mail-qv1-f98.google.com [209.85.219.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587F52D94B6
	for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 18:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763490921; cv=none; b=ds71DPhobJgRncG4XkyfuUM7rD6r9kAupRJH5/clGZdfKGHlRSzViLhDTg9trm23WAM/FRp7bjL9Wnec0mknR+sk9KjDPJ50h6MfUx2rDG7IrrH2NIvEnrrAmoTI3a+m6msHaGl4xUDfJca4BM0+O25S4reHsbawhJDIAOJ0ZOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763490921; c=relaxed/simple;
	bh=EJ50Gm0aIYUS9tCqR37i55xeKh9MvLGcTNJmeFc23Qs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OL2zWwlWOD4tTuzvVDMjvf3nWnN1iYY0/RpCh3J64Qc6zPHgU6ToF54kzqqSnejzsZBlptqKoWNc/sdg3ws9Bvei0X2chOmR0GYIKd81SIduLYeKHF0xhxUfP4iqLjr8zkTcAjR/vLGmdQn3rmhWIoVt0Mdqh1OS5pIxdJcv0jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=VFMggGLa; arc=none smtp.client-ip=209.85.219.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-qv1-f98.google.com with SMTP id 6a1803df08f44-880570bdef8so56261986d6.3
        for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 10:35:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763490918; x=1764095718;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6escJsy+cDt/xGuVF5sLz1hYdQq4kG1CujcTZp9D/YQ=;
        b=c+h89ct/HnH7Yu+XYTKnM/MnozutK50IsTHDCJlu5UX09JdUgJmfcWIyE2Erm9GEn1
         S0syPT5rDNw9pqND0adWLVt2EjKAiOkiNkl8fvybJd0DkbTSCBO1CXQC+TKQurLtj80k
         SVH/U5Lxym1zJ2fIDCnyBfvSV95y8mTTBJaQuJNBRwBVUQMy2nAWDijbUmBaaK90cCnJ
         cPy8Rj77wc3q5zLv3k0HLuEuXaTmXqUGZrvPwX8wgCdW9vHHCTDLOxaBlXwDV7/YgbPZ
         XTBDqOz4ygWTPpjcO3unX3xJoSRRN5aOvEazrnk2bKNB6dTCyroHZ3PAEQo38x5W+VFM
         LLtw==
X-Gm-Message-State: AOJu0YytlpCxkw8lFb+oyfncCefCgZ7EBpxdpNRZxozFkU8S9P4f8mcS
	vgz6p51HP+x7csjTWpvVlMpU2yvlUSlZuXUu3lNf4kID7o/8nMRn9ni9Nf3J8AVaukUmpZ4vUvi
	FuF0XFSROakXK6MS9bDZ+rH+pAsktpUL/z3iJUAXPgcsbos1Wey6Y5l5OLk9UK7MQ2uLSpbcC9D
	oJGSgK9nMu74ddJx+WVoW2W12MeAQ82GzPQyO8zg3RIO/bptn4CQSBURBT/UVgFuYErprQOp++x
	la88EK14Aixvd9XnM+/iQ==
X-Gm-Gg: ASbGncthmKT1ITf56aBMm8GwDpn+JOsAZzuStrDIHSEsXsK5E5x0sz46ODJ0PHIQ7BU
	eyyjrtaeLI5CBeSRCAn8lPOHNw3M1iI7wm89Mps+PcrKPRK7SSHwb329+vsoxXC1tHBkhLm6zAm
	rSgQM/Tu94kplAKx0KN1RnY6hp8nTL2vkK0jIFYGvgNbCVvZC+LuFJoa6HYZsIzyNUsmR1zU1cD
	G8xbhba9EUc2I69eRuQT8A4pO36TbOdpXkJxl/PawOVJMQEcX0heqjJoGXDCA4FhCAEj62Zxbqz
	YGCe0/+xnZ4KlX7aRyB7P5iuJxeoVzJzcG0DMDSX++BAU4yMlMhKIq8wVUaidVk4rZZ4y5pHpUc
	xToN9L8Pr0eE+Zs4MC+X6Qx1dyGwDrF3NBpKIl3N4kvX8rBpNUOeZLcjpyhk3BVj3i3RVMsUKY2
	6YXehybO8jqtdqv8ynQdsdTlkKAahVmtSI2qhf7oEPcRcssim692B3
X-Google-Smtp-Source: AGHT+IGVX93qH1zGbGCS/+nGyhRJTqAalQxrojxOnWStG+mdpTRnJfk18VSfDFMlfXOo1A1ec3MykQVWqfk7
X-Received: by 2002:a05:6214:1c88:b0:863:5c7a:728c with SMTP id 6a1803df08f44-88292658f54mr238355126d6.34.1763490917772;
        Tue, 18 Nov 2025 10:35:17 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-103.dlp.protect.broadcom.com. [144.49.247.103])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-8828653a426sm20365016d6.16.2025.11.18.10.35.16
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Nov 2025 10:35:17 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b993eb2701bso5730138a12.0
        for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 10:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1763490916; x=1764095716; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6escJsy+cDt/xGuVF5sLz1hYdQq4kG1CujcTZp9D/YQ=;
        b=VFMggGLa3J/NDys4Q+IExS5At5YfQ+XQBDnesoI83fG33JFufRrQi0YDn5K3SOhvxl
         2pRvhrV5MnYsUlmHemxlsskAJXt5H1d0/KUnfPR57xIF59Yeid/2xAnMjiZihXln7oKE
         p30foitJpD5W5Et/UMospH+ZYZRLCFejHvePw=
X-Received: by 2002:a05:7023:b07:b0:119:e56b:98b9 with SMTP id a92af1059eb24-11b41306c47mr8310671c88.32.1763490915756;
        Tue, 18 Nov 2025 10:35:15 -0800 (PST)
X-Received: by 2002:a05:7023:b07:b0:119:e56b:98b9 with SMTP id a92af1059eb24-11b41306c47mr8310641c88.32.1763490915104;
        Tue, 18 Nov 2025 10:35:15 -0800 (PST)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b0608860fsm52865160c88.5.2025.11.18.10.35.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 10:35:14 -0800 (PST)
Message-ID: <6466b7da-eb8d-41d3-b3d5-9845eb6067a2@broadcom.com>
Date: Tue, 18 Nov 2025 10:35:11 -0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/15] gpio: brcmstb: Use modern PM macros
To: Jisheng Zhang <jszhang@kernel.org>, Doug Berger <opendmb@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Hoan Tran <hoan@os.amperecomputing.com>,
 Andy Shevchenko <andy@kernel.org>, Daniel Palmer <daniel@thingy.jp>,
 Romain Perier <romain.perier@gmail.com>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 Srinivas Neeli <srinivas.neeli@amd.com>, Michal Simek <michal.simek@amd.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
References: <20251118003229.26636-1-jszhang@kernel.org>
 <20251118003229.26636-3-jszhang@kernel.org>
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
In-Reply-To: <20251118003229.26636-3-jszhang@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 11/17/2025 4:32 PM, Jisheng Zhang wrote:
> Use the modern PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.
> 
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Acked-by: Doug Berger <opendmb@gmail.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


