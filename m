Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE562674DF5
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jan 2023 08:23:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229924AbjATHXo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Jan 2023 02:23:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbjATHXn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Jan 2023 02:23:43 -0500
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D1523D921
        for <linux-gpio@vger.kernel.org>; Thu, 19 Jan 2023 23:23:41 -0800 (PST)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-4fd37a1551cso35970237b3.13
        for <linux-gpio@vger.kernel.org>; Thu, 19 Jan 2023 23:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TA3tL774T/87I1ppcDOWxNhqf64vnCQf4e96ToG+gWU=;
        b=GpOxgi+k5ZosZ450PFE197mvrRP0Ibe7qoATb35i+zqlseVzyoJOitgNnGNT8yHbqP
         uG+kuWG50d4UZZrRaac6R4cXb71DUlgfay5Hqbe1asRrcvYefcZKEqseZPvwHG3PUNxi
         DUJ/dGUnDUwv9jhMFELVH90Vc/ghdlHP0qIW3xYxcr6HCL3spM5HTuWeJXtkgJoEWvYR
         M+9L1aFoheY+gkE5VcGqnTdQ8WjIS3j6BjR8vebmiVsH1DyG+DjgOA1jNuGuaPxgWh0Q
         5rEpM0eD8wvDiKCCilE5L3Qf9mc2+QsPOhRHRu8EUvNz8Gluym0522J16o8LnKZcX1H1
         ejVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TA3tL774T/87I1ppcDOWxNhqf64vnCQf4e96ToG+gWU=;
        b=L8jTuLOsM76ZOaE91rFPdI7QfZUJyA7r86nDb/G3mCByzNwcSQwLSlKfvwwkFRnStp
         FALkbv+mL2QQuVXGA31Ob3AxVI9DlFt4q4v++x2fEsQ38RUV+7srqfTm7Rz6UN3DBoiy
         qzg6ugpYHvcExZjtANhwRKSZFBrdgmKFVqG8P+xG2Kyh/SSUvowXYQperhQ6YWZI9q8M
         zjNBISOwHFqyeav7c7OO1cUC/zdXzqO5bXkQctafw13ZDw/nllNt7T18Ui3H88nETSGO
         HeDBFJxu6TiXZPRC0egT5YzIM0xWVB+QnpuGEuJVHzFxWccxkchP0clh5DSkyQQ/mz7K
         PJjg==
X-Gm-Message-State: AFqh2kriBsFB8kNc9fyBsZp+2yvpq7nZbzB/TfsQqj5j4SyxELMQddCS
        3Qf2a1VPti+jaBQZYzii+Q+u3Orc34bP12zTA8rpjA==
X-Google-Smtp-Source: AMrXdXsFy5S/+1aUxe8BBygRPPKpHRVTsDDpZAXb1gt17BAkiOnRhABkE4Oeqj7++tMmtO8taxtaEU1uf4b56dHCj5I=
X-Received: by 2002:a0d:f282:0:b0:4ed:c96d:1b89 with SMTP id
 b124-20020a0df282000000b004edc96d1b89mr1944156ywf.130.1674199420633; Thu, 19
 Jan 2023 23:23:40 -0800 (PST)
MIME-Version: 1.0
References: <20230119130053.111344-1-hdegoede@redhat.com> <20230119130053.111344-2-hdegoede@redhat.com>
In-Reply-To: <20230119130053.111344-2-hdegoede@redhat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 20 Jan 2023 08:23:29 +0100
Message-ID: <CACRpkdaZw+M+kKgdV-mSVBTHY95OE51OGCzkvXSzkpen8Ybt7g@mail.gmail.com>
Subject: Re: [PATCH v4 01/11] leds: led-class: Add missing put_device() to led_put()
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-gpio@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Andy Yeh <andy.yeh@intel.com>, Hao Yao <hao.yao@intel.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 19, 2023 at 2:01 PM Hans de Goede <hdegoede@redhat.com> wrote:

> led_put() is used to "undo" a successful of_led_get() call,
> of_led_get() uses class_find_device_by_of_node() which returns
> a reference to the device which must be free-ed with put_device()
> when the caller is done with it.
>
> Add a put_device() call to led_put() to free the reference returned
> by class_find_device_by_of_node().
>
> And also add a put_device() in the error-exit case of try_module_get()
> failing.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
