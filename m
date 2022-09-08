Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38B255B178A
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Sep 2022 10:47:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231680AbiIHIrI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Sep 2022 04:47:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231683AbiIHIqz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Sep 2022 04:46:55 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9C3B11CD7F
        for <linux-gpio@vger.kernel.org>; Thu,  8 Sep 2022 01:46:32 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id z97so1937905ede.8
        for <linux-gpio@vger.kernel.org>; Thu, 08 Sep 2022 01:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=ike64CUEUd9DsY2jLXloOMGX1zcdA8CVovnEVfdpkWw=;
        b=LKcaO49R7C8D7BiAe7tCsdVClR1PBI8B7udt+lfBQSS+x1yUq4VGovYQ1webE9nqw7
         lIQNKZXg+37DOjGos6CnFYKzKtsnkszwufk4cSmLu7jdwiMyGSYw6aRUDNMp2JNTPn9Q
         s0W5Y+tE3hEbzoF1CfjLlQOGKmHlcZeN/wT8wL24n6MQIgEEqgol87G35WOjwpcuI2lk
         qNFj7GRCe8xMlX3yyyXSqkgxlEUai6VUTz3ZY1QcAKRzdDCfDLicOza3s7aofcV2xmZm
         bl3Cf3g4utherIQaOE6u/cHbjoZ+HQ3QQBNu2v35D1poam90vFvonghu7DIe2RuqpQ/m
         WORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=ike64CUEUd9DsY2jLXloOMGX1zcdA8CVovnEVfdpkWw=;
        b=Z9vN4agNJIaEtaUikz2pxC9JkeljLB7ZBF8GZ5egdMLYuEwkNToN4/Iq+CzajPwVlk
         kht5pKqjS5FQDg7BzYyAQypKKc8fBKEAmLI0/INVtV2JDTTdYeH3W3qX3Gpi+10WBTfP
         Y6pyugE17iNQmRpOGJwlIKAKDV6boL5D0NGvuh1W8WCfJxN4DH6e/EvaaUUoRCQtbGWk
         3Oos42M1B0XXLXd27yQVoExGwfs//kbas80kPgGaIKX1PZOi08B0uPutsyrFHrrEa9A4
         AvBmDGYgjqbKCwdsZR2wVac0Xfm+m4UXi/21vTgm2Uff8OCbISaDLnyHXjCe5Y7GlzTP
         7hCg==
X-Gm-Message-State: ACgBeo22Z1E84R0+AiI/cAXNuge8IWPHqhoQqisx8EzU3PHHd8NjYkbX
        n55xi3J8JSPIZEndxqbF721VCXXegAeqy2Bq51aOqw==
X-Google-Smtp-Source: AA6agR4U76xtXaCBaEkcc16Efe+w9c+SR2weFMmxwjNiQ7qKd8luRRl6XC6xXOWShNwUnwGUtUi4ZhBzOgU6QexOVu0=
X-Received: by 2002:aa7:d6d9:0:b0:44d:e1b7:d905 with SMTP id
 x25-20020aa7d6d9000000b0044de1b7d905mr6280515edr.32.1662626790778; Thu, 08
 Sep 2022 01:46:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220907080251.3391659-1-horatiu.vultur@microchip.com>
In-Reply-To: <20220907080251.3391659-1-horatiu.vultur@microchip.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 8 Sep 2022 10:46:19 +0200
Message-ID: <CACRpkdYNvL9xf61BPJ1QDotXkJBG18+o=ZsFwoLw_LL-qGZ-Qw@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: ocelot: Fix interrupt controller
To:     Horatiu Vultur <horatiu.vultur@microchip.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        andy.shevchenko@gmail.com, UNGLinuxDriver@microchip.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 7, 2022 at 9:59 AM Horatiu Vultur
<horatiu.vultur@microchip.com> wrote:

> When an external device generated a level based interrupt then the
> interrupt controller could miss the interrupt. The reason is that the
> interrupt controller can detect only link changes.

I see there are some further comments, I expect to just merge v3 into
fixes as this needs to go into the -rc:s right?

Yours,
Linus Walleij
