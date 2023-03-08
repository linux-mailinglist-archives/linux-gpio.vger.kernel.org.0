Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FF726B13C3
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Mar 2023 22:24:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229907AbjCHVYF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Mar 2023 16:24:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229869AbjCHVYC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Mar 2023 16:24:02 -0500
Received: from sender3-op-o18.zoho.com (sender3-op-o18.zoho.com [136.143.184.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60072D1AD5
        for <linux-gpio@vger.kernel.org>; Wed,  8 Mar 2023 13:23:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678310583; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=e4ajlNbGQNsC3O1B1WPmQsT6/2dnUqMg5MPbTYH0m9CHHnYPoqQIbvSGaxdvE+wRvDQU4ahiJWltyzBws/pQzwIDuZgN1e9rBV8Q4gCBDkarCD3fribvo7MfQqyPUf4PymjRCQEnDEe8tqgTzdPnPHgGQfZEd9MDWy5iM3Vp+8c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1678310583; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=MVXS8KDoDhOM/NALqKC+cp6/ciQN+TQg0DQlrMhKv8E=; 
        b=YjEYjwd2GCNGsGMgbn7Hzii58PHYaiC4egDNq0Iar9fXyZAcBi0sb3JtRjJzqUJFQBozt1fi26xBeX3AhOGpoPuYZhcRJCB8vzSD3+2nZwFlpnlBEo3XnG+3/qvDoz3eegTnVAwvIseCNKKSMS+yO5uUSKAir2kI/mb11TmHWkA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=arinc9.com;
        spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
        dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1678310583;
        s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
        h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
        bh=MVXS8KDoDhOM/NALqKC+cp6/ciQN+TQg0DQlrMhKv8E=;
        b=DeJOdnvKTnhzen1ZAfJv3wlrsqe9/C8dx6jV1G19Prur97d5hd8xayoL8hVL7+cl
        5f9BWGKhOxLrosINyDRYR5Ifr2rHJuPltENN9Gquqs/iaQFV4fX5ROqCyDzQOxytJqi
        HbKjXd+nMavGY8C+pp1adfHx1IjtoA+/43ifLShM=
Received: from [10.10.10.3] (212.68.60.226 [212.68.60.226]) by mx.zohomail.com
        with SMTPS id 1678310581456117.44812708718553; Wed, 8 Mar 2023 13:23:01 -0800 (PST)
Message-ID: <27dcf711-859e-6d21-f46f-3169bc1d4568@arinc9.com>
Date:   Thu, 9 Mar 2023 00:22:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 17/20] dt-bindings: pinctrl: mediatek: mt7986: fix
 patternProperties regex
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Wang <sean.wang@kernel.org>,
        William Dean <williamsukatube@gmail.com>,
        Daniel Golle <daniel@makrotopia.org>,
        Daniel Santos <daniel.santos@pobox.com>,
        Luiz Angelo Daros de Luca <luizluca@gmail.com>,
        Frank Wunderlich <frank-w@public-files.de>,
        Landen Chao <Landen.Chao@mediatek.com>,
        DENG Qingfang <dqfext@gmail.com>,
        Sean Wang <sean.wang@mediatek.com>, erkin.bozoglu@xeront.com
References: <20230303002850.51858-1-arinc.unal@arinc9.com>
 <20230303002850.51858-18-arinc.unal@arinc9.com>
 <20230308211511.GA3850618-robh@kernel.org>
From:   =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20230308211511.GA3850618-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 9.03.2023 00:15, Rob Herring wrote:
> On Fri, Mar 03, 2023 at 03:28:46AM +0300, arinc9.unal@gmail.com wrote:
>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>
>> Set second level patternProperties to '^.*mux.*$' and '^.*conf.*$' on
>> mediatek,mt7986-pinctrl.yaml.
>>
>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>> ---
>>   .../devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml  | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
>> index 46b7228920ed..e937881210c5 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
>> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
>> @@ -72,7 +72,7 @@ patternProperties:
>>       additionalProperties: false
>>   
>>       patternProperties:
>> -      '.*mux.*':
>> +      '^.*mux.*$':
> 
> These are equivalent (so is just 'mux', but that's ambiguous). Why are
> we changing them? Ideally, we'd only have a wildcard on one end.

I've seen your review on Daniel's patch for adding mt7981 pinctrl schema 
so I wanted other schemas to be on par with your review.

https://lore.kernel.org/linux-mediatek/20230123225943.GA2781371-robh@kernel.org/

Arınç
