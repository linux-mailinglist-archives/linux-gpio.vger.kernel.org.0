Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EF0866B934
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jan 2023 09:42:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232334AbjAPImm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Jan 2023 03:42:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232000AbjAPIml (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Jan 2023 03:42:41 -0500
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com [IPv6:2607:f8b0:4864:20::a2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5D201206D
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 00:42:40 -0800 (PST)
Received: by mail-vk1-xa2d.google.com with SMTP id w72so13010054vkw.7
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 00:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wrP8AerW0/JKhEqpAc/o/aaC+p4bm/uGqCruKrRcrv8=;
        b=g86VohdszuLJXOtD//dt9LzWoF4+xe0NRkopE9XtMBdqHtFsoF1GsQWLTpNURggLez
         O983w+rjPugrJmlKije8zP1kyyZ8OAW14frGpUE68wNpEFGNhzgC1EEpjREgXBRu3Nzm
         5W1CfQO+HBxoQ/Iv9jbQaHMe0ODYZEAONEdB1Sj/PB4+9CZOBTeBe5h0whWVezW7l0pO
         eJZ7P0qK28PYfuOhl9+1od07STAOkW168xT7d+5zHhzHRTj6KpcF5EMFM+861RsaWD/o
         Z4ejrcU4qBA/ZrcD1oPK1eIKesgSXqpHPXJspLyfRLmW08WT7Q1evfgkdS6Khifdrlg6
         EY1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wrP8AerW0/JKhEqpAc/o/aaC+p4bm/uGqCruKrRcrv8=;
        b=QGg1S3aYhp+9dcXdvk7+FFUYt6iIpKkYxA5Gh1v9vrxSU1AtJmLi31Xz5R7LuIChWO
         8sVMS0TxVwCG6qc48d0qq9HEKVMN8Kw8aefbRStVzVdxR5C4DSfNoDGRbdDhl8BsPWv7
         dY5yNJQqwdK5SnhQC9SMmFBRpy8YVxHt1BSYt0cxJAUncde5ujnLO66EcwJbCTN3AP7y
         XKeeTkRlupAWJ6pvimajjaHtfzl/yYI9a9xhvu4EOVVCBjTvTaHzs+8nHapEKFIflAXB
         fycbbcTYR4Ximusdjyx4DVIAAXRUscVZhQj8mDr0OBeGXeg8GATXRHOG6cJanBwlw8uJ
         4rdg==
X-Gm-Message-State: AFqh2korFHjJAnyAGUAAXQ2UsRKLOl01o153G0/Cozr9WoBrnU90ZVaE
        bvX/iog5GZN2S1IPLFqoYkOFfQhWoyVBatNbkM3a5A==
X-Google-Smtp-Source: AMrXdXsvvPO+UBgDRWVi+dAiWJfBl3QYIfdEgOKvt/WM/NZrW7wicGAQUujOlEVVB0TNfg55xFRh97XNtSMh/wHeFgA=
X-Received: by 2002:a1f:c684:0:b0:3db:104:6d13 with SMTP id
 w126-20020a1fc684000000b003db01046d13mr2187892vkf.25.1673858559653; Mon, 16
 Jan 2023 00:42:39 -0800 (PST)
MIME-Version: 1.0
References: <20230113215210.616812-1-brgl@bgdev.pl> <20230113215210.616812-16-brgl@bgdev.pl>
 <20230116060250.c6i6ouu2ojutubcd@vireshk-i7>
In-Reply-To: <20230116060250.c6i6ouu2ojutubcd@vireshk-i7>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 16 Jan 2023 09:42:28 +0100
Message-ID: <CAMRc=MdX+SbN65m2jkZqJOYKobGgi=H0jCVyqcHCPo56152fMA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 15/16] bindings: rust: make mutators return &mut self
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 16, 2023 at 7:02 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 13-01-23, 22:52, Bartosz Golaszewski wrote:
> > diff --git a/bindings/rust/libgpiod/tests/line_request.rs b/bindings/rust/libgpiod/tests/line_request.rs
> > index c3fc37b..561f4e8 100644
> > --- a/bindings/rust/libgpiod/tests/line_request.rs
> > +++ b/bindings/rust/libgpiod/tests/line_request.rs
> > @@ -97,13 +97,11 @@ mod line_request {
> >              config.lconfig_add_settings(&offsets);
> >              config.request_lines().unwrap();
> >
> > -            let request = config.request();
> > -
>
> Why remove this ? And open-code it ?
>

Because I'm a Rust noob and couldn't figure out how to deal with the
mutable/non-mutable borrow vomit that ensued when I kept the local
variable. If you could improve upon this one, it would be great!

Bart
