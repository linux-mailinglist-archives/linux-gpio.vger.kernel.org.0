Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C131B6B73D8
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Mar 2023 11:25:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229534AbjCMKZV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Mar 2023 06:25:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbjCMKZU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Mar 2023 06:25:20 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16F5313D54
        for <linux-gpio@vger.kernel.org>; Mon, 13 Mar 2023 03:25:18 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id z42so12010800ljq.13
        for <linux-gpio@vger.kernel.org>; Mon, 13 Mar 2023 03:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678703116;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pbrJDtN9FhNDtr20R0XiPnYTSZFkmiksV9h1k4kyQ98=;
        b=VY8uugNkMiYA+TYm6b4G1dm9cgjqMlafEB+6oiXdPNMHA94piZsYq6sl9o4htfoHxy
         jiWIVFntqtPn9gMRcYzgF0qLR6jgdgUcyJ9LvDx7xxbuYF/f2gwzVAObkWm2axbX1cOe
         nxcowpZv/gbHyKqiCXxjYOT66sAmI4IY82pbefTDcaqbQMnKq8xPVQc872uLlqzMEjJO
         +fmd6VaZI341zuLoiBb3dsJyUNo57S+d0oDvGuH2Gfwki7km5Em59CHKmosDdLVtvEq5
         LczIIFYYzD5hDxESdaOFdAakUMZJ3sdoofmwLmXv6b7KDiziAa3yfH7ajsU6SI9bp2PV
         oPdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678703116;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pbrJDtN9FhNDtr20R0XiPnYTSZFkmiksV9h1k4kyQ98=;
        b=QngGYU2rvjo9nyjyvfiKsPYSf2E4cQc/vWFp3ZgPsDIJ+wRQZPLlOp+Fa3DdWxJzZI
         wmQom2uv5ly5Mbg7rJb1NVmXDdP3hVorliH+P1z9a/G43KpIAsnd199S61FTMwEHLkBF
         u0YK6VOlfKtBa4t4aKN0oUbTqN0rJZrARSUjITlNA2g4SqVFAVGB4ZfANZfCgx8HXVP0
         7abwC9kbQnW7+ilxFUdzraCwwlWTE9l2ewYkga22QvkzhOC8BzYa+9WC8n8F9TypZoo1
         i4SVtB9ofEzDtbMtB04nPiaJveC5KCjq6fhnX1pdxGFlEotuuJour0jAwXSCEQt+di3N
         oxxw==
X-Gm-Message-State: AO0yUKUSvcyf56k8AErEmSEP6x1Bj2nABMxQW6akT4dcH/wyzbnHvhE2
        qbnWos6jqELOxD1mUU/dWFLhEQ==
X-Google-Smtp-Source: AK7set9r8v+cNOL0nDYJPIKVpvSdm7/GrRj5qHTxjwsR9LSWNA2w1DNDiPRxbcGRdZ/FZBf3YGyMag==
X-Received: by 2002:a2e:9243:0:b0:295:aa1f:3d6e with SMTP id v3-20020a2e9243000000b00295aa1f3d6emr9665037ljg.38.1678703116387;
        Mon, 13 Mar 2023 03:25:16 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id d15-20020ac24c8f000000b004db39e80733sm922259lfl.155.2023.03.13.03.25.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Mar 2023 03:25:16 -0700 (PDT)
Message-ID: <6d83e088-9ed2-9b4b-6468-5b5ea1a45205@linaro.org>
Date:   Mon, 13 Mar 2023 11:25:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] pinctrl: qcom: msm8998: Add MPM pin mappings
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, marijn.suijten@somainline.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230308213651.647098-1-konrad.dybcio@linaro.org>
 <CACRpkdZFWaLZvD6uW6rO+oKGZw24S+dKD+TBBpkQJKceiSBnaw@mail.gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CACRpkdZFWaLZvD6uW6rO+oKGZw24S+dKD+TBBpkQJKceiSBnaw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 13.03.2023 11:23, Linus Walleij wrote:
> On Wed, Mar 8, 2023 at 10:36 PM Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
> 
>> Add MPM <-> TLMM pin mappings to allow for waking up the AP from sleep
>> through MPM-connected pins.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> Patch applied as nonurgent fix, tell me if it should rather be treated as
> urgent (for the -rc:s and/or stable tags)
Nope, I'd be screaming very loud if it was urgent! :D

Thanks for your very prompt response!

Konrad
> 
> Yours,
> Linus Walleij
