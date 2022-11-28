Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E07763B305
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Nov 2022 21:25:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233956AbiK1UZQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Nov 2022 15:25:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234026AbiK1UZP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Nov 2022 15:25:15 -0500
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EB8E2A722
        for <linux-gpio@vger.kernel.org>; Mon, 28 Nov 2022 12:25:14 -0800 (PST)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-3cbdd6c00adso24303417b3.11
        for <linux-gpio@vger.kernel.org>; Mon, 28 Nov 2022 12:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aKRoRYNTW4HJCR1frGaCKessTYp/at9IXsVuhASCfRU=;
        b=QU9n4l7/V9/pOIE/+kDiKswYTUXlsBP1BHI1htW4u+VZBPfRmSWvLThwSkGqgXuXCj
         nlbXiljjuhPG6VYLKdpb4O5rxik+MFvbBcet9UQauTFl00bnJCSZ7H0dajjdOcY2IMrY
         TVvFZFxJVg6I42/MXKXUprUYh1MpZMdiVJZVpg+hxp+mjW9C7KM+0lsYY7bdaCo4o0Qu
         y7lW5TFI+/pgzafwIs2hu/a51I94TLuvq1k47+v9eKDeHbb1aM9A5HzCKuWMQVbCS9sA
         BKFiqtjoLXZxjL//gxloRaBfzALmL2m6BmC4QODw2TCaaK9dR8TwviCaYpjA0xuQZ87+
         mUEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aKRoRYNTW4HJCR1frGaCKessTYp/at9IXsVuhASCfRU=;
        b=3OTlvKVkwrNayGO7AoPYgKgMmGemIpz+5XQV7hcywFyTJLQtpbsExkjszMokSEu3pq
         8Pg5HMFrI2OHabsp1NU4wiyEzEJ6OJ44UIEU/LD/lN8J6Cnqg5lf1GOtafRFKx1kV2rr
         0/MJXuXjKUY/4hp7kqjr7TiQmNBGrf+uC8JrmfMjHbcK6GuEof7A6epd18kqo9naifeM
         k9uePItXqgVbQ6SmriteTUSpZ/Z/z1uCfgemqgg90U3By/L1YzLMmPWAycygGEAfzU4J
         VRP6/7dycUk/EwqrBNbbVTQfE71kAL29uA3RZowrBmadfw/7fNnOpFoIxAjM8JWI4nd5
         ancQ==
X-Gm-Message-State: ANoB5pniKb18oGVxmCDJidGR2OFwk8yEw0LhZXH8OR69ZXq54R04yQk0
        r2M3auBEwAG9azW2SQco7OPyKwGiMywlzamVydvrVw==
X-Google-Smtp-Source: AA0mqf4Tz6jouxpu8n0VfIND8O4LqmtzJxwLEx+s3OYhdps2IYWEMlGIp4tLypz7OgkzA6zsM/3sdsSncoUwq1BvgcU=
X-Received: by 2002:a0d:d711:0:b0:3c3:dc9f:d24f with SMTP id
 z17-20020a0dd711000000b003c3dc9fd24fmr8700598ywd.343.1669667113459; Mon, 28
 Nov 2022 12:25:13 -0800 (PST)
MIME-Version: 1.0
References: <Y30YOvHpqvte9otX@black.fi.intel.com>
In-Reply-To: <Y30YOvHpqvte9otX@black.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 28 Nov 2022 21:25:02 +0100
Message-ID: <CACRpkdZa7hOuU5e-i+_=TqM_Ttec6tvzgXXPm8giy=NiFO2tEA@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 6.2-2
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        linux-pwm@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 22, 2022 at 7:42 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> This is an immutable tag with PWM feature enablement for Intel pin control IPs.
> It's targeting v6.2 and have been reviewed by all stakeholders.
>
> The idea is that PWM and pin control subsystem soak up it independently.

I wanted to give Thierry the option to say if he's pulling this in,
but it needs rotation in linux-next so I've pulled it into the pin
control tree now.

Yours,
Linus Walleij
