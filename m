Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75D847B6543
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Oct 2023 11:17:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239513AbjJCJRq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Oct 2023 05:17:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231509AbjJCJRp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Oct 2023 05:17:45 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 489B090
        for <linux-gpio@vger.kernel.org>; Tue,  3 Oct 2023 02:17:41 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-534659061afso1024297a12.3
        for <linux-gpio@vger.kernel.org>; Tue, 03 Oct 2023 02:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696324660; x=1696929460; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ej9CYZVeUojJdrHALws4klkgC42W4yLx+nv2R/kCTck=;
        b=ifBQFEt9EMrufvU9TJtXg0Yfu/gw61cmIsPTO92oYpo3D/iHHwbRLmTzBqRR+N1OXA
         QapFHJkML8G7nuWDMJv4dwPz4G+CvDDFYe+YO3FaCQuNKj/r6JOh5O5cj40vFIlWlz/G
         nCX6Bm9NyUIuU+pOpszMqjiMOwQ9noaffda1yyklPDIYU0wXTlLmo5kU1q/m44L6SMRb
         kXoehdGHTGFqtjlsSoLO8yg3eFpBfqO2ReqHhfArYqhb5JkWN0saDjzkQd6RAVIULypf
         aqkpNYOCQYSLHEJp6dc2vc5/GN6Pi2NIlfc1UlsFl25gDrcvoiK0SWWZhOBxS00DlmV6
         84hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696324660; x=1696929460;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ej9CYZVeUojJdrHALws4klkgC42W4yLx+nv2R/kCTck=;
        b=LdfAHwGXkefqg9ujCRQrUBtxREo3JZHbYx+sVQPwDUJQnhYLIJkX3W8275bnYlQtay
         cRnDAptMNgQDqWLQkbqUJGlvD3NoEQ7Nh01fpZIF18xT01PBgLMp1sHgLoVVnXtwhx4P
         XaOAr1N3SiEXHT7KWWAMnl5xytgdbbhsym951Hu0oOw76v51hDIdP09hz6BJImgvKfHC
         qGtfnIYB0Ebak8xMnVWE6U4fWVXPGMSSt0+cvi4OWFaqmV2pmt4SPn0yeF6XRl2eIH1m
         fDtCQUNpcQhYTZtc22pD/9TfXkunzWjScG8ktT9x7M9OSb464EzsJNzWGRwNpjP3pzLX
         /EWg==
X-Gm-Message-State: AOJu0Yw+DkegsEijt72sdtia7NeqVyWv4s5ButhX3SPgP+zNR19TTeCA
        RrnpLOqmvSxaRazId3IAKuMYng==
X-Google-Smtp-Source: AGHT+IFUd35fJXoyOyP/G610/ibRlCBZMzjn0dBC8V1V7xkWfwZu8rUOZL59Bgr6wJcQmlda1irP4Q==
X-Received: by 2002:aa7:cd70:0:b0:525:bbc0:2a8c with SMTP id ca16-20020aa7cd70000000b00525bbc02a8cmr10972139edb.33.1696324659683;
        Tue, 03 Oct 2023 02:17:39 -0700 (PDT)
Received: from localhost (i5C743835.versanet.de. [92.116.56.53])
        by smtp.gmail.com with ESMTPSA id v18-20020a056402185200b00534c65fd0ebsm536979edy.90.2023.10.03.02.17.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Oct 2023 02:17:39 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Tue, 03 Oct 2023 11:17:38 +0200
Message-Id: <CVYOWM37OR3Y.3K4VIOR9A0DPG@ablu-work>
Subject: Re: [libgpiod][PATCH v2 1/3] bindings: rust: fix soundness of
 line_info modeling
Cc:     "Linux-GPIO" <linux-gpio@vger.kernel.org>,
        "Manos Pitsidianakis" <manos.pitsidianakis@linaro.org>,
        "Kent Gibson" <warthog618@gmail.com>
To:     "Viresh Kumar" <viresh.kumar@linaro.org>
From:   "Erik Schilling" <erik.schilling@linaro.org>
X-Mailer: aerc 0.15.2
References: <20230929-rust-line-info-soundness-v2-0-9782b7f20f26@linaro.org>
 <20230929-rust-line-info-soundness-v2-1-9782b7f20f26@linaro.org>
 <20231003085845.5ldq3ghwez3impyx@vireshk-i7>
In-Reply-To: <20231003085845.5ldq3ghwez3impyx@vireshk-i7>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue Oct 3, 2023 at 10:58 AM CEST, Viresh Kumar wrote:
> On 29-09-23, 15:18, Erik Schilling wrote:
> > diff --git a/bindings/rust/libgpiod/src/chip.rs b/bindings/rust/libgpio=
d/src/chip.rs
> > index 81e1be6..9ef8f22 100644
> > --- a/bindings/rust/libgpiod/src/chip.rs
> > +++ b/bindings/rust/libgpiod/src/chip.rs
> > @@ -107,7 +107,9 @@ impl Chip {
> >              ));
> >          }
> > =20
> > -        line::Info::new(info)
> > +        // SAFETY: We verified that the pointer is valid. We own the p=
ointer and
> > +        // no longer use it after converting it into a Info instance.
> > +        Ok(unsafe { line::Info::from_raw_owned(info) })
>
> Hmm, I was expecting the naming to be simplified in this version here.
>
> Now:
>
> Info::from_raw_owned()
> InfoRef::from_raw_non_owning()
>
> What I am suggesting:
>
> Info::from_raw()
> InfoRef::from_raw()
>
> Or maybe just `new()` routines for both ?
>
> I think structure names tell us enough about ownership here and we don't =
need to
> add it to functions.

Ah, I posted some weak opposition against that in [1], but failed to
mention that again for v2. I mostly disliked `Info::from_raw()` being
not very expressive without peeking at the type definition. But if you
feel strongly about this, I am happy to change it.

I would strongly vote for `from_raw()` since `new()` sounds like it
would create a new instance, but really, we are just wrapping an already
existing instance here.

So... Shall I move to `from_raw()` or keep
`from_raw_owned/non_owning()`?

- Erik

[1] https://lore.kernel.org/r/CVUJTBQZYN6B.17WXH28G8MKZ2@ablu-work

