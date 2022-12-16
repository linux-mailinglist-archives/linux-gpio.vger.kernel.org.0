Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C61CD64EEBD
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Dec 2022 17:14:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232147AbiLPQO0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Dec 2022 11:14:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231757AbiLPQNv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Dec 2022 11:13:51 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 981E1F6F
        for <linux-gpio@vger.kernel.org>; Fri, 16 Dec 2022 08:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671207179;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wURGvGbeXFElQK+1JoCJWdzCOYSxxIx6OSpE5tUptwQ=;
        b=hy+PGfvhcn+aIJDQHtIiaykQ33Q415T5nMj74OlErM9zF2xprkVRkRJLUWyEtpMjv9vBDW
        oMa/UbeLlsAOe6CJQyHCMumqW7s4LXZMZZ973fbMSB7rwjNWlDaF5TWth9qdM2p7gqv2QL
        AuNzQOPcTsC9tUw7v56AWvuLSRFFi/E=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-568-alU738osOvmoT7CbHDtfgA-1; Fri, 16 Dec 2022 11:12:58 -0500
X-MC-Unique: alU738osOvmoT7CbHDtfgA-1
Received: by mail-ed1-f72.google.com with SMTP id g14-20020a056402090e00b0046790cd9082so2214408edz.21
        for <linux-gpio@vger.kernel.org>; Fri, 16 Dec 2022 08:12:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wURGvGbeXFElQK+1JoCJWdzCOYSxxIx6OSpE5tUptwQ=;
        b=FK/97FVV84nNC3/+qT8pTm4+x3zbykkV79Qh5xXxc37DcfKJqr+PaeQYcsdiHmbib6
         HPSLDqbjkacRUeoTwtJRT1aIqcQPrSIsUjtOhvPiFfSIypBoqc8nGjroh2ryKnEgIvOn
         kwCipTU6FrEm9zN1PenYxYNhOWU42b/3/I2lxs+t6XkhwY2pmBOYN6g1AF9iK4er3UR+
         PtK3ghjJKsHXmTT5Eh+xbyegplL34edl4uN9gsfd9Az5ZVNe0yjogVgrRsYciUwC0lOT
         aBx8ED8bzIrGUM14maqdm/44z6yAvoGUiGFiVNRSF1k6t413rxR46sONf84DyBj5L8VP
         aHIA==
X-Gm-Message-State: ANoB5pmsCt+Owl/UDHA/YajFcY43bQQ3oDC+kePuoP2d3ksv0ZVbDgis
        5XjOZTDqa1ZYGHI+yRzbXmw8NhxgKnHcIx39TggApqZ1aSVEWPaDohxz8bHLdArWLGxuUjeEZSD
        sNYPz+tzIpEZHVM4Lf3qWDg==
X-Received: by 2002:a17:907:d092:b0:7c1:766e:e09 with SMTP id vc18-20020a170907d09200b007c1766e0e09mr17459140ejc.29.1671207177122;
        Fri, 16 Dec 2022 08:12:57 -0800 (PST)
X-Google-Smtp-Source: AA0mqf50iqeefJRduXX2rwzez9VdVVpN5fpmMgPeScO7DIs4zfQlUWkH2nwxx+hx/Hf6EtQCQOtCxw==
X-Received: by 2002:a17:907:d092:b0:7c1:766e:e09 with SMTP id vc18-20020a170907d09200b007c1766e0e09mr17459133ejc.29.1671207177009;
        Fri, 16 Dec 2022 08:12:57 -0800 (PST)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id co18-20020a0564020c1200b004611c230bd0sm1034983edb.37.2022.12.16.08.12.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 08:12:56 -0800 (PST)
Message-ID: <ad2a8bb6-9acf-d3ca-b48f-5f12d45a16eb@redhat.com>
Date:   Fri, 16 Dec 2022 17:12:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 06/11] v4l: subdev: Make the v4l2-subdev core code
 enable/disable the privacy LED if present
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
 <20221216113013.126881-7-hdegoede@redhat.com>
 <Y5x6iHdMj6Dx0Buf@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y5x6iHdMj6Dx0Buf@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 12/16/22 15:02, Andy Shevchenko wrote:
> On Fri, Dec 16, 2022 at 12:30:08PM +0100, Hans de Goede wrote:
>> Extend the call_s_stream() wrapper to enable/disable sensor privacy LEDs
>> for sensors with a privacy LED, rather then having to duplicate this code
>> in all the sensor drivers.
> 
> ...
> 
>> +static void call_s_stream_update_pled(struct v4l2_subdev *sd, int enable)
>> +{
>> +	if (!sd->dev)
>> +		return;
>> +
>> +	/* Try to get privacy-led once, at first s_stream() */
>> +	if (!sd->privacy_led)
>> +		sd->privacy_led = led_get(sd->dev, "privacy-led");
> 
>> +
> 
> Redundant blank line?

I find this more readable with the blank line between the 2 ifs.
> 
>> +	if (IS_ERR(sd->privacy_led))
>> +		return;
> 
> I'm not sure I have got the logic right. Let's assume we call it with
> _led == NULL. Then in case of error, we feel it with the error pointer.
> If we call again, we check for NULL, and return error pointer.
> 
> So, we won't try the second time. Is it by design? Or should it be

It is by design, there even is a comment which says so:

/* Try to get privacy-led once, at first s_stream() */



Regards,

Hans



> 
> 	struct ... *led;
> 
> 	if (!privacy_led) {
> 		led = ...
> 		if (IS_ERR())
> 			return;
> 		privacy_led = led;
> 	}
> 
> ?
> 
>> +}
> 

