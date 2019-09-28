Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D02CC1226
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Sep 2019 22:45:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728666AbfI1Up3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 28 Sep 2019 16:45:29 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:32924 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728684AbfI1Up3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 28 Sep 2019 16:45:29 -0400
Received: by mail-lf1-f68.google.com with SMTP id y127so4322045lfc.0
        for <linux-gpio@vger.kernel.org>; Sat, 28 Sep 2019 13:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dLYTFkFrNGxCoEYojjgFEui1jSM/OuDfyPrBEU2Sxno=;
        b=VQn/lxN4Rfh4eLguBjpAe2eJvvH//mQ4E8VIOMpdlCZrYrcfRNaeNZYk/GF7pjsGBD
         PwsO/dPYGJnZPLm0f480zUv+bxDzlQC13Ks1OSWWE/zJESJdyTgPiC6RNhyi9Bcpu+y2
         E8cMtZ2okAFZTO5lUp2ggy41SzILDxNMc/WTcolngc1QhmiYLhF0aiPGyriKSnSWkEnB
         GB7jeb5IY+Vyt4AVSyZu38YaFZVe7UM2im/DBynAn2qZPZrE7mR/2bSqXiHag936qBdH
         Oc3GbtG+FrxlglsKW6WdTFkb6ta5Y+6MGnYPK+r72DFMfJEYScBbAZmmgs1neinmnSQ6
         xphg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dLYTFkFrNGxCoEYojjgFEui1jSM/OuDfyPrBEU2Sxno=;
        b=AQj63IKZwSg5HJeY7h74iUQcL2P6cQPLEUimJAG8zg3sqRyR3/3rATLyfdW09gjLQ/
         28VJoDIUHc+sT4Bn7cBANc/EjYkp81GeO0GdpqxfbBEBZEiorVIWgOXBlCbi55L7HAy5
         r2QF3n+uTO+mNy9U+6R/I49ts+Ztq4U3qJhO+0ZLPacYKYTdUxtnTQxkqA8U9nJXqdBA
         DiQuK3PCDpBx9BD7u0EeJOS+6RA1HDuVrloaJVI7ayk9K4ljiqNSzmIP55DMlfa7IXU5
         owLP1xcejm+LBrDM4J6BNqJ7qj42vVf1kaMh5Gxv1hdoL4IAPxc/WH/H4pFaFhHRlmKE
         SxWQ==
X-Gm-Message-State: APjAAAUohNcZ54UdBTBmCJsBSP7pPzUiHT7GEP+Ze0nW9SCmGvXuvKc1
        kUwtABjO9BKpgJYxWrobKvvjoOiY3W3aT1ThMoM9Mw==
X-Google-Smtp-Source: APXvYqz/fprWRPeUCs8lVfveO0SM2vBJwVHWDB1UJtfBV8UQKoSb+8524QRmSNO3T0LpaE+yjmnic+Bn9KzNWHMRbvs=
X-Received: by 2002:a19:48c3:: with SMTP id v186mr6806509lfa.141.1569703526497;
 Sat, 28 Sep 2019 13:45:26 -0700 (PDT)
MIME-Version: 1.0
References: <CACRpkdY62aXDOZm7cK4ND-RSnr9Ynz0DxS8-PHSF7i7diRG=WA@mail.gmail.com>
 <20190405194613.19578-1-u.kleine-koenig@pengutronix.de> <20190405194613.19578-2-u.kleine-koenig@pengutronix.de>
 <CACRpkda1xoUZGMCDWGSvA7MPxXC5qc3tp8UiZt+us19vppGpyw@mail.gmail.com>
 <20190408133506.xv3cwcqkqdobgz2r@pengutronix.de> <CACRpkdbYtsVLXC61jn_Gy_X33N4DBD9eumf3JNVCLemk0sGHzQ@mail.gmail.com>
 <20190408102744.66856bdb@gandalf.local.home> <CACRpkdax=n6hYfixSgsVaT2vPiZGdCC=tbQJrazzao946_M7yA@mail.gmail.com>
 <20190824140426.4kflanpydbafsmve@pengutronix.de> <CACRpkdbspcWpeggzCaBa=GiZriy7REyQpfH6x=uE1HdqXY=kPQ@mail.gmail.com>
