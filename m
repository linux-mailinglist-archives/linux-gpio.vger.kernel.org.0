Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AA2F7B1F43
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Sep 2023 16:12:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232425AbjI1OMb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Sep 2023 10:12:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232142AbjI1OMa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Sep 2023 10:12:30 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36FF711F;
        Thu, 28 Sep 2023 07:12:29 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 982BFC433C8;
        Thu, 28 Sep 2023 14:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695910348;
        bh=wtGe4SsbGGcWY1/IDsDw79ZQnLnIek+nUMtbOAOYDhM=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=pfSTfRbXDXPGTcCYn+1RDdOLPiFjsTqIybxiXnvRHC3TAzghtBnkAiU0YGjhlepS7
         9bTekmGi1Cf4YkHVs/dZA0+xPlOXVZrHvgnnbIFQF8TrJ2q6sqSf0TY/q9z5M7Qm+U
         csKesPMUaNsHT0BZBADqCQ4lphHqBF66z5h3YeV2m1b+5sDMuKqOzQVsunhHG0qV35
         Xe6DecmygpDEuDIC8SAnvWBsRV8NO7ElK6W1dCGDGStTZeJBynsIfaNMaZWvKREyJB
         oDZpuJ2wXu0+4VhWwhjk854ex+9it60dDZc2rCDu1SpL6G7IhADS5fCxCJrbkt4OUl
         1rtVXf39UPpcA==
From:   Lee Jones <lee@kernel.org>
To:     =?utf-8?q?Jan_Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-leds@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20230926-gpio-led-trigger-dt-v2-0-e06e458b788e@linaro.org>
References: <20230926-gpio-led-trigger-dt-v2-0-e06e458b788e@linaro.org>
Subject: Re: (subset) [PATCH v2 0/3] Rewrite GPIO LED trigger to use
 trigger-sources
Message-Id: <169591034632.1624130.7939810399934804656.b4-ty@kernel.org>
Date:   Thu, 28 Sep 2023 15:12:26 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 26 Sep 2023 23:48:10 +0200, Linus Walleij wrote:
> This rewrites the platform-data GPIO LED trigger to instead
> use fwnode trigger-sources to describe the LED used.
> 
> This will work out-of-the-box with e.g. device tree.
> 
> Tested with real hardware by modifying a device tree adding
> trigger-sources to a LED and trigger-source-cells to
> a gpio chip, setting the trigger to a pushbutton. It works
> like a charm, once the trigger is set to "gpio".
> 
> [...]

Applied, thanks!

[2/3] dt-bindings: leds: Mention GPIO triggers
      commit: 4aa583f1a6b85c88e3278d2461797d592ac61fcc
[3/3] leds: triggers: gpio: Rewrite to use trigger-sources
      commit: 1222f5dbc7723cc78741343da2e414b80de83c8f

--
Lee Jones [李琼斯]

