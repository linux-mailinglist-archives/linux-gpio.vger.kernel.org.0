Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E571A48AD5E
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jan 2022 13:13:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239617AbiAKMNg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jan 2022 07:13:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45760 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239449AbiAKMNg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 11 Jan 2022 07:13:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641903215;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9wdX4E06AUpzdOuz3xZ6K6uovdIhyVYdE1wl5angGZU=;
        b=BLLjZTXBzIGjT37LdDWr8glLc6bvdDaZ2e5bLfuS3UxAuBTtgIYvEqnAR8tGTorUwQz6Iu
        PqSE7m97jCkM2ckZzn4ajDvbPHyOXk333OIav1YCmOpukJoKA8zDdAF2GWZeNHG2Nek9Kh
        Gr8WaNgC+w0D7GIrGLynLXtZHwtzPQU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-496-HamwWuVkPRyEjKIjtK9uGg-1; Tue, 11 Jan 2022 07:13:34 -0500
X-MC-Unique: HamwWuVkPRyEjKIjtK9uGg-1
Received: by mail-ed1-f69.google.com with SMTP id ec25-20020a0564020d5900b003fc074c5d21so8731791edb.19
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jan 2022 04:13:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=9wdX4E06AUpzdOuz3xZ6K6uovdIhyVYdE1wl5angGZU=;
        b=OJcnH7+pYV19/TDxUEMDRUD0aSmAASM5g65QlvoLYvij1QX6EbB00Fkc/8c2Dd1GKZ
         Hkwq2a61Dcfj3zqz1RWtqePmRuTUIYax8gsyWOJJpy7pOKtE+M8dxP0mXYhZad2q68+s
         Eaw2/5aMtSq0hQhmC/OJOSMnucM2Dy8nGtGMmUOtjOsVnkxD885wIY3qCqcQAaxbtTOM
         rzsZ7LI1PRvP4U0q7yzXQenbV2G3yr7GSt16OWTMRqwDKoTRKH3Bpr00uFsRD0RlPdbK
         r2EyIgtg3gKL7MQcSJuR2UDwJX4aVEW3l2D8WKUZP5Ucc0C3O3ou+vDCvu2aMteUze+/
         oISA==
X-Gm-Message-State: AOAM530L+hjrY2Oor+dH3uJtwwzQClkxvEH7O0TvmQ1loGbVPv5fBqvV
        qhGwhSsTlElLrVCmKg6CXdt06jZ3Ay5vb7qPmFxBbXTA3DD7mfitqRGJkdterg5qXLzNcQKIQup
        FiimuOgp/1LlPE3iJMmLPpA==
X-Received: by 2002:a17:906:2890:: with SMTP id o16mr3392424ejd.99.1641903213354;
        Tue, 11 Jan 2022 04:13:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzt5OeoKzsD+0qVLWnQSjVpOkiwlEPGKTmm456HTg698SqVIppr3kgnGiFov/uEW3vpmSNWFQ==
X-Received: by 2002:a17:906:2890:: with SMTP id o16mr3392415ejd.99.1641903213227;
        Tue, 11 Jan 2022 04:13:33 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id g4sm4950927edp.25.2022.01.11.04.13.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jan 2022 04:13:32 -0800 (PST)
Message-ID: <abd55ec0-ab84-6399-b690-e6ae1e8e662b@redhat.com>
Date:   Tue, 11 Jan 2022 13:13:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2] gpio: tps68470: Allow building as module
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20220111105632.219581-1-hdegoede@redhat.com>
 <Yd1qgTKIFa7pTEwg@smile.fi.intel.com>
 <dd4387d7-76e7-2831-18ce-c57bfdb3f9a4@redhat.com>
 <Yd1x3EbXzjTdfms2@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Yd1x3EbXzjTdfms2@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 1/11/22 13:02, Andy Shevchenko wrote:
> On Tue, Jan 11, 2022 at 12:46:16PM +0100, Hans de Goede wrote:
>> On 1/11/22 12:31, Andy Shevchenko wrote:
>>> On Tue, Jan 11, 2022 at 11:56:32AM +0100, Hans de Goede wrote:
> 
> ...
> 
>>> It used to be 2 patches in the series, are you going to send another one
>>> separately?
>>
>> Ah right, I forgot this was a series. The other one had no review comments,
>> so v1 is still valid, you can find it here:
>>
>> https://lore.kernel.org/linux-gpio/20211225120026.95268-2-hdegoede@redhat.com/
> 
> Okay (but in the future it's better to send a new complete version, it's easier
> for `b4` tool to handle).

Ack, as I said I forgot this was part of a series, otherwise
I would have done a v2 for the entire series.

Regards,

Hans

