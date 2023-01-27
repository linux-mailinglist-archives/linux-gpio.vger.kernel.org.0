Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A061867E6D6
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jan 2023 14:35:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233763AbjA0Nfb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Jan 2023 08:35:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231671AbjA0Nfa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Jan 2023 08:35:30 -0500
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70CB215CA5
        for <linux-gpio@vger.kernel.org>; Fri, 27 Jan 2023 05:35:29 -0800 (PST)
Received: by mail-yb1-xb2d.google.com with SMTP id b1so5944621ybn.11
        for <linux-gpio@vger.kernel.org>; Fri, 27 Jan 2023 05:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+JlBczZ+fG7R6JQ9nktDvVYnDGRE115Thkzmewvp3F4=;
        b=NygA6arAMbHn7P/PnR1WwheGhSmyw6qLAHJj9IB6jRprxCmnETGw/fdT67AlI5AAHt
         x740bkfwo2MpNcdepS2pC8rcuQW2UHjWNBxbFA45yX4KtGPE1CKfD/kLtlAb+TdQlvHB
         mkUfOGjqpBDoJh01JY8NINzIMZxMKaIG+bU47OJqg+O2ZrRcHblrGPJoOURpscYBE7jn
         lVjyWyGHbYxcDeOjnMiLWJNFlANwAeNONVgXUHIDEMcKVbfb1g94Lyd8+HTbz66AGRUY
         ++JtEpygBZb6JmYQjvBWxYVBDXIDVp15rUE0vymW8kpsGHNn+FH3g6vrkygXqA6plcau
         uI3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+JlBczZ+fG7R6JQ9nktDvVYnDGRE115Thkzmewvp3F4=;
        b=j6edLdSbXpYT6R0JIy0lhIYVk89ZWryXQ26n6FLCAhUDUT/lpLu02OuB9qtebyMtL9
         kqa0ieFzcX0YKR9K2QU9GCoT3HQbi3p/9CEK51dximjaPO/ZrugiUIGFjx8rAtJOQj1U
         ErgTP9A/0ud9cTlgNt7sm1ge1dtTp/YRRGfe/EUdvcKj8FjL8E2hXq0LIilJ4gMB6DIv
         InTIBcwvV+QW3hThXQjJ9948V+/1202v/a3c1hTB64JMZlzFMqCY1kHX89B/F7Z5sPHC
         zvC3GB78VCNHaCbxo4zGO1B/afh4poplwm6q5MvAlFqLkMM6Xf95za3aq3k6BsQsJ/vz
         sj6g==
X-Gm-Message-State: AFqh2ko55hQbpUg3ybMJONOIdZiNlviSHHybY1w2HeAnCd6Vd1egXT9B
        wzdb0sJESUpSRtMcigDX3YI6VYZNXKVeK7kgi4XaxA==
X-Google-Smtp-Source: AMrXdXs8LpY8+SIRcxq+5MJlyno9csqwNoT4DlT60NMH3d/zyJdHGHyD/Z7d9QKSpoZurSghjMmivfFw6s2gFzi3OJQ=
X-Received: by 2002:a5b:38b:0:b0:7ca:9b40:72a7 with SMTP id
 k11-20020a5b038b000000b007ca9b4072a7mr4948223ybp.130.1674826528746; Fri, 27
 Jan 2023 05:35:28 -0800 (PST)
MIME-Version: 1.0
References: <20230127101149.3475929-1-arnd@kernel.org> <20230127101149.3475929-4-arnd@kernel.org>
In-Reply-To: <20230127101149.3475929-4-arnd@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 27 Jan 2023 14:35:17 +0100
Message-ID: <CACRpkdaaAbqL4CWwDK8z=DqJ3V-HQrwzZCXro+hbfw2pqaqAQw@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] gpiolib: remove asm-generic/gpio.h
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 27, 2023 at 11:12 AM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The asm-generic/gpio.h file is now always included when
> using gpiolib, so just move its contents into linux/gpio.h
> with a few minor simplifications.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
