Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1328589A6E
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Aug 2022 12:27:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231177AbiHDK1B (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Aug 2022 06:27:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238986AbiHDK1B (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Aug 2022 06:27:01 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A46739B98
        for <linux-gpio@vger.kernel.org>; Thu,  4 Aug 2022 03:26:52 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id t22so30179499lfg.1
        for <linux-gpio@vger.kernel.org>; Thu, 04 Aug 2022 03:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=om03wwz+ZRnw5a2g8oUVqYCoqVIUjoKqhcO8rFCadcw=;
        b=M2Va+IhCt0l+iJnOqhZr3jywFUBCv/qc9QlFrkONLKlv3qU/cb0fMmpmmzWFQZXRg1
         bN/k+HBNAeEQF2fddmXqxd7UOx/LRnNQ7yDfBWlROPTejYU385tvHmUvkR6Uc1EAYehC
         xxchK75ONT490fdepDKJRHPQWIjW5x1IPrXMGDbqhcIRioqcdXSiyLcNpSO7Vy0ZDRwI
         8JUBp9UClNtzPYW9ytkrreB9ZmxbHzRMFBLylK6JCnl7jua2M/JQ9QPzOgZmJDAxPG9z
         TJYirVwMwviVjMceEks+yOLYH2DZtSmXOAC9msiiusP106Z9wGC6CXG+rhzu+nQhMDE7
         qPmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=om03wwz+ZRnw5a2g8oUVqYCoqVIUjoKqhcO8rFCadcw=;
        b=PD9+2YcNs0cEIUl+1SgjES6OksYquopFxvN8c82waWWDn7UvdVKAeme3gM115f/B0C
         8ZkaQFRfQ6VGIMINLCk1zzDpZZSdzII5jTJ7ZeuwYjvw5K3oFOXwnF1/YaLOAHw8prv4
         LK2VAIeECpvZ8qj8NbGyPxRrGxzOpfYn6koy0z4UCk+4c/VmOTYZSqNEPoT+mdskEd/q
         epyNkL6/RUu7KcvgtH1cI4dJiUnnA1Hlt66X3PrMssZXAmTisGvp+ukPS5LgV0aJKPt8
         9mvljDYyJCTSlGIgj5UyZEjH8Cca67fA18INBUahTWQUNvpAe/dX1eGvJCGgEgvaKzw8
         aAqw==
X-Gm-Message-State: ACgBeo2BsfuLgOQWn56gqZ14I9NLwKfV45eUtplEK7CHnQx7pK6ABl10
        AKRos2QOfMPxQiXY9EWP4FWJIg==
X-Google-Smtp-Source: AA6agR7hL7vrJGcvBVTx0kL6VXd32MqAgQaIcASH9HdfeJuV4zVTkYFxtwLQnjxiLYJ6lcJhGzIDew==
X-Received: by 2002:a19:6414:0:b0:48a:eb80:816b with SMTP id y20-20020a196414000000b0048aeb80816bmr440726lfb.360.1659608810844;
        Thu, 04 Aug 2022 03:26:50 -0700 (PDT)
Received: from [192.168.1.6] ([77.222.167.48])
        by smtp.gmail.com with ESMTPSA id u12-20020a05651220cc00b0048a83336343sm73833lfr.252.2022.08.04.03.26.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Aug 2022 03:26:50 -0700 (PDT)
Message-ID: <950740ff-5b00-93f1-d39f-b71680958f7d@linaro.org>
Date:   Thu, 4 Aug 2022 12:26:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] dt-bindings: riscv: fix SiFive l2-cache's cache-sets
Content-Language: en-US
To:     Conor Dooley <mail@conchuod.ie>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Conor Dooley <conor.dooley@microchip.com>,
        Atul Khare <atulkhare@rivosinc.com>,
        Sagar Kadam <sagar.kadam@sifive.com>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220803185359.942928-1-mail@conchuod.ie>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220803185359.942928-1-mail@conchuod.ie>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 03/08/2022 20:54, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Fix device tree schema validation error messages for the SiFive
> Unmatched: ' cache-sets:0:0: 1024 was expected'.
> 
> The existing bindings allow for just 1024 cache-sets but the fu740 on
> Unmatched the has 2048 cache-sets. The ISA itself permits any arbitrary
> power of two, however this is not supported by dt-schema. The RTL for
> the IP, to which the number of cache-sets is a tunable parameter, has
> been released publicly so speculatively adding a small number of
> "reasonable" values seems unwise also.
> 
> Instead, as the binding only supports two distinct controllers: add 2048
> and explicitly lock it to the fu740's l2 cache while limiting 1024 to
> the l2 cache on the fu540.
> 
> Fixes: af951c3a113b ("dt-bindings: riscv: Update l2 cache DT documentation to add support for SiFive FU740")
> Reported-by: Atul Khare <atulkhare@rivosinc.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> I split this off from the existing series as there is no dependancy
> between this cache change and the gpio patch. The prior series can
> be found at:
> https://lore.kernel.org/all/20220726170725.3245278-2-mail@conchuod.ie/
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
