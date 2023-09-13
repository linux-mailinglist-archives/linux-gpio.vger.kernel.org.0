Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3F2079DF74
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Sep 2023 07:32:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233418AbjIMFcl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Sep 2023 01:32:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235107AbjIMFck (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Sep 2023 01:32:40 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDE3F1735
        for <linux-gpio@vger.kernel.org>; Tue, 12 Sep 2023 22:32:36 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-307d20548adso6488810f8f.0
        for <linux-gpio@vger.kernel.org>; Tue, 12 Sep 2023 22:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1694583155; x=1695187955; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N4nYj22yWcBXT0fLmDHEet6LUruNho+epuPQlZMk6rA=;
        b=QfIuB7m5npkIjdxEqLwP/UTYKoi0Aid+CBgxNJNeQIm29w78Vckcx7Xl158RrQriHm
         xyiGqFkjn3hIa0/7pWc861IvFuMza8/zGM2B+I2u7h7bHvuUksUjHaadTjYzA/pM/xLy
         Qk9UgnBw6wB84kjy/C4l9s08ndOqkKSGutvIcPlFEPDbcSmZszD8iVI9i5vE8zq0QZIc
         6qyd4oiKPk0pKo6mWzFO86Ar48M3F41sxmRFdMGG5jdKPGgW3rZ3aJV6kyjdDFatqk8n
         t+Q6Svjl9DWSxn8u4+g4Rbb8JnmqhgpQSOGaoA1F0HlkATlg22ZTh+6OzNBeMAehpw2J
         13Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694583155; x=1695187955;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N4nYj22yWcBXT0fLmDHEet6LUruNho+epuPQlZMk6rA=;
        b=wjfjnLBYbKWRqqyERDCfeKTCmH6T76qGpinK/v8+2p6y+EzgfPuepCylNLYuKF7rKC
         i7TuYuAQnSbaTFvWfKHjTPcvipJmVkyNLOGHlPOlAKkiUYXxSUHB56/4o1T5lZYLD30G
         RE1blBKXulXKmEHps27hhRJguM5ScY5+qoA6fbImnsxrD5H91l6tnauGRHs3gDb32eGc
         xNuK0Z+22VlV3edEzRIQJ0ip45KcqmlEf85ntbZiMYplC1bX9pLAX/TjuCSRZz9iAsS4
         YLCT+z5qE8kVj/AdrZNYvzZwzGE7eVdINESw3XeDJLBfszkAcDXCNoj189/JKVSqB3ob
         SKZw==
X-Gm-Message-State: AOJu0Yw0sleDNpo+4bmyFj+bE7qkFMQZCaD9QWhRVn+VU9omGNwdv/DF
        kLytVnX+LDMEYVivHRdMTa56+g==
X-Google-Smtp-Source: AGHT+IER9H3VVgLr+hfSKE6vI6LgtgJgyvA5sBGY5z57WD3YPKGjBTuZJ6vz2gIvOl0O6kav/COyJg==
X-Received: by 2002:adf:e350:0:b0:319:7787:54a9 with SMTP id n16-20020adfe350000000b00319778754a9mr1037074wrj.24.1694583155059;
        Tue, 12 Sep 2023 22:32:35 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.145])
        by smtp.gmail.com with ESMTPSA id n15-20020a5d598f000000b0031fba0a746bsm3448003wri.9.2023.09.12.22.32.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Sep 2023 22:32:34 -0700 (PDT)
Message-ID: <56cf08f2-5d8e-6098-6218-081d8f620abe@tuxon.dev>
Date:   Wed, 13 Sep 2023 08:32:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 35/37] dt-bindings: arm: renesas: document SMARC
 Carrier-II EVK
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        ulf.hansson@linaro.org, linus.walleij@linaro.org,
        gregkh@linuxfoundation.org, jirislaby@kernel.org,
        magnus.damm@gmail.com, catalin.marinas@arm.com, will@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        biju.das.jz@bp.renesas.com, quic_bjorande@quicinc.com,
        arnd@arndb.de, konrad.dybcio@linaro.org, neil.armstrong@linaro.org,
        nfraprado@collabora.com, rafal@milecki.pl,
        wsa+renesas@sang-engineering.com,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20230912045157.177966-1-claudiu.beznea.uj@bp.renesas.com>
 <20230912045157.177966-36-claudiu.beznea.uj@bp.renesas.com>
 <20230912161635.GA877089-robh@kernel.org>
From:   claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20230912161635.GA877089-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 12.09.2023 19:16, Rob Herring wrote:
> On Tue, Sep 12, 2023 at 07:51:55AM +0300, Claudiu wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Document Renesas SMARC Carrier-II EVK board which is based on RZ/G3S
>> (R9A08G045) SoC. The SMARC Carrier-II EVK consists of RZ/G3S SoM module and
>> SMARC Carrier-II carrier board, the SoM module sits on top of carrier
>> board.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>  Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
>> index 822faf081e84..f4964445e5ab 100644
>> --- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
>> +++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
>> @@ -476,6 +476,8 @@ properties:
>>  
>>        - description: RZ/G3S (R9A08G045)
>>          items:
>> +          - enum:
>> +              - renesas,smarc2-evk # SMARC Carrier-II EVK
> 
> You just changed the existing binding...
> 
>>            - enum:
>>                - renesas,r9a08g045s33 # PCIe support
> 
> This is the SoM module? 

No, this is a SoC variant which supports PCIe.

> You either need to squash this change or add 
> another case with 3 entries and maintain the 2 entry case. (there's no 
> way to express any entry at the beginning or middle can be optional)
> 
>>            - const: renesas,r9a08g045
>> -- 
>> 2.39.2
>>
