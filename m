Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A142A276891
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Sep 2020 07:49:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726827AbgIXFtY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Sep 2020 01:49:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726683AbgIXFtX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Sep 2020 01:49:23 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AC66C0613CE;
        Wed, 23 Sep 2020 22:49:23 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id r7so2703847ejs.11;
        Wed, 23 Sep 2020 22:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/m46953p5ZoQXmA6fe0UKZalPcZpoeX6rm82oiFf4uQ=;
        b=fUG0RJEB8Ad+V7U1mVPVZvx86mn1ABa2PR/J49d3mX1g2EGp/GTGB2gkqZR7BIYgwJ
         VGAIVzYbfQhxCsOE9zv3Jktx0eoHzYRrFBDUN9JMAMQ7hDI1hLfOjqZf2QqH8DfE47Ih
         r1sYfs4dypk8Kj+ArL1Ka65T49TAGaMeQ56fITjvGkn5Pk0CaAo6OeN649KOpK9boqmI
         hFV8u52L72Vf5Ub0oLVH4ESL61TciQgjHArecR1TQPQteM3PsYma6MNkYU2Oa6vjDV4z
         TdKneixqXDs8x/900xxclPWGtJsVXhPXYiwTcp3inRQxzXSQAxF9H6mS1EGdkCr+WZ+0
         2mRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/m46953p5ZoQXmA6fe0UKZalPcZpoeX6rm82oiFf4uQ=;
        b=kIlMIs87A6YgMuT0RMEeEo0wg6kxMBIgIs/fGwOrOGqjiNFF2Aee1k9dHulVCq0nVK
         ykBglzUBRQsbn74xRPo0IzpphlCJQC14IM27Ox11kqbOs8hUCp4MBCuC3X5JgpPPDNVf
         OHS6phWYdcdIld6GdbA+0ODMc+MyjrnLoWqVNDPteCtPnkLN8xkKY/elPXTuXaZyqNaD
         zS4xKslS10A8VrFj9mwKndIO36Fvfy0TOdXaN7GKW6hAkSVU6jOAPofKpGKAg55hJwJe
         p0SqVCuct7U3bclrnitzHkBMH8YbFMeZj8RDoUGf5PnhLvPJgUeLn1fee3zTXn5MAzdk
         En2Q==
X-Gm-Message-State: AOAM532Q+LLfs2SSnNITLtNM/OwA55j7bZPV1BkEu/cH/JcHneePw0Zi
        u684zm7Jo2hfXgZbhFgghU/ZgfD5Jg76kTfkNDE=
X-Google-Smtp-Source: ABdhPJwExVCqPAq6YF/H5FxrCDF9iTuyJOZBCdscHJpMz5or329ZIG99XgxPiRNbFZFssi4sAptDoIPY+cf4Z58SXgw=
X-Received: by 2002:a17:907:1116:: with SMTP id qu22mr2762324ejb.231.1600926562073;
 Wed, 23 Sep 2020 22:49:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200914104352.2165818-1-drew@beagleboard.org>
 <CA+7tXii8rwBexgAHeqYsvBywhWLmk-Hf5_VWUU5bQkBREeFcSA@mail.gmail.com>
 <20200917092004.GA2468349@x1> <CA+7tXihwHbcuxZ10jGZrQkET9+Dbs31SfsYDt_6XB+-JM99gqA@mail.gmail.com>
 <20200917103942.GA2477958@x1> <20200923065755.GR7101@atomide.com>
 <CA+7tXigeNhQQVuAu0toZrvBKvMYkDU-8EWTpJR29HLTAMgoOBA@mail.gmail.com> <20200924054324.GB9471@atomide.com>
In-Reply-To: <20200924054324.GB9471@atomide.com>
From:   Trent Piepho <tpiepho@gmail.com>
Date:   Wed, 23 Sep 2020 22:49:11 -0700
Message-ID: <CA+7tXigg+h3v61AVMaYRKa_ZwznehOUPEESMqXKsNDNCrFph3w@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: document pinctrl-single,pins when
 #pinctrl-cells = 2
To:     Tony Lindgren <tony@atomide.com>
Cc:     Drew Fustini <drew@beagleboard.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Christina Quast <cquast@hanoverdisplays.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 23, 2020 at 10:43 PM Tony Lindgren <tony@atomide.com> wrote:
>
> * Trent Piepho <tpiepho@gmail.com> [200924 01:34]:
> > On Tue, Sep 22, 2020 at 11:57 PM Tony Lindgren <tony@atomide.com> wrote:
> > >
> > > Also FYI, folks have also complained for a long time that the pinctrl-single
> > > binding mixes mux and conf values while they should be handled separately.
> > >
> >
> > Instead of combining two fields when the dts is generated they are now
> > combined when the pinctrl-single driver reads the dts.  Other than
> > this detail, the result is the same.  The board dts source is the
> > same.  The value programmed into the pinctrl register is the same.
> > There is no mechanism currently that can alter that value in any way.
> >
> > What does combining them later allow that is not possible now?
>
> It now allows further driver changes to manage conf and mux separately :)

The pinctrl-single driver?  How will that work with boards that are
not am335x and don't use conf and mux fields in the same manner as
am335x?
