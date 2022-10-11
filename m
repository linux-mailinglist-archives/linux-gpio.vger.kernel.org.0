Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 690AD5FABBB
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Oct 2022 06:46:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229490AbiJKEqv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Oct 2022 00:46:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiJKEqu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Oct 2022 00:46:50 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C22137A77B
        for <linux-gpio@vger.kernel.org>; Mon, 10 Oct 2022 21:46:49 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id h12so5750994pjk.0
        for <linux-gpio@vger.kernel.org>; Mon, 10 Oct 2022 21:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GpxyS14bKMN40MXz5HxgXNBQ/SpLyLH20XKlcMmfE+c=;
        b=Y10ICPVB4zne8pPn+Jc61r7Rd8pDE7ecbAMmdUQxaOoaGZ6osEOvl7M80VNDfOkSw5
         FtWKwFdzeLQHuU08qDsCRqL+aom15fEMSt/rVGn0QzxhI1NiJ0PzU7P0Mj1FnX4049HE
         vMoCqVUfSBBLaYzXvq2et8zG6UnRP0eYr+TmTbv8AlzNWQH84zEL1JdWZPEikOZ5mHPh
         jjPwbUrBDPK916SZZF8ZlSUOTgG9/ubv03rwm+1AHOm/TUWPMTRMCh5Uw/hV4+zxl7Yc
         9iDLKZPSnQwFqW1VdyvVGeX2PyTqYhu8mHNHXBuOxcEnMKKvYAlJLgGeJAg1062qie0B
         MYvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GpxyS14bKMN40MXz5HxgXNBQ/SpLyLH20XKlcMmfE+c=;
        b=4ouw7Py4l4cPDzujx1UcEa48hXkMJLViRH7fliVsF3mXO0osGcxcfUD+R2ykEpPX6y
         +JuNtO1N2nus2ZPrREx2AsQFj6J9xZjzlrgTwZnTb66dGpkZIq2ALxLTw8+Hsx6wtydr
         TinCMaKngeZC9Kx+zhTP31Z3G5P90Pz3xRF062CxHrnv8Lxjy4Ztzq9kdtHqZN+I4dOm
         xjMS25Kx57QTWnMAbdqhrk4yS/DKbIIaQEHIJydpgjElm1WS4Rny6dYwvxqg9k1FP6t1
         Kh35Tdnh9nbEtwebXhVzotEgs9yV8um6eiXqfdvqulq0Em1sxCQcz6QKSD8XRjquT43Q
         IHtw==
X-Gm-Message-State: ACrzQf09JLtTu2cJw7dHbYMGlLh62+wHk6t/IpRapVzaAg+7a5fERQ/f
        H61TYzurhXENy1ZaPzTePg2o9YWaKae5HA==
X-Google-Smtp-Source: AMsMyM5Rgk2Fh3qZGNUccYSB1HzJZeME7MMxjvHbBU5IXne5j7Ys42JXLU0noPnEq+kiTtkkspXIEQ==
X-Received: by 2002:a17:90b:4b46:b0:20a:e906:426d with SMTP id mi6-20020a17090b4b4600b0020ae906426dmr25393225pjb.48.1665463609235;
        Mon, 10 Oct 2022 21:46:49 -0700 (PDT)
Received: from localhost ([122.172.86.128])
        by smtp.gmail.com with ESMTPSA id h3-20020a170902f7c300b0017691eb7e17sm7484931plw.239.2022.10.10.21.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 21:46:48 -0700 (PDT)
Date:   Tue, 11 Oct 2022 10:16:46 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Subject: Re: [PATCH V6 3/8] libgpiod: Add rust wrapper crate
Message-ID: <20221011044646.umilituvdyex3bgm@vireshk-i7>
References: <CAKohpomwhkKL9_mhmvH1C1WmHG50M5tL-Gy25Y2gVsbBuWGdiw@mail.gmail.com>
 <CAMRc=MebN1VwSzGtdGcYAeiN45D-e59oi6in-n7JYKqyqcum1Q@mail.gmail.com>
 <20220928111043.bs2ihopdxduavcsq@vireshk-i7>
 <CAMRc=MfA7SYS2FWZ+HHmqjTe=0EtedncJ5fRLB9CT4NiR0U8SA@mail.gmail.com>
 <20220928151716.3hhbcrjwskvwvajh@vireshk-i7>
 <CAMRc=McHusz7kK2v-H5Ccdrj1X6M7gTj7oaMuQoyuHhDVXekYw@mail.gmail.com>
 <CANiq72mvLzoNConYzqRYYq9M9Wr6iyo28VQ7Dt0FpfFiHUwzhg@mail.gmail.com>
 <20221011041651.amibtu24kcgm67e7@vireshk-i7>
 <Y0TwJkzFNioQxwsi@sol>
 <20221011043749.ecbcwgxub6zs5s5n@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221011043749.ecbcwgxub6zs5s5n@vireshk-i7>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 11-10-22, 10:07, Viresh Kumar wrote:
> And I am not sure why, as the reference isn't used anymore in this
> case to the event0.

This works though:

diff --git a/bindings/rust/libgpiod/examples/gpiobufferevent.rs b/bindings/rust/libgpiod/examples/gpiobufferevent.rs
index 613a800584e3..e16a1a39b22c 100644
--- a/bindings/rust/libgpiod/examples/gpiobufferevent.rs
+++ b/bindings/rust/libgpiod/examples/gpiobufferevent.rs
@@ -40,10 +40,12 @@ fn main() -> Result<()> {
         let event1 = buffer.event(1)?;

         println!("{:?}", (event0.line_offset(), event1.line_offset()));
+        let event0_copy = edge::Event::event_clone(&event0)?;
         drop(event0);
         // This fails to compile
         // request.read_edge_events(&mut buffer)?;
         drop(event1);
         request.read_edge_events(&mut buffer)?;
+        drop(event0_copy);
     }
 }
diff --git a/bindings/rust/libgpiod/src/edge_event.rs b/bindings/rust/libgpiod/src/edge_event.rs
index f5426459d779..12c0fd73f778 100644
--- a/bindings/rust/libgpiod/src/edge_event.rs
+++ b/bindings/rust/libgpiod/src/edge_event.rs
@@ -43,8 +43,8 @@ impl<'b> Event<'b> {
         })
     }

-    pub fn event_clone(&self) -> Result<Self> {
-        let event = unsafe { gpiod::gpiod_edge_event_copy(self.event) };
+    pub fn event_clone(event: &Event) -> Result<Self> {
+        let event = unsafe { gpiod::gpiod_edge_event_copy(event.event) };
         if event.is_null() {
             return Err(Error::OperationFailed(
                 OperationType::EdgeEventCopy,


-- 
viresh
