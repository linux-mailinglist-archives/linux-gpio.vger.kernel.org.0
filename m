Return-Path: <linux-gpio+bounces-3664-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A2F8601B4
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Feb 2024 19:41:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A0B628723D
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Feb 2024 18:41:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0E3A1448F3;
	Thu, 22 Feb 2024 18:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g83gJR89"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DEA1448E4
	for <linux-gpio@vger.kernel.org>; Thu, 22 Feb 2024 18:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708626803; cv=none; b=YjN8ynp1eg3qyYaJno/yBVQs2KR4nV3tT1Ot/noEakwK9A1HIeONPEfpkwto1C1Lg1vm9pN0/p6/YzRsqQxH9XtpB95IxUuE3ft10TxEUUpO7pBxbfrMYhEYHMbxcPfp0Owj2fc59mR51gzz1RkyQNZAv/Y/1iMOvD/xFcmiaIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708626803; c=relaxed/simple;
	bh=XSQAUK/U55m0KLayh5Wo5le7Vj1aHM53DbCd9IqoMdU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=teXSBf7iuVOEwbTEghPwiU5xPAeBKQ5UeRzOCfOSBHrDT/QO5OUzrIg0fZtBllo9OJEjt4dWGgw9tpLG4cI0skDqu1P2HgDUh4+CnHP3Vtn4+RY62/9pgDO6EDGqayGqTEJv6JsBj6i6XmlRu4049H3BzS6OYNHHohKbPida+8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g83gJR89; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708626800;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IDF5rof44gEIb9jX4TIDVAFNvDzRBoYmWa48QZ9r6nQ=;
	b=g83gJR897ZwJ8rUK8X1YTLxVGhoTuOhG56I2tSszT+J9GWM2FdvaR++WIq28LNW0Hy2egM
	kaGysJ/uG6CthGSsm8gZUa4h8CJyi+sFVtoPDIiZsyRZGNXX3kSvJBtPE4aaUj3CYTVTDe
	ji2b+4QZJvKMaFNGY4HLkK3kUzHtaog=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-300-wHYD67TnMhC3L2JVnM_m0w-1; Thu, 22 Feb 2024 13:33:18 -0500
X-MC-Unique: wHYD67TnMhC3L2JVnM_m0w-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a2f1d0c3389so3702266b.0
        for <linux-gpio@vger.kernel.org>; Thu, 22 Feb 2024 10:33:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708626798; x=1709231598;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IDF5rof44gEIb9jX4TIDVAFNvDzRBoYmWa48QZ9r6nQ=;
        b=aVzpLW6Pvk6FsQCk3KO1JnVitzSs9G8TC8ZkzXHZXnQAiToo/aZ/MmnoIEtNyYOXg2
         1hW03mKNOpkmdSICNt+MtxkV9RlDpZdw7bHPcILyAcUqpFhWFQ380EuE2ZQBicBNyxCH
         ZbH6P3snINGDTlHx4lm8tHuIPmHsRZg9btab+W2NcmoHCAWY5IiMRTlLfDBlJC7BftJL
         VXVD1XEeRB+1GEYsRx7IGey+yuGWiOpWgz1CItx+oEHI8uN9Et21Qa8o0A7VF7lba3+1
         lzBXkUs4MWGORSg0BijqFlRlYn6kBjf5A5Mw1gUznOnZldkdj9zUI//DV1u7cORsQK8d
         WD9g==
X-Forwarded-Encrypted: i=1; AJvYcCVne6XRfuE0rygMD2rtS/ouBIjmILKfl/fpkF1anoEF6U/oTH3Qt2qXBzgTk9bI1SxfmDMWKNzHYEJbjWlUkJjX4yFsMHyzs2p9CQ==
X-Gm-Message-State: AOJu0YxTXTyXPLcoZ+Dy3drjGJLMNsF7D9Gkmi8pzekDsvUGYxF7zxYt
	QaUmieI95u2UYpF/uZM6ojjtgRzgCgReivfCXtSUuIK0PP880Y8KR53R04XrpCor5ZFxPu3ag7Y
	/Z/xuiqryI9v+OgkXR0GQy3X8Hx20IO3lR8bTnQ9c4ZO5pl0ONrNrVqYrwCE=
