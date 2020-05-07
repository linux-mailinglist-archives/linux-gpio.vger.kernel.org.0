Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B09D1C86B6
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2020 12:30:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725809AbgEGKap (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 May 2020 06:30:45 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:48254 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725879AbgEGKao (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 May 2020 06:30:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588847443;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8jYlXVIeYwPIAaTa/8NGwUOA9TXF5pyDMIzCVjgMxm8=;
        b=ivwWZXbROD32cK7D8rOtXgaG8fpRWY18p7vEFONxCTAdk6HVY3wOkDl3euba4q7kJSkdE6
        O/xoRGH2u2Bhyi+G5RbiztfVTMsmF3GB7vxtqrMyaj3eJZxy2ULSIJifZlQTH+v9w+Ubjw
        KCL68FHsfsgu/Cu1QHatNLnq2ic3uEc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-beLKOtBaNP293jH0T4n7bg-1; Thu, 07 May 2020 06:30:41 -0400
X-MC-Unique: beLKOtBaNP293jH0T4n7bg-1
Received: by mail-wr1-f71.google.com with SMTP id z8so3147391wrp.7
        for <linux-gpio@vger.kernel.org>; Thu, 07 May 2020 03:30:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8jYlXVIeYwPIAaTa/8NGwUOA9TXF5pyDMIzCVjgMxm8=;
        b=cvVb2R+ie2Mqgzw0vAxLEzxmsksKs00olqKuDft06x53kPclyka84YWGNLwHCJGz2V
         VUf6yKd1ZfN0HrHNmn6cGL5AJvUlaKHBLg1TsGuLlP1/6uFhXZ2wJ/EGYuSLv5cAqsNW
         N08QkJo9K3nlgg245DA2nQUleAleAYeOhvPveN2taslMm7zO/Ckr7r0lOszXKARcwfsG
         BTUjdKR9ppcyl8LlQX+PptTYrOPM++bvHLpcq34imzJxK1YmV2tBk4vL2Yr5Bl5w8MLi
         3pAB/uGD+D6bzm6VLeQvJxjPKD44AnxGSFrMfqmZU++eeAMDSsRqpSvoleDs+rhjFDe5
         fj1A==
X-Gm-Message-State: AGi0Pube1l+B6aTaXkpqITOVW5iVo7CHnoIvCuHn0S7u++MsA8tAZ68A
        Gv3KQyOeUm6VxiNu6dG6pkJ5SLHLP6yt+NNFKnj1ZPUTFQWc5hy9J2I6oceFn7nVMzDmkzBLjPs
        HIU2yDipGCvvfNmcFupo4ig==
X-Received: by 2002:a5d:5642:: with SMTP id j2mr3913172wrw.52.1588847439004;
        Thu, 07 May 2020 03:30:39 -0700 (PDT)
X-Google-Smtp-Source: APiQypLYsFyxuTZc14Fgz1L9YXfTpaCsMoR+ZYvt4JlYFVWwq/uNI7MbYeDdYuumr/g0A43oTs6NUA==
X-Received: by 2002:a5d:5642:: with SMTP id j2mr3913158wrw.52.1588847438835;
        Thu, 07 May 2020 03:30:38 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id q187sm7512995wma.41.2020.05.07.03.30.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2020 03:30:38 -0700 (PDT)
Subject: Re: [PATCH 1/3] ACPI / utils: Add acpi_evaluate_reg() helper
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-acpi@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20200505132128.19476-1-hdegoede@redhat.com>
 <20200505132128.19476-2-hdegoede@redhat.com>
 <20200505154205.GR185537@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <3a8682dc-5423-d057-4289-929a84f28f94@redhat.com>
Date:   Thu, 7 May 2020 12:30:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200505154205.GR185537@smile.fi.intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 5/5/20 5:42 PM, Andy Shevchenko wrote:
> On Tue, May 05, 2020 at 03:21:26PM +0200, Hans de Goede wrote:
>> With a recent fix to the pinctrl-cherryview driver we know have
>> 2 drivers open-coding the parameter building / passing for calling
>> _REG on an ACPI handle.
>>
>> Add a helper for this, so that these 2 drivers can be converted to this
>> helper.
> 
> Suggested-by?

Right sorry about that I will fix this for v2.

 >> + * @function: Parameter to pass to _REG one of ACPI_REG_CONNECT or
 >> + *            ACPI_REG_DISCONNECT
 >
 > Is it enum or definitions? If former can we refer to it?

These are #define-s.

Regards,

Hans

