Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 295FB72F7D8
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jun 2023 10:29:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243359AbjFNI3z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Jun 2023 04:29:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243535AbjFNI3m (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Jun 2023 04:29:42 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4562F199B
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jun 2023 01:29:41 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-977d55ac17bso76365966b.3
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jun 2023 01:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686731379; x=1689323379;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+mtyWlBA5EUBsrGj2voYhsFK+/sDAIfa9jXhYmq9yX4=;
        b=gQ8zxmfroRuTMTl+qulNJkoRhjvd9axti7rkyYVvL9QTq6UA18NhIQKlqMiFbrqb2d
         Z36igcvbchh/kCYnt0Cs1W/AZ4iuMRyzfbslWBv741aDup755PcDB1HDhIaEDHACaKRu
         hW1cY4p+t+FjKn2fobO3rO+Llj3JZqQWoeNoznOU3ti+O61Oa4Z6yVbj00wFuL4RVztL
         jGOLYMyTcKEsa1R0cXy+CZ8aYxmTrl4DusPH1TJlA4nfFXmMbJH5gUramoQkpcdlCWY9
         VhHfIiO7V3NQKVeXWWw8KxCaDDxhhrrj2LbWk3Xfpnoogn7hiYrbJYSYkYcz9tiBVMOI
         clbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686731379; x=1689323379;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+mtyWlBA5EUBsrGj2voYhsFK+/sDAIfa9jXhYmq9yX4=;
        b=WcPQERMSft/vmbB1QykoISuGPkvRIu2VBVL+ZgA8yP+vsbdL7C1FuUERzTt/K8ATTP
         kll63nAk+VAZ2X+bPy51jVdc7nfji9d5abmlqgNrOtBFyqh16JXdSOvSwwIT2Lg5BwgR
         8MwoCpn8HitKioAoOXKGHoMx2xUDRuDMVxqs8wkKtkeC4I3Orx8gVdWe/lwNUxy/bTdB
         onWVMK/SSnpeVzqSzqBJYoXqFZEe7/fpnGEdH3ixOhB0bu5qInkj1SJ0l77yIwE9m2H2
         9eNYrHKFPiQRrC5O+u3FObSodcu4phS9bg+4P/sJ2b3ILagEDDpP/ZmHEljYe3x4VIQI
         7l1A==
X-Gm-Message-State: AC+VfDywb+MZOaOZBrx1TkXxYHpJXjth+Ywt26z4CqOvGk9EutTkCh51
        gH0imf03JDpjy4EgTosaiSqbhA==
X-Google-Smtp-Source: ACHHUZ7uLD7kbvwKhnb8JuzlqyouJw6QD0p5fcwdg0cqtT//CrHkyOhpy+eZzSBNea8v3Nj9KzHLqg==
X-Received: by 2002:a17:907:848:b0:96f:a891:36cb with SMTP id ww8-20020a170907084800b0096fa89136cbmr15643606ejb.0.1686731379672;
        Wed, 14 Jun 2023 01:29:39 -0700 (PDT)
Received: from localhost (i5C740811.versanet.de. [92.116.8.17])
        by smtp.gmail.com with ESMTPSA id p14-20020a170906140e00b009786ae9ed50sm7674565ejc.194.2023.06.14.01.29.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 01:29:39 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 14 Jun 2023 10:29:38 +0200
Message-Id: <CTC8DE4V7PT2.1Z9QICMLN3WQI@fedora>
Subject: Re: [libgpiod][PATCH 4/4] bindings: rust: examples: add dedicated
 examples
Cc:     <linux-gpio@vger.kernel.org>, <brgl@bgdev.pl>
To:     "Kent Gibson" <warthog618@gmail.com>
From:   "Erik Schilling" <erik.schilling@linaro.org>
X-Mailer: aerc 0.14.0
References: <20230614035426.15097-1-warthog618@gmail.com>
 <20230614035426.15097-5-warthog618@gmail.com>
 <CTC7KTWRXMS4.1G8UBSCYLSMIT@fedora> <ZIl35wFvID2uA5fg@sol>
In-Reply-To: <ZIl35wFvID2uA5fg@sol>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed Jun 14, 2023 at 10:18 AM CEST, Kent Gibson wrote:
> On Wed, Jun 14, 2023 at 09:52:20AM +0200, Erik Schilling wrote:
> > On Wed Jun 14, 2023 at 5:54 AM CEST, Kent Gibson wrote:
> > > Add rust equivalents of the core examples.
> > >
> > > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> >=20
> > Reviewed-by: Erik Schilling <erik.schilling@linaro.org>
> >=20
> > Some nit-picks below, but those are a matter of taste and the change
> > looks ok either way.
> >=20
> > > +
> > > +use libgpiod::line;
> >=20
> > I think one could also just import the other used modules. Or, since
> > this is an example anyway, just `use libgpiod::*`.
> >=20
>
> I'm never keen on using `::*`, as subsequent changes could pull in symbol=
s
> that conflict with locals.
>
> And as this is an example I wanted to be explicit as to where the symbols
> originate, especially as there is some overlap, e.g. line::Config and
> request::Config.
> The general rule is, if it is only used once then use the full name.
> But there are so many line attributes that using the slightly shortened
> form made it more readable.

Yeah, I assumed that you followed this rule. Fine with me.

> > > +                "line: {}, type: {}, event #{}",
> > > +                event.line_offset(),
> > > +                match event.event_type()? {
> > > +                    line::EdgeKind::Rising =3D> "Rising ",
> > > +                    line::EdgeKind::Falling =3D> "Falling",
> > > +                },
> > > +                event.line_seqno()
> > > +            );
> >=20
> > println!("{: <8}") could also be used to pad things (would allow
> > removing the trailing space).
> >=20
>
> So add 4 chars to remove 1?
>
> Ideally the padding would go after the comma, and then you start getting
> into compound fields, so this was a case of KISS.

As I said, may be a matter of taste. I am fine with either way (thats
why I already provided the Review tag). The extra " " just jumped
to my eye since with rustfmt it is not aligned in a way that made it
immediately obvious.

- Erik
