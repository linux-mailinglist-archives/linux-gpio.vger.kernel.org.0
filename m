Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C00CB540488
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jun 2022 19:15:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345466AbiFGRPm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jun 2022 13:15:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345470AbiFGRPk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jun 2022 13:15:40 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id ECD1610276C
        for <linux-gpio@vger.kernel.org>; Tue,  7 Jun 2022 10:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1654622139;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ylQrXRxCE5WefGCA0g7YA7OMYNSZuN3Qp/+5VKhMNKM=;
        b=O+qFplb0SThYmxpCVm1fiEsk6/0pDyfrQnuPXveWV19z/9vai40+PT1aUj2kQYZ3AYyh48
        atxO4jY4wFRwP+g+SgRUxGYzv3j4o0ZGMsjgcaE3L+MScSZ3KdWcix/4LrN8aN/eCgUyw6
        KCav7x0D26kmKcTJHuE127B/vB53A1E=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-nAJGfSDiPiKA6djJVbVF9w-1; Tue, 07 Jun 2022 13:15:36 -0400
X-MC-Unique: nAJGfSDiPiKA6djJVbVF9w-1
Received: by mail-ed1-f72.google.com with SMTP id t14-20020a056402020e00b0042bd6f4467cso13012520edv.9
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jun 2022 10:15:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ylQrXRxCE5WefGCA0g7YA7OMYNSZuN3Qp/+5VKhMNKM=;
        b=6FqM3AW0bjKXLbC7wdIr/U4hy8v65tMT7LO0NFa0tYAF89xZs1ZM9c9cHFPtS/yahG
         fVQL0L259AP/nYQbDCeADOVBMc+qwaBOYLQNf93Oi+czmuFpfFZyg5owEPbqcx0mL2so
         PRQwOE2NeZ2K86tmmmyTSepBEmooIAMd0PqD12eQ97AMgMrDrST7PL8CBbPpNoPadXm6
         KS82PxjnYgvEKvKkYfXWtZ8nF/JgN1Lzjr2cEi/7GqeuqGZ8m2zh+opsNHi2JYheysnT
         j0/zJxHogKR04cHrlLBS8T3Gv1gO/KTUGMZ62X0JqEFtKzFjqp8lGUlwqTp0+8joqFd3
         64Eg==
X-Gm-Message-State: AOAM530N+kk7gn/Zn+jcMtTkSML7Rm1EKWHTdmbF+TirNPfOAu5dPAU4
        iD+F0i6HYuJR2SS0oH96BjVmEn1sSfxlp2J09oVcWHA9F6WWMGWiYmioM9CGE2/N6ZWwBlt1Jhl
        T5gEWHe1Oo7v8Xbw2eKBk3w==
X-Received: by 2002:a05:6402:5114:b0:42f:b5f3:1f96 with SMTP id m20-20020a056402511400b0042fb5f31f96mr23188465edd.260.1654622134895;
        Tue, 07 Jun 2022 10:15:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzX1Cu3nPKRVmyJ+MDxgaeYIxZau3BfUeQpL7WBwfYfiESgqradh0LlQ1DOcm/hAz2wDsIaw==
X-Received: by 2002:a05:6402:5114:b0:42f:b5f3:1f96 with SMTP id m20-20020a056402511400b0042fb5f31f96mr23188425edd.260.1654622134615;
        Tue, 07 Jun 2022 10:15:34 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id b23-20020a17090630d700b0070e1adff390sm5926625ejb.34.2022.06.07.10.15.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jun 2022 10:15:33 -0700 (PDT)
Message-ID: <938117aa-001c-9e31-f50c-dbfa2d376d76@redhat.com>
Date:   Tue, 7 Jun 2022 19:15:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v6 11/12] platform/x86: simatic-ipc: drop custom P2SB bar
 code
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Tony Luck <tony.luck@intel.com>, Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Henning Schild <henning.schild@siemens.com>,
        Lee Jones <lee.jones@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Yong <jonathan.yong@intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Cc:     Borislav Petkov <bp@alien8.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        James Morse <james.morse@arm.com>,
        Robert Richter <rric@kernel.org>,
        Jean Delvare <jdelvare@suse.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Tyser <ptyser@xes-inc.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mark Gross <markgross@kernel.org>
