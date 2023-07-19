Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47C19759BC5
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Jul 2023 19:03:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230076AbjGSRDu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Jul 2023 13:03:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230346AbjGSRDt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Jul 2023 13:03:49 -0400
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A0BD172D
        for <linux-gpio@vger.kernel.org>; Wed, 19 Jul 2023 10:03:48 -0700 (PDT)
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-403c6a0f3aaso54357031cf.2
        for <linux-gpio@vger.kernel.org>; Wed, 19 Jul 2023 10:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1689786228; x=1690391028;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Y/1slnyFOfruKLlVgzy7Oy/yzYdM3htwk1fVwDtIRk=;
        b=mknpiap4VlzD98tl/hHtgiTz+hpghsQCUu8zc2R7FU+fC1+Nt2mEeusJNUbQixaHEX
         uiIKyyEd4Dq3OrVDcc7xtvLRXg2G1/PaVEesjc+x9BE0fBeSn6k4N0CVePpZCXsuzvUm
         f53gYdCf/JRwvyf8I/EUnFVVmyKz3IXYAm0WKTa8aitbsjmTaBeFMX2vpBLapTqThOg6
         Guforr1Np1vUUXvA9/bDfmuK/YMWXTCtZgWbzOdTK2IBv28LH7MzEfBcQROcZBM4AwHv
         mET3PbZWJqUfyPf/WEQmvJkhAzSJej7+WI+tfxMKl9I80SvyPB1YIWPKyx0ArDyCEi16
         LoZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689786228; x=1690391028;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Y/1slnyFOfruKLlVgzy7Oy/yzYdM3htwk1fVwDtIRk=;
        b=SqgRFmLbRMxX5ey5hAlctvSAcLPBJkVF1VDeekGKs2K2Z/BSnC22IaWRCjG+00Gp5f
         vx0Aat1oMWYuFOBtrKoEa4IwnqSY6pO+eS9ND/HmFJAQv9IAADRq+pN1d4jDsctvJ6X5
         ZyKnIaT6NqBgzRqLktBk6fCfYsWt2NQJMf6rn5SZK14ouqUaxWDPe417i7WrucDn3iuO
         L/QjGmK0NPN0b4Jk6F76jd/EYZla2Gt0chrc2llAgwwFr188fWuFfr0firQVrigCXDE9
         +14PcIA8brol5EcHJaJQhLN+sYoAS3gnoAnnItEitie++fe1gCRJolTPznX+EQhDylGD
         68dQ==
X-Gm-Message-State: ABy/qLYtbYEBGSJ28hykvSZ/OwqEgmxWzHWoov1XbuQG5fp4d9HQwanS
        KYa/vurhfX/LZPAtbLOczBZSUA==
X-Google-Smtp-Source: APBJJlGo7WgU956qlMCfm5+kYjiJGtiIBkXK8Pxq+lmL3ldE9ZAtORUHqORdt2kk9hfe+8Fm+OlMYA==
X-Received: by 2002:a0c:a801:0:b0:632:1c72:c379 with SMTP id w1-20020a0ca801000000b006321c72c379mr15842406qva.51.1689786227785;
        Wed, 19 Jul 2023 10:03:47 -0700 (PDT)
Received: from ?IPV6:2600:1700:2000:b002:8499:3c3c:78f6:f355? ([2600:1700:2000:b002:8499:3c3c:78f6:f355])
        by smtp.gmail.com with ESMTPSA id v14-20020ae9e30e000000b0076264532630sm1378783qkf.121.2023.07.19.10.03.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 10:03:47 -0700 (PDT)
Message-ID: <a3c4f1c6-444b-b3a2-c952-bdd5b0463f95@sifive.com>
Date:   Wed, 19 Jul 2023 12:03:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] gpio: sifive: Get the parent IRQ's domain from its
 irq_data
Content-Language: en-US
To:     Andy Shevchenko <andy@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Emil Renner Berthing <emil.renner.berthing@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
References: <20230719163446.1398961-1-samuel.holland@sifive.com>
 <20230719163446.1398961-4-samuel.holland@sifive.com>
 <ZLgVPv7zdoaiUCU6@smile.fi.intel.com>
From:   Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <ZLgVPv7zdoaiUCU6@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2023-07-19 11:54 AM, Andy Shevchenko wrote:
> On Wed, Jul 19, 2023 at 09:34:44AM -0700, Samuel Holland wrote:
>> Do not parse the devicetree again when the data is already available
>> from the IRQ subsystem. This follows the example of the ThunderX and
>> X-Gene GPIO drivers. The ngpio check is needed to avoid a possible
>> out-of-bounds read.
> 
> ...
> 
>> -	girq->parent_domain = parent;
>> +	girq->parent_domain = irq_get_irq_data(chip->irq_number[0])->domain;
> 
> For the sake of readability I would like to leave parent variable
> and assign it beforehand somewhere upper in the code.

OK.

> Also, can irq_get_irq_data() return NULL? Needs a comment on top
> of that assignment or an additional check.

No, the earlier loop already verified the IRQ number was valid. I don't think it
can later become invalid. In any case, we already dereference the result of
irq_get_irq_data(irq_number[foo]) in sifive_gpio_child_to_parent_hwirq().

