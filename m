Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BBCF75359E
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Jul 2023 10:51:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235615AbjGNIvM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 Jul 2023 04:51:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235274AbjGNIvL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Jul 2023 04:51:11 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5937C270D
        for <linux-gpio@vger.kernel.org>; Fri, 14 Jul 2023 01:51:09 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-99454855de1so11947766b.2
        for <linux-gpio@vger.kernel.org>; Fri, 14 Jul 2023 01:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689324668; x=1691916668;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AA400F82oAmi6pERwPSVC1qSgSS17NSxKmCHMIAbTTo=;
        b=lz9ham2WZ/uKM8V9JrlP3W1/oWDSZgMqvENb2rBr1YZ/NjE4cPEOameleQFscAwNHr
         90iHQFIf+RUYjNfaMy2PC+VmKk3NDRyUqzEPcLzFlzfFexZiTfSUeC6VmQ3xtRqJ/w9K
         vmE2gLOCMK7QUrd4gabcBhpwphXkMY0Ii3PA1GAIGqfMFG1CHiEsSCseA+PqORNPM+sL
         zKI4Q6K4hQfwOI61UR96v8DghoxuC6cUkcMxKQartiudOOMwAumZ6SBd50YSHlk3woyr
         6wu/fVxCSVlzzHKCtUdNCUwqmIzqIkRFtM6Zt9Y0Q1mGiWarVfiAOp4jFGBlrODLNr0v
         p6qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689324668; x=1691916668;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AA400F82oAmi6pERwPSVC1qSgSS17NSxKmCHMIAbTTo=;
        b=YP1AXyNIohcR45DGp3WVusyxzNUGCZJ9PMeLvw5rTnveJW5bs6dcWsmo7FM6frgj1j
         knrH10y25ka6619hcCHusj4ejGDXuOhhIGMP1SWF+I2Snx2xb3PJKc1KomXbt5qTEXu1
         dmvjWEqKpb+MSrNTWeT6hKbi15OJGKIbnn6fsgitv4QSHHZmeGl7xx9a8lflAyEPbvbI
         4302goRSF1byy/WjOC8BH8Dh4Xfg4Dc1v73il0Clv/VQHNZWj0V85y/9YrRS5hjKZX7R
         xF/dWwlciJeOF2HZ+pDS4pBqOfZghqER4GK/peZJXTsQcXZVBYDJg7DGKfgSJiYMKKAU
         5W4A==
X-Gm-Message-State: ABy/qLb1HekXcoxExQTYjgbxzWIQermRABlUBfWg7EqXTou/DgksZpjD
        KD2bYNJA9JLHM9ryftfPYL1W2w==
X-Google-Smtp-Source: APBJJlFgNNfzLiYIyWQu4MS6PqDCXwzQncQfsuKandKde1IOd03hugnMV5pIJPl9p4d2SrOGIObX4Q==
X-Received: by 2002:a17:907:1112:b0:967:21:5887 with SMTP id qu18-20020a170907111200b0096700215887mr3081876ejb.40.1689324667825;
        Fri, 14 Jul 2023 01:51:07 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id a22-20020a170906245600b00992c92af6easm5024952ejb.161.2023.07.14.01.51.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jul 2023 01:51:07 -0700 (PDT)
Message-ID: <e2daa887-4cd3-84a8-3450-bfebd94c1b7e@linaro.org>
Date:   Fri, 14 Jul 2023 10:51:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: cypress,cy8c95x0: Add reset
 pin
Content-Language: en-US
To:     Naresh Solanki <naresh.solanki@9elements.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Patrick Rudolph <patrick.rudolph@9elements.com>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230714081902.2621771-1-Naresh.Solanki@9elements.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230714081902.2621771-1-Naresh.Solanki@9elements.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 14/07/2023 10:19, Naresh Solanki wrote:
> From: Patrick Rudolph <patrick.rudolph@9elements.com>
> 
> This patch adds support for an optional reset pin.
> 
> The reset pin is used to bring the chip into a known state and has an
> internal pull-down, allowing it to be left floating if not needed.
> 
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

