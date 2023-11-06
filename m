Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAA877E2736
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Nov 2023 15:41:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231764AbjKFOlj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Nov 2023 09:41:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231630AbjKFOli (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Nov 2023 09:41:38 -0500
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 919391BF
        for <linux-gpio@vger.kernel.org>; Mon,  6 Nov 2023 06:41:32 -0800 (PST)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-1e9c42fc0c9so1807515fac.1
        for <linux-gpio@vger.kernel.org>; Mon, 06 Nov 2023 06:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gadgetoid.com; s=google; t=1699281691; x=1699886491; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ONHgW+741nsB2b4NwNlv0XwzQZ6wvbIOmz/sVr4MrMg=;
        b=fbBtqEo676tMLfi09gmKI3NyykJcm3l5i1rZZSxz01h9Ex9ZTgOErDZL2IE4G9DWo+
         lF2Jeg/Jk3mzh197ysrdNoqBzqlwTAmsyTWKjqKvxOscgSvLSgvNZsXVvjF31vqukXAk
         UVdOECGZHTCwfLwvgQcpV9D1zUmP5af+/x2D++SobEYpahkI40hFgX7qoCVa45mRgcCg
         88Sf+7PCrUWcFh3wZfUWHSMwhMaS7KEBhi6Y9ZArVe9BzLOFRH04XDlnm1ZIQyjf8Q36
         Vg1LfrfHSJp7U/gfCzrm0QVNkb5TLqYGtRiR0awYIYBmpZXmKfEDIWng4qJL7OdxwO1/
         IdRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699281691; x=1699886491;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ONHgW+741nsB2b4NwNlv0XwzQZ6wvbIOmz/sVr4MrMg=;
        b=LfwUYpPYb/Uue0bQlEuSk0WLDCiOZKFBMlE6084dLvIJgYxMYxmjjcjh0uRFYWnH/o
         qzssvv35DhUzVzK76j2BJ2HQHmS1CF8qnmxu92DQZ0tIBrWz9t7914oHxKoyQYGphLAl
         UYjEziXHQKpi2/IoXFHJF75hmeKdtn/bkgJQXehylk520pP2bHuT64vwfeB2XthZnYN/
         z0dzC/ePsjDjBquQ/DI0kuiGTYTmIehhCsrMWUDsAc0RlB6lInWDFbEpNLe/NhvCX7/R
         Kt3L1G2rqWu5oIVMwU7MWsVTAKA/tYKumhkyVT1pSPQjVd0UITL1vNbgjD+pFHRXs++s
         shWQ==
X-Gm-Message-State: AOJu0YwlGa9hWoiCAdttK9fYvWxI4LlSOA+KpEAgdyAjOmjZD7iLMHqP
        4dhQQOtxrpbUxvZrDNZ9QphbVCaSiMKh2jZnYzNZaQ==
X-Google-Smtp-Source: AGHT+IE7bEiSZAemwiIz66wjta7J3NuBYCJ33YMkOlFBtOOGhYimBCLs8iOUEFxNiwKNpIN+oIk3/P/gFt34mKNNh3g=
X-Received: by 2002:a05:6871:3410:b0:1e9:b879:a8e0 with SMTP id
 nh16-20020a056871341000b001e9b879a8e0mr29245952oac.16.1699281690764; Mon, 06
 Nov 2023 06:41:30 -0800 (PST)
MIME-Version: 1.0
References: <20231103191455.2441883-1-phil@gadgetoid.com> <CWRQXOJ5TFLJ.1NYFSAPXR0HCY@ablu-work>
In-Reply-To: <CWRQXOJ5TFLJ.1NYFSAPXR0HCY@ablu-work>
From:   Phil Howard <phil@gadgetoid.com>
Date:   Mon, 6 Nov 2023 14:41:19 +0000
Message-ID: <CA+kSVo8NPmeGRSn0rwckfeV+R5JLnhN8b6V_pX4K2HWweydAdQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] bindings: python: fix README.md SPDX license tags
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 6 Nov 2023 at 13:00, Erik Schilling <erik.schilling@linaro.org> wrote:
>
> On Fri Nov 3, 2023 at 8:14 PM CET, Phil Howard wrote:
> > Replace the # (which is a markdown heading) with HTML tags to hide SPDX
> > identifier tags within the project description on pypi.
> >
> > Signed-off-by: Phil Howard <phil@gadgetoid.com>
> > ---
> >  bindings/python/README.md | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/bindings/python/README.md b/bindings/python/README.md
> > index abb69da..325c63d 100644
> > --- a/bindings/python/README.md
> > +++ b/bindings/python/README.md
> > @@ -1,5 +1,5 @@
> > -# SPDX-License-Identifier: CC-BY-SA-4.0
> > -# SPDX-FileCopyrightText: 2023 Phil Howard <phil@gadgetoid.com>
> > +<!-- SPDX-License-Identifier: CC-BY-SA-4.0 -->
> > +<!-- SPDX-FileCopyrightText: 2023 Phil Howard <phil@gadgetoid.com> -->
>
> I went with a single block when I fixed this for the Rust bindings [1].
> But I got no opinion on which way is better. I guess as long as the
> tools work it should be fine.

Might be worth doing this for consistency. Also I think I noticed
while prepping another
patch that checkpatch.pl was detecting the "-->" on a line as part of
the SPDX info.

(Glad I'm not the only one to be caught out by this)

>
> Acked-by: Erik Schilling <erik.schilling@linaro.org>
>
> [1]:
>   commit fd25c0ea05fec3997f44d986b2fb904ba029e812
>   Author: Erik Schilling <erik.schilling@linaro.org>
>   Date:   Fri May 26 17:27:32 2023 +0200
>
>       rust: bindings: turn SPDX tags into comments
>
>       In markdown `# Foo` generates a top-level heading. This leads to to some
>       weird, huge SPDX tags being rendered before the start of the actual
>       content.
>
>       Lacking good examples, I just took the syntax that `reuse addheader`[1]
>       outputs.
>
>       [1] https://github.com/fsfe/reuse-tool
>
>       Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
>       Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
>       Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>


-- 
Phil
