Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DA9A524A9F
	for <lists+linux-gpio@lfdr.de>; Thu, 12 May 2022 12:46:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352787AbiELKqS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 May 2022 06:46:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352801AbiELKp7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 May 2022 06:45:59 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8EA51BC99
        for <linux-gpio@vger.kernel.org>; Thu, 12 May 2022 03:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1652352350;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TCJLtBpkCpoNhytrPnBMMa+Df/U29oTQnuhtYLtN2Ho=;
        b=Serh0A7BRRxe3aThqBtDQx8HZW2L6MTi6BUcITRn5MSdqq5sGfgKJs51qmNMJ6NvH2Q1fk
        N7ugflFs9AejJ0PbHjXUivNSb7K7/0Rld8K2ZiFt5NceQGmEK5MuvhEd4pAkqNC1eMicYV
        e/cMe8Q4ESrZU19YnqBQupF3c7Z+tmY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-98-nq4eHR7WP0Go6xL_nZxBAw-1; Thu, 12 May 2022 06:45:49 -0400
X-MC-Unique: nq4eHR7WP0Go6xL_nZxBAw-1
Received: by mail-ed1-f71.google.com with SMTP id f1-20020a50fe01000000b004282af18d8bso2906296edt.23
        for <linux-gpio@vger.kernel.org>; Thu, 12 May 2022 03:45:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TCJLtBpkCpoNhytrPnBMMa+Df/U29oTQnuhtYLtN2Ho=;
        b=IyXVeqIphTrwRLZt/NTkGeRCWqJImTN3H+8tM6AazOhVljfdbb7HYFlj0BC5+B5mAD
         O6I5jB5gq0neA7kf7hWS4OAfMPRfP8jnWFI7FEyzeWzlB5CuPQ9QDAN3Rt5vkb4k1OyH
         7gtkNS4YO4zlfGMBn1+7X862NTDelQ7pLxgMSEemYIgs0AjqOeDLuna+FBQ43r155FAo
         O+m0pP66T9U23S6aBJnZbDwGefQ7dmnW4fdylPYd7LWKEXsiJXH+aHfbzqVmNt+JxC4B
         HGic0+FdJhH9iHRZadt8WILrrppsz1VSHnzlF+GhKzZhORyNYFX6+wAuWqW9qZSGqeRK
         1T/g==
X-Gm-Message-State: AOAM531LeNDycmV/nCC6rz5Q7wD8txxMR69lSeU81krummRmdNc/+9Td
        oQ0gMzhWAHzmR6WfnJjK3ifvqeoprUwhXDy+Xdyr47L9yIpyA1LNqxOBvt076QsfgOVvb7XjFw1
        I/IlkLAwom66cz8LJAfJc9A==
X-Received: by 2002:aa7:d916:0:b0:425:d75f:ae68 with SMTP id a22-20020aa7d916000000b00425d75fae68mr34154805edr.270.1652352347838;
        Thu, 12 May 2022 03:45:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxECFOLs5RBdl3mHZa53gpKtF7VUFkt92t99kAnYQXrDSPfKSDLd1ZOUpb30VBwHJkpaK6kuQ==
X-Received: by 2002:aa7:d916:0:b0:425:d75f:ae68 with SMTP id a22-20020aa7d916000000b00425d75fae68mr34154784edr.270.1652352347584;
        Thu, 12 May 2022 03:45:47 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id bt10-20020a170906b14a00b006f3ef214e43sm1961957ejb.169.2022.05.12.03.45.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 May 2022 03:45:47 -0700 (PDT)
Message-ID: <196635f6-8215-d4e4-270e-7375af81136c@redhat.com>
Date:   Thu, 12 May 2022 12:45:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v5 0/8] platform/x86: introduce p2sb_bar() helper
Content-Language: en-US
To:     Lee Jones <lee.jones@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Tony Luck <tony.luck@intel.com>, Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        =?UTF-8?Q?=c5=81ukasz_Bartosik?= <lb@semihalf.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Yong <jonathan.yong@intel.com>,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Borislav Petkov <bp@alien8.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        James Morse <james.morse@arm.com>,
        Robert Richter <rric@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Peter Tyser <ptyser@xes-inc.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mark Gross <markgross@kernel.org>
References: <20220510151451.85561-1-andriy.shevchenko@linux.intel.com>
 <YnzZpE4JOLlxsjVc@google.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YnzZpE4JOLlxsjVc@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 5/12/22 11:55, Lee Jones wrote:
