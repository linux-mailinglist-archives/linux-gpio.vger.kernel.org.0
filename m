Return-Path: <linux-gpio+bounces-15093-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A40A221D4
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jan 2025 17:36:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0EEE18852E4
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jan 2025 16:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27EE91DE4ED;
	Wed, 29 Jan 2025 16:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aSPa5kCS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EB42FB6
	for <linux-gpio@vger.kernel.org>; Wed, 29 Jan 2025 16:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738168567; cv=none; b=sxtzJJjcsiuWSluiAurgYKDH3v2RPzKOmad7TRTcmhdv8KVIUHBr40yANtch0CIqJsEBwHZVDpbO5HnDJwzxA3P4EprVE2d94BGGlyyk5tVCnFAdy5nTc6VUyaGJMuh24xPqdoeUfDY8Sw+ukWyOSud8OPPCQDH46xqht6oLfH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738168567; c=relaxed/simple;
	bh=KMxVq3VCe3NHCQkw0rBzPeUmSkoGnpXelfGxPInrEvM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UqnI4LbnCwFWSSAL7TsOK35aqz5y4uSjhcRFhVuSx6PgDvD3pQjgDo/peQjrOaDQLpkyrRk8swf5UtUq2hkxWMda0qLsDUck5uJ86hcZ6VAB4Fih1+TS4Pi0cTCQIWTm+Vu4ed12OEG/YhwsqZeXQQQpqzr8C9CpCo5o5NfKDas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aSPa5kCS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738168565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VQij+jRwi8uf9NqssR80Ps4E9lnIEVXXYLT4uU5SKVY=;
	b=aSPa5kCSWvFECCi6z2bHBR6cERgN4oTOtlgFzXga7JURYxvnh+KfhbsieaI6uOnxQa8xP3
	h7hM4cr1aRqWzyc3XWAI1hk8bDB+9gpdlKk6mO9p9IVMqMgW3LV5XJTj8ygozJIbOQOjIV
	qpt/ZFrT4XT3GBsUcKlKbu7M/YM29tQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-53-NzTvXmVXOQ2_kYjn2jnQOQ-1; Wed, 29 Jan 2025 11:36:03 -0500
X-MC-Unique: NzTvXmVXOQ2_kYjn2jnQOQ-1
X-Mimecast-MFC-AGG-ID: NzTvXmVXOQ2_kYjn2jnQOQ
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ab6930f94b7so395842566b.1
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jan 2025 08:36:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738168562; x=1738773362;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VQij+jRwi8uf9NqssR80Ps4E9lnIEVXXYLT4uU5SKVY=;
        b=WCq0FiD21onrIt/Zkpms/mjMCEmnAv1R92AEhMo3zzNSZ5OdX/5UK4rRQoir7kSELN
         IiRCo+1l+XbUvUZbTj8270QwdN0uTY3flH94gcotrPB8eoimuYYUA4tVkcjWdSh+utdu
         qqAkGdfh+EnrejGS1lkP/E4Hm1INTFmOIdWvbr58VtfTOOloQreBZHRkrMHrVThTnzrl
         fJmAlwpK4lkTS+shrVseg+1vz/JyRS5OwlYLQIJ78dpRSmJXqgs9vCF6OQXq5qsQ6BSe
         gZ32f7BTup7QwiHpLr9J1yOvt9bNm4NV3DGzl2u0lAiMVs0Q4OvD18hTxl32Ez5UsmPh
         VmqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbPjg3/99COo61sK+D0NvgQ4INXe8U2T0LQhzvUNh2xdGNrY/9nef3Pq/Uunodblu/KrOLO1TNB3DB@vger.kernel.org
X-Gm-Message-State: AOJu0YyqqyCIqSNDDR5re0CcefmYskn/rqfqq1VdhdNRI5szFCwFF9II
	qCwXVRCpOAoVWtnzEkQVYIcOBWQfx58zTFkAi+eSEJ+oRQN7SXgaOMMnm0bcQFOBTQMFLW/8pZ/
	runt0wePRN2RSeH530EkBwxZxWQ+V1VseXhj3hMEexsdePFP2vulWS+jwNT0=
X-Gm-Gg: ASbGncsQEqUYL0k2GLNqepMY1bCzN3On8YcuJImJHzRq+WeIcQLB3OiGx+DWQSdrTq5
	xOgkplx/d2SpVrjoPrApCLV0dzC8ItEeIvTKfimeFKbdDDRL61aRbjgX2wHIYbdLA5rEFcTCkse
	W/wf7vmECNp9DmWlUrf4RZyxRM7316ZBq8DjCIYsnSIqVbfarUU5uheY0fBF2V02b1eRN+CdsJa
	0z3Url/F/UxJkUil7Suht5uupn/vxpo861wQudOzm4YGUwRtdXxkiWkpBWc2Ayy1Giwgt0RYId1
	v+W1ccFbHSe8EhmKQIZSN9iYEv9L0fD9rPoTvoD4hUl/W9K1igcBA63/XknRvOXYPT+0fISctvy
	MXyFrVqfsMZwYqTkZAmaFqPqYT1PskuQu7iWlD5u1D3Hte1pqYB8gDNg=
X-Received: by 2002:a17:906:c146:b0:aa6:1e9a:e45a with SMTP id a640c23a62f3a-ab6cfdbc62cmr351383166b.46.1738168562425;
        Wed, 29 Jan 2025 08:36:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGl2dfW/N/rtxcyfbfUg7clGzXzmhh9ZsMQ50bE8SGr3dboDOKlrBrYE+as0zTSOP8ANrn6Ww==
X-Received: by 2002:a17:906:c146:b0:aa6:1e9a:e45a with SMTP id a640c23a62f3a-ab6cfdbc62cmr351381466b.46.1738168562046;
        Wed, 29 Jan 2025 08:36:02 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab675e12df2sm1009755666b.12.2025.01.29.08.36.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 08:36:01 -0800 (PST)
Message-ID: <d7552864-9da2-43e3-838b-837ef3fa9f0b@redhat.com>
Date: Wed, 29 Jan 2025 17:36:00 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] pinctrl: intel: Unify the way of handling chained
 IRQ
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
References: <20250129145155.1746876-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250129145155.1746876-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 29-Jan-25 3:49 PM, Andy Shevchenko wrote:
> Some of the drivers are using the dedicated helpers (chained_irq_enter(),
> chained_irq_exit() helpers) and some relies on the specific implementations
> of the parent IRQ chip and its configuration. Update the latter ones to
> use dedicated helpers that cover all possible scenarios.
> 
> Andy Shevchenko (2):
>   pinctrl: baytrail: Use dedicated helpers for chained IRQ handlers
>   pinctrl: lynxpoint: Use dedicated helpers for chained IRQ handlers

Thanks, patches looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

For the series.

Regards,

Hans


> 
>  drivers/pinctrl/intel/pinctrl-baytrail.c  | 5 ++++-
>  drivers/pinctrl/intel/pinctrl-lynxpoint.c | 5 ++++-
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 


