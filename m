Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7439A646069
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Dec 2022 18:38:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230164AbiLGRiz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Dec 2022 12:38:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230130AbiLGRi1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Dec 2022 12:38:27 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9D08F48
        for <linux-gpio@vger.kernel.org>; Wed,  7 Dec 2022 09:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670434653;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IHCZeVT8+tsyQCQ4HzhOkGSB0d3Ym2pm84+wyQjhgMo=;
        b=Q4tzzzSi8B4DzBVXFBDQHUVJyjh6RXJlUcSNvp883XswRhCBu4Zdc432rcF8zmfRCcw1jB
        mR45XJgnAnJVFiCgeRbcryIX8PTHXPwhNUuBT0glvGiNIAxDVCnf93QQdrssAMqPvjrXjG
        6yhR+6jqUHBXWgANr93gd1LFizlaCQQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-193-FXATv6iQOwyohufSvZAXcA-1; Wed, 07 Dec 2022 12:37:32 -0500
X-MC-Unique: FXATv6iQOwyohufSvZAXcA-1
Received: by mail-ej1-f69.google.com with SMTP id ds15-20020a170907724f00b007c0abebc958so3749875ejc.2
        for <linux-gpio@vger.kernel.org>; Wed, 07 Dec 2022 09:37:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IHCZeVT8+tsyQCQ4HzhOkGSB0d3Ym2pm84+wyQjhgMo=;
        b=aLU3DLIqfNJ2rmSeEa6ZMydu+A2yRzdbksH25haoxkOQ8vdXrOOXY3nWiCDYtwu+RS
         K09WOACFkq7TCW6wr/f/uxqS0VCEjyZWmkjsQ+WE8EWCqEpHyPwj9oypH8eLeQFsIcM6
         KB8zoh+JO9SJyQhgqA97p6BL2/xtAammwvacLGQ4iGri7puk1fJOgKXtXiUG0SyPD+ly
         46R45bl7fpaYnwaf7KPrrHgEtFejHH9BxNRm/x6HBHM0sYa0QKMYIiPFpRKmV39EN414
         p6T85bA5fCfIEVXsBkwUj8xGV0DRz6dum+Fwgxx5vWuIRad8sLsj4HHysgFmmoypg0fd
         d6EA==
X-Gm-Message-State: ANoB5pmht4b9A2mxLW6ovcsTHLc3Nllxgpk99mj9wfUybK6RarS+9rQU
        hX+IsIqSzigDGGwwwrTytpYkx3VecG//DpXzfIFKh5Ld4WgQCkcuGKLYOHVP5A5cE5MqrfnRlYt
        4cJuCT1trE9+Lys2c6OnaJA==
X-Received: by 2002:a17:906:3087:b0:7bd:bb10:b5f8 with SMTP id 7-20020a170906308700b007bdbb10b5f8mr45759204ejv.659.1670434650969;
        Wed, 07 Dec 2022 09:37:30 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6PlsUKNSNbCOlaFF0rdvHPTS80VsiKj/692+pl3GkMvCPpogDwKwhNgBi/LzrwvpWAfBbatg==
X-Received: by 2002:a17:906:3087:b0:7bd:bb10:b5f8 with SMTP id 7-20020a170906308700b007bdbb10b5f8mr45759193ejv.659.1670434650817;
        Wed, 07 Dec 2022 09:37:30 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id h6-20020aa7de06000000b0046b531fcf9fsm2486222edv.59.2022.12.07.09.37.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Dec 2022 09:37:30 -0800 (PST)
Message-ID: <0e5b2a63-7fa5-43db-6e4c-d58a047aa452@redhat.com>
Date:   Wed, 7 Dec 2022 18:37:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 0/5] gpio/media/int3472: Add support for tps68470
 privacy-LED output
Content-Language: en-US, nl
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
References: <20221128214408.165726-1-hdegoede@redhat.com>
 <CACRpkda+3e6jLq4WkyiCFcvL_rO1tAf_TvO5B9kikkii+6vSnA@mail.gmail.com>
 <f79b9397-64af-894a-411c-5595fa136008@redhat.com>
 <e04eaaa0-1a5d-7f8f-9cd9-4a2117f83aab@redhat.com>
 <CACRpkdZZ01gTeWaU5GybiafDM3EnyEhyuEMTenusfV2s1NdfXQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CACRpkdZZ01gTeWaU5GybiafDM3EnyEhyuEMTenusfV2s1NdfXQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 12/7/22 01:25, Linus Walleij wrote:
> On Mon, Dec 5, 2022 at 4:01 PM Hans de Goede <hdegoede@redhat.com> wrote:
> 
>> An alternative approach, would be to add support for LED
>> lookup tables to the LED class code (like we already have
>> for GPIOs) and use this to allow tying a LED classdev to
>> a struct device on non devicetree platforms.
>>
>> Given the problems with the swnode approach from above
>> I believe that this would actually be better then
>> the swnode approach.
>>
>> Lookup tables like this use device-names, so we don't need
>> to have swnode-s ready for both the provider and the consumer
>> at the time of adding the lookup table entry. Instead all
>> that is necessary is to know the device-names of both
>> the provider and the consumer which are both known in
>> advance.
> 
> I think this looks like a good idea.
> 
> We attach other resources such as clocks, regulators,
> DMA channels, GPIOs exactly this way. So why not LEDs?
> 
> As GPIO maintainer I every now and then get a suggestion
> like this to "just let this pass as a GPIO because it makes
> my life so much easier", but it is the same curse as the
> input subsystem has: it is versatile and well engineered so
> it starts to look like a golden hammer (everything start to
> look like nails).
> 
> But we are two GPIO maintainers and right now Bartosz
> does the majority of the work, and if he thinks it's the best
> idea ever I will certainly reconsider.

Ok, I will give the LED lookup table approach a go and
post a new series replacing this one when its ready.

Feel free to drop this series from your queue.

(Note given that that is going to be a whole new approach
I plan to start the new series at v1 again).

Regards,

Hans

