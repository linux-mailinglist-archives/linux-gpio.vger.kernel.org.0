Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33C48504DAD
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Apr 2022 10:20:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237213AbiDRIWl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Apr 2022 04:22:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237202AbiDRIWi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Apr 2022 04:22:38 -0400
Received: from ssl.serverraum.org (ssl.serverraum.org [IPv6:2a01:4f8:151:8464::1:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31A9A17061;
        Mon, 18 Apr 2022 01:20:00 -0700 (PDT)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 50CC122239;
        Mon, 18 Apr 2022 10:19:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1650269998;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ItaZUj1j8/Q4cJNZVZH/jRlztsg91VMkEGsyQtVlg/g=;
        b=lKasnfwtvTIHScAKmuCRPXzH5gyD3HaPPzIYM17cp8CaseRivMofEeWvdkm7kepMmLHMf6
        OMZMf8K4C/UKNL0GXzeIUacbcBiukqulZiQx0ucjcuKJI3CMNCo21kxen4SMVrNY3V65fv
        +P0YbvlBSZtEmBhuYHHfQRp4d7Y04UI=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 18 Apr 2022 10:19:58 +0200
From:   Michael Walle <michael@walle.cc>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Paul Burton <paulburton@kernel.org>,
        Quentin Schulz <quentin.schulz@bootlin.com>,
        Antoine Tenart <atenart@kernel.org>,
        Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        "David S . Miller" <davem@davemloft.net>,
        UNGLinuxDriver@microchip.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v3 6/6] dt-bindings: pinctrl: convert ocelot-pinctrl to
 YAML format
In-Reply-To: <CACRpkdbrw7Hjt9mB9pr_iNsGi71g_d8BGhpT_ih1RVgKJ5U0qQ@mail.gmail.com>
References: <20220319204628.1759635-1-michael@walle.cc>
 <20220319204628.1759635-7-michael@walle.cc>
 <CACRpkdbrw7Hjt9mB9pr_iNsGi71g_d8BGhpT_ih1RVgKJ5U0qQ@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <e02e22920ffe23b49237c0c1379e888b@walle.cc>
X-Sender: michael@walle.cc
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

[resend, use Krysztof's new email address]

Am 2022-04-18 01:41, schrieb Linus Walleij:
> On Sat, Mar 19, 2022 at 9:47 PM Michael Walle <michael@walle.cc> wrote:
> 
>> Convert the ocelot-pinctrl device tree binding to the new YAML format.
>> 
>> Additionally to the original binding documentation, add interrupt
>> properties which are optional and already used on several SoCs like
>> SparX-5, Luton, Ocelot and LAN966x but were not documented before.
>> 
>> Also, on the sparx5 and the lan966x SoCs there are two items for the
>> reg property.
>> 
>> Signed-off-by: Michael Walle <michael@walle.cc>
> 
> So is this single patch something I should apply to the pin control 
> tree?

The first five patches will fix the validation errrors once the
binding is converted to the YAML format. So, do they need to go
through the same tree?

Also as mentioned, there is this pending series [1] which is the
reason I've converted the binding to YAML in the first place. So
at least the first patch of this series will have to go through
the same tree as the YAML conversion patch.

How can we move forward here? Krzysztof, maybe all of the dt
bindings patches can go through your tree and I'll reposting
the second patch of [1] afterwards?

-michael

[1] 
https://lore.kernel.org/linux-gpio/20220313154640.63813-1-michael@walle.cc/
