Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA70566BAB2
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jan 2023 10:42:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232118AbjAPJmd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Jan 2023 04:42:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232098AbjAPJmA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Jan 2023 04:42:00 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E69059EB
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 01:41:01 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id 20so15110622pfu.13
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 01:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vbnYUYLNC5TZHJuFgPikLTSgaJavOhNAGnGaVdBkyIg=;
        b=r4Tb0nZ1VbNYnCbH32ysOCjQkB5U2Vo6V9RXBwlr+MMKpUCBG5XF0QGzEMRAVPWe7o
         CshYO94Rn6cra6pguyv6MKVAWBz+vF2VQn6gUy1ORGsQrVJXxos+agFIcbtfvQjU4uec
         88uv5eaXUxUemU2YWe4hyAjmRtln0mkghEWW69h70HQuIl7WkE4TWjsdpzH/XNOcl+6z
         qhG7XhEVyBYgXHPi8jCpKi2Z/yc0aLGghGsuYO+KzUrtG2xg84rsxtgbgnIWYGDvngd6
         NiK5t1TVLpVbdcvwqGeg3QxA2Ca7umoAFJp+FtrMcbd3YTyi6xTh4UfNHJFGoDDqi9RT
         gZ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vbnYUYLNC5TZHJuFgPikLTSgaJavOhNAGnGaVdBkyIg=;
        b=ApEdepRUWqEZoiwHvvnyj2J9NGVo3Pte5HIOapNUe1Mo7MRKU5GaVppTUPQfruVg/5
         BeVev4HvoeO3PrzkBfu5Fl8SXoePXqtdWQOy5/2KkDS0wNlcg2XqcRajrNv4wX1kosC4
         IRnDJt0jFCPQHOQUQz8Qv7iXG5QmjCT2AHBoJhae14tppiX/Ws/FjRan8sPhhJgtKtao
         4EPKfcufhXQk2dfKfYzyq/IjUu5IfqUS4L/7xSNdF7SYm0soMt+Wz1+y1MVpwKDdm0UW
         Kdf7AxC4Pq5Q+8enT+qJhBuCPIQo98NPEm96dX2XtKToMen7qfqodDfO709/kS03lCU8
         fDXA==
X-Gm-Message-State: AFqh2kqVp45XhIKgicjxOkEYr0ozqMIYIPwx3exFdzo9USBupmWM+Ai3
        YhuaeKY7z8qSr0QUBhPztLBXHg==
X-Google-Smtp-Source: AMrXdXteBdXVno4chKDcyhBwHuYfC70B8tXzNiram3xyPi06o28Vvdz6wsk2fTmeEPZ6mEaHex6Dlg==
X-Received: by 2002:a05:6a00:301c:b0:58d:924e:e5de with SMTP id ay28-20020a056a00301c00b0058d924ee5demr6146388pfb.11.1673862060630;
        Mon, 16 Jan 2023 01:41:00 -0800 (PST)
Received: from localhost ([122.172.81.45])
        by smtp.gmail.com with ESMTPSA id x11-20020aa78f0b000000b00575fbe1cf2esm3491426pfr.109.2023.01.16.01.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 01:41:00 -0800 (PST)
Date:   Mon, 16 Jan 2023 15:10:58 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH 15/16] bindings: rust: make mutators return
 &mut self
Message-ID: <20230116094058.7m3d4pdy7llnk7my@vireshk-i7>
References: <20230113215210.616812-1-brgl@bgdev.pl>
 <20230113215210.616812-16-brgl@bgdev.pl>
 <20230116060250.c6i6ouu2ojutubcd@vireshk-i7>
 <CAMRc=MdX+SbN65m2jkZqJOYKobGgi=H0jCVyqcHCPo56152fMA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MdX+SbN65m2jkZqJOYKobGgi=H0jCVyqcHCPo56152fMA@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 16-01-23, 09:42, Bartosz Golaszewski wrote:
> On Mon, Jan 16, 2023 at 7:02 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > On 13-01-23, 22:52, Bartosz Golaszewski wrote:
> > > diff --git a/bindings/rust/libgpiod/tests/line_request.rs b/bindings/rust/libgpiod/tests/line_request.rs
> > > index c3fc37b..561f4e8 100644
> > > --- a/bindings/rust/libgpiod/tests/line_request.rs
> > > +++ b/bindings/rust/libgpiod/tests/line_request.rs
> > > @@ -97,13 +97,11 @@ mod line_request {
> > >              config.lconfig_add_settings(&offsets);
> > >              config.request_lines().unwrap();
> > >
> > > -            let request = config.request();
> > > -
> >
> > Why remove this ? And open-code it ?
> >
> 
> Because I'm a Rust noob and couldn't figure out how to deal with the
> mutable/non-mutable borrow vomit that ensued when I kept the local
> variable. If you could improve upon this one, it would be great!

From what I can understand, config.request() returns a mutable
reference and you don't need a mutable variable to keep it, since the
variable doesn't need to store another reference later. Just moving
back to original code should work here.

diff --git a/bindings/rust/libgpiod/tests/line_request.rs b/bindings/rust/libgpiod/tests/line_request.rs
index 561f4e80d189..5644292d486a 100644
--- a/bindings/rust/libgpiod/tests/line_request.rs
+++ b/bindings/rust/libgpiod/tests/line_request.rs
@@ -97,11 +97,13 @@ mod line_request {
             config.lconfig_add_settings(&offsets);
             config.request_lines().unwrap();

+            let request = config.request();
+
             // Single values read properly
-            assert_eq!(config.request().value(7).unwrap(), Value::Active);
+            assert_eq!(request.value(7).unwrap(), Value::Active);

             // Values read properly
-            let map = config.request().values().unwrap();
+            let map = request.values().unwrap();
             for i in 0..offsets.len() {
                 assert_eq!(
                     *map.get(offsets[i].into()).unwrap(),
@@ -113,7 +115,7 @@ mod line_request {
             }

             // Subset of values read properly
-            let map = config.request().values_subset(&[2, 0, 6]).unwrap();
+            let map = request.values_subset(&[2, 0, 6]).unwrap();
             assert_eq!(*map.get(2).unwrap(), Value::InActive);
             assert_eq!(*map.get(0).unwrap(), Value::InActive);
             assert_eq!(*map.get(6).unwrap(), Value::Active);
@@ -123,8 +125,8 @@ mod line_request {
             lsettings.set_active_low(true);
             let mut lconfig = line::Config::new().unwrap();
             lconfig.add_line_settings(&offsets, lsettings).unwrap();
-            config.request().reconfigure_lines(&lconfig).unwrap();
-            assert_eq!(config.request().value(7).unwrap(), Value::InActive);
+            request.reconfigure_lines(&lconfig).unwrap();
+            assert_eq!(request.value(7).unwrap(), Value::InActive);
         }

         #[test]

-- 
viresh
