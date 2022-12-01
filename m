Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A295F63E782
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Dec 2022 03:10:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229551AbiLACKQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Nov 2022 21:10:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbiLACKP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Nov 2022 21:10:15 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 331D543857
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 18:10:15 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id k5so505323pjo.5
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 18:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7f0wGpyUJqWOFegqP3U+OdFiKgJ4C0iSz0pi6NTuBa0=;
        b=k2cYT3ejyMvGsqkm3W5UwMbTTFI8LXMWJYNSnOI0f+uLX8UspRbcHV9atYX4kqsIBP
         jKg2Ezk/Q/o/HUSI7bFi/ti/0gBve+jnDZ2lhHsbKDJEI0d5uHt58s9PDYcg4+LpQR3Y
         aRM3e0+qmBaIPP58NBKy+TpRRVd8jxcP4jCyP9clO6mrwV5CO//Kg5R4Wry9DvsrKqFP
         E8nrlDlkUV9SW706DrrvGWgKBLf4HIOkD7Twe/N9s7/rYu3b29DWowMO7/PyCeGyPUj5
         4yYX4qMpGSKHZ11JaMmWWpAkQ2/Bq4BaykThg004J8Yq437+yNgYX1puHZ0D0+BrtfOw
         r63w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7f0wGpyUJqWOFegqP3U+OdFiKgJ4C0iSz0pi6NTuBa0=;
        b=yAgGsr6mWA/5JbOVsKzWbyvUd669RunpX6VMJCCajDB0Ocga4ZXPEQIu4SjNyWsQEX
         wGQXOaEG2dvWs74KoYIpS9ebnARk+LGnLj2JYgAt3RtC+IVWMNKukw7FYJg37zoEmW5M
         3c6WbFR9DGnTKr+n3IwBBizf0UV/aoTpFBKCMwmrys+tWit0vM5DwvEyfZrXZxyxVX1N
         SJMWhtVIVTLK9vaNJIlLeD3HZa7i292poLP3sohQPR1WtlVhWKnpfbMGNcoU/7/PbRcD
         rxTAXAf502y0pRSw30mSZNX57iMLfcc79JJSfRNFgZGAbabNA3q3cg5aL4/okYuk0meL
         PoXw==
X-Gm-Message-State: ANoB5pnOVZVgsafJaIArT8NkHoGGVfcT/CB81n7X16eZEn46KBOz6OR0
        Ojz29kTkviNgmTnDEpiZ+b7Ysw==
X-Google-Smtp-Source: AA0mqf4ucrvXbSTTrjN5sJ8E+88D4tY9stP6AOLngGfSo9Bm+Skw0VGqZdySg2pqeFLPcMDVamaGCA==
X-Received: by 2002:a17:90a:f98d:b0:219:70c7:cf80 with SMTP id cq13-20020a17090af98d00b0021970c7cf80mr2771194pjb.40.1669860614775;
        Wed, 30 Nov 2022 18:10:14 -0800 (PST)
Received: from localhost ([122.172.87.149])
        by smtp.gmail.com with ESMTPSA id x28-20020aa79a5c000000b0056b8181861esm2106187pfj.19.2022.11.30.18.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 18:10:14 -0800 (PST)
Date:   Thu, 1 Dec 2022 07:40:10 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH 05/11] gpiosim: rename HOG_DIR to DIRECTION
Message-ID: <20221201021010.mvrbnz4lgdpsnpg3@vireshk-i7>
References: <20221130124231.1054001-1-brgl@bgdev.pl>
 <20221130124231.1054001-6-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221130124231.1054001-6-brgl@bgdev.pl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 30-11-22, 13:42, Bartosz Golaszewski wrote:
>  bindings/rust/gpiosim-sys/src/lib.rs   | 12 ++++++------

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
