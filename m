Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B88B562B86D
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Nov 2022 11:31:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232572AbiKPKbT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Nov 2022 05:31:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232892AbiKPKa6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Nov 2022 05:30:58 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14AD0326DF
        for <linux-gpio@vger.kernel.org>; Wed, 16 Nov 2022 02:27:37 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id r127-20020a1c4485000000b003cfdd569507so236168wma.4
        for <linux-gpio@vger.kernel.org>; Wed, 16 Nov 2022 02:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JCiwP4w6poODmaRZlCq+BuNtHH4Q7+ZpM50ZuhAxga8=;
        b=SR8otCmpP+dWUVMvsMTx/YL4QO4w6lXuJzYe7yHqeUWfivVRRt8IK/K5+Yo6Y5Oad5
         TJoMDHuiV7+FuaaJCR40FgDUKGpOUSu1dcR5teVjCfXj9yXKR9roJ/FtGr7QicrHvSui
         j/LsoCkknwwM3sIUQy0FodfDHfTTHgoEzCpmBK4Rq9IhF9ZpdN80TJWJnxycjNKefnYi
         sXaHrK0AWW9Gay5kXtxwpRuKssWLdBcsuYbk6SVIR4XeTz9ZmpIZadYLuAu91FHF8XAL
         m9UMXdXNmDtG+gZ96WVyPJ4WF8dYmPQZTLt74kMjb+cFHuy+G+BW0Agc43NAKisa0KUx
         3AVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JCiwP4w6poODmaRZlCq+BuNtHH4Q7+ZpM50ZuhAxga8=;
        b=RnwbZxgczo+lemf8Hwtch+2rLJd8tE76Y0QqmtGpdNC67yvM4Ch4E9v0e/bNTA8oKB
         kapu9bjxXqetR8Jk5J2Clf3iA/s3mdcU602xSnXym3Rb76YXFaDLQO6MektEWerw5lP6
         VGYDWLA1VbR0GHcCp5ZHTYw7VRh/9a0x8pnc/r1mz7ylP2tzW9H91V5q0Tn8CKjaYPhN
         YETrZFp76AwQiOX5SIESaRcl8iv8dxK2EGfbHLccf1WZ+4HfnI+KXWPmjO9iHYB239I0
         /0XGFG1ewhMX4bWPlH8Gzp72AnDr0Hc+ovlSK5RoaE6GL0G3QTH8Jtjz/08htmKqHcbq
         FzZQ==
X-Gm-Message-State: ANoB5pmKigo0VeNgLjS8rpmeAONVBfRDG45u1EBEKD0JC3OSpgyHkOFo
        8EhjBatVpzlGrGlq5V6lw2tMHo829c0Fpdbz
X-Google-Smtp-Source: AA0mqf5kYL2horbe0CB4zpVITRnWmZOuNz4aG1W9A2ABg5+rRe2RR9fCpMJYORSVI5kipVAbuWatrA==
X-Received: by 2002:a05:600c:35cf:b0:3cf:aa11:93a8 with SMTP id r15-20020a05600c35cf00b003cfaa1193a8mr1716279wmq.31.1668594455605;
        Wed, 16 Nov 2022 02:27:35 -0800 (PST)
Received: from [192.168.1.166] ([212.228.7.114])
        by smtp.gmail.com with ESMTPSA id bt17-20020a056000081100b0023677e1157fsm14936693wrb.56.2022.11.16.02.27.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 02:27:35 -0800 (PST)
Message-ID: <3df35c66-c696-f94e-e49f-bb0dbee0a1e3@linaro.org>
Date:   Wed, 16 Nov 2022 10:27:33 +0000
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
 <35760f9d-e491-4014-96f3-b13657c1c523@linaro.org>
 <Y3S4dXdneJ6mEVoI@smile.fi.intel.com>
From:   Niyas Sait <niyas.sait@linaro.org>
In-Reply-To: <Y3S4dXdneJ6mEVoI@smile.fi.intel.com>
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



On 16/11/2022 10:16, Andy Shevchenko wrote:
> I'm afraid that opening this to the drivers will allow to a lot of unknown data
> to be encoded in ACPI, so I would really like to see the vendor data to be
> absent (ideally).

Ok. I can rework the interface to drop the vendor data and length.

--
Niyas
