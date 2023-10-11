Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51B9D7C505A
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 12:38:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234803AbjJKKin (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 06:38:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231847AbjJKKim (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 06:38:42 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBD47B0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 03:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1697020676;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=B9T69CSeczQTNAGc3fH4cJghTMdZtaq9dJk8j6ttMDE=;
        b=ZWv8BMhVZGbq4E8yYG3IRN92PB+fU6LIdRdcR2BEDjVrL66rUxK7fhLJ53PQf2UTT6yzyD
        6YEw6LLuHRBkOCumx1WKZQBbB+7MXE4fzCpi+RNGwFqiCVYqOXwjCc10pLNP1jyI44shjw
        dYeq3x6DNft/wF9AtWt/pkLw+H2WPFA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-475-VHsY8om1N5KnetSLnx6Gwg-1; Wed, 11 Oct 2023 06:37:54 -0400
X-MC-Unique: VHsY8om1N5KnetSLnx6Gwg-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9b2e030e4caso88069866b.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 03:37:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697020673; x=1697625473;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B9T69CSeczQTNAGc3fH4cJghTMdZtaq9dJk8j6ttMDE=;
        b=YLG45z2VVqhOndR+k8jgk7ik8uXK68OPOAkW1XC+71xnfnMt1v+TP6NC52qqr4WGaL
         Dnr2HP86e0g+E77ng8XzAsg2s3432vUwyPDYhQAVjFHs/OokAgH1YsA/LOTRFyjJcedY
         k0Rg/NhJ9QhbD/zI0D7rEJqwPgHVccQr4g71Sig5QU+HTaHwdcQCT1/fqppcqkLxM3T5
         chYYuaI2l2WbbvDvEyYnE1OzYaHv5HY+KDl6vfXQSpN4wp4WfB/ZxhTvD6xTEsn82FJH
         CiHa1cXSumGv6IdVjwGO30I4bGNsATnxNwztSGH0+dKg2/SWsTvgiubgmGD5CDbRfGhG
         sgFg==
X-Gm-Message-State: AOJu0YzO9l4c9eLpagoT8J8J/M4zi6KHdH1YtlTga02i2BPoDU8tMblG
        pvPG/DiscQYWxtrpq/6tyGnUBg2GhaTdNHRlIWZ0rL8ZV2N26UVfGfHKvxR1/8HctHVJ1S1I/WP
        KP3+Lzwjc5J+JorvGJsQGpQ==
X-Received: by 2002:a05:6402:2547:b0:531:14c4:ae30 with SMTP id l7-20020a056402254700b0053114c4ae30mr16765437edb.0.1697020673669;
        Wed, 11 Oct 2023 03:37:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpqK//D1TgfDznC+Wtwpoxq0pK4T0TpAW3VYUjkeuymqvaSZAJeCmcSYMMkbgvTRmAH89JYQ==
X-Received: by 2002:a05:6402:2547:b0:531:14c4:ae30 with SMTP id l7-20020a056402254700b0053114c4ae30mr16765416edb.0.1697020673313;
        Wed, 11 Oct 2023 03:37:53 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id s14-20020a056402014e00b005309eb7544fsm8660244edu.45.2023.10.11.03.37.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 03:37:52 -0700 (PDT)
Message-ID: <6a87b43a-0648-28d4-6c69-e0f684e44eb6@redhat.com>
Date:   Wed, 11 Oct 2023 12:37:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v20 1/4] usb: Add support for Intel LJCA device
Content-Language: en-US, nl
To:     Andy Shevchenko <andriy.shevchenko@intel.com>,
        Wentong Wu <wentong.wu@intel.com>
Cc:     gregkh@linuxfoundation.org, oneukum@suse.com, wsa@kernel.org,
        andi.shyti@linux.intel.com, broonie@kernel.org,
        bartosz.golaszewski@linaro.org, linus.walleij@linaro.org,
        linux-usb@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org, sakari.ailus@linux.intel.com,
        zhifeng.wang@intel.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1696833205-16716-1-git-send-email-wentong.wu@intel.com>
 <1696833205-16716-2-git-send-email-wentong.wu@intel.com>
 <ZSZ3IPgLk7uC5UGI@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZSZ3IPgLk7uC5UGI@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 10/11/23 12:21, Andy Shevchenko wrote:
> On Mon, Oct 09, 2023 at 02:33:22PM +0800, Wentong Wu wrote:
>> Implements the USB part of Intel USB-I2C/GPIO/SPI adapter device
>> named "La Jolla Cove Adapter" (LJCA).
>>
>> The communication between the various LJCA module drivers and the
>> hardware will be muxed/demuxed by this driver. Three modules (
>> I2C, GPIO, and SPI) are supported currently.
>>
>> Each sub-module of LJCA device is identified by type field within
>> the LJCA message header.
>>
>> The sub-modules of LJCA can use ljca_transfer() to issue a transfer
>> between host and hardware. And ljca_register_event_cb is exported
>> to LJCA sub-module drivers for hardware event subscription.
>>
>> The minimum code in ASL that covers this board is
>> Scope (\_SB.PCI0.DWC3.RHUB.HS01)
>>     {
>>         Device (GPIO)
>>         {
>>             Name (_ADR, Zero)
>>             Name (_STA, 0x0F)
>>         }
>>
>>         Device (I2C)
>>         {
>>             Name (_ADR, One)
>>             Name (_STA, 0x0F)
>>         }
>>
>>         Device (SPI)
>>         {
>>             Name (_ADR, 0x02)
>>             Name (_STA, 0x0F)
>>         }
>>     }
> 
> This commit message is not true anymore, or misleading at bare minimum.
> The ACPI specification is crystal clear about usage _ADR and _HID, i.e.
> they must NOT be used together for the same device node. So, can you
> clarify how the DSDT is organized and update the commit message and
> it may require (quite likely) to redesign the architecture of this
> driver. Sorry I missed this from previous rounds as I was busy by
> something else.

This part of the commit message unfortunately is not accurate.
_ADR is not used in either DSDTs of shipping hw; nor in the code.

The code in question parsing the relevant part of the DSDT looks
like this:

static int ljca_match_device_ids(struct acpi_device *adev, void *data)
{
        struct ljca_match_ids_walk_data *wd = data;
        const char *uid = acpi_device_uid(adev);

        if (acpi_match_device_ids(adev, wd->ids))
                return 0;

        if (!wd->uid)
                goto match;

        if (!uid)
                /*
                 * Some DSDTs have only one ACPI companion for the two I2C
                 * controllers and they don't set a UID at all (e.g. Dell
                 * Latitude 9420). On these platforms only the first I2C
                 * controller is used, so if a HID match has no UID we use
                 * "0" as the UID and assign ACPI companion to the first
                 * I2C controller.
                 */
                uid = "0";
        else
                uid = strchr(uid, wd->uid[0]);

        if (!uid || strcmp(uid, wd->uid))
                return 0;

match:
        wd->adev = adev;

        return 1;
}

Notice that it check _UID (for some child devices, only those of
which there may be more then 1 have a UID set in the DSDT) and
that in case of requested but missing UID it assumes UID = "0"
for compatibility with older DSDTs which lack the UID.

And relevant DSDT bits from early hw (TigerLake Dell Latitude 9420)
Note no UID for the I2C node even though the LJCA USB IO expander
has 2 I2C controllers :

    Scope (_SB.PC00.XHCI.RHUB.HS06)
    {
            Device (VGPO)
            {
                Name (_HID, "INTC1074")  // _HID: Hardware ID
                Name (_DDN, "Intel UsbGpio Device")  // _DDN: DOS Device Name
            }

            Device (VI2C)
            {
                Name (_HID, "INTC1075")  // _HID: Hardware ID
                Name (_DDN, "Intel UsbI2C Device")  // _DDN: DOS Device Name
            }
    }

And for newer hw (Lenovo Thinkpad X1 yoga gen7, alder lake):

        Scope (_SB.PC00.XHCI.RHUB.HS08)
        {
            Device (VGPO)
            {
                Name (_HID, "INTC1096")  // _HID: Hardware ID
                Name (_DDN, "Intel UsbGpio Device")  // _DDN: DOS Device Name
            }

            Device (VIC0)
            {
                Name (_HID, "INTC1097")  // _HID: Hardware ID
                Name (_DDN, "Intel UsbI2C Device")  // _DDN: DOS Device Name
                Name (_UID, Zero)  // _UID: Unique ID
            }

            Device (VIC1)
            {
                Name (_HID, "INTC1097")  // _HID: Hardware ID
                Name (_DDN, "Intel UsbI2C Device")  // _DDN: DOS Device Name
                Name (_UID, One)  // _UID: Unique ID
            }

            Device (VSPI)
            {
                Name (_HID, "INTC1098")  // _HID: Hardware ID
                Name (_DDN, "Intel UsbSPI Device")  // _DDN: DOS Device Name
            }
        }

Note UIDs are used for the I2C controllers but not for the singleton
SPI and GPIO controllers.

TL;DR: there is nothing to worry about here, but the commit message
should be updated to reflect reality.

Regards,

Hans

