Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CFC363E776
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Dec 2022 03:07:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbiLACHC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Nov 2022 21:07:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229745AbiLACHB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Nov 2022 21:07:01 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70EE39D82D
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 18:06:59 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id 4so289400pli.0
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 18:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LETJSF92jmrD0Cx43Y1Mg5wUzpaPWnGAlmKuSPpgkMA=;
        b=Lrt26yNLqHIW4tjKYzdz7E6GbR6E+7rMJJ+55eStpxbqR7K54uGyvn8xDQaOLxiRrO
         +foKVtRZmfFpOx4SlNgoAT5zjbKgXhU9Nx6du8WcJvGc8gjhJW1rtqdPhyi4+YnPHhPm
         FRs6kvMwutnhrXHc3YiCd56CFiliEIhUU555iSl0KOgqb5sbA5i8835SGYow5zp99iAc
         Q5QcYhslaW3bcy1dHb3QMYkAA3kGdZqBh7Ep9b81BpeL5RSNzCiSZKI9ETTzAiMlN0uo
         NNLj2JwhCbyMziIlPNMA5j3CShe8X9Cl14QFNqAvkx++tNgGhQj/1g25CIY2URI1DOgO
         kDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LETJSF92jmrD0Cx43Y1Mg5wUzpaPWnGAlmKuSPpgkMA=;
        b=56rObNk4igrcrVF3jerfiq44BpUkRuJ6JNmoe3G9Aa2mGLXMVn+kGBSsF8u58ioOKA
         1oiYs8BXq6rSkVPbSQUa3UNEtcU6VdyNNpQsttIC1NMBMRajYh7VySHyJPgQWddZoR21
         LPbVfo/0lxIQA8frTS93j1syU5Nz6ad2lv+I9DR+SyfrnB918x8XBvz19eCKA9PrAQnE
         TSWeI04rO0khxa7jfHtgGPJN1hl/8t37OOyJkdbqJ0tNEqEzZkWmzCJpnpbB3f1ceXsJ
         yAB45DgFC4Xk3WM3pgklMiS1yVUeTtUI9Nr4+24quDL43YzQidd3+sKmBRJFVGo5ipc/
         VG+g==
X-Gm-Message-State: ANoB5pkb7XowI3KURwbQNCELsai721gqaz5pmslcUYozJgVgg5fkcc3g
        QEda7/m/5hREv6eQQqdKu3ccng==
X-Google-Smtp-Source: AA0mqf5k+oAg3mySbk5xWi5TDqPe//WTbI7Mw4PDitpAOp1eH2/A/3uPvRlIAe23dUUwytbzqauzQA==
X-Received: by 2002:a17:903:2290:b0:189:90ba:e78f with SMTP id b16-20020a170903229000b0018990bae78fmr15540882plh.29.1669860418941;
        Wed, 30 Nov 2022 18:06:58 -0800 (PST)
Received: from localhost ([122.172.87.149])
        by smtp.gmail.com with ESMTPSA id w19-20020aa79553000000b005752201875fsm2006270pfq.87.2022.11.30.18.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 18:06:58 -0800 (PST)
Date:   Thu, 1 Dec 2022 07:36:54 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH 01/11] treewide: use C enum types explicitly
Message-ID: <20221201020654.4p4qnvfu3cgpfxw2@vireshk-i7>
References: <20221130124231.1054001-1-brgl@bgdev.pl>
 <20221130124231.1054001-2-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221130124231.1054001-2-brgl@bgdev.pl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 30-11-22, 13:42, Bartosz Golaszewski wrote:
>  bindings/rust/gpiosim-sys/src/lib.rs        |  42 +++--
>  bindings/rust/gpiosim-sys/src/sim.rs        |   2 +-
>  bindings/rust/libgpiod/src/lib.rs           | 169 ++++++++++++--------
>  bindings/rust/libgpiod/src/line_info.rs     |  10 +-
>  bindings/rust/libgpiod/src/line_settings.rs |  30 ++--

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
