Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3F2478821D
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Aug 2023 10:35:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234142AbjHYIei (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Aug 2023 04:34:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234308AbjHYIeJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Aug 2023 04:34:09 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B3FD19AC
        for <linux-gpio@vger.kernel.org>; Fri, 25 Aug 2023 01:34:07 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-d6b1025fc7aso638271276.3
        for <linux-gpio@vger.kernel.org>; Fri, 25 Aug 2023 01:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692952446; x=1693557246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5oWB5zwqbBsSi6JyZzBGjqCAgsWINDR0zhlWHyDbTrQ=;
        b=Aw98zxT8Ok3yb4AgGjD8HEiklqqH2ZJzuTpvuxVtQyivJp01hQO7bFbDKgmbSuC8e/
         4dppcPtHzmUWWwxG9+9PHNEu5U0GXlaDQQaZarhHGgstzpnY62CE3nYlKxTmLIo4W5Yp
         DmG7SbE7idYoIWf6r0WZnAMfnCLkc3xmeFUD5iLJubAqOihDnB3tT3LepAS6GlpSR0v6
         tmNs51mlUAj1lfuSDCQFVYzPeo+BM98RnrJ3+t9MU+MoZCm7hpF7HiAN3oUUav3g9Eob
         lrXWdOqhnrceJOx499MbSGBxsrGRxJBAph9WWwBPXntpPtWz/c62k/1OpwloZMSoxgp2
         QdOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692952446; x=1693557246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5oWB5zwqbBsSi6JyZzBGjqCAgsWINDR0zhlWHyDbTrQ=;
        b=NowmpzmVaCbyK8eovLHUAe3uQSzCq55oMzTaAiLwKVulc+fzuF8CoQbCy9OU3Prt2b
         /w8lGmjwVYn7KwOt25ALkay0F2hT93Kg+s3rbNWO2lQ4PCR7GOvYczrE4EI37o0Bd8pm
         oD4CYqNmilkOkgH13g3XiTLNsQtI9UxsAcV3J9RfyalMESDb2zk5EWLZ1Co8OYr95V5Y
         Iw1p1j5C0mnkHWYWvaj8Bt4rQLGkoHOBdXRouAnFhmZ7gyvupbu8PejnmKq5Fej0SYZN
         kPaS0uw35ZtWtn5S8lk2o0y8C+uGDe67PhdYQ5yrXJASaidIYeo15+C1ATyEOStxWrRJ
         ycow==
X-Gm-Message-State: AOJu0YyW3/tmyU/FwxTB582hVTtK5BKwS0zMSaegaj/YgASNf+yDyQ8T
        p/op5wt/7YbT1oFZkBm6977AN+szkcYtcDPm3dPAShU829kcG2Q2
X-Google-Smtp-Source: AGHT+IHoOV/gNjc8Z4YzVtChuMBrnQTJXS7cSJa1GmAVy3C8b/yHtZ9hJeIFI/ORjOUMrVKX4NLOLpAO35cShuSUqUU=
X-Received: by 2002:a25:6412:0:b0:d77:a0a5:e1a3 with SMTP id
 y18-20020a256412000000b00d77a0a5e1a3mr8215669ybb.33.1692952446552; Fri, 25
 Aug 2023 01:34:06 -0700 (PDT)
MIME-Version: 1.0
References: <ZOco6n9jbDTOWWdy@black.fi.intel.com>
In-Reply-To: <ZOco6n9jbDTOWWdy@black.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 25 Aug 2023 10:33:54 +0200
Message-ID: <CACRpkdZ-0GMsJC02XZ8GJBN3OuxHtnG5YOarhMq0LgjGupj6Tw@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 6.6-1
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 24, 2023 at 11:54=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> A bit late batch of Intel pin control updates along with some other
> drivers to be involved. The main parts of the batch were at least
> 10 days in Linux Next without any problems reported. Please pull
> for v6.6 cycle.

Pulled in, excellent work as usual. Also nice to see a new
developer (Raag) on board.

It doesn't matter that it's late because the patches have been in
-next already so we can trust them.

Yours,
Linus Walleij
