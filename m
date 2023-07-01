Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43368744918
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Jul 2023 15:10:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230013AbjGANKu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 1 Jul 2023 09:10:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbjGANKt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 1 Jul 2023 09:10:49 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F8763AA7
        for <linux-gpio@vger.kernel.org>; Sat,  1 Jul 2023 06:10:48 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-55adfa61199so1980377a12.2
        for <linux-gpio@vger.kernel.org>; Sat, 01 Jul 2023 06:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688217047; x=1690809047;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rdGjxVi6hGcaiTePb6IGBckROAI/ak+eaZkNFbvlzsc=;
        b=j+97exHhFBBHUL5gajkyud98cCQ9qaARYx6tcaUqADPZ66B/rQZvJXQRgF+rx/CnfZ
         5tpLztzeoTaADPM/6UmG/R2INJuKEwKKOW3iEknE+In9lN79oC+6yJwsoKu+irymksGn
         pl9MMtIKPTeQsqvapR+RPJru9OdaQuzaXMgOEqczIi40DB/9DXuCTufcTDnkWniv7T7r
         tYiiV//LmUvpyMiadmn/fsSIIvJIY4M6V1jVXn/mRkYox6+YLqgVMlFYpg+fTl6eIj0v
         1Uf5fnqGbI2gd+lYXX/IBtlG21krBOS2G6NZqvDyshIzlSeaUNdIf8FKaeawhqEy/VZI
         9f2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688217047; x=1690809047;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rdGjxVi6hGcaiTePb6IGBckROAI/ak+eaZkNFbvlzsc=;
        b=X/L/hrWPVicW8cgw5t5fRsHdb8QPPPJOMuAD3tC9Ux8tJDV+XX4aeCK1aLlpbx09Vr
         HMGhA7HbNTCZS99fzUEskhLroaZlVfqEMabBkzhIZWOPQ61jIPT0jm+Edxe53zVaLVdd
         BqW1SvywYvZuIAgQar6cdInWINIYqOBgagOOKjoTTwmNPLhcGTleBli2hD8fA8cEBivu
         7uhxqcXYGj1GQB+dGxP2J0qgxrSsJp6kO26nAl0vrRLvdLvOz1vAa6cYXpiTd7vDxIpc
         AHDuIlVkYurqH8+GmSc0qwqEsMubukz04NLK+Dgd9dpa8gCdPp2dE2LRRsqaRZHjlTK/
         bU0A==
X-Gm-Message-State: AC+VfDzCx7egp0bxti39/dS/30deP9Ck84gQmiakh3sfEBd56NRDI6W+
        Tc4UaXnBmozz+9TLggLXgZQ=
X-Google-Smtp-Source: ACHHUZ5YIJAx2t1hL5ApLNC9JoeUP/8YLWgF/Ad5fu6OwRx6y0ggDpKq0D+bpYE3FDKVZTH4nHFX5w==
X-Received: by 2002:a05:6a20:5499:b0:127:3c6e:fc83 with SMTP id i25-20020a056a20549900b001273c6efc83mr7164841pzk.42.1688217047557;
        Sat, 01 Jul 2023 06:10:47 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id s12-20020a62e70c000000b00679a4b56e41sm8892854pfh.43.2023.07.01.06.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jul 2023 06:10:46 -0700 (PDT)
Date:   Sat, 1 Jul 2023 21:10:42 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH libgpiod 4/4] bindings: rust: clippy: silence
 false-positive on iterator
Message-ID: <ZKAl0pZ3UP7mRk4D@sol>
References: <20230629-clippy-v1-0-9ff088713c54@linaro.org>
 <20230629-clippy-v1-4-9ff088713c54@linaro.org>
 <ZJ6bd8+oDbyX06rp@sol>
 <CTPWFHFJNFFA.2SGA858S5QIJ5@fedora>
 <ZJ6sQYctu9mHqQP5@sol>
 <CTPXANU2HUHF.3UJIZX6CQV4UF@fedora>
 <ZJ6zaq2JCQvMcnTh@sol>
 <CTPXGBYT71JR.290ZDBVD3EMM7@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CTPXGBYT71JR.290ZDBVD3EMM7@fedora>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 30, 2023 at 12:53:36PM +0200, Erik Schilling wrote:
> On Fri Jun 30, 2023 at 12:50 PM CEST, Kent Gibson wrote:
> > On Fri, Jun 30, 2023 at 12:46:11PM +0200, Erik Schilling wrote:
> > > On Fri Jun 30, 2023 at 12:19 PM CEST, Kent Gibson wrote:
> > > > > 
> > > >
> > > > That is the only test failing out of the whole suite, so gpiosim is not
> > > > the problem.
> > > >
> > > > That is with the latest from the Raspberry Pi rpi-6.4.y branch[1]
> > > > (a867309b7a55 so a few days old now), with CONFIG_GPIO_SIM so that I can
> > > > run the tests.
> > > > Happens to be running on a Pi ZeroW, but I don't think that test is speed
> > > > sensitive.  I have done a complete rebuild - same result.
> > > >
> > > > Are there any distos enabling GPIO_SIM yet?
> > > 
> > > Fedora does now (after I asked for it [2]). But it does not support any
> > > 32-bit ARM targets anymore :/. Can you try reproducing it without the
> > > patches? I would be surprised if this was related to the patches.
> > > 
> >
> > Tried that - same result with libgpiod master.
> > So it is not from your patches.
> 
> Thanks for checking! Will try to reproduce it in the next weeks.
> 

Seems there was something broken in my build.
I did a clean slate rebuild and now all tests are passing.

Cheers,
Kent.
