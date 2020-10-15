Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00D6A28EBF2
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Oct 2020 06:06:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726596AbgJOEGy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Oct 2020 00:06:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725208AbgJOEGy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Oct 2020 00:06:54 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56C16C061755
        for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2020 21:06:54 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id o7so923202pgv.6
        for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2020 21:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7VNUQ41VUTjGSF/lh9jbtGc0lbaxqihZJsvmjhNeqSM=;
        b=n8ITrY1npeUMBSZ8xEZNn4aOPk+lozBFXOu032qqRSP5pkdeT7PTnzcf+3reRoUerI
         FbiDQOEXWjT3DNiHNLTpw0R1QBfrc/AHuekAGTLgZtCVkqeSmiP0q7p1OAWxdhUoorCT
         bpNMTio7edgvJKAOan2+eGyxvJxPFEE46c96rpNaBBNnaRU5vpebNkzd16sD+vVTxavp
         aYV0ND2/UFb3BX3E6FmwCrVCG3y7rXlAhbZ3jb/6i0asOcKjdiMHpP1pkVRUGxLyHfd0
         Q22RRT6HP9YX18UU9s/27I37tFYIctvqSqdnt3asiy8+MiDc1Al5aoyRVHhn9inKh/6o
         JjmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7VNUQ41VUTjGSF/lh9jbtGc0lbaxqihZJsvmjhNeqSM=;
        b=Wpjx8abMgmx3INdgpz1sBJkmFBm8SZN2eGsBV+s4w6FjVo2AVnfhyEaikHeGtaUO85
         OxKNLsAtJ3vGSYKOyTl43nEo49WMSYk98n40HcpAEGD4jj6+RhQsEL9frJcx6ktvD5Au
         bxhN/ahrTJhOuVfybUj6Ik5ZD3ENX0Ji52+39zkH94T7tNkGj5ggkg8hNxk4FzOl302R
         kd2ZfjADKIDm3hYgZAtiE/Q6ZBKAu102tfGTgh8y4zA3DSsbfg0Rrs1wqQXQD7nMLD3n
         p62UFvH5nnk23BSH2RaoJLnZDt6f2TTUpYdent4fQ4Vwb6+R1dRwmiyGfbrCIRORxzG/
         frlw==
X-Gm-Message-State: AOAM530piV1SFqKwDaf9FLAj8JDqzvIchbWLusIpg+gahOdA/1OMB6+m
        hCpLSyvHHEeZMGluNBZzR30=
X-Google-Smtp-Source: ABdhPJwpKLJQs85MajhbI5E2rjujlgxt21EBrnSqJUiqNxmeWrawLZii+mg67Woj77obRqmtKqrBgw==
X-Received: by 2002:a63:140e:: with SMTP id u14mr1716301pgl.91.1602734813534;
        Wed, 14 Oct 2020 21:06:53 -0700 (PDT)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
        by smtp.gmail.com with ESMTPSA id s23sm1134880pgl.47.2020.10.14.21.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 21:06:52 -0700 (PDT)
From:   Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date:   Thu, 15 Oct 2020 12:06:29 +0800
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        wang jun <availa@outlook.com>,
        Nehal Shah <Nehal-bakulchandra.Shah@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: Any other ways to debug GPIO interrupt controller (pinctrl-amd)
 for broken touchpads of a new laptop model?
Message-ID: <20201015040629.ycv5nc7vit6wcynu@Rk>
References: <20201003230340.42mtl35n4ka4d5qw@Rk>
 <20201004051644.f3fg2oavbobrwhf6@Rk>
 <20201006044941.fdjsp346kc5thyzy@Rk>
 <e9cfac98-51fc-b169-cb74-80fd11de12ec@redhat.com>
 <20201006083157.3pg6zvju5buxspns@Rk>
 <69853d2b-239c-79d5-bf6f-7dc0eec65602@redhat.com>
 <4f02cbdf-e1dd-b138-4975-118dd4f86089@redhat.com>
 <a07d3890-f560-855f-3631-a3d5848dcdf5@redhat.com>
 <20201014042420.fkkyabmrkiekpmfw@Rk>
 <df2c008b-e7b5-4fdd-42ea-4d1c62b52139@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <df2c008b-e7b5-4fdd-42ea-4d1c62b52139@redhat.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 14, 2020 at 01:46:14PM +0200, Hans de Goede wrote:
>Hi,
>
[...]
>
>I've never seen this kinda glitch/debounce filter where
>you can filter out only one type of level before, so
>I wonder if the code maybe simply got it wrong, also for
>a level type irq I really see no objection to just
>use DB_TYPE_REMOVE_GLITCH instead of the weird "half"
>filters.
>
>So I just ran a git blame and the DB_TYPE_PRESERVE_HIGH_GLITCH
>has been there from the very first commit of this driver,
>I wonder if it has been wrong all this time and should be
>inverted (so DB_TYPE_PRESERVE_LOW_GLITCH instead).
>
>I think we may want to just play it safe though and simply
>switch to DB_TYPE_REMOVE_GLITCH as we already do for all
>edge types and when amd_gpio_set_config() gets called!
>
>Linus, what do you think about just switching to
>DB_TYPE_REMOVE_GLITCH for level type irqs (unifying them
>with all the other modes) and not mucking with this weird,
>undocumented "half" filter modes ?
>
>>Or can you point to some references? I've gain some
>>experience about how to configure the GPIO controller by studying the
>>code of pinctrl-amd and pinctrl-baytrail (I can't find the hardware
>>reference manual for baytrail either). I also tweaked the configuration
>>in pinctrl-amd, for example, setting the debounce timeout to 976 usec
>>and 3.9 msec without disabling the glitch filter could also save the
>>touchpad. But I need some knowledge to understand why this touchpad [1]
>>which also uses the buggy pinctrl-amd isn't affected.
>>
>>[1] https://github.com/Syniurge/i2c-amd-mp2/issues/11#issuecomment-707427095
>
>My guess would be that it uses edge types interrupts instead ?
>I have seen that quite a few times, even though it is weird
>to do that for i2c devices.
>
Actually it uses the level type interrupt according to the shared
DSDT.dsl,

         Device (TPDA)
         {
             Name (_HID, "SYNA2B3F")  // _HID: Hardware ID
             Name (_CID, "PNP0C50" /* HID Protocol Device (I2C bus) */)  // _CID: Compatible ID
             Name (_UID, 0x08)  // _UID: Unique ID
             Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
             {
                 Name (RBUF, ResourceTemplate ()
                 {
                     I2cSerialBusV2 (0x002C, ControllerInitiated, 0x00061A80,
                         AddressingMode7Bit, "\\_SB.I2CD",
                         0x00, ResourceConsumer, , Exclusive,
                         )
                     GpioInt (Level, ActiveLow, ExclusiveAndWake, PullUp, 0x0000,
                         "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                         )
                         {   // Pin list
                             0x0003
                         }
                 })
                 Return (RBUF) /* \_SB_.I2CD.TPDA._CRS.RBUF */
             }

>Regards,
>
>Hans
>

--
Best regards,
Coiby
