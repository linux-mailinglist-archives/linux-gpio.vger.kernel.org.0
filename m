Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DEEB5FD744
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Oct 2022 11:47:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229516AbiJMJrr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Oct 2022 05:47:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbiJMJrq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Oct 2022 05:47:46 -0400
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [IPv6:2001:4b7a:2000:18::167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5874C103255
        for <linux-gpio@vger.kernel.org>; Thu, 13 Oct 2022 02:47:45 -0700 (PDT)
Received: from SoMainline.org (D57D4C6E.static.ziggozakelijk.nl [213.125.76.110])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 7E1383F270;
        Thu, 13 Oct 2022 11:47:43 +0200 (CEST)
Date:   Thu, 13 Oct 2022 11:47:42 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/16] arm64: dts: qcom: sm6125: align TLMM pin
 configuration with DT schema
Message-ID: <20221013094742.fftcbdkjipkw3pub@SoMainline.org>
References: <20220930192954.242546-1-krzysztof.kozlowski@linaro.org>
 <20220930192954.242546-11-krzysztof.kozlowski@linaro.org>
 <20221011074512.anifehocqjnxuf35@SoMainline.org>
 <112ada96-f742-8d06-dc90-a422d3636e06@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <112ada96-f742-8d06-dc90-a422d3636e06@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2022-10-11 08:06:55, Krzysztof Kozlowski wrote:
> On 11/10/2022 03:45, Marijn Suijten wrote:
> > On 2022-09-30 21:29:48, Krzysztof Kozlowski wrote:
> >> DT schema expects TLMM pin configuration nodes to be named with
> >> '-state' suffix and their optional children with '-pins' suffix.
> >>
> >> Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > 
> > Thanks!
> > 
> > Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> > 
> > Perhaps mention more clearly that this is fixing up an earlier patch
> > that tried to address missing `-pins`?
> 
> It is not fixing only that patch, but also nodes added later without suffix.

Afaik the node was already there when [1] was applied, it just
accidentally added -pins to cmd twice instead of once to clk and cmd
separately.  But feel free to stick to a generic commit message.

[1]: https://lore.kernel.org/all/20220912061746.6311-35-krzysztof.kozlowski@linaro.org/

- Marijn