In-Reply-To: <CACRpkdbspcWpeggzCaBa=GiZriy7REyQpfH6x=uE1HdqXY=kPQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 28 Sep 2019 22:45:13 +0200
Message-ID: <CACRpkda7zU41cZ3vxwTmX48uB_gCJhScbD6hp0WEkkZUUS0u_w@mail.gmail.com>
Subject: Re: [PATCH 2/2] tracing: drop handling of NOTRACE symbol
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Tal Shorer <tal.shorer@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 27, 2019 at 2:41 PM Linus Walleij <linus.walleij@linaro.org> wrote:

> I put it in a separate branch and push to the build servers so
> we can see if something happens!

Oh there it is... buildserver says:

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
 devel-drop-trace
branch HEAD: 40da9a24a778d94e034d160bfacf4931ae5922cd  tracing: drop
handling of NOTRACE symbol

Regressions in current branch:

kernel/trace/trace_events_filter.c:2105:14: error: field name not in
record or union initializer
kernel/trace/trace_events_filter.c:2115:44: error: field 'rec' has
incomplete type
kernel/trace/trace_events_filter.c:2121:2: note: in expansion of macro
'DATA_REC'
kernel/trace/trace_events_filter.c:2142:9: sparse: sparse: too many errors
kernel/trace/trace_events_filter.c:2222:29: error: passing argument 2
of 'create_filter' from incompatible pointer type
[-Werror=incompatible-pointer-types]
kernel/trace/trace_events_filter.c:2222:30: error:
'event_ftrace_test_filter' undeclared (first use in this function);
did you mean 'trace_ftrace_test_filter'?

Error ids grouped by kconfigs:

