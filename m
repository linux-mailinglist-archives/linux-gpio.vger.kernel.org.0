Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1944A6632FE
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Jan 2023 22:34:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237878AbjAIVeb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Jan 2023 16:34:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237636AbjAIVeJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Jan 2023 16:34:09 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ADFFC7D
        for <linux-gpio@vger.kernel.org>; Mon,  9 Jan 2023 13:34:00 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id m8-20020a05600c3b0800b003d96f801c48so10229489wms.0
        for <linux-gpio@vger.kernel.org>; Mon, 09 Jan 2023 13:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MlYpszLLTI25+yXKRfrKC7ULXZPxXwzRu/Hl0C/nRkI=;
        b=jONwJE0Ws9VggzLas6Ei1DLNfubkoNmAI3iUEYjj2C9BTkJFqFMbdUEhSx2ALNL4Ie
         9tzYYxy2QdLmBc1X6e0m6uv/wx28DKSFsC2U1pHC+cOffRLhAf0nSnxuBRD5Iehmp9JQ
         i35cB3+nJnRf0t6vphqvoGRAjB9WPbzER86Aju3jiKZqOvAm9OhJfa9/ipjipMZfPdlF
         kf4HiAYNDUro994zJ5JODjG3q0SJSPu3I8Ca1sLJk36GyBQwiG5APQ45rNnr5AAJc1hm
         ncffj48e45eLsH/HULxKcN2bWJzOl7n2v3TYDuIPf+vw7ONJWf+p59XJbbDHMwpABfIg
         06iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MlYpszLLTI25+yXKRfrKC7ULXZPxXwzRu/Hl0C/nRkI=;
        b=Bt22YRO7oqshpP/YUTtsvY/HUrza1uqd/fDfgqK+T/H8c8w4qrSX+NzlQhl7MhIwCq
         rWGCnKGu2n3S6AlbLj8QOU69quyR8abayAi3dT1h9tTqonRpg0zV8w2jY5JsiCaMgqSz
         KNojwpvO3A1kPs41NkB/8DO7lG/St7gxS2W4lADKhb1lQ+BcSsst0YXGg7ARhRHP1N/d
         0Fbp/WyXoAJOSAHnukXOyzWlfgdbyvr8bAiCECQ5sAC47zmx4sI5wnQxakTSbJi6PK7U
         WWj7NjnrIRWlf8hMpjbsEmkm94b2+MRmwAh8RUEGrYMJ1oQWAZMEvoadDk37JtWmCfcT
         Y5QA==
X-Gm-Message-State: AFqh2kr54Vp/Qetf58VxgKGgfp4JjHZ+WUZEfckC+XSrbp4aAzZsaE7w
        9HwmME49oDr3TfyGpeTeHS+TdQ==
X-Google-Smtp-Source: AMrXdXuRAlR/2RIGRcuq9FoqszptbKQ0HvdTJnPpLx46ibQmwwqOXGig3Hw/E0lajTEw4087USj7tg==
X-Received: by 2002:a05:600c:22c4:b0:3cf:8ed7:712d with SMTP id 4-20020a05600c22c400b003cf8ed7712dmr51592422wmg.14.1673300038867;
        Mon, 09 Jan 2023 13:33:58 -0800 (PST)
Received: from [192.168.1.166] ([212.228.7.114])
        by smtp.gmail.com with ESMTPSA id j6-20020a05600c42c600b003b492753826sm11962883wme.43.2023.01.09.13.33.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 13:33:58 -0800 (PST)
Message-ID: <0efc4469-326d-5f47-3878-c8f25f9f7d56@linaro.org>
Date:   Mon, 9 Jan 2023 21:33:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH v3 1/2] pinctrl: add support for ACPI pin function and
 config resources
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, mika.westerberg@linux.intel.com,
        rafael@kernel.org, linus.walleij@linaro.org, fugang.duan@linaro.org
References: <20221130164027.682898-2-niyas.sait@linaro.org>
 <Y4fE6CPLHKPdjt9y@smile.fi.intel.com>
 <a23d0da6-6f80-a7d5-a0fb-a10e1a408129@linaro.org>
 <Y4fnoOKngSLW7dfb@smile.fi.intel.com>
 <a033178f-89f8-1843-ee02-321da8c2ca90@linaro.org>
 <Y4kzG3K1LlC5ZcQi@smile.fi.intel.com>
 <ae60701e-a2f1-4945-d9e0-e8ecd1c82f62@linaro.org>
 <Y43oYSF8WWu6ziJ9@smile.fi.intel.com>
 <24bf8b5d-d0ff-1d45-9c36-12bcc6fc3868@linaro.org>
 <a85b6bf6-e00b-243a-4ca4-8339a1c81c48@linaro.org>
 <Y7wgBU7CoTpH7PTe@smile.fi.intel.com>
From:   Niyas Sait <niyas.sait@linaro.org>
In-Reply-To: <Y7wgBU7CoTpH7PTe@smile.fi.intel.com>
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



On 09/01/2023 14:09, Andy Shevchenko wrote:
> On Tue, Jan 03, 2023 at 04:49:23PM +0000, Niyas Sait wrote:
>> On 20/12/2022 10:53, Niyas Sait wrote:
>>> Hi Andy,
>>>
>>> As discussed previously, I've put together a design for the pinctrl ACPI
>>> support in a google doc [1]
>>>
>>> Could you please have a look ?
>>>
>>> [1]
>>> https://docs.google.com/document/d/1bgLAOEGmhVnxSF_Bx6-blg1_ZNnv8BTQGYW6gixOvjY/edit?usp=sharing
>> Did you get a chance to look at the design doc ?
> I started reading it before Xmas holidays and then other tasks overhent me.
> I'll prioritize this.
> 

Thanks.

> P.S. Have you seen the ECR for the ACPI specification regarding pin numbering
> vs. GPIO numbering?

Yes just found it. Looks good to me.

-- 
Niyas
