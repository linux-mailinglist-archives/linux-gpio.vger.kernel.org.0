Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17A916EA5B7
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Apr 2023 10:21:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231420AbjDUIVb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Apr 2023 04:21:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229724AbjDUIVb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Apr 2023 04:21:31 -0400
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B08DA243
        for <linux-gpio@vger.kernel.org>; Fri, 21 Apr 2023 01:21:02 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-54f8d59a8a9so16525807b3.0
        for <linux-gpio@vger.kernel.org>; Fri, 21 Apr 2023 01:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682065261; x=1684657261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ZDTPQTdwBS3U/dvkRKu73nFR4uvTQ4Wzf/xDMYpWos=;
        b=rI+gJJnfRbX+uFzw6pehHiCO/klXUS4TSNSZ2odzrwHTtLjiIRZCWevflRFuOxZCyM
         Y+3/uQLwB1zN64Xtvd2SOCkQA1DBr7xMUd8HciXxABDezXZGb6tw+GNfsN9/O6t7WSGO
         0k8g65EzQunhbFcDEOqkJygK/qv/C/c+ycxt+xz8CyjIU5B2JDL+O0V7Jz97W2pg3rSM
         C243SN7EO/32vWlM3tqwjhaLhBW4trZqBZ2CeXd+20PSjEODITc1SLo5wOA93tFaCFrY
         nMDzGiBORhoVrrVQpFsESW+egSdWT1+4IfF2qYsCDKAyCOlE021a8ezSkp9ZnKLTxass
         IuXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682065261; x=1684657261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ZDTPQTdwBS3U/dvkRKu73nFR4uvTQ4Wzf/xDMYpWos=;
        b=BucfZBGA37j7BAjQ/Hkxz/m9UJq9b030JaZdei/S1/yM8e4jdafA5pLEzA/GwX0VZY
         2/aqdrfzxk8kmj13pIw+Fbve0PHoDF5k0OOs4QgyXIFBQK4jn9lTfn4KWQP4KWEZgAR0
         5XGtk5gSZFLtNX8pAlIUeDcWK3jEklS8/b8Z2b32UeX/wrZRuGaWt2QJNmv9XoECvaN7
         ydWhNTKE+6VXpwCt40g260+h1aZ9zfIsHeBnzbVGgGmKpHr8uWCs3ACXT/6TFf3uR+wX
         bfFH9kRa8r52w0gK9u+545w4zefaQKvwdefeKsrf4hYCKGu4ewgQlLRVh606pGFiTtHE
         z1lQ==
X-Gm-Message-State: AAQBX9cPeu3ydTVhqSSW6QduM4hjM8mL3eGH2gNmwy64ClLoqkTa5zGM
        KF6NnuVB2svp0KyQ1tYz2RNOIJZxbCrnFV6PQ/HjFm2IxeRNrrCK
X-Google-Smtp-Source: AKy350a4MO0JBLZ0LOA+3NaPSDNF/zF4mo2l/XL4rEhsPsSpvGzrJRqavB5CeItyHcI3LuVIMA/A/2QS4DyEKI2YktQ=
X-Received: by 2002:a81:8341:0:b0:54e:f59f:5153 with SMTP id
 t62-20020a818341000000b0054ef59f5153mr1182455ywf.17.1682065261694; Fri, 21
 Apr 2023 01:21:01 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1679323449.git.william.gray@linaro.org> <ca710d14a710fee44f7911f2a84b6a55570561ee.1679323449.git.william.gray@linaro.org>
 <571b4df1-91ea-481c-9797-842974dfa922@sirena.org.uk> <ZDWopwozNjFg/9NX@fedora>
 <db1edaaa-ea56-4f21-bc69-43f648e79c5b@sirena.org.uk> <ZDXSjsjryXn0pHCz@fedora>
In-Reply-To: <ZDXSjsjryXn0pHCz@fedora>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 21 Apr 2023 10:20:50 +0200
Message-ID: <CACRpkdYNjoc=AHM_AWyyh3DbtfVd17WdmtO68GXrep87WRx5HQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] gpio: 104-dio-48e: Implement struct dio48e_gpio
To:     William Breathitt Gray <william.gray@linaro.org>
Cc:     Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 11, 2023 at 11:35=E2=80=AFPM William Breathitt Gray
<william.gray@linaro.org> wrote:
> On Tue, Apr 11, 2023 at 10:15:54PM +0100, Mark Brown wrote:
> > On Tue, Apr 11, 2023 at 02:36:23PM -0400, William Breathitt Gray wrote:
> > > On Tue, Apr 11, 2023 at 09:23:55PM +0100, Mark Brown wrote:
> > > > On Mon, Mar 20, 2023 at 10:50:15AM -0400, William Breathitt Gray wr=
ote:
> > > > > A private data structure struct dio48e_gpio is introduced to faci=
litate
> > > > > passage of the regmap and IRQ mask state for the device to the ca=
llback
> > > > > dio48e_handle_mask_sync(). This is in preparation for the removal=
 of the
> > > > > handle_mask_sync() map parameter in a subsequent patch.
> >
> > > > What's the story with this patch?
> >
> > > Currently dio48e_handle_mask_sync() uses the map argument in its
> > > implementation. Once the map parameter is removed, the current
> > > implementation of dio48e_handle_mask_sync() will no longer build, so =
we
> > > must adjust the implementation to no longer depend on map.
> >
> > I mean what's the story with getting this patch applied?  It doesn't
> > seem to have been reviewed...
>
> I'm sorry, I forgot to add Linus' tag from v2 [0]. Linus, would you
> confirm you're still okay with this patch?

Oh of course.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
