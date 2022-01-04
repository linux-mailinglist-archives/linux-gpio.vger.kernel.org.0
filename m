Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 942254843AA
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jan 2022 15:47:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234380AbiADOrk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Jan 2022 09:47:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28087 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234373AbiADOrk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Jan 2022 09:47:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641307659;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qHMt2NMZZWTklQYnjdxAx0Br7Q3zTrVD/d/43hFeXUk=;
        b=Tn1YHsCG2FXpOwa6ZbyiVWshmUKTyAqId8SZb7FYtbgEux7rdC3HTwE/aT0SSeClC0XgWv
        LbWSfBZNc/3wWVWhGLU2mcH3pAoAVSNIyyfnpQKyKZ4aorCLujcCeLfPB8ccz6y4jw1pt4
        vNPyc1kzTrCyq9TJmhsQivwx+c8Hxio=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-Hgxy05nnP3m11hCEaOZxPg-1; Tue, 04 Jan 2022 09:47:38 -0500
X-MC-Unique: Hgxy05nnP3m11hCEaOZxPg-1
Received: by mail-ed1-f69.google.com with SMTP id v18-20020a056402349200b003f8d3b7ee8dso22035319edc.23
        for <linux-gpio@vger.kernel.org>; Tue, 04 Jan 2022 06:47:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=qHMt2NMZZWTklQYnjdxAx0Br7Q3zTrVD/d/43hFeXUk=;
        b=B2vRUWnZG/JGwO0VHVtLJMk0E6JsJ5VDniKvyltVNpl6H6f8NRBur2lfbHZllzJNxv
         NssGMHqS79BMc+43SzvLYeBY35mGsv4U+p/4UuOr+WcEEjdCK32alMMdMEeTgFlu7ElG
         EzmPDpALeVdG/KsEmdl3b6E6xZ7A19qyV42/ihzSz8xDuw3ASOfm8koidQTmcMi8VYzg
         VnqLtUQ8b+iC48Swyr4wtwzkialqg04ADgqPsldVHXfIRG+z+mvgsTyyEaUs6M6DASFo
         nAov4sP00zsR/b1eX97+6hJfvIH/eG3pnxOtyoDzdOaRV+x6FZLIS+gLPbidRVILKWRA
         +6Xw==
X-Gm-Message-State: AOAM532RU0WbHQ9Wf5u0Aff9Cmph9dxpZhhpXa4PqHhUR++1T+Fztj43
        CD+C4pcVc64ocRsTiHin8rYP3p4yU0/9dPhUiiYAW4as6T5giUvND9fI19NGnP8ph5W5wqALU+F
        /CjURbb7m0Abau16hL+0FSw==
X-Received: by 2002:a05:6402:22f9:: with SMTP id dn25mr49604778edb.403.1641307657643;
        Tue, 04 Jan 2022 06:47:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxXvFop7Y2NkNEDVOhFialQSnCZBVaW5EWNcng7SCqdinSN2ormpdHf18cvHrG3CJkH+1K/+Q==
X-Received: by 2002:a05:6402:22f9:: with SMTP id dn25mr49604770edb.403.1641307657479;
        Tue, 04 Jan 2022 06:47:37 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id go35sm11476414ejc.191.2022.01.04.06.47.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jan 2022 06:47:37 -0800 (PST)
Message-ID: <d04b5312-a38f-e7a7-f6cf-35320daade39@redhat.com>
Date:   Tue, 4 Jan 2022 15:47:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: pinctrl-cherryview regression in linux-next on preproduction
 Braswell
Content-Language: en-US
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
References: <70004f1a-fef5-f6e9-6824-47eeb59f8014@linux.intel.com>
 <6d133b89-cc03-6308-6da7-dcea95a93a8c@redhat.com>
 <a8b6d8f1-ad8c-23ac-a85b-2c903530735f@linux.intel.com>
 <c29e98f5-c8e4-1967-a249-a461776488ad@redhat.com>
 <65271fd1-1c1c-f2ad-9b0f-60174e791eaa@linux.intel.com>
 <27a870e5-675a-564f-2bfe-ee913bdec0ac@redhat.com>
 <60adc8c5-3d58-b7bf-6c53-70599118b83f@redhat.com>
 <e3052473-0dba-49b3-c58c-c100742c978d@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <e3052473-0dba-49b3-c58c-c100742c978d@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Jarkko,

On 1/4/22 15:38, Jarkko Nikula wrote:
> Hi
> 
> On 1/4/22 12:48, Hans de Goede wrote:
>> So I've written another patch, which I believe is something which we will want
>> regardless of the question if we should mask interrupts at boot or not.
>>
>> I've attached this patch here. Jarkko, can you test a linux-next kernel with
>> just this patch added?
>>
>> This should still lead to the "interrupt on unused interrupt line %u" message
>> getting printed, but hopefully the system will actually boot despite this,
>> since the code path printing the msg now acks the interrupt.
>>
>> Thinking more about this I believe that this is likely the correct fix for
>> the caused regression, because the spurious IRQ was always there already.
>>
>> Fixing the spurious IRQ is still good to do but is a somewhat separate issue
>> really.
>>
> Unfortunately it doesn't fix:
> 
> [   13.060619] cherryview-pinctrl INT33FF:00: interrupt on unused interrupt line 0
> [   13.068888] cherryview-pinctrl INT33FF:00: interrupt on unused interrupt line 0
> [   13.077146] cherryview-pinctrl INT33FF:00: interrupt on unused interrupt line 0
> [   13.085364] cherryview-pinctrl INT33FF:00: interrupt on unused interrupt line 0
> ...
> 
> I did dev_err_ratelimited() conversion to the error print together with your patch and that allowed to boot.

Ok, thank you for testing all my different patches.

> That gave me an idea to look at is there anything suspicious in "top" or /proc/interrupts (no and no) but powertop shows CPU 0 is over 90 % in C0 state and max frequency.
> 
> But comparing powertop on v5.16-rc8 it does look sometimes the same and sometimes CPU 0 is less in C0 (but still over 30 %). Hard to say is there difference but obviously v5.16-rc8 either is not good on this machine since CPU 0 and package seems to reach idle only 5 % or less.

Hmm, does this happen to with the "hack" patch to initially mask interrupts
triggered by all the interrupt-lines of the GPIO-controller ?

Ah upon reading your reply a second time I see you already checked
/proc/interrupts; and that you are also seeing this with 5.16-rc8.

So the load is likely not caused by the pinctrl issue and there also
is some other issue I guess...

For the high cpu-load issue it would be good to know if this is
also present on older kernels.

Regards,

Hans


