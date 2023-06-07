Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58552726168
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Jun 2023 15:36:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238787AbjFGNgW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Jun 2023 09:36:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240467AbjFGNgT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Jun 2023 09:36:19 -0400
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29FF41FE0
        for <linux-gpio@vger.kernel.org>; Wed,  7 Jun 2023 06:36:11 -0700 (PDT)
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-3f9baa69682so5243811cf.3
        for <linux-gpio@vger.kernel.org>; Wed, 07 Jun 2023 06:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686144970; x=1688736970;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f4sf5qH8tH2f0lLXDyzC4ZbN3gKOaTXNp3tb8kTl5K8=;
        b=EooWi7y4sBjLFetA5+uP0JX2xp9ku4bqRUaJAKbXPvq+mtBBwVjr1GtGLqOsKdUMtJ
         rAYnwOue3AWuFKZvSp+WyVpJJZhQF0KWlBdH1GuXpBtDxj9ZFr2hb8p+4aqMBN676S7i
         PmoVRvz03U9QknFpxpnAIa3n17TScErEnNUbNX65kSoy3ECsTp2/UJ+EcMHBK5wpTAf/
         oCQyA0h9UwhSgclZXBC/n0F09JfK9BsIlNuiYzQyGPdFQ3kaSsjVkGJ1zTxpOUx6/Ruw
         QmtsI6waWJujBbb1WjCL87KeWzO6wsQoehfOn2US/USupieI0b7lQNMdPGvHtH56PQHk
         3qNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686144970; x=1688736970;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f4sf5qH8tH2f0lLXDyzC4ZbN3gKOaTXNp3tb8kTl5K8=;
        b=SfIlNpolnkP8ZBBwfkdf5QFMmocNTM3midJmg4j5eQs6mb0eKkdmUrHU/IvsWRiXpX
         u1FxBhZFe8Tf3fDqTBvesROwIH3YIsAJe7PZjOKk4u+imKJrkdaQ4LziHPYtGshFIVRp
         GUES/jYvkajn2suCU4qI8V537Gfj/Kwki1MIzx/fBVwuTOxheAXx7m+sd/qyk1gCBL+h
         LsRTnc1eYnQvC+7UEBn5zc33wgr4dT21imxTUw/fckNAakVuzBtzuqBpjPXKi7EQo0V0
         6uIftfA+XbIejzosPshv2To2ZN5IE7K/U2VxxzbtqwVbzxbONqn/RlVZd3LjrShjTNaj
         oTUA==
X-Gm-Message-State: AC+VfDzeU+dcwcb+YfGC1rwJEUSpL5a7opeoMX778q/xBK97kYIdR7OA
        XjBQhyOj+8NKXjbo3yfJ2TthPnpkCjI3g5/s+TrcKA==
X-Google-Smtp-Source: ACHHUZ7dErdQjWWo/zzM+X1ukuNViiUc9NhOGiU+BR7hrkZ96r6EzX/r+/wFOKgqACIGCOV2UiccEqzeRVS65zHaJJA=
X-Received: by 2002:a05:6214:d8a:b0:61b:5e9b:a15d with SMTP id
 e10-20020a0562140d8a00b0061b5e9ba15dmr2495870qve.36.1686144970243; Wed, 07
 Jun 2023 06:36:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230607065004.37112-1-warthog618@gmail.com> <CAMRc=Mf9K=_a=UzmazHF1Qc7XxWfP_qJH2gftPAT0Y=e_3FtyQ@mail.gmail.com>
 <ZIB+GUaa934A4sq6@sol>
In-Reply-To: <ZIB+GUaa934A4sq6@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 7 Jun 2023 15:35:59 +0200
Message-ID: <CAMRc=Me_UKGtkJCfWx9DjyzmvTxRvbDBnZDRHCnFteg5gbgtgA@mail.gmail.com>
Subject: Re: [PATCH] gpio: sim: quietly ignore configured lines outside the bank
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linus.walleij@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 7, 2023 at 2:54=E2=80=AFPM Kent Gibson <warthog618@gmail.com> w=
rote:
>
> On Wed, Jun 07, 2023 at 02:50:43PM +0200, Bartosz Golaszewski wrote:
> > On Wed, Jun 7, 2023 at 8:50=E2=80=AFAM Kent Gibson <warthog618@gmail.co=
m> wrote:
> > >
> > >
> > > base-commit: ba65c79fbb813423e7d42d99375e2045b27958a6
> > > prerequisite-patch-id: d89da2e3b7511c5b8132a379b12e4996256ac214
> > > --
> > > 2.40.1
> > >
> >
> > I queued this for fixes, thanks!
> >
>
> Oh, ok.  I didn't think it was serious enough for fixes, or I would've
> made the two patches a series.  And included a Fixes on this one.
>
> Cheers,
> Kent.

It fixes a problem and is fairly small. Works as a fix for me.

Bart
