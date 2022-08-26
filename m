Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22F425A2872
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Aug 2022 15:24:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344244AbiHZNYE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Aug 2022 09:24:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245701AbiHZNYC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Aug 2022 09:24:02 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBE45D91E3
        for <linux-gpio@vger.kernel.org>; Fri, 26 Aug 2022 06:24:01 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-333a4a5d495so35225237b3.10
        for <linux-gpio@vger.kernel.org>; Fri, 26 Aug 2022 06:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=PIiR/n+QCdxkf97dDWAHzLDooe+ZeLrKTx7VubO2kJc=;
        b=Vfl506+eEV29j3SFSG2c2FJrlXpA71hhQeWU6XPZ07WA/C7x9Gpef8u7QgZUgqxphb
         5A4IZYKU2YXkTmb84zrEVFK9HNcw1IrqvhY0a291OQr5HtrVD6nB3TXLVaqEzA1Q2tc4
         f3pX0OVE231I3FCp1NPzfBnURjmc+lhY5Iw6kVkMCxwVZxTEwh4eQv/NEvVcdw+Utwta
         g/8nSsbIiUWmmy2a4cFuOonbjeW7ONu4iISRXvh6+X8aVQ1uymTaKeP0/hgbOrLNOm0E
         hOUBuMgeU7UpuQX550zkBWChF9uKWWljEws3290n3Sc7aufSyzja4obExOmR1XaDsdHV
         3UBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=PIiR/n+QCdxkf97dDWAHzLDooe+ZeLrKTx7VubO2kJc=;
        b=31bQ30k9yv91WuusN0MAcMj+4u3FLqBV7w3OhfjxxlnawmCvBEvHtTp9CBF/rrQ2+S
         keRyDpItiEg6UFww6YjqsYCE3XOyxowCLPxiINaxhtfwyHcyinK60Ed8RedWq7JHmxsd
         0RH+n0zWx7KDmMm7Au36MRJvUSBDYzt3bqPiQ3hEYsDkkRGTgvnu/1HeoxkcHaegUIFG
         CNfyTcupj4Lbwa0oH/NjJKKKPAOmimKp2pX21wzFRf1duxKjwFZqF83WNV0Cti8yjirY
         iSeOGJCKU8ZVJScamfJC7iGk/FkWCqKpL7NeudrVZ/d5RLzSzB//o/WmFUpa0Glv0upd
         GGNA==
X-Gm-Message-State: ACgBeo0h/Cr8cOnWbYBiftlkNXfbo8CNV4iAuwJtRiuAdXmaDTUD0y8A
        +DjW4ojRM2o357M5xbZj2whSjZB/Ug8xGEv/n4yJqw==
X-Google-Smtp-Source: AA6agR60F7qofL+lQIprq0JSMlXSjr77GXI9fuLCUlQazq2xZ0LgTfP9Uw5qghqaJr4OYz6jjBnuq2E8e7ph3ThQ0d4=
X-Received: by 2002:a25:378a:0:b0:696:3e8b:fe5f with SMTP id
 e132-20020a25378a000000b006963e8bfe5fmr6874805yba.66.1661520241045; Fri, 26
 Aug 2022 06:24:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220823230753.14799-1-mario.limonciello@amd.com>
In-Reply-To: <20220823230753.14799-1-mario.limonciello@amd.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 26 Aug 2022 15:23:48 +0200
Message-ID: <CACRpkdaXaDH25Fxx=paA8D9tPEx23-c-9NNdgtpX5fDDvTX6BA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: amd: Pick some different unicode symbols
To:     Mario Limonciello <mario.limonciello@amd.com>
Cc:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 24, 2022 at 1:07 AM Mario Limonciello
<mario.limonciello@amd.com> wrote:

> Feedback from Kent had showed some better selections for symbols to
> use for pinctrl-amd debugfs output.  Adopt some of those instead.
>
> Fixes: e8129a076a50 ("pinctrl: amd: Use unicode for debugfs output")
> Suggested-by: Kent Gibson <warthog618@gmail.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Patch applied.

Yours,
Linus Walleij
