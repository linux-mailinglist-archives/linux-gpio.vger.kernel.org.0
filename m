Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B0A45A0FAF
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Aug 2022 13:58:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240633AbiHYL6V (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Aug 2022 07:58:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240558AbiHYL6U (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Aug 2022 07:58:20 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 396DAA5718
        for <linux-gpio@vger.kernel.org>; Thu, 25 Aug 2022 04:58:19 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id v14so2506679ejf.9
        for <linux-gpio@vger.kernel.org>; Thu, 25 Aug 2022 04:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=iQYbswVj7iM4wqguS/ZmMUjlm9pK2PIPrAloX1Q6g7Q=;
        b=zwgg9tn6AWHOp9f3t61Mo5JEjMdDoAGp9tIBsRSHkFooCeKLD5656cagW8eyiiQPRr
         PdyfN8+30JG4SLbAWL5u3K2GuIEHT0aUx//rBU8preTL+AZaSx6dbSZZVJCmPI3iFa3M
         oKOWexPaZhk4M1IHN1cMY0COiSvfHXry04/7HM7JkKhM57BumaRpOVd+vTN5pRDcKSm6
         kj4UPVv7FRNrB14lgrVp7BP4x9IcRnWlDuaebwBokFYg4DpeMDiTI8SRU05POexROvJ6
         OSFsZZit/I2ogapEr2l7OyFOVBlXEbn5Td+CyT7u6H+4FXR7yUHhSqvAeAO5I7oQSYmm
         9kZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=iQYbswVj7iM4wqguS/ZmMUjlm9pK2PIPrAloX1Q6g7Q=;
        b=DxCL2Nvi18Tx+4FBlQKpEZngjRBmdbfvokyDU9JsZDL0qwlop7rg9NLTA9C2h1FLIp
         DS+zDCrnSwOJN8zRMoO5xvJlgLJcKz1cy67DGy40TTFIfhiyBpzXy5gwqm9uqllLFRz+
         g6k22yr7GXn2P2KDQIUleVe8s5HqOK5Y3hsVAnoDUPuN8Q4+odY/9ENrsYQCqKAsgY3y
         AYOhAWPZtAeMntkEoutM6k4cpflGvH1TTQN8YrIZ7HFy5LlIRLFaUxXtm95197znV8TE
         zADTq2L3aZIFjVsZGU5SlY4oFvV6EkSGQOEM5tx2eJKt+YUZPhxQ5SLBFGM8uMN6rotU
         SY4Q==
X-Gm-Message-State: ACgBeo1BBf/WVLm0NExQBYuPR36oO41b+SrivSM9LOaFIOenO6z6ZS0w
        IVMgY8MSP+4qMTj6/bSkeDAArIT0WJGy1XU08b6J/A==
X-Google-Smtp-Source: AA6agR4izDWOE+9XTU+4xXNJ0Srz/r8RJsdsvkC3QjAfuqj7oC+ch8T2Fe57i2NzQFuB5qtP5JsoeVMI2Zs9uKSjS0I=
X-Received: by 2002:a17:906:58c8:b0:6fe:91d5:18d2 with SMTP id
 e8-20020a17090658c800b006fe91d518d2mr2336619ejs.190.1661428697709; Thu, 25
 Aug 2022 04:58:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220620165053.74170-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220620165053.74170-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 25 Aug 2022 13:58:06 +0200
Message-ID: <CACRpkdaZrQ-YY8ZSzB4XNJWqjA7Ej=y-YK-Xc1v+q0ZzAbtZ6A@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: bcm: Convert drivers to use struct
 pingroup and PINCTRL_PINGROUP()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 20, 2022 at 6:50 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The pin control header provides struct pingroup and PINCTRL_PINGROUP() macro.
> Utilize them instead of open coded variants in the driver.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied due to non-responsive maintainers!

Thanks for fixing this up Andy.

Yours,
Linus Walleij