References: <20220606164138.66535-1-andriy.shevchenko@linux.intel.com>
 <20220606164138.66535-12-andriy.shevchenko@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220606164138.66535-12-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 6/6/22 18:41, Andy Shevchenko wrote:
> From: Henning Schild <henning.schild@siemens.com>
> 
> The two drivers that used to use this have been switched over to the
> common P2SB accessor, so this code is not needed any longer.
> 
> Signed-off-by: Henning Schild <henning.schild@siemens.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Also Ack for merging this through the MFD tree.

Regards,

Hans

> ---
>  drivers/platform/x86/simatic-ipc.c            | 38 -------------------
>  .../platform_data/x86/simatic-ipc-base.h      |  2 -
>  2 files changed, 40 deletions(-)
> 
> diff --git a/drivers/platform/x86/simatic-ipc.c b/drivers/platform/x86/simatic-ipc.c
> index b599cda5ba3c..26c35e1660cb 100644
> --- a/drivers/platform/x86/simatic-ipc.c
> +++ b/drivers/platform/x86/simatic-ipc.c
> @@ -101,44 +101,6 @@ static int register_platform_devices(u32 station_id)
>  	return 0;
>  }
>  
> -/* FIXME: this should eventually be done with generic P2SB discovery code
> - * the individual drivers for watchdogs and LEDs access memory that implements
> - * GPIO, but pinctrl will not come up because of missing ACPI entries
> - *
> - * While there is no conflict a cleaner solution would be to somehow bring up
> - * pinctrl even with these ACPI entries missing, and base the drivers on pinctrl.
> - * After which the following function could be dropped, together with the code
> - * poking the memory.
> - */
> -/*
> - * Get membase address from PCI, used in leds and wdt module. Here we read
> - * the bar0. The final address calculation is done in the appropriate modules
> - */
> -u32 simatic_ipc_get_membase0(unsigned int p2sb)
> -{
> -	struct pci_bus *bus;
> -	u32 bar0 = 0;
> -	/*
> -	 * The GPIO memory is in bar0 of the hidden P2SB device.
> -	 * Unhide the device to have a quick look at it, before we hide it
> -	 * again.
> -	 * Also grab the pci rescan lock so that device does not get discovered
> -	 * and remapped while it is visible.
> -	 * This code is inspired by drivers/mfd/lpc_ich.c
> -	 */
> -	bus = pci_find_bus(0, 0);
> -	pci_lock_rescan_remove();
> -	pci_bus_write_config_byte(bus, p2sb, 0xE1, 0x0);
> -	pci_bus_read_config_dword(bus, p2sb, PCI_BASE_ADDRESS_0, &bar0);
> -
> -	bar0 &= ~0xf;
> -	pci_bus_write_config_byte(bus, p2sb, 0xE1, 0x1);
> -	pci_unlock_rescan_remove();
> -
> -	return bar0;
> -}
> -EXPORT_SYMBOL(simatic_ipc_get_membase0);
> -
>  static int __init simatic_ipc_init_module(void)
>  {
>  	const struct dmi_system_id *match;
> diff --git a/include/linux/platform_data/x86/simatic-ipc-base.h b/include/linux/platform_data/x86/simatic-ipc-base.h
> index 62d2bc774067..39fefd48cf4d 100644
> --- a/include/linux/platform_data/x86/simatic-ipc-base.h
> +++ b/include/linux/platform_data/x86/simatic-ipc-base.h
> @@ -24,6 +24,4 @@ struct simatic_ipc_platform {
>  	u8	devmode;
>  };
>  
> -u32 simatic_ipc_get_membase0(unsigned int p2sb);
> -
>  #endif /* __PLATFORM_DATA_X86_SIMATIC_IPC_BASE_H */