> On Tue, 10 May 2022, Andy Shevchenko wrote:
> 
>> There are a few users and at least one more is coming (*1) that would
>> like to utilize P2SB mechanism of hiding and unhiding a device from
>> the PCI configuration space.
>>
>> Here is the series to consolidate p2sb handling code for existing users
>> and provide a generic way for new comer(s).
>>
>> It also includes a patch to enable GPIO controllers on Apollo Lake
>> when it's used with ABL bootloader w/o ACPI support (*2).
>>
>> The patch that brings the helper ("platform/x86/intel: Add Primary to
>> Sideband (P2SB) bridge support") has a commit message that sheds a light
>> on what the P2SB is and why this is needed.
>>
>> The changes made in v5 do not change the main idea and the functionality
>> in a big scale. What we need is probably one more retest done by Henning
>> (*3). I hope to have it merged to v5.19-rc1 that Siemens can develop
>> their changes based on this series (*4).
>>
>> I have tested this on Apollo Lake platform (I'm able to see SPI NOR and
>> since we have an ACPI device for GPIO I do not see any attempts to recreate
>> one).
>>
>> *1) One in this series, and one is a recent merge of the Simatic IPC drivers
>> *2) This patch can be postponed as Lee hasn't given his tag yet.
>> *3) Henning gave his tag and I dared to used it even against changed patch 1
>> *4) The changes were posted in between of v4 and v5 of this series, but need
>>     more work.
>>
>> Taking into account the *2) the series is ready to be merged via PDx86 tree.
> 
> If that happens you need to do 2 things:
> 
> 1. Change all s/Acked-for-MFD-by/Acked-by/
> 2. Submit a pull-request that we can all pull from
> 
> Alternatively, I can apply this via MFD and do the same.

Applying this via MFD is fine with me and probably is the
logical thing to do since only 1/8 patches in the set is
a pdx86 patch and 3 patches are MFD patches.

Patch 1/8 already has my Acked-by for merging it through
the MFD tree.

Regards,

Hans


> 
>> Changes in v5:
>> - rewritten patch 1 to use pci_scan_single_device() (Lukas, Bjorn)
>> - rebased patch 2 on top of the new Intel SPI NOR codebase
>> - fixed a potential bug and rewritten resource filling in patch 5 (Lee)
>> - added many different tags in a few patches (Jean, Wolfram, Henning)
>>
>> Changes in v4:
>> - added tag to the entire series (Hans)
>> - added tag to pin control patch (Mika)
>> - dropped PCI core changes (PCI core doesn't want modifications to be made)
>> - as a consequence of the above merged necessary bits into p2sb.c
>> - added a check that p2sb is really hidden (Hans)
>> - added EDAC patches (reviewed by maintainer internally)
>>
>> Changes in v3:
>> - resent with cover letter
>>
>> Changes in v2:
>> - added parentheses around bus in macros (Joe)
>> - added tag (Jean)
>> - fixed indentation and wrapping in the header (Christoph)
>> - moved out of PCI realm to PDx86 as the best common denominator (Bjorn)
>> - added a verbose commit message to explain P2SB thingy (Bjorn)
>> - converted first parameter from pci_dev to pci_bus
>> - made first two parameters (bus and devfn) optional (Henning, Lee)
>> - added Intel pin control patch to the series (Henning, Mika)
>> - fixed English style in the commit message of one of MFD patch (Lee)
>> - added tags to my MFD LPC ICH patches (Lee)
>> - used consistently (c) (Lee)
>> - made indexing for MFD cell and resource arrays (Lee)
>> - fixed the resource size in i801 (Jean)
>>
>> Andy Shevchenko (6):
>>   pinctrl: intel: Check against matching data instead of ACPI companion
>>   mfd: lpc_ich: Factor out lpc_ich_enable_spi_write()
>>   mfd: lpc_ich: Switch to generic p2sb_bar()
>>   i2c: i801: convert to use common P2SB accessor
>>   EDAC, pnd2: Use proper I/O accessors and address space annotation
>>   EDAC, pnd2: convert to use common P2SB accessor
>>
>> Jonathan Yong (1):
>>   platform/x86/intel: Add Primary to Sideband (P2SB) bridge support
>>
>> Tan Jui Nee (1):
>>   mfd: lpc_ich: Add support for pinctrl in non-ACPI system
>>
>>  drivers/edac/Kconfig                   |   1 +
>>  drivers/edac/pnd2_edac.c               |  62 +++-------
>>  drivers/i2c/busses/Kconfig             |   1 +
>>  drivers/i2c/busses/i2c-i801.c          |  39 ++----
>>  drivers/mfd/Kconfig                    |   1 +
>>  drivers/mfd/lpc_ich.c                  | 161 +++++++++++++++++++------
>>  drivers/pinctrl/intel/pinctrl-intel.c  |  14 +--
>>  drivers/platform/x86/intel/Kconfig     |  12 ++
>>  drivers/platform/x86/intel/Makefile    |   2 +
>>  drivers/platform/x86/intel/p2sb.c      | 133 ++++++++++++++++++++
>>  include/linux/platform_data/x86/p2sb.h |  28 +++++
>>  11 files changed, 338 insertions(+), 116 deletions(-)
>>  create mode 100644 drivers/platform/x86/intel/p2sb.c
>>  create mode 100644 include/linux/platform_data/x86/p2sb.h
>>
>>
>> base-commit: 3bf222d317a20170ee17f082626c1e0f83537e13
> 

