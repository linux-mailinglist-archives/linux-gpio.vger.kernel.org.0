Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AED12A376F
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Nov 2020 01:05:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbgKCAFy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Nov 2020 19:05:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725940AbgKCAFx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Nov 2020 19:05:53 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCF0CC0617A6
        for <linux-gpio@vger.kernel.org>; Mon,  2 Nov 2020 16:05:53 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id c20so12621581pfr.8
        for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2020 16:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZqsUyULNQ5T8eVJBY1wAcNGYl5gI5fUvIShFJJSQzK0=;
        b=DfgNDEmfriKjtlAucXQj7bqPQtlYfUKZcYqfcCpViKFCMroSdVadUUPCA2eXpNxmeD
         UAmzH52ywXogsmH/VmxvVkoSkJaoiO8cItn1kh04gAx0k29YtdpUSCRMEx+gIGI2wbzQ
         I8DL86A7T7ah5GnGKrAkggTkRLxLjqvwlmJX0KY99DR5g9s3GZHmKQ0Um50ifs94Vh6P
         j76n4hN5x1GymUjXJWtKJwgHNM/OBFKPKDZ6R0n8jAkHyoAPQMWsqp4N919YYhlhy2HV
         3V9pVuTtKvtuxVvM4K8hWJOpLZvc/NaEQxvrISuzexfP32IZ6nw6nfwjBveZAeFAlth+
         LrNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZqsUyULNQ5T8eVJBY1wAcNGYl5gI5fUvIShFJJSQzK0=;
        b=i+/8MfaV0G+pTZAY1Pf6Ddii7L1LEQM/tCZYywV844raCoBZDfU4REZdq9nIcpMuQS
         +Yh3wBKy3z5k6tmeIg2pzct7qzwE0MS7rvdl3v+6m6/fk4jGGFI75VgbvNuzie/9J2Jj
         hYxIzFuBObHSpzT72yEOy9o1MyeGnDmbXrwm8Qw/TDRyG5m1ijzmZlvQjRwkANa9D47n
         MqPoobUgsyKaRjXv5U+8JFfEpEdZL2D73UmvvHSjttAFfJvniyco6PO7oUO8h0lF0BdA
         0G5xuiA0cRWk1JWu3lLa6dCq2anBp6Qg49ExYufnS2WGDbg/5ieO/c5Jz8PlOE8CvRDX
         BCyQ==
X-Gm-Message-State: AOAM5315JDO6Itwyhxh64CHGFUYGQgEEaiR1P496MsKSPoUCmaHN7P5t
        gwULq+l+68XDAig7fmxwaR7/KBiz75LtnA==
X-Google-Smtp-Source: ABdhPJyGqbbOX2zoz+z1HEzXPjET4+G2CbC1xQbDICwsFOZFmmRGiYBaN2H+fXLPSSOS504un3c2FQ==
X-Received: by 2002:a63:e34a:: with SMTP id o10mr14952419pgj.129.1604361953302;
        Mon, 02 Nov 2020 16:05:53 -0800 (PST)
Received: from localhost ([160.16.113.140])
        by smtp.gmail.com with ESMTPSA id fy13sm606484pjb.10.2020.11.02.16.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 16:05:52 -0800 (PST)
From:   Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date:   Tue, 3 Nov 2020 08:05:07 +0800
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        wang jun <availa@outlook.com>,
        Nehal Shah <Nehal-bakulchandra.Shah@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: Any other ways to debug GPIO interrupt controller (pinctrl-amd)
 for broken touchpads of a new laptop model?
Message-ID: <20201103000507.ufzukd2vkb5h2e3b@Rk>
References: <20201006044941.fdjsp346kc5thyzy@Rk>
 <e9cfac98-51fc-b169-cb74-80fd11de12ec@redhat.com>
 <20201006083157.3pg6zvju5buxspns@Rk>
 <69853d2b-239c-79d5-bf6f-7dc0eec65602@redhat.com>
 <4f02cbdf-e1dd-b138-4975-118dd4f86089@redhat.com>
 <a07d3890-f560-855f-3631-a3d5848dcdf5@redhat.com>
 <20201014042420.fkkyabmrkiekpmfw@Rk>
 <df2c008b-e7b5-4fdd-42ea-4d1c62b52139@redhat.com>
 <20201026225400.37almqey2wxyazkn@Rk>
 <f15806d6-32e2-c6b0-8f96-670a196380a8@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <f15806d6-32e2-c6b0-8f96-670a196380a8@redhat.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 27, 2020 at 11:09:11AM +0100, Hans de Goede wrote:
>Hi,
>
...
>
>So I see 2 ways to move forward with his:
>
>1. Just disable the debounce filter for level type IRQs; or
>2. Add a helper to sanitize the debounce pulse-duration setting and
>   call that when setting the IRQ type.
>   This helper would read the setting check it is not crazy long for
>   an IRQ-line (lets say anything above 1 ms is crazy long) and if it
>   is crazy long then overwrite it with a saner value.
>
>2. is a bit tricky, because if the IRQ line comes from a chip then
>obviously max 1ms debouncing to catch eletrical interference should be
>fine. But sometimes cheap buttons for things like volume up/down on tablets
>are directly connected to GPIOs and then we may want longer debouncing...
>
>So if we do 2. we may want to limit it to only level type IRQs too.
>
>Note I have contacted AMD about this and asked them for some input on this,
>ideally they can tell us how exactly we should program the debounce filter
>and based on which data we should do that.

Is there any update from AMD? Based on the discussion, I'm going to
submit a patch to disable debounce filter for both level and edge
type IRQs, i.e. to remove relevant code in amd_gpio_irq_set_type of
drivers/pinctrl/pinctrl-amd.c since setting debounce filter is
orthogonal to setting irq type and Andy has submitted the patch to
support setting debounce setting supplied by ACPI in gpiolib-acpi.c

Btw, did you contact AMD through a representative? Obviously CC them
didn't get their attention. There is an inconsistency for configuring
debounce timeout in pinctrl-amd as was spotted by Andy [1]. I also need
their feedback for this matter.

[1] https://lore.kernel.org/patchwork/comment/1522675/
>
>Regards,
>
>Hans
>

--
Best regards,
Coiby
