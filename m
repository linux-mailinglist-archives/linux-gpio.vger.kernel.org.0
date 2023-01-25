Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63EE367B15F
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jan 2023 12:33:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235259AbjAYLdM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Jan 2023 06:33:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235556AbjAYLc7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Jan 2023 06:32:59 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A39F027997
        for <linux-gpio@vger.kernel.org>; Wed, 25 Jan 2023 03:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674646333;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=w2+kEj5yu/AChEArJixkPor31XrjtH3hjAdn3DFNQpU=;
        b=SSslPASvBgcKaZxHv9V/PXFSX/p06ekBCn/9PtJYhy/Vm+fmD75BTksqO1HSXxUfRHuMMS
        oRZnEwo0SGq2k9NFPhz23pXzT6oH3QgXCYj32nxZ/nueDDXQ+VjVYSGr7IoYfI41S82aSG
        0jzd9ACsfraBJjEG+5zx4sqW90bxtwk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-42-P_78PtVROjG6QpyCR5t9-g-1; Wed, 25 Jan 2023 06:32:12 -0500
X-MC-Unique: P_78PtVROjG6QpyCR5t9-g-1
Received: by mail-ed1-f69.google.com with SMTP id x5-20020a05640226c500b0049e840f68feso11477773edd.23
        for <linux-gpio@vger.kernel.org>; Wed, 25 Jan 2023 03:32:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w2+kEj5yu/AChEArJixkPor31XrjtH3hjAdn3DFNQpU=;
        b=wautcIaDhpdBk0HQ3KrCYGsicdBOHmgrnkSxh6rtXZiEsQd7F36D6GqzSG67XMptI6
         r9wbJ5pmqvVVr4fbpD9yWmk1b0WckuUnyjy5ZONa3tkUI9nyVb6hOzkOqtv1KacczrAI
         k1fV8mMLU2VHeCEJFyp8vARYx2pOEy1rmTEh+DlmKCEWiE7WpWo3YaXpWQ5bWys3dGnm
         2YUiOLmMNy5FtQh4Zgf04PBecXUrf+nUAUCn/v5otqIRNFZONFfp9WRThFWI4tk6RnEC
         IcWq2u14y54orlgoxg4WsgiXHeKE5lFO73uqhu86YWBmDYI2hgqnU2vDfbhpkkvOV6qQ
         n7fQ==
X-Gm-Message-State: AFqh2kq1ctJVEGR//cxqSAPDVp2OIYymj9lWi/HqRaCDTK80+1gk2qqT
        lwCLnCDt0J4490BOWlLvwHPyp9YzmiJgm1sS4oD9kW9gceVRuP0qCXKKhzqFqIYP1rqqVTB3+ph
        YZqsBRGB8lpQafnBKS33BAg==
X-Received: by 2002:a17:907:8b08:b0:86e:e403:4f2e with SMTP id sz8-20020a1709078b0800b0086ee4034f2emr38540949ejc.76.1674646331415;
        Wed, 25 Jan 2023 03:32:11 -0800 (PST)
X-Google-Smtp-Source: AMrXdXum5itCsb3/CyGGcEKoveSyy0zO0dbHiqQmeXz+YmRsvOR7kCsJdeg3qfWvt94S6WndOgtoZQ==
X-Received: by 2002:a17:907:8b08:b0:86e:e403:4f2e with SMTP id sz8-20020a1709078b0800b0086ee4034f2emr38540926ejc.76.1674646331187;
        Wed, 25 Jan 2023 03:32:11 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id kf6-20020a17090776c600b00877df3eea5fsm2202143ejc.163.2023.01.25.03.32.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 03:32:10 -0800 (PST)
Message-ID: <07a830ec-4cb9-8a02-dfc0-a3b52cc79290@redhat.com>
Date:   Wed, 25 Jan 2023 12:32:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 resend 1/2] gpio: tps68470: Fix tps68470_gpio_get()
 reading from the wrong register
Content-Language: en-US, nl
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-gpio@vger.kernel.org
References: <20230125110547.18093-1-hdegoede@redhat.com>
 <20230125110547.18093-2-hdegoede@redhat.com>
 <CAHp75Vd22k70oiQ4ygmYrGiC_cdb6NrqtHzV+q2j=Yu3VXj00g@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vd22k70oiQ4ygmYrGiC_cdb6NrqtHzV+q2j=Yu3VXj00g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 1/25/23 12:23, Andy Shevchenko wrote:
> On Wed, Jan 25, 2023 at 1:05 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> For the regular GPIO pins the value should be read from TPS68470_REG_GPDI,
>> so that the actual value of the pin is read, rather than the value the pin
>> would output when put in output mode.
> 
> It really depends. I think it's a wrong perception and brings nothing
> to software. If we output, we know what we program, so reading back
> returns us what we _assume_ should be on the pin under normal
> circumstances. The difference is OD/OS/OE/OC cases where we output
> only one possible value.
> 
>> Fixes: 275b13a65547 ("gpio: Add support for TPS68470 GPIOs")
> 
> Is it really fixing anything? Can we have more?
> 
> P.S. Before doing this, I would have a clarification in the
> documentation. Sorry that I have had no time to respond to my series
> regarding that. But it seems we have a strong disagreement in the
> area.

I know disagree on some of the semantics of gpiod_get_value() but 99.9%
of the consumers of gpiod_get_value() are going to deal with pins
which are either in input mode, or in some non push-pull (e.g.
open-collector for i2c) mode. And in those cases reading GPDI
os the right thing to do.

Calling gpiod_get_value() when the pin is in push-pull mode really
does not make much sense, so there will be very little if any users
of that. And this patch fixes the 99.9% other (potential) users
while not breaking the push-pull case since even then reading GPDI
should still return the right value.

Regards,

Hans


