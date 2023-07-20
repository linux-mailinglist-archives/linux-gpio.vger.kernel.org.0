Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73D7775A8CF
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jul 2023 10:11:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230290AbjGTILG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Jul 2023 04:11:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230247AbjGTILE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Jul 2023 04:11:04 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8C29271D
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2023 01:10:42 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3fbf1b82d9cso3651045e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2023 01:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689840641; x=1690445441;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WN8uoQU0RzkfTnA8xg1xHLz5SFxQatZP5zYD6zcr3yo=;
        b=G9ktw7WHw1GquR+B21+iObD3YH5ok0+4Jx3zwauFxzGt4ayZpeaKFFOsgTolJ7A0q+
         1KP2uwg9Ja4eVdU61mJxaV1so92b+8y8HNQbiuj0X2+QSmKWiOwJKnIe/6M7yE1r7Aez
         hUTme3O6c+CMke1VxvdsQ054hxbcGWrDoP30nBPact1JnQMPHxuCXtc9q2IrSYiN8E1J
         IP8TutKnKlO9jfq5JdINvTe7+ANbn7ylkunaADzBKftkQmxqOgzHWn0FXEks+ZVYm9yp
         M5N7CnlmU4oDUFTMt+FN3znH8n04+/umOP7qYDRNKpIQ1x46M9N6G/VWJ2lHwr3tpeQg
         6hBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689840641; x=1690445441;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WN8uoQU0RzkfTnA8xg1xHLz5SFxQatZP5zYD6zcr3yo=;
        b=icHuqnEU92jPVfpO5VJ/728tnkKCV9ITj/rnBcit/bv0H7K1wbPLzR7X9T43rprq+k
         FeRQqIqq1tv0laBhr8nW14rFIWy9gxjwFjlNCuFdvSkrGV74C7U2bqIAAH9TXMTB3FmP
         npLlvHQ/9bPRfKXiyVGvbJlQxBkZ9Y+8SceW7+PRWn5fx0TMh7DmjI6w8gV4SwbmbWeR
         QJCh60Aq4btNmJlTh9/TpSjdpHKAsVFec+UZ0usRuYiXRgu4W5kqLfkJMLMOvXDpLHLQ
         aoNhu0U665fS5irArILM2HvvfWQ7dd78cfX45rLYpKz3pTQeVggWOyc5m7OT5/riJ2mM
         9CbA==
X-Gm-Message-State: ABy/qLaHX84G1APNGz8TWeQ1yZk4Icy+wdMQFkeUZSqgfXB8ldNzZ6Rj
        YjYzM9JMzFQMH2CVO75kAxWGFQ==
X-Google-Smtp-Source: APBJJlFz13FgX5oCqnvabFXGrnWBMCaXbGNTTtWZ3Cakrftael0+9xBONU18QgOAhr/uQZQO4NQPOw==
X-Received: by 2002:a7b:cbda:0:b0:3fb:ad5d:9568 with SMTP id n26-20020a7bcbda000000b003fbad5d9568mr3693733wmi.38.1689840641093;
        Thu, 20 Jul 2023 01:10:41 -0700 (PDT)
Received: from localhost (i5C7438C1.versanet.de. [92.116.56.193])
        by smtp.gmail.com with ESMTPSA id v5-20020adfebc5000000b0031417b0d338sm539101wrn.87.2023.07.20.01.10.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 01:10:40 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Thu, 20 Jul 2023 10:10:40 +0200
Message-Id: <CU6UIH1XJDVM.TS19DX8K0RHQ@fedora>
Subject: Re: [libgpiod][PATCH 5/5] bindings: rust: provide
 LineRequest::chip_path()
Cc:     <linux-gpio@vger.kernel.org>,
        "Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>,
        "Kent Gibson" <warthog618@gmail.com>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
        "Viresh Kumar" <viresh.kumar@linaro.org>
To:     "Bartosz Golaszewski" <brgl@bgdev.pl>
From:   "Erik Schilling" <erik.schilling@linaro.org>
X-Mailer: aerc 0.14.0
References: <20230719192057.172560-1-brgl@bgdev.pl>
 <20230719192057.172560-6-brgl@bgdev.pl> <CU6QJJUDI5D7.2GPPMGLBM6C83@fedora>
 <CAMRc=McrhxwASt8WJ0dOrEa1NPnhtOVkNBXuiK1ejiS5P37JgA@mail.gmail.com>
In-Reply-To: <CAMRc=McrhxwASt8WJ0dOrEa1NPnhtOVkNBXuiK1ejiS5P37JgA@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu Jul 20, 2023 at 10:04 AM CEST, Bartosz Golaszewski wrote:
> On Thu, Jul 20, 2023 at 7:04=E2=80=AFAM Erik Schilling
> <erik.schilling@linaro.org> wrote:
> >
> > On Wed Jul 19, 2023 at 9:20 PM CEST, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > Provide a wrapper around gpiod_line_request_get_chip_path() for Rust
> > > bindings and add a test-case.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > ---
> > [...]
> > > diff --git a/bindings/rust/libgpiod/src/line_request.rs b/bindings/ru=
st/libgpiod/src/line_request.rs
> > > index 1140aa9..2caab14 100644
> > > --- a/bindings/rust/libgpiod/src/line_request.rs
> > > +++ b/bindings/rust/libgpiod/src/line_request.rs
> > [...]
> > > @@ -25,6 +26,17 @@ impl Request {
> > >          Ok(Self { request })
> > >      }
> > >
> > > +    pub fn chip_path(&self) -> Result<&str> {
[...]
> > More importantly, _if_ this function is returning a file path, then I
> > would consider to return a Path [1]. The conversion from &str -> Path i=
s
> > "0-cost" and makes the API more explicit. `Sim::dev_path()` also return=
s
> > a PathBuf so the conversion in the test would become a little easier.
> >
>
> I wanted to stay in line with chip's path() getter which also returns
> Result<&str>. As you're saying - the user can convert it at 0 cost if
> needed.

Makes sense. Did not notice that it is used as &str elsewhere.

- Erik
