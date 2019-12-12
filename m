Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A00D11CBFB
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2019 12:13:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728695AbfLLLNw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Dec 2019 06:13:52 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:41416 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728458AbfLLLNw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Dec 2019 06:13:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576149230;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+nqQBKWQuEcBiy5rC99TfxbCNVi1WbICaWUW+QsJfz8=;
        b=cv9FQHJNJ6aPaIwOJIIyEctrM1b0KsTH60mXOsM44+/Yi4IPiv/eoKbNQk1OnKjZZrYzaI
        Lj1RxTFHHujkAlrMZ1bZY8UdCgBaEYOJFpQvKooA6l5c9Kuln5NAmRG35IdF2EU8qOg7Pp
        PM5xWInsqgkDhIZdIzh5MYVqIT+yRPM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-bTmu6dG9Ne2zgQk1MzxTaA-1; Thu, 12 Dec 2019 06:13:47 -0500
X-MC-Unique: bTmu6dG9Ne2zgQk1MzxTaA-1
Received: by mail-wr1-f70.google.com with SMTP id 90so897679wrq.6
        for <linux-gpio@vger.kernel.org>; Thu, 12 Dec 2019 03:13:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+nqQBKWQuEcBiy5rC99TfxbCNVi1WbICaWUW+QsJfz8=;
        b=M/WkOgKX4juBUBUf2EtXJU+0CzvtVXVn7UbC3FYdd68N3KX2MFErntlWbwGOMB8USq
         WENwM49Mz4RfujcUWrxUEaLpdCITPr9jOop3BBiQd1XFa4+KgwfFbrCQ+BLRgkQ+CMy1
         wd4yHlpwAqRZH2v7swdnRCBVyStttpvX1V/ji33PfhMBT8tpGO98ua5GEXolrwTEw5Wx
         Kr764hzCnmDpiNJikFA2eYYmw7FljxWoC9fLVlUxYvmvKoRSuDFbSM9XjhiEifMCpRMh
         U1IpWUmC+ZQ96ElNlmuyswxgvlP1Q2X5SVDkx25RpuYwsE565WUmnWVTtBWb2UyRxT5y
         VBRg==
X-Gm-Message-State: APjAAAVpbjH5/pupAadqH9R8JiM4mQMcZEOHptEARe4OfF+G7ggA509A
        E0iId7k8qq9hRibfk1II8MC3R4PrJVEpyLgq5CoX+g2PD+8XDlX6GOSrgu5gBCSpV7Xg7tvrBUH
        QjLLfsTnGcV3sQoIG05Wt5A==
X-Received: by 2002:adf:edd0:: with SMTP id v16mr5575017wro.310.1576149226646;
        Thu, 12 Dec 2019 03:13:46 -0800 (PST)
X-Google-Smtp-Source: APXvYqws6N9rOfpaqD4EnlssDNLWDxUKBezrGEnyQ4eKnT3710IsCVOOyBktNTbroQT/n1kG5HGDkg==
X-Received: by 2002:adf:edd0:: with SMTP id v16mr5575002wro.310.1576149226472;
        Thu, 12 Dec 2019 03:13:46 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c0c-fe00-7e79-4dac-39d0-9c14.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:7e79:4dac:39d0:9c14])
        by smtp.gmail.com with ESMTPSA id s3sm5570155wmh.25.2019.12.12.03.13.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2019 03:13:45 -0800 (PST)
Subject: Re: [PATCH v1 0/5] pinctrl: baytrail: Clean up (part 3)
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
References: <20191212102557.87754-1-andriy.shevchenko@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <c2453fea-f423-6238-61b2-34b4e5be4998@redhat.com>
Date:   Thu, 12 Dec 2019 12:13:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191212102557.87754-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

On 12-12-2019 11:25, Andy Shevchenko wrote:
> This is a part 3 of clean up pin control driver for Intel Baytrail.
> After this applied the driver will use all available data structures
> from pinctrl-intel.h header.
> 
> Note, that patch which exposes common pin control data structrure for drivers
> will be used by Lynxpoint as well.
> 
> This has been tested on the tablet with SD card detection and buttons pressed.
> 
> Based on our pinctrl/intel for-next branch.
> 
> Andy Shevchenko (5):
>    pinctrl: baytrail: Move IRQ valid mask initialization to a dedicated
>      callback
>    pinctrl: intel: Share struct intel_pinctrl for wider use
>    pinctrl: baytrail: Keep pointer to struct device instead of its
>      container
>    pinctrl: baytrail: Use local variable to keep device pointer
>    pinctrl: baytrail: Reuse struct intel_pinctrl in the driver
> 
>   drivers/pinctrl/intel/pinctrl-baytrail.c | 272 +++++++++++------------
>   drivers/pinctrl/intel/pinctrl-intel.c    |  35 +--
>   drivers/pinctrl/intel/pinctrl-intel.h    |  44 ++++
>   3 files changed, 173 insertions(+), 178 deletions(-)
> 
> 
> base-commit: ab68b220e81fd03383c0d9e1a87b51f9bbe4db77

 From a quick look this series looks good to me:

Acked-by: Hans de Goede <hdegoede@redhat.com>

I've also added this to my personal tree for testing purposes, I will let
you know if I hit any problems.

Regards,

Hans

