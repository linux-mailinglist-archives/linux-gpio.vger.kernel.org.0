Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DDD21C8688
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2020 12:22:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725857AbgEGKWV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 May 2020 06:22:21 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:55874 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725879AbgEGKWT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 May 2020 06:22:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588846938;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=daEPk34nz7/mc4JDF7jTwtjOAhjMSLlPm91sqnZzBuI=;
        b=XBOrl+9d7y7JSD/1Iw749RxLYqIkXT0UTXIFDnEZ6kTlXocuYTfNoIpgpDf4hcxfotCz3S
        WPyw9pGVuSAkrq/lY6FuQ5BGzw8xM5l3HKdyCNgfkJ5JUFgw7AMKtoShcQLi9oW/Frxgwu
        v+8QEyLE9AenktjAS1yHMlOh5yym2Fo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-02WfUvBDM6OSuY3TG8r4oA-1; Thu, 07 May 2020 06:22:16 -0400
X-MC-Unique: 02WfUvBDM6OSuY3TG8r4oA-1
Received: by mail-wr1-f69.google.com with SMTP id q13so3155260wrn.14
        for <linux-gpio@vger.kernel.org>; Thu, 07 May 2020 03:22:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=daEPk34nz7/mc4JDF7jTwtjOAhjMSLlPm91sqnZzBuI=;
        b=uDRnIUwA/eETEGR0Zf0f16KWgtSMCTL4D0lkJpjr5kDJjMzrP2A+Gt7Vcy7Nusedli
         +Z4tR+XwfvpOoqerhFcLFHC7Le1zf2VM/pwY85QzTBmP4CzmK+NDgUL+EjZsrBLN9/GT
         g2Z5qBC0kAzuhxsjtAf4m8ghTqtkHEC/3UcAiJgdTzV9/gVMeAsiuNpFwpRXmVhomOxP
         EJAA11rh8PthsJlsj665x+CWlpk6BLnRqVIBXCGH6619XFkaOkoE27tvY3pjfchjj4wq
         M1AEKx3xsh+zI5HyocVB15MU3PQFHleZHItlDMUtbO4xx5vZWQ2j/CJrukHHrf/ale+o
         yA8w==
X-Gm-Message-State: AGi0PubOHuFd5e8nWF+UsiwhAU/SfsyyFJyF1sFHawKTOaq8sgrFUczc
        5rWbMAJmAtDGKumxfzTcB/0wWaq+LGanHE1zvAFcM2ZfCGsn3sSvRcTwruF+v2eTeZV+iQi6sys
        3CMobUEnny1chywP1Korcig==
X-Received: by 2002:adf:bb4e:: with SMTP id x14mr14365975wrg.63.1588846934932;
        Thu, 07 May 2020 03:22:14 -0700 (PDT)
X-Google-Smtp-Source: APiQypLbQmQ8O7FsZD4F25oysdIJsv00xcVAI1gzNc4qrcfwocuf280YRdmP3LDUgYBImau7I11qbQ==
X-Received: by 2002:adf:bb4e:: with SMTP id x14mr14365949wrg.63.1588846934676;
        Thu, 07 May 2020 03:22:14 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id u127sm7457177wme.8.2020.05.07.03.22.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2020 03:22:14 -0700 (PDT)
Subject: Re: [PATCH 0/3] ACPI / utils: Add acpi_evaluate_reg() helper
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-acpi@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20200505132128.19476-1-hdegoede@redhat.com>
 <20200505154447.GU185537@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <3d39d404-98b1-a69e-77dc-779846c77b08@redhat.com>
Date:   Thu, 7 May 2020 12:22:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200505154447.GU185537@smile.fi.intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 5/5/20 5:44 PM, Andy Shevchenko wrote:
> On Tue, May 05, 2020 at 03:21:25PM +0200, Hans de Goede wrote:
>> Hi All,
>>
>> Here is a small series adding an acpi_evaluate_reg() helper, note
>> the third patch sits on top of a fix for the pinctrl-cherryview
>> driver which I recently submitted and which is still finding its
>> way upstream.
>>
>> Since this is not urgent (just a small code cleanup) I suggest
>> that the ACPI people can pick up patches 1-2 and then the last patch
>> can be merged post 5.8-rc1, at which point all the dependencies for
>> it should have landed already.
> 
> Thank you!
> 
> Some minor comments to be addressed.
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thank you, I will fix the remarks you have and send out a v2
with just patches 1 and 2 for now, then we can move forward
with those.

How to deal with the _REG not being called issue by the ACPICA
core issue on Cherryview devices is still being discussed, so
lets wait for the final fix for that and then I can send out
a new version of the 3th patch on top of that once the other
bits are merged.

Regards,

Hans

