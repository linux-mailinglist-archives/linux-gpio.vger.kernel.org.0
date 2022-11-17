Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96E0062DCBA
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Nov 2022 14:28:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239969AbiKQN2I (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Nov 2022 08:28:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239934AbiKQN2G (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Nov 2022 08:28:06 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD84F5F85B
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 05:28:03 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id v124-20020a1cac82000000b003cf7a4ea2caso5092521wme.5
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 05:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3uv2+BWjn3npG6/fe85H3XGSNIkic2RCEPnfweeM1kA=;
        b=md8Ontep3EcXjVK2NUCN5q78pEpcZsUFKU65x0jX9YQh1wIaBVYmNU+2QOBSaAxyUj
         R7+5j7DFPD3zwOMW3mydZABSPX5SrC+ouiR57MVqkppxfWero8AdL8BBIM2JUbhW5tSH
         auRs/mYWSJHXtvEA0CMIwS9fQf6S0z9sNyDHAJicgJ0XDiXBdre8vI75k6V67OG1GuC2
         dVPU742WU8QBgs1Uu7LobQYRfnJW2VnQCwZ6J2ZR2k6+o8cMDibq0rjUw2RjbkblXeUr
         t6Hp2ONuuj8i3I7Y8VQDVTA4ZLGo6tQhnmf/m9XUbF3skf0wQ49VJXe5566BBULsp5ei
         zSBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3uv2+BWjn3npG6/fe85H3XGSNIkic2RCEPnfweeM1kA=;
        b=77Iv+7AXek05VFHr6O1PkpToAKiIorIy7fqNJ5ikKNgwjGVGzHza3u36QkSdDrP64P
         c16oLmX5OGtU8DU264PFhEMLXgtil3DME2s78CwCCqIFvuJLko12elynllNvG+R60JOd
         WXAgzKo2ipl6CAyx4blddcmJNBshAipmpfntFWZjKYRTU5k+lybu+9W/yxzGRCYNVTKn
         bn6oXXZ54pu49XXVb4ZqW9evBu4E+erC81lv9OYBPqoTmJtvYhKomoGFzKuh1Exp0Kzr
         vGBtlaL1jnOcZbs5TXlninw0jbROZlFqmoctY4qSxD1Q1lvPBi9Fi5FjYrpFVThZZiPi
         JsTA==
X-Gm-Message-State: ANoB5pnnP2W6qN1Y7WdHzFHDVtbMK9epwjFupcpUjTmAwtgApuu97unr
        bPsvdcV21QmTmy0nZh8Vac518kbO7ZLVqw==
X-Google-Smtp-Source: AA0mqf5CFhqTnm4DAj7M51LlHtzccNjt1UadVCF81p968ur6BItp0DRQxDMlqxygC+quz2QBsss2ow==
X-Received: by 2002:a05:600c:2241:b0:3cf:9ced:dce4 with SMTP id a1-20020a05600c224100b003cf9ceddce4mr1666333wmm.120.1668691682525;
        Thu, 17 Nov 2022 05:28:02 -0800 (PST)
Received: from [172.16.30.75] ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id f19-20020a05600c155300b003c6f3e5ba42sm6279430wmg.46.2022.11.17.05.28.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Nov 2022 05:28:02 -0800 (PST)
Message-ID: <d72903a9-ba74-fc0e-5d40-6bb50f4d8354@linaro.org>
Date:   Thu, 17 Nov 2022 13:28:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH RFC v2 1/3] pinctrl: add support for ACPI PinGroup
 resource
Content-Language: en-US
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        rafael@kernel.org, linus.walleij@linaro.org
References: <20221115175415.650690-1-niyas.sait@linaro.org>
 <20221115175415.650690-2-niyas.sait@linaro.org>
 <Y3SwV2ygYb3C0w4o@black.fi.intel.com>
From:   Niyas Sait <niyas.sait@linaro.org>
In-Reply-To: <Y3SwV2ygYb3C0w4o@black.fi.intel.com>
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

On 16/11/2022 09:41, Mika Westerberg wrote:

>> + * pinctrl_acpi_get_pin_groups() - Get ACPI PinGroup Descriptors for the device
>> + * @adev: ACPI device node for retrieving PinGroup descriptors
>> + * @group_desc_list: list head to add PinGroup descriptors
>> + *
>> + * This will parse ACPI PinGroup resources for the given ACPI device
>> + * and will add descriptors to the provided @group_desc_list list
> I would add here what happens to group_desc_list if the function returns
> non-zero.
> 
> Also perhaps the API should use an array instead and when NULL is passed
> it returns the size as we do with properties for example. The naged
> list_head pointer looks kind of weird.

Array would be nice. However I might have to do an additional acpi walk 
to find the number of PinGroups to allocate array and another iteration 
to populate fields. May be two iterations are not as bad as I thought. 
Open to suggestions.

--
Niyas
