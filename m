Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 728A264EEBA
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Dec 2022 17:14:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231995AbiLPQOY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Dec 2022 11:14:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231996AbiLPQNt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Dec 2022 11:13:49 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9489D1263D
        for <linux-gpio@vger.kernel.org>; Fri, 16 Dec 2022 08:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671207156;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zFkMxUWLdwGHIAixRcJsjatehdV3JvWTV1e5ITjujjY=;
        b=deD/FhjYZ6KGJs5JRQSLwhzaGMBp6s5UvpRqDcZ1IQgqkAkCZA0R375FRpK3sDgCGPoVK0
        V8NkO6HmKm1hZY5uKcbEu78tzOs9qmMampyZ8uj1bRiwgMdnTHP/QCvh5HLIKc052mqizS
        qNrHC8D7dk7vPesae3WwC3ds8CKndgk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-418-HCD8Z6S4N5qZhY562rP4mA-1; Fri, 16 Dec 2022 11:12:35 -0500
X-MC-Unique: HCD8Z6S4N5qZhY562rP4mA-1
Received: by mail-ed1-f70.google.com with SMTP id v4-20020a056402348400b0046cbbc786bdso2214550edc.7
        for <linux-gpio@vger.kernel.org>; Fri, 16 Dec 2022 08:12:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zFkMxUWLdwGHIAixRcJsjatehdV3JvWTV1e5ITjujjY=;
        b=rYm4+8fHFS/9nCpIsar/CWnFC+0dPhjhfut+6eY+/ROW8R2hbKiLDSfoKFdW3v8d+9
         EdIQVI+qBcdP+dXqp4CLIKzADLewwstA9pBZ4i/woTZkiZ6SOz0dYlVKeLnEaiN1NpSj
         T/xsGiU1oOLdrhzNOBSK6nsS3IV3b2vDtUAejAAeUENQe0HvomVSjQCPHe71/Vyz17D6
         g+1c/1olvwRin/YP/z17fa2jRowRD0chD63l7SjmEP32bL0YHJkm2vjh93CUyBsum26B
         Y+5JLcidy+kXBDyLfkNAY/6xGbFRso46u7WRZKWO0Aol76j7RCpxXW+dzPUniWjyCk+z
         Hv5Q==
X-Gm-Message-State: AFqh2kqOQFgbCl9UJEN+H+ZNQphANezFwHIqRMPTQvRf8KXx3X9pkYw5
        Z3UrBcoYMEaT2liK6Y/xAeB5hin9NY2WyYT2Dj5og8n8/NsY29pLxBJK7PmCX4KqUNu8np4AzV3
        yrTAlyOTKnB0LZlekFnYW3g==
X-Received: by 2002:a17:906:1f4d:b0:7e0:eed0:8beb with SMTP id d13-20020a1709061f4d00b007e0eed08bebmr2658448ejk.41.1671207154444;
        Fri, 16 Dec 2022 08:12:34 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuGHAW3XAtvRofwJ5XrWPr4dqsyehv9s53hIQDwCoVun5ID0UVhjYDByv0SmlRBlovLVvwUjw==
X-Received: by 2002:a17:906:1f4d:b0:7e0:eed0:8beb with SMTP id d13-20020a1709061f4d00b007e0eed08bebmr2658424ejk.41.1671207154296;
        Fri, 16 Dec 2022 08:12:34 -0800 (PST)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id g17-20020a17090604d100b007c0e23b5615sm997680eja.34.2022.12.16.08.12.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 08:12:33 -0800 (PST)
Message-ID: <38ee7caa-d028-9cc4-7e13-e3642a0bcf77@redhat.com>
Date:   Fri, 16 Dec 2022 17:12:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 05/11] leds: led-class: Add generic [devm_]led_get()
Content-Language: en-US
To:     Andy Shevchenko <andy@kernel.org>
Cc:     Mark Gross <markgross@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-gpio@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Andy Yeh <andy.yeh@intel.com>, Yao Hao <yao.hao@intel.com>,
        linux-media@vger.kernel.org
References: <20221216113013.126881-1-hdegoede@redhat.com>
 <20221216113013.126881-6-hdegoede@redhat.com>
 <Y5x17PKiPnMLMfMg@smile.fi.intel.com>
 <d329fa91-a913-a0ab-a7a9-50069c1c834c@redhat.com>
 <Y5yXtIhhMTkPLpeA@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y5yXtIhhMTkPLpeA@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 12/16/22 17:07, Andy Shevchenko wrote:
> On Fri, Dec 16, 2022 at 04:54:59PM +0100, Hans de Goede wrote:
>> On 12/16/22 14:43, Andy Shevchenko wrote:
>>> On Fri, Dec 16, 2022 at 12:30:07PM +0100, Hans de Goede wrote:
> 
> ...
> 
>>>> +EXPORT_SYMBOL_GPL(led_add_lookup);
>>>
>>>> +EXPORT_SYMBOL_GPL(led_remove_lookup);
>>>
>>> Wondering why we can't make at least those two to be namespaced from day 1,
>>
>> switching the LED subsystem code to use module namespaces is
>> a RFE which is independent of / orthogonal to this patchset.
> 
> Adding new unnamespaced APIs only delays and increases a burden of the work.
> We can start already for the logically separated subset of API, no? That's why
> I asked about this.

Sorry, but I really see this as an independent changes and there is
enough discussion around these changes as is without throwing this
into the mix.

Regards,

Hans


