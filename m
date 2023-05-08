Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54ADE6FB311
	for <lists+linux-gpio@lfdr.de>; Mon,  8 May 2023 16:38:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233604AbjEHOic (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 May 2023 10:38:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233259AbjEHOib (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 May 2023 10:38:31 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBB9FE4C
        for <linux-gpio@vger.kernel.org>; Mon,  8 May 2023 07:38:30 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-75131c2997bso1801167085a.1
        for <linux-gpio@vger.kernel.org>; Mon, 08 May 2023 07:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683556710; x=1686148710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f94nVkHMdXqRh1VoqGkstCxNt8JdaEKTUSx2hclX/ts=;
        b=Rq1BA4zlrkt0dCCUdQEoZMnehhn1h4kuz7ohTFXUePFkn88XywQkzqwr/Nu1LZEz5B
         BaInaGapnmz8hDq1my2zUo+URU31HMMlrYE3DWd+TlW3rLOBj/kb71gL9VmD+35u021v
         1xZhN9/Ycec/yKw7y7nDcvY/0av7f7Ra2Lh/ty2mvF2zLhGucrtZYhZ3J4yt6qbqLIEt
         7JMUUpV3uMjUY7Jj+HCfyG+aMSmXFvk4Ap+Hf1YL6ft4jDQc0bnRAVGr4jemTsVh7Njy
         hPGTlwXYTLO5BdTb0MjS+YgYKCrgeBfYNvedcC4ixyFeXJzyAesLq1TPASHIBMJf0TRP
         utGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683556710; x=1686148710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f94nVkHMdXqRh1VoqGkstCxNt8JdaEKTUSx2hclX/ts=;
        b=iRBNTYA/rhAujkpA5x3IV/srJ9Y75ALujYQm86bmwoVzsFpTofznHjD/FhQM+D4P1c
         3fGqN7Sc/payZe8zQ1JgsYdYIqMm/l/igeV2AU+Qh4FemmXKb1H/mpayew4Ithhc23Hd
         d6nEKVMFFrXLYKe7hKWgJCQBcM/IgJ+mRa2OmvsZPnhcuOO+yP0nODc9PBd4tbSsIeOM
         h18WG1Uq3SjiND2dC6+3wsy0030y5O7mPerDt6E5pofW8akyuFThhAjyrc9zdClE3l9D
         +lHqFYu9dgJKuXVhIi+N6R7N3uzgT1xokuIC4qrimuQeJOrI7C17aHQIg0D7ZnvLLuvc
         6KBQ==
X-Gm-Message-State: AC+VfDyBdf8CuaiuYqqFDCEn4IuRqP+eoyYB7WFfNW8az9m1iHdlkmWr
        el1X5iIyVEg/xVnMZyh5dfTJk68fUD4xTrnKhk0=
X-Google-Smtp-Source: ACHHUZ5kJQKkQGNvMLs67+pYBSBljEKDDFlAJeMi6MntFwjW+rf6ZB1EwF2M4ZHsGGfQDmGvfPtjB07NBJsBvPCIYLw=
X-Received: by 2002:a05:6214:5297:b0:61b:58ec:24c8 with SMTP id
 kj23-20020a056214529700b0061b58ec24c8mr15743388qvb.10.1683556709891; Mon, 08
 May 2023 07:38:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230508131848.142602-1-milo.spadacini@gmail.com> <CACRpkdYN6XCw7wyGPjmsGUqbbF-3N7iSURAB2rqwurDFKdT5ug@mail.gmail.com>
In-Reply-To: <CACRpkdYN6XCw7wyGPjmsGUqbbF-3N7iSURAB2rqwurDFKdT5ug@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 8 May 2023 17:37:53 +0300
Message-ID: <CAHp75VfUXs7-0Otr_1cKKWwMzL74omoRqg8KqJCw+5=-eCZxtA@mail.gmail.com>
Subject: Re: [PATCH v3] tools: gpio: fix debounce_period_us output of lsgpio
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Milo Spadacini <milo.spadacini@gmail.com>, brgl@bgdev.pl,
        linux-gpio@vger.kernel.org, warthog618@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 8, 2023 at 4:46=E2=80=AFPM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> On Mon, May 8, 2023 at 3:20=E2=80=AFPM Milo Spadacini <milo.spadacini@gma=
il.com> wrote:
>
> > Fix incorrect output that could occur when more attributes are used and
> > GPIO_V2_LINE_ATTR_ID_DEBOUNCE is not the first one.
> >
> > Signed-off-by: Milo Spadacini <milo.spadacini@gmail.com>

I'm not sure if we need a Fixes tag, but anyway LGTM as well:
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Thanks Milo!
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

--=20
With Best Regards,
Andy Shevchenko