recent_errors
|-- arm-allmodconfig
|   |-- kernel-trace-trace_events_filter.c:error:event_ftrace_test_filter-undeclared-(first-use-in-this-function)-did-you-mean-trace_ftrace_test_filter
|   |-- kernel-trace-trace_events_filter.c:error:field-name-not-in-record-or-union-initializer
|   |-- kernel-trace-trace_events_filter.c:error:field-rec-has-incomplete-type
|   |-- kernel-trace-trace_events_filter.c:error:passing-argument-of-create_filter-from-incompatible-pointer-type
|   `-- kernel-trace-trace_events_filter.c:note:in-expansion-of-macro-DATA_REC
|-- arm64-allmodconfig
|   |-- kernel-trace-trace_events_filter.c:error:event_ftrace_test_filter-undeclared-(first-use-in-this-function)-did-you-mean-trace_ftrace_test_filter
|   |-- kernel-trace-trace_events_filter.c:error:field-name-not-in-record-or-union-initializer
|   |-- kernel-trace-trace_events_filter.c:error:field-rec-has-incomplete-type
|   |-- kernel-trace-trace_events_filter.c:error:passing-argument-of-create_filter-from-incompatible-pointer-type
|   `-- kernel-trace-trace_events_filter.c:note:in-expansion-of-macro-DATA_REC
|-- arm64-allyesconfig
|   |-- kernel-trace-trace_events_filter.c:error:event_ftrace_test_filter-undeclared-(first-use-in-this-function)-did-you-mean-trace_ftrace_test_filter
|   |-- kernel-trace-trace_events_filter.c:error:field-name-not-in-record-or-union-initializer
|   |-- kernel-trace-trace_events_filter.c:error:field-rec-has-incomplete-type
|   |-- kernel-trace-trace_events_filter.c:error:passing-argument-of-create_filter-from-incompatible-pointer-type
|   `-- kernel-trace-trace_events_filter.c:note:in-expansion-of-macro-DATA_REC
|-- mips-allmodconfig
|   |-- kernel-trace-trace_events_filter.c:error:event_ftrace_test_filter-undeclared-(first-use-in-this-function)-did-you-mean-trace_ftrace_test_filter
|   |-- kernel-trace-trace_events_filter.c:error:field-name-not-in-record-or-union-initializer
|   |-- kernel-trace-trace_events_filter.c:error:field-rec-has-incomplete-type
|   |-- kernel-trace-trace_events_filter.c:error:passing-argument-of-create_filter-from-incompatible-pointer-type
|   `-- kernel-trace-trace_events_filter.c:note:in-expansion-of-macro-DATA_REC
|-- s390-allmodconfig
|   |-- kernel-trace-trace_events_filter.c:error:event_ftrace_test_filter-undeclared-(first-use-in-this-function)-did-you-mean-trace_ftrace_test_filter
|   |-- kernel-trace-trace_events_filter.c:error:field-name-not-in-record-or-union-initializer
|   |-- kernel-trace-trace_events_filter.c:error:field-rec-has-incomplete-type
|   |-- kernel-trace-trace_events_filter.c:error:passing-argument-of-create_filter-from-incompatible-pointer-type
|   `-- kernel-trace-trace_events_filter.c:note:in-expansion-of-macro-DATA_REC
|-- sh-allmodconfig
|   |-- kernel-trace-trace_events_filter.c:error:event_ftrace_test_filter-undeclared-(first-use-in-this-function)-did-you-mean-trace_ftrace_test_filter
|   |-- kernel-trace-trace_events_filter.c:error:field-name-not-in-record-or-union-initializer
|   |-- kernel-trace-trace_events_filter.c:error:field-rec-has-incomplete-type
|   |-- kernel-trace-trace_events_filter.c:error:passing-argument-of-create_filter-from-incompatible-pointer-type
|   `-- kernel-trace-trace_events_filter.c:note:in-expansion-of-macro-DATA_REC
|-- sparc64-allmodconfig
|   |-- kernel-trace-trace_events_filter.c:error:event_ftrace_test_filter-undeclared-(first-use-in-this-function)-did-you-mean-trace_ftrace_test_filter
|   |-- kernel-trace-trace_events_filter.c:error:field-name-not-in-record-or-union-initializer
|   |-- kernel-trace-trace_events_filter.c:error:field-rec-has-incomplete-type
|   |-- kernel-trace-trace_events_filter.c:error:passing-argument-of-create_filter-from-incompatible-pointer-type
|   `-- kernel-trace-trace_events_filter.c:note:in-expansion-of-macro-DATA_REC
|-- x86_64-allmodconfig
|   |-- kernel-trace-trace_events_filter.c:error:event_ftrace_test_filter-undeclared-(first-use-in-this-function)-did-you-mean-trace_ftrace_test_filter
|   |-- kernel-trace-trace_events_filter.c:error:field-name-not-in-record-or-union-initializer
|   |-- kernel-trace-trace_events_filter.c:error:field-rec-has-incomplete-type
|   |-- kernel-trace-trace_events_filter.c:error:passing-argument-of-create_filter-from-incompatible-pointer-type
|   |-- kernel-trace-trace_events_filter.c:note:in-expansion-of-macro-DATA_REC
|   `-- kernel-trace-trace_events_filter.c:sparse:sparse:too-many-errors
`-- x86_64-allyesconfig
    |-- kernel-trace-trace_events_filter.c:error:event_ftrace_test_filter-undeclared-(first-use-in-this-function)-did-you-mean-trace_ftrace_test_filter
    |-- kernel-trace-trace_events_filter.c:error:field-name-not-in-record-or-union-initializer
    |-- kernel-trace-trace_events_filter.c:error:field-rec-has-incomplete-type
    |-- kernel-trace-trace_events_filter.c:error:passing-argument-of-create_filter-from-incompatible-pointer-type
    `-- kernel-trace-trace_events_filter.c:note:in-expansion-of-macro-DATA_REC

I looked into this last time but couldn't wrap my head around it.

Yours,
Linus Walleij
