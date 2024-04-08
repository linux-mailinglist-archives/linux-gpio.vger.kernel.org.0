Return-Path: <linux-gpio+bounces-5191-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A93889C83E
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Apr 2024 17:27:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5643728600A
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Apr 2024 15:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 485F2140397;
	Mon,  8 Apr 2024 15:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bJ4f8UKK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5E613F443
	for <linux-gpio@vger.kernel.org>; Mon,  8 Apr 2024 15:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712590072; cv=none; b=lfIoLZO0ouELl8H9CPnb7obuxabkgB/P+PepjkuIBXjNl0rFq8o23m0gKlWmFDGNQ23An4aytfW8qy3ejU9+6c8AiDVtCnkI8B00t1VffACR686uhRw5QeUFbhR8zfV0XMqjrebFicO5jH1P1p1qG4dX6OFzGS/QvzVcOzxNObg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712590072; c=relaxed/simple;
	bh=mlVW9Me+XbweFyG9F25yRrb5gzakcJA4MSi16ccv36k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NVcircL2LA9ATeqo+nBjgbSvpufhxbfM6UIrvz4aX/07eTtBtzgec/bHMz2TVi1Bp9Z0kPubSJlRB8806dVLmuJz0du2t0BSoyDoBbw4mhRoRlSiSrLUBOn0tDbnW+KWG8NzL5CwAIhJbimWQ3mUHj1b5WjQJGgqF9KIrJ+EkAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bJ4f8UKK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712590069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x9lmgoGiJPBgqXYheNnhSIDVhxfqRrXJG/Rw0VMx+Zk=;
	b=bJ4f8UKK8x1yH9MPTrKgFmIRsGcZnxsFpI4ajXs0l3Xd9Z9Hazf7W54nVRYZ6aIKmshx11
	aICKQ8htF/ZzDtr/KOrnmOS8glikGPDI+RdBc2u3NVrBq+FO45BzZASUvUucNd/Tq9zLv5
	cpGo6UGBeRg5l6xZwq9mc5x7TPvbTNw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-691-48yLwpczOSOWeZFi24qAxg-1; Mon, 08 Apr 2024 11:27:48 -0400
X-MC-Unique: 48yLwpczOSOWeZFi24qAxg-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a51d062b178so77121666b.2
        for <linux-gpio@vger.kernel.org>; Mon, 08 Apr 2024 08:27:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712590067; x=1713194867;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x9lmgoGiJPBgqXYheNnhSIDVhxfqRrXJG/Rw0VMx+Zk=;
        b=GiHfJwUy6W4tbADerqgYA4YB1D9ef+Pf2I0z7sb+YT8vdYOvgRxxKGYGTtX4W11ocZ
         bbVLqioqm7ZiIR+xUS0DKLBA7ysWPMGp50tfIpAc+93FG+WWBZ2H6G3Gar532vTCesU0
         L3WrC5Zxil1rBUN8mMvfNUJiY609Fakkwg6X/8dtggeb58gQPkdQsvdasdoVF3x9noV+
         C9bDbzbAIX2l6J1Lw+q8Etkenq/UdM+eHs7TQs5dJHoojLsIlY8hxb8vi8SjISBfP4st
         MZcaN4gyROZQewdZZE4gkoQJFnOprVquNmo0KLBTzSCD1vRU82+EsEnTjiARm1vViFa3
         Hb3g==
X-Forwarded-Encrypted: i=1; AJvYcCVna09dhblkF28Bmxbc7PNCAWK3wL81f6yG5ZsTbAugadAzKy0x59s1krKEw6L/YLZs0BkoTOkGOH785tJY7DSq1vs8Ho87WCehtQ==
X-Gm-Message-State: AOJu0YxK8RipvxAG/m2Bv14lpONcwqKEn7uDBPBz0B+xf32b5TGNGxtT
	k0aY6mguuJ0uuQZ+trqX0FfE6VyT0CP6w08SPq2Lqeb48ttSKloC9JU12tJ16pX5wIKY87FC7S7
	o6dCU73dUyDjTtD3GQC9QDtmmN6HL+nyNRz1ktOoiFt8drOeTwL+IYsw+SRY=
X-Received: by 2002:a17:906:340f:b0:a51:d235:74cf with SMTP id c15-20020a170906340f00b00a51d23574cfmr2674298ejb.38.1712590067150;
        Mon, 08 Apr 2024 08:27:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEI/VwBmMFdArbHeoBDZ2t7a+cc1SsBqXDZl12Lkul3tuzGYitmToVfeIox5n1MLEEUok7krw==
X-Received: by 2002:a17:906:340f:b0:a51:d235:74cf with SMTP id c15-20020a170906340f00b00a51d23574cfmr2674286ejb.38.1712590066822;
        Mon, 08 Apr 2024 08:27:46 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id qb34-20020a1709077ea200b00a4df78425dbsm4496079ejc.36.2024.04.08.08.27.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 08:27:46 -0700 (PDT)
Message-ID: <01494b5d-b7de-48b7-b68b-69a32da9fa5b@redhat.com>
Date: Mon, 8 Apr 2024 17:27:45 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] mmc: core: Add mmc_gpiod_set_cd_config() function
To: Andy Shevchenko <andy@kernel.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20240407200453.40829-1-hdegoede@redhat.com>
 <ZhQL7KmvVYgRpz46@smile.fi.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZhQL7KmvVYgRpz46@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/8/24 5:23 PM, Andy Shevchenko wrote:
> On Sun, Apr 07, 2024 at 10:04:48PM +0200, Hans de Goede wrote:
>> Some mmc host drivers may need to fixup a card-detection GPIO's config
>> to e.g. enable the GPIO controllers builtin pull-up resistor on devices
>> where the firmware description of the GPIO is broken (e.g. GpioInt with
>> PullNone instead of PullUp in ACPI DSDT).
>>
>> Since this is the exception rather then the rule adding a config
>> parameter to mmc_gpiod_request_cd() seems undesirable, so instead
>> add a new mmc_gpiod_set_cd_config() function. This is simply a wrapper
>> to call gpiod_set_config() on the card-detect GPIO acquired through
>> mmc_gpiod_request_cd().
> 
> FWIW,
> Reviewed-by: Andy Shevchenko <andy@kernel.org>

for just this patch or for the series ?

> assuming you considered addressing nit-picks.

Ack will do.

Regards,

Hans



