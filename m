Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D12EC4C5EC2
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Feb 2022 21:39:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231703AbiB0UjZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 27 Feb 2022 15:39:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231949AbiB0UjQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Feb 2022 15:39:16 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CB1E6E553
        for <linux-gpio@vger.kernel.org>; Sun, 27 Feb 2022 12:38:29 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id v28so14714141ljv.9
        for <linux-gpio@vger.kernel.org>; Sun, 27 Feb 2022 12:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U9xhZwaxUuMiS2YT5xPkv6KeE3gRj8GLelmcYGjQjfc=;
        b=HNhkInAoG//sp9xFN6zmJL6sLovoGy26g7FjBTKa/4kA94lIEccpn4y2F0GU0emrRb
         M063ohN1Jr77irshWpKDEv2h3KFpcTzLhtfmyZeYrkz8yaq1l7yzAKmhtSemockShu2a
         SE0jMAbWBb4HkSxF6fAH5LzIdGUhK8c/rspjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U9xhZwaxUuMiS2YT5xPkv6KeE3gRj8GLelmcYGjQjfc=;
        b=XpitvGNwpK44vrTtE3YFxN9SE+rQhRe60yRCCZlvE/VJGPsn1vefnppVWM1purenSb
         YQfStipmyL68qcHj66PbulHK876LvYYgM+gW8YQ4CQGle5EsozBNQmhSfYGi2nzjbUjk
         RZLSOWnXESSqYuJWJe1JiS5mnbTd+woSe6SS3TIQFrvaIdhv3FhZ0qxBiixa6b+OHNEP
         WBzg82vSarwJB7gbyZv7+zLuezSx7nm4+7gqrMKZ9LgcCONiHDJ5WNvMbO/YDv6gqUVH
         ppqzBd6qwXkf3Be/Spsh+h010EjtlM/K9t5T0xy3RmcHPPdK3050WGjFy4xz57Q87VoN
         jXPA==
X-Gm-Message-State: AOAM530dkHRPcu6OuE8gZzTIDwAE6/ROvF+oTCYq6n85pxIgWr7NTYpK
        r1I9Eezs3TgzYdE9qSbEytWRJqb3DR0WZbou4Rw=
X-Google-Smtp-Source: ABdhPJwxNz4T7PP33BCfv5ddPu6Tm99BMghVuEpF1Hfa8mVaM7Maar2LKfamDC4APdOWzPUopNUDXQ==
X-Received: by 2002:a05:651c:543:b0:246:3f05:369c with SMTP id q3-20020a05651c054300b002463f05369cmr12081906ljp.433.1645994307584;
        Sun, 27 Feb 2022 12:38:27 -0800 (PST)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id q28-20020ac25a1c000000b0044565c9edf4sm735098lfn.2.2022.02.27.12.38.26
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Feb 2022 12:38:27 -0800 (PST)
Received: by mail-lj1-f181.google.com with SMTP id e8so14774797ljj.2
        for <linux-gpio@vger.kernel.org>; Sun, 27 Feb 2022 12:38:26 -0800 (PST)
X-Received: by 2002:a2e:80c6:0:b0:246:3334:9778 with SMTP id
 r6-20020a2e80c6000000b0024633349778mr12342769ljg.443.1645994306221; Sun, 27
 Feb 2022 12:38:26 -0800 (PST)
MIME-Version: 1.0
References: <CACRpkdYM21hcH5d9rXyvjMPHQp429OZ1Zcy7uLU2tndoJcOmUQ@mail.gmail.com>
In-Reply-To: <CACRpkdYM21hcH5d9rXyvjMPHQp429OZ1Zcy7uLU2tndoJcOmUQ@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 27 Feb 2022 12:38:10 -0800
X-Gmail-Original-Message-ID: <CAHk-=whg3eRY1nOJjHam+jORmVymU539CxhBUjp4=tGoFitotw@mail.gmail.com>
Message-ID: <CAHk-=whg3eRY1nOJjHam+jORmVymU539CxhBUjp4=tGoFitotw@mail.gmail.com>
Subject: Re: [GIT PULL] pin control fixes for the v5.17 series
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Feb 26, 2022 at 5:11 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> some more pin control fixes that trickled in the last week or
> two.

Hmm. Am I confused because I thought I'd see a fix for the orangepi
problem that Guenter has been reporting?

That problem has been pending for quite a while now.

               Linus
