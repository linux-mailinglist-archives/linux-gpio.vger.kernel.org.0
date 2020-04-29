Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3553D1BDA0B
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2020 12:46:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726516AbgD2Kqh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Apr 2020 06:46:37 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:23896 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726524AbgD2Kqg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Apr 2020 06:46:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588157195;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CGFLKYqGYwTO8ngLreYeAL4zj+kJUCu0scJTKwhZKfw=;
        b=Q6+k0ETzKLtt5YbnNXpEe7oTh7Kokayq05Cg7PKN7xU3GsQbhifaCuSrUblFmu3HMN1Jpb
        mWghjD4KKaWOtBR1FQEL0ZkwAcHOMegIcKiAzA7xO8MkptVyTjJFSbtAGiRWWG45Kq1zEn
        uUTPTVrzM8NUTr/TplAAUIYQLTpX11k=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-JfS-MQodO1CfPt2qDV8A4Q-1; Wed, 29 Apr 2020 06:46:34 -0400
X-MC-Unique: JfS-MQodO1CfPt2qDV8A4Q-1
Received: by mail-wm1-f71.google.com with SMTP id t62so1043906wma.0
        for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2020 03:46:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CGFLKYqGYwTO8ngLreYeAL4zj+kJUCu0scJTKwhZKfw=;
        b=KJe2mgcvigAzRnsLuc/9R2vfCeGdWofwsbUSvObJTyhqC9YzPVQ/wJFEWjatpK718T
         HJ/BOH9ijXIPN3z0etLAlC2wzV96Xc9hWET92m8SAXn/+NQ6c8v2+fRhUxjFqOPavFC1
         3x2GiWjLXEhNXg5i2hTvsFYLqspJmkja6uLNpOj+4R+lOq9ngt7oZ5WRiGfm41K9pWoE
         MnHTroKcekS1csqDYJHQ8gTtCOkp+aRRTHnkxruP0f8Ochqlq+GF7O4CK9BfM2hRa1RP
         Bp3L3JW2e69tkzK22uuQx/k7MQw2CAbuI/EmAnS1Bwhn4QDGz/6MJZ3vZQ+GOuW8kMNw
         Xu0w==
X-Gm-Message-State: AGi0PuY9lqgK356aoTTSQI4KLCYybzb/Dlh7NWlhcqPDx/EBgHoVmiXB
        iVVId8p4POaVfMvxhfDfnWuDl+EsRp6IFj5sOUainbjvtAETKPq73etfFZzFyJt0sNN6o1cy51S
        Ieez6+c5XAejotF3yAuuFCg==
X-Received: by 2002:a05:600c:2157:: with SMTP id v23mr2394950wml.149.1588157193039;
        Wed, 29 Apr 2020 03:46:33 -0700 (PDT)
X-Google-Smtp-Source: APiQypIAUTgxZaFTHPgsbJmUbl3JkeAHmDZlcGM5inOSQIXWzfO3yfyVxCtKZHSfUQLsNOi0Sx4usA==
X-Received: by 2002:a05:600c:2157:: with SMTP id v23mr2394930wml.149.1588157192847;
        Wed, 29 Apr 2020 03:46:32 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id p7sm31081845wrf.31.2020.04.29.03.46.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2020 03:46:32 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: intel-vbtn: Use acpi_evaluate_integer()
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org
References: <20200429104515.63570-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <395781bd-171a-2034-8e98-3f64d2031b39@redhat.com>
Date:   Wed, 29 Apr 2020 12:46:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200429104515.63570-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 4/29/20 12:45 PM, Hans de Goede wrote:
> Use acpi_evaluate_integer() instead of open-coding it.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Sorry I send out the wrong patch, this is the start of a series
I'm working on. So please ignore.

Regards,

Hans


> ---
>   drivers/platform/x86/intel-vbtn.c | 19 ++++++-------------
>   1 file changed, 6 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/intel-vbtn.c
> index b5880936d785..191894d648bb 100644
> --- a/drivers/platform/x86/intel-vbtn.c
> +++ b/drivers/platform/x86/intel-vbtn.c
> @@ -119,28 +119,21 @@ static void detect_tablet_mode(struct platform_device *device)
>   	const char *chassis_type = dmi_get_system_info(DMI_CHASSIS_TYPE);
>   	struct intel_vbtn_priv *priv = dev_get_drvdata(&device->dev);
>   	acpi_handle handle = ACPI_HANDLE(&device->dev);
> -	struct acpi_buffer vgbs_output = { ACPI_ALLOCATE_BUFFER, NULL };
> -	union acpi_object *obj;
> +	unsigned long long vgbs;
>   	acpi_status status;
>   	int m;
>   
>   	if (!(chassis_type && strcmp(chassis_type, "31") == 0))
> -		goto out;
> +		return;
>   
> -	status = acpi_evaluate_object(handle, "VGBS", NULL, &vgbs_output);
> +	status = acpi_evaluate_integer(handle, "VGBS", NULL, &vgbs);
>   	if (ACPI_FAILURE(status))
> -		goto out;
> -
> -	obj = vgbs_output.pointer;
> -	if (!(obj && obj->type == ACPI_TYPE_INTEGER))
> -		goto out;
> +		return;
>   
> -	m = !(obj->integer.value & TABLET_MODE_FLAG);
> +	m = !(vgbs & TABLET_MODE_FLAG);
>   	input_report_switch(priv->input_dev, SW_TABLET_MODE, m);
> -	m = (obj->integer.value & DOCK_MODE_FLAG) ? 1 : 0;
> +	m = (vgbs & DOCK_MODE_FLAG) ? 1 : 0;
>   	input_report_switch(priv->input_dev, SW_DOCK, m);
> -out:
> -	kfree(vgbs_output.pointer);
>   }
>   
>   static int intel_vbtn_probe(struct platform_device *device)
> 

