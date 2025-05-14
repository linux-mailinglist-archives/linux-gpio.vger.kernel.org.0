Return-Path: <linux-gpio+bounces-20145-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C01AB687C
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 12:15:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EBE731BA06BB
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 10:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CE17BA42;
	Wed, 14 May 2025 10:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iVsAw0OE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704C414A09C
	for <linux-gpio@vger.kernel.org>; Wed, 14 May 2025 10:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747217706; cv=none; b=s+0MxkDTUPN4jYCDUdVCEf4USZ5WFua3FgE0yo5FO/NaPcqsWIXWVIb7l9ySWFJQDLOj9yZ+f35FYsmnh2LRtzcvxXhm4gVJM3lj7rw66iBFMg5/G0Tp4LqsT2SGAln6Vi4kcsuV17awZpOuLwi5QU64e0kxR1JEVrsyAsxmLRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747217706; c=relaxed/simple;
	bh=wDmraekW7m0pgFwPRFE4S7PnYUyPMFc7PeEJ7Alaud0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LeGhrooD+SmQVpTTA4kMSUZemr3dhc8ZihC/jRA7gHbRnrHSQy8UvYicjqQW0eZrSSYHPp2yYB2IJ/jKxyZT0boVgiMg+bSYqhak+yvbnTjuoUkEQHdBxjoRFGBFGDHBPX8ya2LzzyVQpnv2zFC+lJsyUXHnJfO2Qi7dPx/A3kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iVsAw0OE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747217703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K8LKDxEPlK0zUrqmN4DZvo7SZOHbpNlPdUFt+T51TxI=;
	b=iVsAw0OE2vGJCyUNvW6ugcxjU7vSSbGD92RyjT5sMmupNXNUIMZ88541/tp/VEhQ7n1qUT
	oyWnl0avt8d9/CuW1efMdgdTscgETcK1B+EEX2UgC5ldbk+X3PFwvq/x10HC/J02w9tfJK
	dbjyRG8CUIEO5V+pbDti8SHEJ2epFCE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-UQy9zZ41M8uNfWYn8J23yQ-1; Wed, 14 May 2025 06:15:02 -0400
X-MC-Unique: UQy9zZ41M8uNfWYn8J23yQ-1
X-Mimecast-MFC-AGG-ID: UQy9zZ41M8uNfWYn8J23yQ_1747217701
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-acb61452b27so731105766b.2
        for <linux-gpio@vger.kernel.org>; Wed, 14 May 2025 03:15:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747217701; x=1747822501;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K8LKDxEPlK0zUrqmN4DZvo7SZOHbpNlPdUFt+T51TxI=;
        b=fytx+ybRwcntXtgMB1LCm2WWnivGtkhT/VdJmNy0R2mlgSpNKUqQFzOTGy4YFO1FM6
         mGQ7bLakQ2ECOrAX92P8kMNagItqvw+XDjPueqZOOFi8kP4UPdGNBGMInhkNRzjII6OQ
         K22wzJhPRh01F8Rm7/qMgASTRZl3gamZs8ezSZbVLei6MbV6UNQeDND4XmrPlMOSrs5Q
         wY1NjNFrt6hu85NztsUcwVh7LTTD9vIt5hwKotd9pe2WK9lGqZ58bDnVH28myXoNYCWa
         HdV3Y43k98aULvU7h44nsjqEBoHXei2MsAnXAccvjgiCkpVzkyhaEg0K6hrUai5X/CPn
         5FdA==
X-Forwarded-Encrypted: i=1; AJvYcCUXfy3f66yyySifv2lev72prj8kJzEr2lAVFWoMFgJ+sGHMSH0WPbsMY231yNupUW0j8GvJmtEgfd/S@vger.kernel.org
X-Gm-Message-State: AOJu0YzrQhkmGgNQMNIGq9wssO7P8Ls2uiHBz5ynarh/m0y/i6Hc6WtQ
	Se0w2zFGSrLQDOfb64V5p4qtcQcviy+WSiwK+sfSRE7KvB5zSbctU6MEQDGNA2AwDQycOS9lSOX
	+pSkmcQxhO73GvlzxszDhoGz8ifXlAvEm+drW8Ig/JR9iczxqfxIhON9KxhA=
X-Gm-Gg: ASbGncsjAJB4GYRm4ngC5HscyytEF+mP21IIc9P/IPB6wX5SLt/+IPo/1E+shcuGAff
	FR4ZRl7aJ7mfFkgAMOidXQKqJ/1w5Yhnkpn1QrALMuYe/M3AP5EXy01c9Xg9XYjuqTFaQOQhTCa
	Eco0z8zN+vtfbz4DkHGZVFVpLZ6zCsI3pBpw8PfERA5PVlmhmRoTYV4fmD2LjH/+bK7u18uwJz7
	v7iyrckH7RpFPDo+PzGMTaLMCt94K5M2IGcVNAPmR2kyx4blqUNgSrMcGDy17FAcUwom8V5ZUTS
	nGz1O9SY4gUY/oJwaQ==
X-Received: by 2002:a17:907:96ab:b0:ad2:293d:166e with SMTP id a640c23a62f3a-ad4f717a571mr262750066b.31.1747217700922;
        Wed, 14 May 2025 03:15:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHL7kdzll3t4oQ25ZYCbLYS9k6oyFJfi2q4wOT/F3rxR/d4Hx5O00NDK2zGNm+A5NAW2+hs3g==
X-Received: by 2002:a17:907:96ab:b0:ad2:293d:166e with SMTP id a640c23a62f3a-ad4f717a571mr262748266b.31.1747217700550;
        Wed, 14 May 2025 03:15:00 -0700 (PDT)
Received: from [192.168.37.224] ([109.36.142.219])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad21947acf8sm912226966b.85.2025.05.14.03.14.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 03:14:59 -0700 (PDT)
Message-ID: <adda844f-1dc7-4c4d-90f1-ddba1c99be65@redhat.com>
Date: Wed, 14 May 2025 12:14:57 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/4] gpiolib: acpi: Split quirks to its own file
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Mika Westerberg <westeri@kernel.org>
References: <20250513100514.2492545-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250513100514.2492545-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 13-May-25 12:00, Andy Shevchenko wrote:
> The GPIO ACPI helpers use a few quirks which consumes approximately 20%
> of the file. Besides that the necessary bits are sparse and being directly
> referred. Split them to a separate file. There is no functional change.
> 
> For the new file I used the Hans' authorship of Hans as he the author of
> all those bits (expect very tiny changes made by this series).
> 
> Hans, please check if it's okay and confirm, or suggest better alternative.

Thanks, the entire series looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




> Andy Shevchenko (4):
>   gpiolib: acpi: Switch to use enum in acpi_gpio_in_ignore_list()
>   gpiolib: acpi: Handle deferred list via new API
>   gpiolib: acpi: Add acpi_gpio_need_run_edge_events_on_boot() getter
>   gpiolib: acpi: Move quirks to a separate file
> 
>  drivers/gpio/Makefile                         |   1 +
>  .../{gpiolib-acpi.c => gpiolib-acpi-core.c}   | 344 +----------------
>  drivers/gpio/gpiolib-acpi-quirks.c            | 363 ++++++++++++++++++
>  drivers/gpio/gpiolib-acpi.h                   |  15 +
>  4 files changed, 392 insertions(+), 331 deletions(-)
>  rename drivers/gpio/{gpiolib-acpi.c => gpiolib-acpi-core.c} (79%)
>  create mode 100644 drivers/gpio/gpiolib-acpi-quirks.c
> 


