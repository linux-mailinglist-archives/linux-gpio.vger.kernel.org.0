Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0351570DDC4
	for <lists+linux-gpio@lfdr.de>; Tue, 23 May 2023 15:43:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236977AbjEWNnJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 May 2023 09:43:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236937AbjEWNm5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 May 2023 09:42:57 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3E45126
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 06:42:40 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-64d341bdedcso3299645b3a.3
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 06:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684849360; x=1687441360;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WgkyALS6JYBFkaNS/DVfHOSeKUcpoLOhGaVsSzn7wMo=;
        b=sLgp4rSO+oK0EWrvJ1dxjpit6CFLUlpCjQQTYyQ2fuYXPwBiJq25Ib0qqbYAJRH3Dj
         8lWzJjK+ApRVl04uKlAynV/66DmQWs41UdZXeevgN/2uKHg1kWR/HiNihq8cFZXr1Mw8
         RSOviteiWTPW7yAkcaNSbrQ6mD4JnqAOELkGQ7LLbqsoKQR7xpF9QT4/4j0h6z1u64yb
         eVQS2FQ5ivIZgbETUXQXAOkHtURZZ1lcaGGd8KMBMYfBJOwmiXPBLi0APPURlZfLN4Cr
         Kgt1RLe3I5u/pTYK0M6cgwLaD08CWCxJp+ecyroiS8RGuxNamx0QcLKPp3SDRIMEFMaU
         ek5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684849360; x=1687441360;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WgkyALS6JYBFkaNS/DVfHOSeKUcpoLOhGaVsSzn7wMo=;
        b=RoeJdKe+QXgT3Rg6OBtgqsONlR17LHpccvkjvbhIRjwLf0jZoHtalrv3+pF9tMGY0/
         iexYG867VJWLFTmPHgxgcsGXd8dnHV+3rhxooHQiA4uvcPVSSdp0TfrIVIvhrIGNCFF/
         xeaUov89F2okg6w9jQPgnPv3Zs6DoDpaCSt5xXYRL+oOQ2eaWgf0mM2nPYDzmdVe3qPl
         qSfQlJSWymrA/LV9CrHSzqiJb0RhIlG4Qpi+YmCbrHrVLAhR4K+HC1gQeJZoJKFJSq5y
         TMzox+H2iQEeFYyDvfLQnclsnlARaXNbfTp7bidWo+FSOFNef1d+A4hJ1lAecnafUxaO
         wZkw==
X-Gm-Message-State: AC+VfDyTXu0LsrI6hDhjgqYc415M4T3ZLpkNDk1t/n2g4e4u764Sikgp
        WZfN2JVD8XM+8COBvYDf5TM=
X-Google-Smtp-Source: ACHHUZ6rO4qy9v2KTmLxKfMWa36TiYhI0T5s5M7VEI+V1qXH92n9bdK8GT2jJcqJ5SdIC0ANYtWsgQ==
X-Received: by 2002:a05:6a00:23d1:b0:646:8a8:9334 with SMTP id g17-20020a056a0023d100b0064608a89334mr17900586pfc.20.1684849360036;
        Tue, 23 May 2023 06:42:40 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id i24-20020aa787d8000000b0064d3e4c7658sm5976700pfo.96.2023.05.23.06.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 06:42:39 -0700 (PDT)
Date:   Tue, 23 May 2023 21:42:34 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH] bindings: python: change the interpretation of
 None in event wait
Message-ID: <ZGzCyoLKyTySqR3L@sol>
References: <20230523133427.194558-1-brgl@bgdev.pl>
 <CAMRc=MdOpX4+9=DTdg7yuzUj3RBNYw=Qaw6Ny-YnyyngAP02pg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdOpX4+9=DTdg7yuzUj3RBNYw=Qaw6Ny-YnyyngAP02pg@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 23, 2023 at 03:35:30PM +0200, Bartosz Golaszewski wrote:
> On Tue, May 23, 2023 at 3:34 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > The docs don't mention it but currently passing None as the timeout to
> > one of the event wait methods works like passing 0 to select() - the wait
> > method returns immediately. Change it to a more standard behavior - None
> > makes the method block indefinitely until an even becomes available for
> > reading.
> >
> > This is a slight change in the behavior but let's hope nobody complains
> > as libgpiod v2 is still pretty recent and its adoption is (hopegully)
> > not wide-spread yet.
> >
> > Suggested-by: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
> 
> Cr*p, it was supposed to be Kent who suggested it and Nicolas who
> Reported it. I can change it when applying if the patch is fine.
> 
> Bart
> 

Man, wish I could get away with that little sleep.

Anyway, that works for me.

Reviewed-by: Kent Gibson <warthog618@gmail.com>