X-Received: by 2002:a17:906:3b52:b0:a3f:1ec7:8765 with SMTP id h18-20020a1709063b5200b00a3f1ec78765mr4781459ejf.8.1708626797726;
        Thu, 22 Feb 2024 10:33:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHy6MVM+yU0ergPm1eOLv+jCkZxkYnKmu7DqTz49UohXBGjHmSJ/pKffRukeXLaaXuaiUR+Cg==
X-Received: by 2002:a17:906:3b52:b0:a3f:1ec7:8765 with SMTP id h18-20020a1709063b5200b00a3f1ec78765mr4781437ejf.8.1708626797348;
        Thu, 22 Feb 2024 10:33:17 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id lu16-20020a170906fad000b00a3d5efc65e0sm4854658ejb.91.2024.02.22.10.33.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Feb 2024 10:33:16 -0800 (PST)
Message-ID: <7013bf9e-2663-4613-ae61-61872e81355b@redhat.com>
Date: Thu, 22 Feb 2024 19:33:15 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] devm-helpers: Add resource managed version of mutex
 init
To: Matthew Auld <matthew.auld@intel.com>, =?UTF-8?Q?Marek_Beh=C3=BAn?=
 <kabel@kernel.org>, linux-kernel@vger.kernel.org,
 Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Oded Gabbay
 <ogabbay@kernel.org>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Aleksandr Mezin <mezin.alexander@gmail.com>, Jean Delvare
 <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 Sebastian Reichel <sre@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-gpio@vger.kernel.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240222145838.12916-1-kabel@kernel.org>
 <03e62bcf-137c-4947-8f34-0cbfcba92a30@intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <03e62bcf-137c-4947-8f34-0cbfcba92a30@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 2/22/24 17:44, Matthew Auld wrote:
> On 22/02/2024 14:58, Marek Behún wrote:
>> A few drivers are doing resource-managed mutex initialization by
>> implementing ad-hoc one-liner mutex dropping functions and using them
>> with devm_add_action_or_reset(). Help drivers avoid these repeated
>> one-liners by adding managed version of mutex initialization.

<snip>

>> index 74891802200d..70640fb96117 100644
>> --- a/include/linux/devm-helpers.h
>> +++ b/include/linux/devm-helpers.h
>> @@ -24,6 +24,8 @@
>>    */
>>     #include <linux/device.h>
>> +#include <linux/kconfig.h>
>> +#include <linux/mutex.h>
>>   #include <linux/workqueue.h>
>>     static inline void devm_delayed_work_drop(void *res)
>> @@ -76,4 +78,34 @@ static inline int devm_work_autocancel(struct device *dev,
>>       return devm_add_action(dev, devm_work_drop, w);
>>   }
>>   +static inline void devm_mutex_drop(void *res)
>> +{
>> +    mutex_destroy(res);
>> +}
>> +
>> +/**
>> + * devm_mutex_init - Resource managed mutex initialization
>> + * @dev:    Device which lifetime mutex is bound to
>> + * @lock:    Mutex to be initialized (and automatically destroyed)
>> + *
>> + * Initialize mutex which is automatically destroyed when driver is detached.
>> + * A few drivers initialize mutexes which they want destroyed before driver is
>> + * detached, for debugging purposes.
>> + * devm_mutex_init() can be used to omit the explicit mutex_destroy() call when
>> + * driver is detached.
>> + */
>> +static inline int devm_mutex_init(struct device *dev, struct mutex *lock)
>> +{
>> +    mutex_init(lock);
> 
> Do you know if this this needs __always_inline? The static lockdep key in mutex_init() should be
> different for each caller class. See c21f11d182c2 ("drm: fix drmm_mutex_init()").

That is a very good point. I believe that this should mirror mutex_init() and
the actual static inline function should be __devm_mutex_init() which takes
the key as extra argument (and calls __mutex_init()) and then make
devm_mutex_init() itself a macro mirroring the mutex_init() macro.

Regards,

Hans






> 
>> +
>> +    /*
>> +     * mutex_destroy() is an empty function if CONFIG_DEBUG_MUTEXES is
>> +     * disabled. No need to allocate an action in that case.
>> +     */
>> +    if (IS_ENABLED(CONFIG_DEBUG_MUTEXES))
>> +        return devm_add_action_or_reset(dev, devm_mutex_drop, lock);
>> +    else
>> +        return 0;
>> +}
>> +
>>   #endif
> 


