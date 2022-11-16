Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56F4162B6E6
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Nov 2022 10:50:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbiKPJuM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Nov 2022 04:50:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230238AbiKPJuK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Nov 2022 04:50:10 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63E5763A7
        for <linux-gpio@vger.kernel.org>; Wed, 16 Nov 2022 01:50:09 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id k8so29019202wrh.1
        for <linux-gpio@vger.kernel.org>; Wed, 16 Nov 2022 01:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rQEpU7qbv/k/+d533DeqrvaHypD3AbDCD2cVN3Qg1AU=;
        b=XOAk4WwEm6P2WU/5VU4vGxIKc2uqCmsKD8DJL6UW7eCDkwF4ac87jvtisz/U1E2N+V
         6gLwv6RQOvWGzHuFRIPPjlsxFk2m+3hRaEgTUqoVt7vAuz811EmYVhQ6XgQ5UZqOjaFB
         RTyBMeQK/oR+cJ8bborUuMIoY4gSu5TKxsPUia/q0ycIdqRwgdI2VH9mcnMnS/W8IWY9
         f2qpbBXncFPcaituyxle88N3zBWugUm2fF8cRqZw7Ey/3D077GZdore2UyQNGNhjUGke
         EhbL4kDGCRUS8sqiaNqHqxfgPJK6kYjWtoY7OOYhqy4CR/BSLrhWIvueiIqdk/866G13
         cKaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rQEpU7qbv/k/+d533DeqrvaHypD3AbDCD2cVN3Qg1AU=;
        b=4p7F/SBHfyx7XHeqIVredAYlcU+gnFTVDSX3Lp+JuOE/GPCTqtf+Y3Kvg+3e9dzW9i
         UlkyxkXamUCTKceFf9zcbx3ZrG8wiaBEKWredS67QOurPlRO1OOK2JK+fsF/uiP2zwy5
         RIVxMnapKLR3DV+MWkMhNCd7VhgxkI4H8zZDqmEWBAG73x1zbw8ceyfyyYRMCTlFucjX
         Y+rHsvw+gKJoQj0fOCXttkoH0ptOprHzkO1FsEcgVDmOY2eWjo0HZXpbJfb/PrOVen6q
         qH5mvi7uIb/brrVxP47JVBwqs+T6byAzXwqQ+wLoHixbzKlO0vUk7dKsAwVxIeDnKrFa
         Fqzg==
X-Gm-Message-State: ANoB5pnCzFbBlN3TuJZphOVuUAmtZXRmNGdSpmoDb/wCpCyUk8guO4Dt
        pWdJ6vb/dUcp/aKb7v01YHwVjQ==
X-Google-Smtp-Source: AA0mqf4ZYCx2CrT9qCjFTHpG+QOXxyYQszxPUlcgRPnAMg6rncb75qkPL4a5/y/IPyjGF7qMflc/zg==
X-Received: by 2002:a5d:6752:0:b0:236:73b2:f026 with SMTP id l18-20020a5d6752000000b0023673b2f026mr13479764wrw.396.1668592207918;
        Wed, 16 Nov 2022 01:50:07 -0800 (PST)
Received: from [192.168.1.166] ([212.228.7.114])
        by smtp.gmail.com with ESMTPSA id by7-20020a056000098700b002368a6deaf8sm14819652wrb.57.2022.11.16.01.50.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 01:50:07 -0800 (PST)
Message-ID: <c9eb64c4-4cb3-b25c-df04-97da24a595fd@linaro.org>
Date:   Wed, 16 Nov 2022 09:50:05 +0000
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
 <3766343a-ce40-10aa-99dc-2ea94bc1ffbd@linaro.org>
 <Y3Pexz7tLrAP05uY@smile.fi.intel.com>
From:   Niyas Sait <niyas.sait@linaro.org>
In-Reply-To: <Y3Pexz7tLrAP05uY@smile.fi.intel.com>
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

On 15/11/2022 18:47, Andy Shevchenko wrote:
> On top of that, how other hardware can utilize what you are doing without
> adding redundancy to the ACPI?

Sorry I missed this question.

I am not sure if there is any redundancy to ACPI spec.

ACPI pin resources gives you most of the bits you need to describe the 
pin dependencies and configuration required for the device.

For my particular implementation (not part of this proposal), I had to 
pass extra data to the driver to describe the GPIO number to Pin mapping 
and conf and mux registers. But that can be potentially fully handled in 
the driver. Sorry for the repetition.

Let me know if I missed your question :-)


--
Niyas

