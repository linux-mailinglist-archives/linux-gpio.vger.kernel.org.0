Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C95A162A154
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Nov 2022 19:30:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231749AbiKOSaD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Nov 2022 13:30:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231781AbiKOS3e (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Nov 2022 13:29:34 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FACA2FC37
        for <linux-gpio@vger.kernel.org>; Tue, 15 Nov 2022 10:29:33 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id l39-20020a05600c1d2700b003cf93c8156dso10890330wms.4
        for <linux-gpio@vger.kernel.org>; Tue, 15 Nov 2022 10:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ds5z1rs6fueVnbiRsTPFsTanePp0NVdRftbCE+tMkFk=;
        b=MQK0ybNHuyVRxBRB6Pv4BE8SSZlH1X1brI5UhlMglvBcNqUsL5WIq4eDaN7w7/l8Az
         eDeK4kRzVvpSFs0qDcOBehN73mpP2e2edIzJm9AKm0a+DGBWK37WnRbvunIb130JnTdX
         mPt9/AnO4o0PDj0ddVwu2p/WHDxfK+zdgwGcVfc3qtwPK19ydrhq8Re/tefkA/3oaulp
         rFnjfTuQi36TXU/x8yNf5dSa/UkMDOV3p1YCNU8ZrdybtbgCXx/eGlIW7X2p3X8OALgW
         N5hZeEY0k7bnJCrqfQ4Op/8f6p/QXGY9FQxM54O2zgk8skZR5yNzPsIbfDUGc1POGGnE
         gLvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ds5z1rs6fueVnbiRsTPFsTanePp0NVdRftbCE+tMkFk=;
        b=DU+ChbPYZ/uz5lHadBLBQD7V4qabIMQLHBx6FUPY6rNKHEMXFDrXzqrZZtAIEO72zD
         Ex1FAkqMxEn77giojD/TT37bBGohLTmyPWeHdMpRLBEj0YM6BbpzXnvP0kYSW8tvKJpA
         O66e7YpV4c8iM9JkCXQF2NwXvzThrlKn+t9NjY7NvgYJj76pmWeEpy9z/wmUWIG8KAPe
         NOv8oKqS1SoxMqa1JiNNhffHCr6pOKCOOCvyF1j3kbML/aosDV2tQPDMGw4w+fXzUwNS
         cUiy+yucFkNhJ86tVJfwU1Supoy2PLOZMoNweQJQWF66lCrMJc9ALM3ED3JmbeAGWBYW
         YLhg==
X-Gm-Message-State: ANoB5pkYqHytMQyFSblRKX/5sZVld+knhSW6vbhZCj9SYnPf6oYs9E7D
        kZgSTYgE3wFzzf5kTvz3jGn+SRHqQpx9agXx
X-Google-Smtp-Source: AA0mqf7cjDiBhtI+g8nBDQ8Hy7eQCciPJvGt277muAZFhp7+PiiQozxLYQW24b9kw7u2ucDCPtD/pw==
X-Received: by 2002:a05:600c:4f8f:b0:3cf:68bb:f5b8 with SMTP id n15-20020a05600c4f8f00b003cf68bbf5b8mr1367367wmq.67.1668536971591;
        Tue, 15 Nov 2022 10:29:31 -0800 (PST)
Received: from [192.168.1.166] ([212.228.7.114])
        by smtp.gmail.com with ESMTPSA id v11-20020a05600c444b00b003c70191f267sm23848162wmn.39.2022.11.15.10.29.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 10:29:30 -0800 (PST)
Message-ID: <3766343a-ce40-10aa-99dc-2ea94bc1ffbd@linaro.org>
Date:   Tue, 15 Nov 2022 18:29:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH RFC v2 0/3] pinctrl: add ACPI support to pin controller
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, mika.westerberg@linux.intel.com,
        rafael@kernel.org, linus.walleij@linaro.org
References: <20221115175415.650690-1-niyas.sait@linaro.org>
 <Y3PWjZb9Jci1oXyM@smile.fi.intel.com>
From:   Niyas Sait <niyas.sait@linaro.org>
In-Reply-To: <Y3PWjZb9Jci1oXyM@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

 > Cover letter doesn't point to the ASL code you are using.

I've built this patch with a prototype ACPI implementation for NXP 
I.MX8MP platform.

You can see the code here: 
https://gitlab.com/nsait-linaro/acpi-patches/-/blob/master/0001-add-acpi-pinctrl-support-for-i2c-controllers.patch.

 > 1) why do you need specific _DSD() for the pin mappings?

_DSD is required to pass the GPIO number to Pin mapping. Is there a 
better way to do it ?

 > 2) wgy you need vendor data for some of Pin*() resources?

Vendor data contains platform specific mux, config and input selection 
register for the pin group.

--
Niyas
