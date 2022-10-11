Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FC915FABAC
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Oct 2022 06:39:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229577AbiJKEhz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Oct 2022 00:37:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbiJKEhy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Oct 2022 00:37:54 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4EDB86888
        for <linux-gpio@vger.kernel.org>; Mon, 10 Oct 2022 21:37:52 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id y1so5327706pfr.3
        for <linux-gpio@vger.kernel.org>; Mon, 10 Oct 2022 21:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JmXaT8iIFO8TkNC0UQJukjtc3NrP+5rCuiefA8yTFlo=;
        b=cArTBghVaWIXHt8GzPRoOucU4SVRZMePWiVWfL4BVzYiswboXDCdDB8lTG0Ptnu1yy
         GaUNPjHkvjB/HvPl4Rs3d7Xox5TsJ5TXHKBK936g4NV/dESHy/f60JJu1C2gqeOk/0Zf
         tUSBz829F6uc+WKiFDFducSsxmzhODGH16O9yNukVwJViSa58QVtxuFxHhjvwS4C42zy
         QGPs8h4JuA2RS6C1D/hUHQYVa/BBmmyUbyHbHQRU8rzPjpYDfgMSMj2RZOcR8u3sI1Ja
         SgxfsEQmjU+2H/yCZvBaGTYpC6oxF0xvCXI4SrS/E6TmIavDAdeDDaG4DqSkPRV0cOk6
         UCHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JmXaT8iIFO8TkNC0UQJukjtc3NrP+5rCuiefA8yTFlo=;
        b=ZguuVa+2noU25+IfT8dFMUCfjkxmX7/2EiKYXJtaRIgIzOmyjIQdhWoJM00dCy5VyR
         wRqJ5TkT/0XqDej27t+jLU73r/8LD9frplYOH8AeLZHbsJEIkrm1b6NzeeQdNfwh5rlZ
         aB7dlrKVwAwMLIUJXS/AhXqtDRgSb9w7D8vqSG2PhpuZHDn7jDyJdnSpQset7F97tGdw
         BoOfLehW3xvgecm8c5Wq71Cze098v0ynauTzwZdUwRMWj/dWxUo99Qouy8hHTXSEQzAZ
         Z1SNfvnNGHBrTBmlddIPGSafh3ik7EoBAr81e3DC7f6lbFm25LzWzYctcECNoq8aWnY5
         n+6w==
X-Gm-Message-State: ACrzQf1Oa0l6+TuxMtyYrThCLjuI/yHBeON21E4oHW217hlTUHT4RolY
        xh0poZi5VIyqEDAzkVGUEXDyyw==
X-Google-Smtp-Source: AMsMyM4vLHpf0R69ukpkBkR5+PrO9q0fkbBseHjBQeub3dDmteDjIWmr7Hy80E+BJ6KzwCee8YhGaw==
X-Received: by 2002:a63:1849:0:b0:43c:8346:57f7 with SMTP id 9-20020a631849000000b0043c834657f7mr19179058pgy.222.1665463072267;
        Mon, 10 Oct 2022 21:37:52 -0700 (PDT)
Received: from localhost ([122.172.86.128])
        by smtp.gmail.com with ESMTPSA id w187-20020a6282c4000000b00562a526cd2esm7743578pfd.55.2022.10.10.21.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 21:37:51 -0700 (PDT)
Date:   Tue, 11 Oct 2022 10:07:49 +0530
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
Message-ID: <20221011043749.ecbcwgxub6zs5s5n@vireshk-i7>
References: <CAMRc=Md4AmweW-p0f+RfwzOH0S3zPhK-60+di8BzSp6oVHvcYA@mail.gmail.com>
 <CAKohpomwhkKL9_mhmvH1C1WmHG50M5tL-Gy25Y2gVsbBuWGdiw@mail.gmail.com>
 <CAMRc=MebN1VwSzGtdGcYAeiN45D-e59oi6in-n7JYKqyqcum1Q@mail.gmail.com>
 <20220928111043.bs2ihopdxduavcsq@vireshk-i7>
 <CAMRc=MfA7SYS2FWZ+HHmqjTe=0EtedncJ5fRLB9CT4NiR0U8SA@mail.gmail.com>
 <20220928151716.3hhbcrjwskvwvajh@vireshk-i7>
 <CAMRc=McHusz7kK2v-H5Ccdrj1X6M7gTj7oaMuQoyuHhDVXekYw@mail.gmail.com>
 <CANiq72mvLzoNConYzqRYYq9M9Wr6iyo28VQ7Dt0FpfFiHUwzhg@mail.gmail.com>
 <20221011041651.amibtu24kcgm67e7@vireshk-i7>
 <Y0TwJkzFNioQxwsi@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y0TwJkzFNioQxwsi@sol>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 11-10-22, 12:25, Kent Gibson wrote:
> On Tue, Oct 11, 2022 at 09:46:51AM +0530, Viresh Kumar wrote:
> > On 29-09-22, 15:55, Miguel Ojeda wrote:
> > > It looks like a container whose elements get invalidated, so
> > > `read_edge_event` could require an exclusive reference to `buffer` in
> > > Rust, that way you cannot keep borrows to its elements like `ev` if
> > > you want to call it. But of course this requires tying the lifetime of
> > > the events to that of the buffer.
> > 
> > What about the below code changes on top of V6 ?
> > 
> 
> Can you clone the event to detach it from the buffer?

I thought we can always do:

event.event_clone() to get a copy, which won't have a reference to the
Buffer. This is how it is defined:

    pub fn event_clone(&self) -> Result<Self> {
        let event = unsafe { gpiod::gpiod_edge_event_copy(self.event) };
        if event.is_null() {
            return Err(Error::OperationFailed(
                OperationType::EdgeEventCopy,
                Errno::last(),
            ));
        }

        Ok(Self {
            buffer: None,
            event,
        })
    }

But when I try to do this in the earlier example:

@@ -40,10 +40,12 @@ fn main() -> Result<()> {
         let event1 = buffer.event(1)?;

         println!("{:?}", (event0.line_offset(), event1.line_offset()));
+        let event0_copy = event0.event_clone()?;
         drop(event0);
         // This fails to compile
         // request.read_edge_events(&mut buffer)?;
         drop(event1);
         request.read_edge_events(&mut buffer)?;
+        drop(event0_copy);
     }
 }

compilation fails :(

error[E0502]: cannot borrow `buffer` as mutable because it is also borrowed as immutable
  --> libgpiod/examples/gpiobufferevent.rs:48:34
   |
39 |         let event0 = buffer.event(0)?;
   |                      --------------- immutable borrow occurs here
...
48 |         request.read_edge_events(&mut buffer)?;
   |                                  ^^^^^^^^^^^ mutable borrow occurs here
49 |         drop(event0_copy);
   |              ----------- immutable borrow later used here


And I am not sure why, as the reference isn't used anymore in this
case to the event0.

-- 
viresh
