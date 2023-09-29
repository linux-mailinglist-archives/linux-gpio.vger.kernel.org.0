Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16A767B30F7
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Sep 2023 12:59:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233115AbjI2K7C (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Sep 2023 06:59:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233000AbjI2K7B (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Sep 2023 06:59:01 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C058CF6
        for <linux-gpio@vger.kernel.org>; Fri, 29 Sep 2023 03:58:41 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-99de884ad25so1870878066b.3
        for <linux-gpio@vger.kernel.org>; Fri, 29 Sep 2023 03:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695985120; x=1696589920; darn=vger.kernel.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GclGPAJ9f125NuvDpbwNgBW59v3ukXlLgh53RnYeFKg=;
        b=CsQm//bfjYYInsLi71ToziL9albuWF4F44gfA9ExsMEQYhnVxi1i+X22W+vff/Nx2Y
         gr2b7+9UTbK4DvBJCTcnd8dlJV3K5rSi6rFTvg37objjiuMdigqMRc6q88L+Ld6RAyrm
         bQ0VnrtezzIBpG3eqA0GfOsJhCy01fe0Vqh/t4eiut4kpExnxSgF9c70Pa+4oSNP3wPO
         moup79L22fDVE03fp69Ej0j7aqDCOeQGJdoQrbNbgNHLXs7VRTIRkeqem0K2MEt3H+3i
         4ZyevLPOObcNZKTE/1FO3gKMly7gifG2kwN1okL9g+mg4ya/QmNNGtHti9xBbEk3OyaE
         lH4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695985120; x=1696589920;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GclGPAJ9f125NuvDpbwNgBW59v3ukXlLgh53RnYeFKg=;
        b=ubOo1hpE8kflQmbhQ8xyaQ+bL4Hls/ZqWG9YrGvUB0IDLmrmJ9+kPUb7G+E5D/iPek
         kvrXGNMmqD6eDsXLCcx9NdIXLmcNgkI86kpfOFGUVotLh29tglqRngvT8R8cKoIUgiht
         KluHl1ECrIpNDsW9P+GUznu+Lx0gNS8rs3OC6FZzS9i14yjh9IBgUm08CpEjSpoeW0+3
         kZ8hzBo6M8Vm8UjKMOeQj0j3e60HbB3ni8zeLHkMop66JPywLnjzUAzn401gyf9SJ9Bi
         vqucR2Qyg+nqJyJ+f0XhbehTlzonzNGEHDRAtzLN+PwbRQ1HUtceUxExJZNu6EX/eSMF
         hfWw==
X-Gm-Message-State: AOJu0Yz5i8aZKG8EoE2jx99bURJ0lbdsW+2UAWowGVFhiYXNrzfDzRfc
        /u5fgm4+i+VTHgiVkuKKYnJafg==
X-Google-Smtp-Source: AGHT+IHrw/dW6F4UX2iikeIZPNC1OhCsHX+a2QJTEWIY3J+H2dzPGBU8dGOjOu39f1HpgzGrt8SR8w==
X-Received: by 2002:a17:906:21b:b0:9a1:cbe4:d029 with SMTP id 27-20020a170906021b00b009a1cbe4d029mr3744416ejd.74.1695985119756;
        Fri, 29 Sep 2023 03:58:39 -0700 (PDT)
Received: from localhost (i5C7438D4.versanet.de. [92.116.56.212])
        by smtp.gmail.com with ESMTPSA id tk9-20020a170907c28900b009b2b47cd757sm3715346ejc.9.2023.09.29.03.58.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Sep 2023 03:58:39 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 29 Sep 2023 12:58:38 +0200
Message-Id: <CVVCJRMQOWE2.23245F2VB5792@ablu-work>
Cc:     "Linux-GPIO" <linux-gpio@vger.kernel.org>,
        "Manos Pitsidianakis" <manos.pitsidianakis@linaro.org>
To:     "Viresh Kumar" <viresh.kumar@linaro.org>
From:   "Erik Schilling" <erik.schilling@linaro.org>
Subject: Re: [libgpiod][PATCH 1/3] bindings: rust: fix soundness of
 line_info modeling
X-Mailer: aerc 0.15.2
References: <20230927-rust-line-info-soundness-v1-0-990dce6f18ab@linaro.org>
 <20230927-rust-line-info-soundness-v1-1-990dce6f18ab@linaro.org>
 <20230928112733.nkzirzdcdirmxr3w@vireshk-i7>
 <CVUJTBQZYN6B.17WXH28G8MKZ2@ablu-work>
 <20230929103915.mkq5hbzmks4rhykh@vireshk-i7>
In-Reply-To: <20230929103915.mkq5hbzmks4rhykh@vireshk-i7>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri Sep 29, 2023 at 12:39 PM CEST, Viresh Kumar wrote:
> On 28-09-23, 14:27, Erik Schilling wrote:
> > On Thu Sep 28, 2023 at 1:27 PM CEST, Viresh Kumar wrote:
> > > > -    /// Get the Line info object associated with an event.
> > > > -    pub(crate) fn new_from_event(info: *mut gpiod::gpiod_line_info=
) -> Result<Self> {
> > > > -        Info::new_internal(info, true)
> > > > +    fn as_raw_ptr(&self) -> *mut gpiod::gpiod_line_info {
> > > > +        self as *const _ as *mut _
> > >
> > > What's wrong with keeping `_info` as `info` in the structure and usin=
g it
> > > directly instead of this, since this is private anyway ?
>
> Ahh, I missed that it is not *mut anymore. Shouldn't we mark it with & as=
 well,
> since it is a reference to the gpiod structure ? Something like ? (I must=
 admit
> that I have forgotten a lot of Rust during my long absence from work :)).
>
>     _info: &'a gpiod::gpiod_line_info,

Technically, yes. But that would require a 'a lifetime parameter on
the `Info` struct. Then, instead of using `&Info` you would need to
use `Info<'a>` everywhere.

Which then gets ugly pretty fast since you need to carry it through all
impl blocks, the `Deref` implementation on `InfoOwned` and force it onto
the consumer of the lib.

I think staying with `&Info` keeps the API a lot simpler (and this code
simpler).

>
> > We would still need to cast it the same way. One _could_ write:
> >=20
> >     fn as_raw_ptr(&self) -> *mut gpiod::gpiod_line_info {
> >         &self.info as *const _ as *mut _
> >     }
>
> Can we use deref to just do this magically for us in this file somehow ?

Hm... Not exactly sure what you mean here. Do you mean a `Deref`
implementation? That one would leak this implementation detail into
public API.

>
> > But the cast dance is still required since we need a *mut, but start
> > with a readonly reference.
> >=20
> > This is required since libgpiod's C lib keeps the struct internals
> > opaque and does not make guarantees about immutable datastructures for
> > any API calls.
> >=20
> > Technically, the 1:1 mapping of this to Rust would be to restrict the
> > entire API to `&mut self`. One could do that - it would probably allow
> > us to advertise the structs as `Sync` - but it would require consumers
> > to declare all libgpiod-related variables as `mut`.

