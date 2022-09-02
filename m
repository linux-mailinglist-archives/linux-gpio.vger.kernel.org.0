Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B65E45ABACC
	for <lists+linux-gpio@lfdr.de>; Sat,  3 Sep 2022 00:22:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230386AbiIBWWo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Sep 2022 18:22:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231284AbiIBWWm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Sep 2022 18:22:42 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA757DF664
        for <linux-gpio@vger.kernel.org>; Fri,  2 Sep 2022 15:22:40 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id b16so4422441edd.4
        for <linux-gpio@vger.kernel.org>; Fri, 02 Sep 2022 15:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=JgPS0q8c1ne/b+eSUH1lDSsMRPGSWmHbmDNfcxWZlMU=;
        b=vI2MlWtKUXnec+wOBsyvgwx+c5U0IOVgVQevxzE4eUNfFNILxWHdNvNqoHv7X5N20R
         m738vsQf8MbaJnbWoy8imFmZyTBTksycJj680ZeAgFzTABEGc25sL6OjsGMPhIriuKeB
         ijEDXqbb2iKByBSY6GDW1ojMjXgtv7NHi5roCrrWlbYBlBI850mGShUxLhCJWYu5X+FK
         KRFOPu9bpsHa+0qIp7QzQUgIIc6esJP8uplQ+JVlBaPoBU9lTUKDk0fZVAoadE9aEKBW
         eoRy6S3COq9V+vUbVkSakGpY2MHLMBnV6LkY+nzgrhRzUcZm4W41FNOwtnI3q++UDelR
         Dgig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=JgPS0q8c1ne/b+eSUH1lDSsMRPGSWmHbmDNfcxWZlMU=;
        b=nhbUMPk68eck8yQQD9liJjhrEGUaggyurmanDFgPZWmtPH9lPG1s2VpXKjoiLmHSPb
         uRZrORofksQsJmrp2RqzH+WQ95Hc/8FM41D2zOGYeAsBXceTRZ5V2gTFEwwywCw4byWq
         e+EscZlw/66MPjY09+6ORtrFtriR2ogf6c3ArBStY3M04FCDTMQk/+AyHkuFTqXTa+wv
         uWZPl2uHXR22YaNoS2p64CY3aByuY/RoKUqrSAsb8mpgrxDOcdGV/7n6VujTsPDuWoQK
         4io4PHxUvOx1meUnFONDX4KbXs+7Vnd6gdVDws5YumpSez762a502R9TF/FpwTsflEG6
         zyqQ==
X-Gm-Message-State: ACgBeo0eAswf6BmZxsUqZRWFFUkNs0C2o48jYvUTDgFCoA2ZdBD/akT5
        ARGLHVEOWTRzK0b1rqpcnFcjIHsxelKp988SqjzqGQ==
X-Google-Smtp-Source: AA6agR55mcRE2bN+nNK2bZlxD/ikBko0XwNj0aQXsZB1Mic99tIXhQt/C0zyYLGb2iUFDwsSa+/EnBSE1/Ft6xOubX4=
X-Received: by 2002:a05:6402:4517:b0:443:7fe1:2d60 with SMTP id
 ez23-20020a056402451700b004437fe12d60mr34720318edb.133.1662157359399; Fri, 02
 Sep 2022 15:22:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220831135512.78407-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220831135512.78407-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 3 Sep 2022 00:22:26 +0200
Message-ID: <CACRpkdbG6Sf2v4Nf=VRnOBpNsUiypUcAHbwC3J=CKvjeuYSJrg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] pinctrl: pistachio: Switch to use fwnode instead of
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 31, 2022 at 3:55 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> GPIO library now accepts fwnode as a firmware node, so
> switch the driver to use it.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v2: fixed compilation error (LKP)

Patch applied so we get some rotation in linux-next!

Yours,
Linus Walleij
