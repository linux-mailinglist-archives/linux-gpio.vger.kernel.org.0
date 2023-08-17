Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2ACC177F5A5
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Aug 2023 13:50:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350458AbjHQLuG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Aug 2023 07:50:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350480AbjHQLtq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Aug 2023 07:49:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 557F2115;
        Thu, 17 Aug 2023 04:49:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DB59B65CA2;
        Thu, 17 Aug 2023 11:49:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AC70C433C7;
        Thu, 17 Aug 2023 11:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692272984;
        bh=teEVrb3W2gvTtrNyepUcTV15xxpfZzRsHJzzuAr82LI=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=Zwqw/xL5J3V7Fx4OowaejmPkxkfelnRuDHwLTMgdk9af9sVjy/pyR1Vi++ZtIWBz8
         9ycbbanHTs2uaDN94ct+/LsPyUtz9JFsM5/5KrXKA95tYRUZCZEgX785OtogDyRT8b
         dyeDeVuK8wCsuefYfB0fQyKwa8xSjmTVSjhzlGbUIy0z2zBrlSC8d0RaO1OnSyDThx
         g+D3ixAGOANJ/oQ7P+NWKLlLIXIct1eIDS7LWjybJ9OouaW9URkmcjf8Qy/51Zc89Q
         GGJe77NXOEiJiGnvC+2cwGBByvt5suT6yJArAgN9YVvf04Umiv1Euo40BqDs/wbJbh
         yyeFkPRsUKtzQ==
From:   Lee Jones <lee@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
In-Reply-To: <20230724063520.182888-2-alexander.stein@ew.tq-group.com>
References: <20230724063520.182888-1-alexander.stein@ew.tq-group.com>
 <20230724063520.182888-2-alexander.stein@ew.tq-group.com>
Subject: Re: (subset) [PATCH v2 2/2] dt-bindings: leds: Add gpio-line-names
 to PCA9532 GPIO
Message-Id: <169227298106.1007427.16180797809612061178.b4-ty@kernel.org>
Date:   Thu, 17 Aug 2023 12:49:41 +0100
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

On Mon, 24 Jul 2023 08:35:20 +0200, Alexander Stein wrote:
> This is a gpio-controller, so gpio-line-names should be allowed as well.
> pca9532 supports up to 16 GPIOs.
> 
> 

Applied, thanks!

[2/2] dt-bindings: leds: Add gpio-line-names to PCA9532 GPIO
      commit: 4aa8f7e24f07669d27945149a72903bc032fa6e9

--
Lee Jones [李琼斯]

