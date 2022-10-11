Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 156BA5FAB9F
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Oct 2022 06:25:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229446AbiJKEZT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Oct 2022 00:25:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbiJKEZT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Oct 2022 00:25:19 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCDF53DBF9
        for <linux-gpio@vger.kernel.org>; Mon, 10 Oct 2022 21:25:17 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id pq16so11467238pjb.2
        for <linux-gpio@vger.kernel.org>; Mon, 10 Oct 2022 21:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N5//JIdt7o09amtBgwEgdHZhPDeKHn8AJ6Lf7dzhUrs=;
        b=pFjIThJ24jDXLE8662Q7Rt9xjvn5UK30CNNyQRBwfIuVvH1cx3To/S7HDPk44CAMij
         g4RwaNBZgUsoiHzJEHMyfw+cfn7uFd761saVxDLWv6SFleiJplHwsjUMRIUJRO60ZIJb
         vuS6pWWJ6slx8o8GWFT6rTdgO8ZkpW9A8gEv+ZnzzdIR6hpUEeB2fdIAh5LMcgj38PfM
         LnACWiUnzmi4+XCpNjRkd0eNJR9Dk9tdKSOI96QDWjJEhX0f9Q272DDXVPn3gKAhkkg3
         fkVY66A/bbnIrOnMoDL9LEwZU4duTxVNY0KGlCn0KnTQsoMnE/n2comp4z2oPWzeZ5UB
         6ofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N5//JIdt7o09amtBgwEgdHZhPDeKHn8AJ6Lf7dzhUrs=;
        b=2LkP/nmxA2Hrwr2EhRBf0m0SW4/AMoq+2El6ZX6Nu0A8cwHP5AZOOmtadqXcjy3hTX
         JiRyQCBZX5A2mQDDlze9J3eVTvXrvtgOFh8ZuUaczlNpC8YNbOX5Ah22O2tUTm83F5ta
         9cLlpXLtieqDz3cwc1BOFwXj+sTawxUKYetIW6XH9hYg3YMhMCWDMy9UXX7edJL2M0JV
         BWI8V+iulnRRExfs8pfZoHQEu8SB6HLdb4meaqyyEsrfEJkgwtYh1H8od2Ryva+YPF5h
         Uve+BCLMBRakbMNSuvyO39M7XuEaPqu1LGdBtrI3VClWjiUhZf3bci9WzGaIkcWAq2O0
         kU1w==
X-Gm-Message-State: ACrzQf189tzzhtQrSBhBEWJ4DJ1jCQavRmIi4L0/UK9EJl4O98Qit5q/
        Pf10rjx1cLIX2HgpuzRHrSY=
X-Google-Smtp-Source: AMsMyM527JUUu8a5nYGIODd56KeQvmW7PAoKoY5wCAqOiNV2A4t/729WdRqGMnTA0PW7SRlGt2+wkg==
X-Received: by 2002:a17:902:ea09:b0:179:c4bc:20e2 with SMTP id s9-20020a170902ea0900b00179c4bc20e2mr22773238plg.132.1665462317293;
        Mon, 10 Oct 2022 21:25:17 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id e88-20020a17090a6fe100b00205d85cfb30sm10071772pjk.20.2022.10.10.21.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 21:25:16 -0700 (PDT)
Date:   Tue, 11 Oct 2022 12:25:10 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Subject: Re: [PATCH V6 3/8] libgpiod: Add rust wrapper crate
Message-ID: <Y0TwJkzFNioQxwsi@sol>
References: <CAKohponphOwaPOoc50fPX=3p+fHbbvP5wJqLYCXfrjeX_nLkpA@mail.gmail.com>
 <CAMRc=Md4AmweW-p0f+RfwzOH0S3zPhK-60+di8BzSp6oVHvcYA@mail.gmail.com>
 <CAKohpomwhkKL9_mhmvH1C1WmHG50M5tL-Gy25Y2gVsbBuWGdiw@mail.gmail.com>
 <CAMRc=MebN1VwSzGtdGcYAeiN45D-e59oi6in-n7JYKqyqcum1Q@mail.gmail.com>
 <20220928111043.bs2ihopdxduavcsq@vireshk-i7>
 <CAMRc=MfA7SYS2FWZ+HHmqjTe=0EtedncJ5fRLB9CT4NiR0U8SA@mail.gmail.com>
 <20220928151716.3hhbcrjwskvwvajh@vireshk-i7>
 <CAMRc=McHusz7kK2v-H5Ccdrj1X6M7gTj7oaMuQoyuHhDVXekYw@mail.gmail.com>
 <CANiq72mvLzoNConYzqRYYq9M9Wr6iyo28VQ7Dt0FpfFiHUwzhg@mail.gmail.com>
 <20221011041651.amibtu24kcgm67e7@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221011041651.amibtu24kcgm67e7@vireshk-i7>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 11, 2022 at 09:46:51AM +0530, Viresh Kumar wrote:
> On 29-09-22, 15:55, Miguel Ojeda wrote:
> > It looks like a container whose elements get invalidated, so
> > `read_edge_event` could require an exclusive reference to `buffer` in
> > Rust, that way you cannot keep borrows to its elements like `ev` if
> > you want to call it. But of course this requires tying the lifetime of
> > the events to that of the buffer.
> 
> What about the below code changes on top of V6 ?
> 

Can you clone the event to detach it from the buffer?
Or are you now forced to drop the event before reading more?

Cheers,
Kent.
