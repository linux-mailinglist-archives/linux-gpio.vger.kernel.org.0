Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E938600DE4
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 13:37:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbiJQLhy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 07:37:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbiJQLhx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 07:37:53 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5A1A57573
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 04:37:52 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id b2so10503390plc.7
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 04:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qvZ9x0wQ/DpJetR3lZf4wFSdEv5/JAJG6uCzeWWl6XU=;
        b=Xr00PztBYqParRB4SFKixoYVIFmGPYZthnnXI8X8iMYKoIhog/1X3ns5jZ/V9IFbOI
         VfQPKLAeXy7yGhw1+0O7yMKopARHfEkljaJjYpTIWU2X5VJKFEiCfQrQxSg2UbcbV1+3
         BhPO+B015vCbqcuQQ+vVapLDFxNxriIkYg83W8gJLRlNfJ50zus/tFsFKU6Ryf1gWYrC
         xvqJdDN+qFCmYyrRrFhwjoOLBytcKMaUDY4laXnOdDlNTgsfuwg9QmAyBjP01qR2fCtF
         3ZRsWoMuzz/q4sOUWrfDLENVTBP/yzzwaL2juUILGm+jCndw0ElNE2VP5dtWSJ7YTaP6
         Nb4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qvZ9x0wQ/DpJetR3lZf4wFSdEv5/JAJG6uCzeWWl6XU=;
        b=FXRWuNTez+daTQExECBIPv/Z3wfa7j0um1i3IhCwmiiaBawG6GJc59s9b7l5ZU0TM9
         8txsggSQpkwpCucE4Fxn9Vu3Co39mFuBnQkAJa+tCRek+Fuy5h5T8DvJxkUXW1WnYmr1
         Svn6509QN90hP9qe97GPvg9C8JhMlMLj1Ve/GgG3dPn1tpkV6jXNGsOE9pwUJ4bQ3mNy
         az0mv5ANE9+nwKpNxBYn5FBC7KbtmzHanttlss8YFLtYPwXr0ymnJO7pNk32LzP8TxdF
         W5DT6Toda4pZKn+JDDmyhipjGxHBuZ08SEyiEVjD3zWT6vC4RlYXERMOX/8iKuoTA2DU
         svFQ==
X-Gm-Message-State: ACrzQf0WqDEZ+aR3xmytsemcPqCLk3ojE+yixc6yotBUS3aGSbbYbU+g
        4/V1Vv9tIZHXTfZX99OUweBCMw==
X-Google-Smtp-Source: AMsMyM7D3D+drrEw9xrbyBgiS4lDtz2jUQTFuf+I93f7vXwDoaVsuSPDxRZTrSOrqe0qKYHD38cNGg==
X-Received: by 2002:a17:902:f64d:b0:178:a963:d400 with SMTP id m13-20020a170902f64d00b00178a963d400mr11670356plg.6.1666006672270;
        Mon, 17 Oct 2022 04:37:52 -0700 (PDT)
Received: from localhost ([122.172.86.128])
        by smtp.gmail.com with ESMTPSA id y16-20020a63e250000000b0046aff3ce339sm5984629pgj.23.2022.10.17.04.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 04:37:51 -0700 (PDT)
Date:   Mon, 17 Oct 2022 17:07:49 +0530
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
Message-ID: <20221017113749.zqvs6ul2qj4rddue@vireshk-i7>
References: <CAMRc=McHusz7kK2v-H5Ccdrj1X6M7gTj7oaMuQoyuHhDVXekYw@mail.gmail.com>
 <CANiq72mvLzoNConYzqRYYq9M9Wr6iyo28VQ7Dt0FpfFiHUwzhg@mail.gmail.com>
 <20221011041651.amibtu24kcgm67e7@vireshk-i7>
 <20221013061204.hu2vn24g42egybbl@vireshk-i7>
 <CAMRc=MfNjCARhhG1yGDKU0HYUmsHkN_MihWy-+pg+SY0T9WERg@mail.gmail.com>
 <20221014095724.ajajkp3ysdfxd2f2@vireshk-i7>
 <CAMRc=Mc5qVJfcPoVit8zgnoAPKqWY3qb1MQwtfP7FNJ53O=UjA@mail.gmail.com>
 <Y0mJC8lVM/cgBLyi@sol>
 <20221017112625.sobgfiist7t6w5zz@vireshk-i7>
 <Y009rqtA1h00ZVN5@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y009rqtA1h00ZVN5@sol>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 17-10-22, 19:34, Kent Gibson wrote:
> > +    pub fn set_prop(&mut self, props: &[SettingVal]) -> Result<()> {
>                                                                   ^   
>                                                         also &mut Self
> 
> Apart from that, yeah that is what I had in mind, as also noted in my
> forthcoming v7 review.

Ahh yes.

diff --git a/bindings/rust/libgpiod/src/line_settings.rs b/bindings/rust/libgpiod/src/line_settings.rs
index be50b5b41c5a..92e8928517f7 100644
--- a/bindings/rust/libgpiod/src/line_settings.rs
+++ b/bindings/rust/libgpiod/src/line_settings.rs
@@ -70,7 +70,7 @@ impl Settings {
     }

     /// Set line prop setting.
-    pub fn set_prop(&mut self, props: &[SettingVal]) -> Result<()> {
+    pub fn set_prop(&mut self, props: &[SettingVal]) -> Result<&mut Self> {
         for property in props {
             match property {
                 SettingVal::Direction(prop) => self.set_direction(*prop)?,
@@ -84,7 +84,7 @@ impl Settings {
             };
         }

-        Ok(())
+        Ok(self)
     }

     /// Get the line prop setting.

-- 
viresh
